# set sdc_version 2.0
# set_units -capacitance pF -time ns

# 10 MHz slow clock for controller domain
set SLOW_CLOCK_PERIOD 100

# Block specific fast clocks
set FAST_CLOCK_PERIOD_AES 1.25;  # 800 MHz
set FAST_CLOCK_PERIOD_SHA256 2;  # 500 MHz
set FAST_CLOCK_PERIOD_KUPYNA_HS 2.5;  # 400 MHz
set FAST_CLOCK_PERIOD_KUPYNA_LP 2.5;  # 400 MHz
set FAST_CLOCK_PERIOD_KALYNA_HS 3.25;  # 308 MHz (to match kalyna_secure1)
set FAST_CLOCK_PERIOD_KALYNA_HS_ENC 1.5;  # 666 MHz (max freq)
set FAST_CLOCK_PERIOD_KALYNA_LP 3.25;  # 308 MHz (to match kalyna_secure1)
set FAST_CLOCK_PERIOD_KALYNA_SECURE1 3.25;  # 308 MHz
set FAST_CLOCK_PERIOD_KALYNA_SECURE2 3.25;  # 308 MHz
set FAST_CLOCK_PERIOD_KALYNA_KUPYNA 2.5;  # 400 MHz

# Primary clocks
create_clock -period ${SLOW_CLOCK_PERIOD} -name slow_clock [get_ports clk_slow_i];  # 10 MHz clock
create_clock -period ${FAST_CLOCK_PERIOD_AES} -name fast_clock_aes [get_ports clk_fast_i];  # 800 MHz clock
create_clock -period ${FAST_CLOCK_PERIOD_SHA256} -name fast_clock_sha256 [get_ports clk_fast_i] -add;  # 500 MHz clock
create_clock -period ${FAST_CLOCK_PERIOD_KUPYNA_HS} -name fast_clock_kupyna_hs [get_ports clk_fast_i] -add;  # 400 MHz clock
create_clock -period ${FAST_CLOCK_PERIOD_KUPYNA_LP} -name fast_clock_kupyna_lp [get_ports clk_fast_i] -add;  # 400 MHz clock
create_clock -period ${FAST_CLOCK_PERIOD_KALYNA_HS} -name fast_clock_kalyna_hs [get_ports clk_fast_i] -add;  # 571 MHz clock
create_clock -period ${FAST_CLOCK_PERIOD_KALYNA_HS_ENC} -name fast_clock_kalyna_hs_enc [get_ports clk_fast_i] -add;  # 571 MHz clock
create_clock -period ${FAST_CLOCK_PERIOD_KALYNA_LP} -name fast_clock_kalyna_lp [get_ports clk_fast_i] -add;  # 571 MHz clock
create_clock -period ${FAST_CLOCK_PERIOD_KALYNA_SECURE1} -name fast_clock_kalyna_secure1 [get_ports clk_fast_i] -add;  # 308 MHz clock
create_clock -period ${FAST_CLOCK_PERIOD_KALYNA_SECURE2} -name fast_clock_kalyna_secure2 [get_ports clk_fast_i] -add;  # 308 MHz clock
create_clock -period ${FAST_CLOCK_PERIOD_KALYNA_KUPYNA} -name fast_clock_kalyna_kupyna [get_ports clk_fast_i] -add;  # 400 MHz clock
set_clock_groups -group fast_clock_aes -group fast_clock_sha256 -group fast_clock_kupyna_hs -group fast_clock_kupyna_lp \
                 -group fast_clock_kalyna_hs -group fast_clock_kalyna_hs_enc -group fast_clock_kalyna_lp -group fast_clock_kalyna_secure1 \
                 -group fast_clock_kalyna_secure2 -group fast_clock_kalyna_kupyna -physically_exclusive

