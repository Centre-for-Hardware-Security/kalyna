# set sdc_version 2.0
# set_units -capacitance pF -time ns
# current_design u_dig_top

# 10 MHz slow clock for controller domain
set SLOW_CLOCK_PERIOD 100

create_generated_clock -name slow_clock_muxed -source [get_ports clk_slow_i] -divide_by 1 [get_pins u_tc_clk_mux2/clk_o] -add -master_clock slow_clock
set_case_analysis 0 [get_pins u_tc_clk_mux2/clk_sel_i]

# 50% input and output delay for primary IOs
set_input_delay -clock slow_clock [expr ${SLOW_CLOCK_PERIOD} * 0.5] [get_ports {*serial_*_i start_i}]
set_output_delay -clock slow_clock [expr ${SLOW_CLOCK_PERIOD} * 0.5] [get_ports {*serial_*_o done_o}]

# 25% input and output delay for internal pins to crypto blocks
set_input_delay -clock slow_clock [expr ${SLOW_CLOCK_PERIOD} * 0.25] [get_ports {aes_ctext_i* aes_done_i}]
set_input_delay -clock slow_clock [expr ${SLOW_CLOCK_PERIOD} * 0.25] [get_ports {sha256_hmsg_i* sha256_done_i}]
set_input_delay -clock slow_clock [expr ${SLOW_CLOCK_PERIOD} * 0.25] [get_ports {kalyna_hs_ctext_i* kalyna_hs_enc_ctext_i* kalyna_lp_ctext_i* kalyna_secure1_ctext_i* kalyna_secure2_ctext_i* kalyna_kupyna_ctext_i* kalyna_hs_done_i kalyna_hs_enc_done_i kalyna_lp_done_i kalyna_secure1_done_i kalyna_secure2_done_i kalyna_kupyna_done_i}]
set_input_delay -clock slow_clock [expr ${SLOW_CLOCK_PERIOD} * 0.25] [get_ports {kupyna_hs_hmsg_i* kupyna_lp_hmsg_i* kalyna_kupyna_hmsg_i* kupyna_hs_done_i kupyna_lp_done_i kalyna_kupyna_done_i}]

set_output_delay -clock slow_clock [expr ${SLOW_CLOCK_PERIOD} * 0.25] [get_ports {key_o* ptext_o* aes_start_o}]
set_output_delay -clock slow_clock [expr ${SLOW_CLOCK_PERIOD} * 0.25] [get_ports {msg_o* sha256_start_o}]
set_output_delay -clock slow_clock [expr ${SLOW_CLOCK_PERIOD} * 0.25] [get_ports {key_o* ptext_o* kalyna_hs_start_o kalyna_hs_enc_start_o kalyna_lp_start_o kalyna_secure1_start_o kalyna_secure2_start_o kalyna_kupyna_start_kalyna_o}]
set_output_delay -clock slow_clock [expr ${SLOW_CLOCK_PERIOD} * 0.25] [get_ports {msg_o* kupyna_hs_start_o kupyna_lp_start_o kalyna_kupyna_start_kalyna_o kalyna_kupyna_start_kupyna_o}]

# False path for async reset input. reset is synchronized internally to clk_slow domain
set_false_path -from [get_ports reset_n_i]

# TODO: False path for synchronizer to clk_muxed domain reset?

# False path for clk mux sel, should be stable before clocks are consumed by downstream logic
# Downstream logic never sees glitchy clock because of ICGs
# set_false_path -through [get_pins u_tc_clk_mux2/clk_sel_i]

# False path for all synchronizer D inputs
set_false_path -through [get_pins -filter {name==serial_i} -of_objects [get_db hinsts -if {.module.name==sync*}]]

# 4x D pin __REDACTED__ cell (D FF with async clear)
set_load [expr 4*__REDACTED__] [all_outputs]

# TODO refine this with IO pins and internal pins from crypto blocks
set_driving_cell -lib_cell __REDACTED__ -pin Q [remove_from_collection [all_inputs] [get_ports {*clk*}]]
