module io_ring (

    ////////////////////////////
    // To/from bond wires
    ////////////////////////////

    input wire ua_clk_fast_i,
    input wire ua_clk_slow_i,
    input wire ua_reset_n_i,

    input wire ua_clk_mux_sel_i,
    input wire ua_enc_dec_sel_i,
    input wire ua_start_i,
    output wire ua_done_o,

    input wire ua_serial_enable_i,
    input wire ua_serial_sel_0_i,
    input wire ua_serial_sel_1_i,
    input wire ua_serial_sel_2_i,
    input wire ua_serial_data_ingress_i,
    output wire ua_serial_data_egress_o,

    input wire ua_chicken_bits_1_i,

    input wire fi_serial_enable_i,
    input wire fi_serial_sel_0_i,
    input wire fi_serial_sel_1_i,
    input wire fi_serial_data_ingress_i,
    output wire fi_serial_data_egress_o,

    output wire fi_osc_1_o,
    output wire fi_osc_2_o,

    output wire fi_trng_o,

    ////////////////////////////
    // To/from core
    ////////////////////////////

    output wire ua_clk_fast_o,
    output wire ua_clk_slow_o,
    output wire ua_reset_n_o,

    output wire ua_clk_mux_sel_o,
    output wire ua_enc_dec_sel_o,
    output wire ua_start_o,
    input wire ua_done_i,

    output wire ua_serial_enable_o,
    output wire ua_serial_sel_0_o,
    output wire ua_serial_sel_1_o,
    output wire ua_serial_sel_2_o,
    output wire ua_serial_data_ingress_o,
    input wire ua_serial_data_egress_i,

    output wire ua_chicken_bits_1_o,

    output wire fi_serial_enable_o,
    output wire fi_serial_sel_0_o,
    output wire fi_serial_sel_1_o,
    output wire fi_serial_data_ingress_o,
    input wire fi_serial_data_egress_i,

    input wire fi_osc_1_i,
    input wire fi_osc_2_i,

    input wire fi_trng_i

);

    assign ua_clk_fast_o = ua_clk_fast_i;
    assign ua_clk_slow_o = ua_clk_slow_i;
    assign ua_reset_n_o = ua_reset_n_i;

    assign ua_clk_mux_sel_o = ua_clk_mux_sel_i;
    assign ua_enc_dec_sel_o = ua_enc_dec_sel_i;
    assign ua_start_o = ua_start_i;
    assign ua_done_o = ua_done_i;

    assign ua_serial_enable_o = ua_serial_enable_i;
    assign ua_serial_sel_0_o = ua_serial_sel_0_i;
    assign ua_serial_sel_1_o = ua_serial_sel_1_i;
    assign ua_serial_sel_2_o = ua_serial_sel_2_i;
    assign ua_serial_data_ingress_o = ua_serial_data_ingress_i;
    assign ua_serial_data_egress_o = ua_serial_data_egress_i;

    assign ua_chicken_bits_1_o = ua_chicken_bits_1_i;

    assign fi_serial_enable_o = fi_serial_enable_i;
    assign fi_serial_sel_0_o = fi_serial_sel_0_i;
    assign fi_serial_sel_1_o = fi_serial_sel_1_i;
    assign fi_serial_data_ingress_o = fi_serial_data_ingress_i;
    assign fi_serial_data_egress_o = fi_serial_data_egress_i;

    assign fi_osc_1_o = fi_osc_1_i;
    assign fi_osc_2_o = fi_osc_2_i;
    assign fi_trng_o = fi_trng_i;

endmodule