# Versions of clk_muxed
create_generated_clock -name fast_clock_aes_muxed -source [get_ports clk_fast_i] -divide_by 1 [get_pins u_tc_clk_mux2/clk_o] -add -master_clock fast_clock_aes
create_generated_clock -name fast_clock_sha256_muxed -source [get_ports clk_fast_i] -divide_by 1 [get_pins u_tc_clk_mux2/clk_o] -add -master_clock fast_clock_sha256
create_generated_clock -name fast_clock_kupyna_hs_muxed -source [get_ports clk_fast_i] -divide_by 1 [get_pins u_tc_clk_mux2/clk_o] -add -master_clock fast_clock_kupyna_hs
create_generated_clock -name fast_clock_kupyna_lp_muxed -source [get_ports clk_fast_i] -divide_by 1 [get_pins u_tc_clk_mux2/clk_o] -add -master_clock fast_clock_kupyna_lp
create_generated_clock -name fast_clock_kalyna_hs_muxed -source [get_ports clk_fast_i] -divide_by 1 [get_pins u_tc_clk_mux2/clk_o] -add -master_clock fast_clock_kalyna_hs
create_generated_clock -name fast_clock_kalyna_hs_enc_muxed -source [get_ports clk_fast_i] -divide_by 1 [get_pins u_tc_clk_mux2/clk_o] -add -master_clock fast_clock_kalyna_hs_enc
create_generated_clock -name fast_clock_kalyna_lp_muxed -source [get_ports clk_fast_i] -divide_by 1 [get_pins u_tc_clk_mux2/clk_o] -add -master_clock fast_clock_kalyna_lp
create_generated_clock -name fast_clock_kalyna_secure1_muxed -source [get_ports clk_fast_i] -divide_by 1 [get_pins u_tc_clk_mux2/clk_o] -add -master_clock fast_clock_kalyna_secure1
create_generated_clock -name fast_clock_kalyna_secure2_muxed -source [get_ports clk_fast_i] -divide_by 1 [get_pins u_tc_clk_mux2/clk_o] -add -master_clock fast_clock_kalyna_secure2
create_generated_clock -name fast_clock_kalyna_kupyna_muxed -source [get_ports clk_fast_i] -divide_by 1 [get_pins u_tc_clk_mux2/clk_o] -add -master_clock fast_clock_kalyna_kupyna
set_clock_groups -group fast_clock_aes_muxed -group fast_clock_sha256_muxed -group fast_clock_kupyna_hs_muxed  -group fast_clock_kupyna_lp_muxed \
                 -group fast_clock_kalyna_hs_muxed -group fast_clock_kalyna_hs_enc_muxed -group fast_clock_kalyna_lp_muxed -group fast_clock_kalyna_secure1_muxed \
                 -group fast_clock_kalyna_secure2_muxed -group fast_clock_kalyna_kupyna_muxed -physically_exclusive
set_case_analysis 1 [get_pins u_tc_clk_mux2/clk_sel_i]

create_generated_clock -name fast_clock_aes_icg -source [get_pins u_tc_clk_mux2/clk_o] -divide_by 1 [get_ports clk_aes_o] -add -master_clock fast_clock_aes_muxed
set_clock_groups -group fast_clock_aes_icg -group fast_clock_sha256_muxed -group fast_clock_kupyna_hs_muxed -group fast_clock_kupyna_lp_muxed -group fast_clock_kalyna_hs_muxed \
                 -group fast_clock_kalyna_hs_enc_muxed -group fast_clock_kalyna_lp_muxed -group fast_clock_kalyna_secure1_muxed -group fast_clock_kalyna_secure2_muxed \
                 -group fast_clock_kalyna_kupyna_muxed -physically_exclusive

create_generated_clock -name fast_clock_sha256_icg -source [get_pins u_tc_clk_mux2/clk_o] -divide_by 1 [get_ports clk_sha256_o] -add -master_clock fast_clock_sha256_muxed
set_clock_groups -group fast_clock_sha256_icg -group fast_clock_aes_muxed -group fast_clock_kupyna_hs_muxed -group fast_clock_kupyna_lp_muxed -group fast_clock_kalyna_hs_muxed \
                 -group fast_clock_kalyna_hs_enc_muxed -group fast_clock_kalyna_lp_muxed -group fast_clock_kalyna_secure1_muxed -group fast_clock_kalyna_secure2_muxed \
                 -group fast_clock_kalyna_kupyna_muxed -physically_exclusive

create_generated_clock -name fast_clock_kupyna_hs_icg -source [get_pins u_tc_clk_mux2/clk_o] -divide_by 1 [get_ports clk_kupyna_hs_o] -add -master_clock fast_clock_kupyna_hs_muxed
set_clock_groups -group fast_clock_kupyna_hs_icg -group fast_clock_aes_muxed -group fast_clock_sha256_muxed -group fast_clock_kupyna_lp_muxed -group fast_clock_kalyna_hs_muxed \
                 -group fast_clock_kalyna_hs_enc_muxed -group fast_clock_kalyna_lp_muxed -group fast_clock_kalyna_secure1_muxed -group fast_clock_kalyna_secure2_muxed \
                 -group fast_clock_kalyna_kupyna_muxed -physically_exclusive

