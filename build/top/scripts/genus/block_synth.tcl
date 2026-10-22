puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "Tool config"
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

if { [info exists ::env(UA_CRYPTO_ROOT) ] } {
	set UA_CRYPTO_ROOT $::env(UA_CRYPTO_ROOT)
} else {
    puts "Error: Environment variable UA_CRYPTO_ROOT not set"
    exit 1
}

# source ../scripts/common/path_setup.tcl
source ${UA_CRYPTO_ROOT}/build/top/scripts/common/path_setup.tcl

set_multi_cpu_usage -local_cpu 8
# set_db super_thread_debug_directory ${WORK_DIR}

### Set PLE (Generates a set of load values, which were obtained from the physical layout..
# estimator (PLE) or wire-load model, for all the nets in the specified design)
set_db interconnect_mode ple

set_db information_level 9
set_db detailed_sdc_messages true

set_db auto_ungroup both

set_db syn_global_effort high
set_db hdl_error_on_latch true
set_db hdl_error_on_blackbox true

set_db design_power_effort high
set_db lp_default_probability 0.5
#set_db lp_insert_clock_gating false
set_db lp_insert_clock_gating true

# https://support.cadence.com/apex/techpubDocViewerPage?xmlName=genus_user.xml&title=Genus%20User%20Guide%20--%20Retiming%20the%20Design%20-%20Retiming%20the%20Design&hash=&c_version=23.1&path=genus_user/genus_user23.1/Retiming_the_Design.html
set_db retime_async_reset true;  # This retimes FFs with async reset or async set
# set_db retime_optimize_reset true;  # This replaces reset FFs with no reset FFs if the reset condition evaluates to dont_care
set_db retime_effort_level high;
set_db retime_reg_naming_suffix _retimed_reg;
set_db retime_verification_flow true;  # Enables formal verification with Conformal

set_db init_hdl_search_path "${SRCS_DIR}/kalyna/TAPEOUT ${SRCS_DIR}/kupyna/TAPEOUT ${SRCS_DIR}/kalyna_kupyna/TAPEOUT}"
set_db hdl_language sv
set_db hdl_zero_replicate_is_null true

# Setup spatial flow
set GENUS_SPATIAL_FLOW 0
if { [info exists ::env(UA_CRYPTO_GENUS_SPATIAL_FLOW) ] } {
	set GENUS_SPATIAL_FLOW $::env(UA_CRYPTO_GENUS_SPATIAL_FLOW)
}

if {$GENUS_SPATIAL_FLOW} {

	set_db design_process_node 65

	set_db opt_spatial_effort extreme
	set_db opt_spatial_useful_skew true
	set_db opt_spatial_early_clock true
	set_db opt_spatial_merge_flops false
	set_db opt_enable_data_to_data_checks true
	set_db opt_enable_restructure true

}

if { [info exists ::env(UA_CRYPTO_SYNTH_BLOCK) ] } {
	set TOP_MODULE $::env(UA_CRYPTO_SYNTH_BLOCK)
} else {
    puts "Error: Environment variable UA_CRYPTO_SYNTH_BLOCK not set"
    exit 1
}

puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "Init files"
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

read_mmmc ${SCRIPTS_DIR}/genus/block_views.tsmc65lp.nldm.mmmc

# TSMC65LP
set init_lef_files "__REDACTED__"
read_physical -lef $init_lef_files

read_hdl -define SYNTHESIS -define KSA -define OPT -define SEM -define XORSHIFT -sv -f ${SCRIPTS_DIR}/genus/${TOP_MODULE}.flist

if {$GENUS_SPATIAL_FLOW} {
	read_def ${DELIVERABLES_DIR}/innovus/${TOP_MODULE}.def -keep_all_instances -keep_routed_nets
}

if {$TOP_MODULE == "top_ctrl"} {
    set TOP_MODULE_NAME ${TOP_MODULE}
} else {
    set TOP_MODULE_NAME ${TOP_MODULE}_top
}

elaborate $TOP_MODULE_NAME
init_design

# suspend

if {$GENUS_SPATIAL_FLOW} {
	set_db design_top_routing_layer M6
	set_db design_bottom_routing_layer M2
}

# check_design -all > ${REPORTS_DIR}/genus/${TOP_MODULE}_check_design.txt
check_timing_intent -verbose > ${REPORTS_DIR}/genus/${TOP_MODULE}_check_timing_intent.txt
report_timing -lint -verbose > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_after_elab.txt
report_timing -unconstrained -max_paths 100 > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_verbose_unconstrained_after_elab.txt
report_clocks -generated > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_clocks.txt
report_clock_groups > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_clock_groups.txt

# suspend

puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "Synthesis - mapping and optimization"
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

# This enables timing-oriented retiming
# set_db [current_design] .retime true

# set_db retiming_clocks [get_db clock:dig_top/analysis_view_0p81v_125c_capwst_slowest/clk];  # Retime only main clk, not QSPI or SPI clocks

if {$TOP_MODULE == "top_ctrl"} {
	set_db hinst:u_operation_done_buffer .dont_touch size_ok;  # We need to hang a false path constraint on paths to this buffer, make sure it is not removed
	set_db hinst:u_tc_clk_mux2 .dont_touch true;  # size_ok still replaces CLK mux with regular non-balanced mux (!!!)
}

# TODO: Dont touch for clk_* cells

set_db [current_design] .dft_dont_scan true
check_dft_rules