create_generated_clock -name fast_clock_kupyna_lp_icg -source [get_pins u_tc_clk_mux2/clk_o] -divide_by 1 [get_ports clk_kupyna_lp_o] -add -master_clock fast_clock_kupyna_lp_muxed
set_clock_groups -group fast_clock_kupyna_lp_icg -group fast_clock_aes_muxed -group fast_clock_sha256_muxed -group fast_clock_kupyna_hs_muxed -group fast_clock_kalyna_hs_muxed \
                 -group fast_clock_kalyna_hs_enc_muxed -group fast_clock_kalyna_lp_muxed -group fast_clock_kalyna_secure1_muxed -group fast_clock_kalyna_secure2_muxed \
                 -group fast_clock_kalyna_kupyna_muxed -physically_exclusive

create_generated_clock -name fast_clock_kalyna_hs_icg -source [get_pins u_tc_clk_mux2/clk_o] -divide_by 1 [get_ports clk_kalyna_hs_o] -add -master_clock fast_clock_kalyna_hs_muxed
set_clock_groups -group fast_clock_kalyna_hs_icg -group fast_clock_aes_muxed -group fast_clock_sha256_muxed -group fast_clock_kupyna_hs_muxed -group fast_clock_kupyna_lp_muxed \
                 -group fast_clock_kalyna_hs_enc_muxed -group fast_clock_kalyna_lp_muxed -group fast_clock_kalyna_secure1_muxed -group fast_clock_kalyna_secure2_muxed \
                 -group fast_clock_kalyna_kupyna_muxed -physically_exclusive

create_generated_clock -name fast_clock_kalyna_hs_enc_icg -source [get_pins u_tc_clk_mux2/clk_o] -divide_by 1 [get_ports clk_kalyna_hs_enc_o] -add -master_clock fast_clock_kalyna_hs_enc_muxed
set_clock_groups -group fast_clock_kalyna_hs_enc_icg -group fast_clock_aes_muxed -group fast_clock_sha256_muxed -group fast_clock_kupyna_hs_muxed -group fast_clock_kupyna_lp_muxed \
                 -group fast_clock_kalyna_hs_muxed -group fast_clock_kalyna_lp_muxed -group fast_clock_kalyna_secure1_muxed -group fast_clock_kalyna_secure2_muxed \
                 -group fast_clock_kalyna_kupyna_muxed -physically_exclusive

create_generated_clock -name fast_clock_kalyna_lp_icg -source [get_pins u_tc_clk_mux2/clk_o] -divide_by 1 [get_ports clk_kalyna_lp_o] -add -master_clock fast_clock_kalyna_lp_muxed
set_clock_groups -group fast_clock_kalyna_lp_icg -group fast_clock_aes_muxed -group fast_clock_sha256_muxed -group fast_clock_kupyna_hs_muxed -group fast_clock_kupyna_lp_muxed \
                 -group fast_clock_kalyna_hs_muxed -group fast_clock_kalyna_hs_enc_muxed -group fast_clock_kalyna_secure1_muxed -group fast_clock_kalyna_secure2_muxed \
                 -group fast_clock_kalyna_kupyna_muxed -physically_exclusive

create_generated_clock -name fast_clock_kalyna_secure1_icg -source [get_pins u_tc_clk_mux2/clk_o] -divide_by 1 [get_ports clk_kalyna_secure1_o] -add -master_clock fast_clock_kalyna_secure1_muxed
set_clock_groups -group fast_clock_kalyna_secure1_icg -group fast_clock_aes_muxed -group fast_clock_sha256_muxed -group fast_clock_kupyna_hs_muxed -group fast_clock_kupyna_lp_muxed \
                 -group fast_clock_kalyna_hs_muxed -group fast_clock_kalyna_hs_enc_muxed -group fast_clock_kalyna_lp_muxed -group fast_clock_kalyna_secure2_muxed \
                 -group fast_clock_kalyna_kupyna_muxed -physically_exclusive

create_generated_clock -name fast_clock_kalyna_secure2_icg -source [get_pins u_tc_clk_mux2/clk_o] -divide_by 1 [get_ports clk_kalyna_secure2_o] -add -master_clock fast_clock_kalyna_secure2_muxed
set_clock_groups -group fast_clock_kalyna_secure2_icg -group fast_clock_aes_muxed -group fast_clock_sha256_muxed -group fast_clock_kupyna_hs_muxed -group fast_clock_kupyna_lp_muxed \
                 -group fast_clock_kalyna_hs_muxed -group fast_clock_kalyna_hs_enc_muxed -group fast_clock_kalyna_lp_muxed -group fast_clock_kalyna_secure1_muxed \
                 -group fast_clock_kalyna_kupyna_muxed -physically_exclusive

create_generated_clock -name fast_clock_kalyna_kupyna_icg -source [get_pins u_tc_clk_mux2/clk_o] -divide_by 1 [get_ports clk_kalyna_kupyna_o] -add -master_clock fast_clock_kalyna_kupyna_muxed
set_clock_groups -group fast_clock_kalyna_kupyna_icg -group fast_clock_aes_muxed -group fast_clock_sha256_muxed -group fast_clock_kupyna_hs_muxed -group fast_clock_kupyna_lp_muxed \
                 -group fast_clock_kalyna_hs_muxed -group fast_clock_kalyna_hs_enc_muxed -group fast_clock_kalyna_lp_muxed -group fast_clock_kalyna_secure1_muxed \
                 -group fast_clock_kalyna_secure2_muxed -physically_exclusive

# 50% input and output delay for primary IOs
set_input_delay -clock slow_clock [expr ${SLOW_CLOCK_PERIOD} * 0.5] [get_ports {*serial_*_i start_i}]
set_output_delay -clock slow_clock [expr ${SLOW_CLOCK_PERIOD} * 0.5] [get_ports {*serial_*_o done_o}]

# 25% input and output delay for internal pins to crypto blocks
set_input_delay -clock fast_clock_aes_icg [expr ${FAST_CLOCK_PERIOD_AES} * 0.25] [get_ports {aes_ctext_i* aes_done_i}]
set_input_delay -clock fast_clock_sha256_icg [expr ${FAST_CLOCK_PERIOD_SHA256} * 0.25] [get_ports {sha256_hmsg_i* sha256_done_i}]
set_input_delay -clock fast_clock_kupyna_hs_icg [expr ${FAST_CLOCK_PERIOD_KUPYNA_HS} * 0.25] [get_ports {kupyna_hs_hmsg_i* kupyna_hs_done_i}]
set_input_delay -clock fast_clock_kupyna_lp_icg [expr ${FAST_CLOCK_PERIOD_KUPYNA_LP} * 0.25] [get_ports {kupyna_lp_hmsg_i* kupyna_lp_done_i}]
set_input_delay -clock fast_clock_kalyna_hs_icg [expr ${FAST_CLOCK_PERIOD_KALYNA_HS} * 0.25] [get_ports {kalyna_hs_ctext_i* kalyna_hs_done_i}]
set_input_delay -clock fast_clock_kalyna_hs_enc_icg [expr ${FAST_CLOCK_PERIOD_KALYNA_HS_ENC} * 0.25] [get_ports {kalyna_hs_enc_ctext_i* kalyna_hs_enc_done_i}]
set_input_delay -clock fast_clock_kalyna_lp_icg [expr ${FAST_CLOCK_PERIOD_KALYNA_LP} * 0.25] [get_ports {kalyna_lp_ctext_i* kalyna_lp_done_i}]
set_input_delay -clock fast_clock_kalyna_secure1_icg [expr ${FAST_CLOCK_PERIOD_KALYNA_SECURE1} * 0.25] [get_ports {kalyna_secure1_ctext_i* kalyna_secure1_done_i}]
set_input_delay -clock fast_clock_kalyna_secure2_icg [expr ${FAST_CLOCK_PERIOD_KALYNA_SECURE2} * 0.25] [get_ports {kalyna_secure2_ctext_i* kalyna_secure2_done_i}]
set_input_delay -clock fast_clock_kalyna_kupyna_icg [expr ${FAST_CLOCK_PERIOD_KALYNA_KUPYNA} * 0.25] [get_ports {kalyna_kupyna_ctext_i* kalyna_kupyna_hmsg_i* kalyna_kupyna_done_i}]