if {$GENUS_SPATIAL_FLOW} {
	check_floorplan -spatial -detailed -out_file ${REPORTS_DIR}/genus/${TOP_MODULE}_check_floorplan.txt
	syn_generic -physical
	# retime -min_area;  # This enables area-oriented retiming
	syn_map -physical
	# syn_opt -logical -spatial;  -logical only on Genus 23
	syn_opt -spatial
} else {
	syn_generic
	# retime -min_area;  # This enables area-oriented retiming
	syn_map
	syn_opt
	# syn_opt -incremental
}

# Set prefix to avoid name clashes for top-level place and route
puts "Uniquifying netlist"
uniquify [current_design]
update_names -module -prefix ${TOP_MODULE}_
update_names -inst -prefix u_${TOP_MODULE}_

puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "Write final reports"
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

report_clock_gating > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_clock_gating.txt
report_ple > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_ple.txt
report_gates > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_gates.txt
report_area > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_area.txt
report_sequential -deleted -optimized > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_sequential_deleted_optimized.txt
report_sequential -mapping > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_sequential_mapping.txt
# report_timing_derate > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_derate.txt

# FIXME: This could be a loop through $all_views
if {$TOP_MODULE == "top_ctrl"} {

	set CURRENT_VIEW wc_cworst_125_sdc_fast
	set_analysis_view -setup ${CURRENT_VIEW} -hold ${CURRENT_VIEW} -leakage ${CURRENT_VIEW} -dynamic ${CURRENT_VIEW}
	report_timing -unconstrained -max_paths 100 > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}_verbose_unconstrained.txt
	report_timing -lint -verbose > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}_verbose.txt
	report_timing > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}.txt
	# report_power -unit mW > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_power_${CURRENT_VIEW}.txt

	set CURRENT_VIEW wc_rcworst_125_sdc_fast
	set_analysis_view -setup ${CURRENT_VIEW} -hold ${CURRENT_VIEW} -leakage ${CURRENT_VIEW} -dynamic ${CURRENT_VIEW}
	report_timing -lint -verbose > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}_verbose.txt
	report_timing -unconstrained -max_paths 100 > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}_verbose_unconstrained.txt
	report_timing > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}.txt
	report_power -unit mW > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_power_${CURRENT_VIEW}.txt

	set CURRENT_VIEW wc_cworst_125_sdc_slow
	set_analysis_view -setup ${CURRENT_VIEW} -hold ${CURRENT_VIEW} -leakage ${CURRENT_VIEW} -dynamic ${CURRENT_VIEW}
	report_timing -unconstrained -max_paths 100 > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}_verbose_unconstrained.txt
	report_timing -lint -verbose > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}_verbose.txt
	report_timing > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}.txt
	# report_power -unit mW > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_power_${CURRENT_VIEW}.txt

	set CURRENT_VIEW wc_rcworst_125_sdc_slow
	set_analysis_view -setup ${CURRENT_VIEW} -hold ${CURRENT_VIEW} -leakage ${CURRENT_VIEW} -dynamic ${CURRENT_VIEW}
	report_timing -lint -verbose > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}_verbose.txt
	report_timing -unconstrained -max_paths 100 > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}_verbose_unconstrained.txt
	report_timing > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}.txt
	# report_power -unit mW > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_power_${CURRENT_VIEW}.txt


} else {

	set CURRENT_VIEW wc_cworst_125_sdc
	set_analysis_view -setup ${CURRENT_VIEW} -hold ${CURRENT_VIEW} -leakage ${CURRENT_VIEW} -dynamic ${CURRENT_VIEW}
	report_timing -unconstrained -max_paths 100 > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}_verbose_unconstrained.txt
	report_timing -lint -verbose > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}_verbose.txt
	report_timing > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}.txt
	# report_power -unit mW > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_power_${CURRENT_VIEW}.txt

	set CURRENT_VIEW wc_rcworst_125_sdc
	set_analysis_view -setup ${CURRENT_VIEW} -hold ${CURRENT_VIEW} -leakage ${CURRENT_VIEW} -dynamic ${CURRENT_VIEW}
	report_timing -lint -verbose > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}_verbose.txt
	report_timing -unconstrained -max_paths 100 > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}_verbose_unconstrained.txt
	report_timing > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_timing_setup_${CURRENT_VIEW}.txt
	report_power -unit mW > ${REPORTS_DIR}/genus/${TOP_MODULE}_report_power_${CURRENT_VIEW}.txt

}

puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "Write deliverables"
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

write_hdl [current_design] > ${DELIVERABLES_DIR}/genus/${TOP_MODULE}_mapped.v
write_hdl [current_design] -lec > ${DELIVERABLES_DIR}/genus/${TOP_MODULE}_mapped_lec.v
# write_do_lec -golden_design rtl -revised ${DELIVERABLES_DIR}/genus/${TOP_MODULE}_mapped_lec.v \
# 			 -log_file ${REPORTS_DIR}/conformal/conformal_log.txt -write_session ${DELIVERABLES_DIR}/conformal/${TOP_MODULE}_conformal.db \
# 			 -tmp_dir ${WORK_DIR} -verbose > ${DELIVERABLES_DIR}/genus/${TOP_MODULE}_conformal_lec.tcl
write_db -common -all_root_attributes ${DELIVERABLES_DIR}/genus/${TOP_MODULE}_genus.db

# foreach mode [all_constraint_modes] {
# 	write_sdc -constraint_mode ${mode} -exclude {set_load set_input_delay set_output_delay set_driving_cell} > "${DELIVERABLES_DIR}/genus/${TOP_MODULE}_genus_constraints_[get_db ${mode} .name].sdc"
# }

exit