set_output_delay -clock fast_clock_aes_icg [expr ${FAST_CLOCK_PERIOD_AES} * 0.25] [get_ports {aes_start_o}]
set_output_delay -clock fast_clock_sha256_icg [expr ${FAST_CLOCK_PERIOD_SHA256} * 0.25] [get_ports {sha256_start_o}]
set_output_delay -clock fast_clock_kupyna_hs_icg [expr ${FAST_CLOCK_PERIOD_KUPYNA_HS} * 0.25] [get_ports {kupyna_hs_start_o}]
set_output_delay -clock fast_clock_kupyna_lp_icg [expr ${FAST_CLOCK_PERIOD_KUPYNA_LP} * 0.25] [get_ports {kupyna_lp_start_o}]
set_output_delay -clock fast_clock_kalyna_hs_icg [expr ${FAST_CLOCK_PERIOD_KALYNA_HS} * 0.25] [get_ports {kalyna_hs_start_o}]
set_output_delay -clock fast_clock_kalyna_hs_enc_icg [expr ${FAST_CLOCK_PERIOD_KALYNA_HS_ENC} * 0.25] [get_ports {kalyna_hs_enc_start_o}]
set_output_delay -clock fast_clock_kalyna_lp_icg [expr ${FAST_CLOCK_PERIOD_KALYNA_LP} * 0.25] [get_ports {kalyna_lp_start_o}]
set_output_delay -clock fast_clock_kalyna_secure1_icg [expr ${FAST_CLOCK_PERIOD_KALYNA_SECURE1} * 0.25] [get_ports {kalyna_secure1_start_o}]
set_output_delay -clock fast_clock_kalyna_secure2_icg [expr ${FAST_CLOCK_PERIOD_KALYNA_SECURE2} * 0.25] [get_ports {kalyna_secure2_start_o}]
set_output_delay -clock fast_clock_kalyna_kupyna_icg [expr ${FAST_CLOCK_PERIOD_KALYNA_KUPYNA} * 0.25] [get_ports {kalyna_kupyna_start_kalyna_o kalyna_kupyna_start_kupyna_o}]

# False path for async reset input. reset is synchronized internally to clk_slow domain
# FIXME: Ensure all FF reset pins are driven by the reset synchronizer "rstgen"
set_false_path -from [get_ports reset_n_i]

# TODO: False path for synchronizer to clk_muxed domain reset?

# False path for clk mux sel, should be stable before clocks are consumed by downstream logic
# Downstream logic never sees glitchy clock because of ICGs
# set_false_path -through [get_pins u_tc_clk_mux2/clk_sel_i]

# False path for all synchronizer D inputs
set_false_path -through [get_pins -filter {name==serial_i} -of_objects [get_db hinsts -if {.module.name==sync*}]]

# False path to serial_regs ciphertext and hash data inputs, these should be stable for COOLDOWN_WAIT_CYCLES (10) clk_slow cycles
# before ciphertext_we and hash_we are asserted
set_false_path -through [get_pins "u_ua_serial_regs/ciphertext_i*"]
set_false_path -through [get_pins "u_ua_serial_regs/hash_i*"]

# False path from serial_regs to crypto blocks, these signals should be stable before they are consumed by the crypto blocks
# FIXME: Look at the log to be sure we get all bits
set_false_path -to [get_ports {key_o*}]
set_false_path -to [get_ports {ptext_o*}]
set_false_path -to [get_ports {msg_o*}]
set_false_path -to [get_ports {hash_msg_chunk_o}]

# False path from chicken bit syncs
# set_false_path -through [get_pins u_sync_chicken_bits_0/serial_o]
set_false_path -through [get_pins u_sync_chicken_bits_1/serial_o]

# False path for operation_done signal from crypto blocks to top_ctrl
# This path is only relevant when clk_slow is selected
set_false_path -through [get_pins u_operation_done_buffer/clk_i]

# 4x D pin __REDACTED__ cell (D FF with async clear)
set_load [expr 4*__REDACTED__] [all_outputs]

# TODO refine this with IO pins and internal pins from crypto blocks
set_driving_cell -lib_cell __REDACTED__ -pin Q [remove_from_collection [all_inputs] [get_ports {*clk*}]]
