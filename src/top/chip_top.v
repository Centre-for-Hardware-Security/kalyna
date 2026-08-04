module chip_top (

    ////////////////////////////
    // ua_crypto IO
    ////////////////////////////

    input wire ua_clk_fast_i,
    input wire ua_clk_slow_i,
    input wire ua_reset_n_i,

    input wire ua_clk_mux_sel_i,
    input wire ua_enc_dec_sel_i,
    input wire ua_start_i,
    output reg ua_done_o,

    input wire ua_serial_enable_i,
    input wire ua_serial_sel_0_i,
    input wire ua_serial_sel_1_i,
    input wire ua_serial_sel_2_i,
    input wire ua_serial_data_ingress_i,
    output reg ua_serial_data_egress_o,

    input wire ua_chicken_bits_1_i,

    ////////////////////////////
    // Frequency injection IO
    ////////////////////////////

    // input wire fi_vdd_ana_i,
    // input wire fi_vss_ana_i,

    input wire fi_serial_enable_i,
    input wire fi_serial_sel_0_i,
    input wire fi_serial_sel_1_i,
    input wire fi_serial_data_ingress_i,
    output reg fi_serial_data_egress_o,

    output reg fi_osc_1_o,
    output reg fi_osc_2_o,

    output reg fi_trng_o

);

    ////////////////////////////
    // ua_crypto core-side nets
    ////////////////////////////

    wire ua_clk_fast;
    wire ua_clk_slow;
    wire ua_reset_n;

    wire ua_clk_mux_sel;
    wire ua_enc_dec_sel;
    wire ua_start;
    wire ua_done;

    wire ua_serial_enable;
    wire ua_serial_sel_0;
    wire ua_serial_sel_1;
    wire ua_serial_sel_2;
    wire ua_serial_data_ingress;
    wire ua_serial_data_egress;

    wire ua_chicken_bits_0;
    wire ua_chicken_bits_1;

    ////////////////////////////
    // Frequency injection core-sided nets
    ////////////////////////////

    wire fi_serial_enable;
    wire fi_serial_sel_0;
    wire fi_serial_sel_1;
    wire fi_serial_data_ingress;
    wire fi_serial_data_egress;

    wire fi_enable_osc_0;
    wire fi_enable_osc_1;
    wire fi_enable_osc_2;
    wire fi_enable_osc_3;
    wire fi_enable_osc_4;
    wire fi_enable_osc_5;
    wire fi_enable_osc_6;
    wire fi_enable_osc_7;

    wire fi_trimming_0;
    wire fi_trimming_1;
    wire fi_trimming_2;
    wire fi_trimming_3;
    wire fi_trimming_4;
    wire fi_trimming_5;
    wire fi_trimming_6;
    wire fi_trimming_7;

    wire fi_osc_1_mux_sel_0;  // Bit 0 of register
    wire fi_osc_1_mux_sel_1;
    wire fi_osc_1_mux_sel_2;
    wire fi_osc_2_mux_sel_0;
    wire fi_osc_2_mux_sel_1;
    wire fi_osc_2_mux_sel_2;  // Bit 5 of register

    wire fi_trng_mux_sel_0;
    wire fi_trng_mux_sel_1;

    wire fi_osc_1;
    wire fi_osc_2;
    wire fi_trng;

    io_ring u_io_ring (

        ////////////////////////////
        // To/from bond wires
        ////////////////////////////

        .ua_clk_fast_i(ua_clk_fast_i),
        .ua_clk_slow_i(ua_clk_slow_i),
        .ua_reset_n_i(ua_reset_n_i),

        .ua_clk_mux_sel_i(ua_clk_mux_sel_i),
        .ua_enc_dec_sel_i(ua_enc_dec_sel_i),
        .ua_start_i(ua_start_i),
        .ua_done_o(ua_done_o),

        .ua_serial_enable_i(ua_serial_enable_i),
        .ua_serial_sel_0_i(ua_serial_sel_0_i),
        .ua_serial_sel_1_i(ua_serial_sel_1_i),
        .ua_serial_sel_2_i(ua_serial_sel_2_i),
        .ua_serial_data_ingress_i(ua_serial_data_ingress_i),
        .ua_serial_data_egress_o(ua_serial_data_egress_o),

        .ua_chicken_bits_1_i(ua_chicken_bits_1_i),

        .fi_serial_enable_i(fi_serial_enable_i),
        .fi_serial_sel_0_i(fi_serial_sel_0_i),
        .fi_serial_sel_1_i(fi_serial_sel_1_i),
        .fi_serial_data_ingress_i(fi_serial_data_ingress_i),
        .fi_serial_data_egress_o(fi_serial_data_egress_o),

        .fi_osc_1_o(fi_osc_1_o),
        .fi_osc_2_o(fi_osc_2_o),

        .fi_trng_o(fi_trng_o),

        ////////////////////////////
        // To/from core
        ////////////////////////////

        .ua_clk_fast_o(ua_clk_fast),
        .ua_clk_slow_o(ua_clk_slow),
        .ua_reset_n_o(ua_reset_n),

        .ua_clk_mux_sel_o(ua_clk_mux_sel),
        .ua_enc_dec_sel_o(ua_enc_dec_sel),
        .ua_start_o(ua_start),
        .ua_done_i(ua_done),

        .ua_serial_enable_o(ua_serial_enable),
        .ua_serial_sel_0_o(ua_serial_sel_0),
        .ua_serial_sel_1_o(ua_serial_sel_1),
        .ua_serial_sel_2_o(ua_serial_sel_2),
        .ua_serial_data_ingress_o(ua_serial_data_ingress),
        .ua_serial_data_egress_i(ua_serial_data_egress),

        .ua_chicken_bits_1_o(ua_chicken_bits_1),

        .fi_serial_enable_o(fi_serial_enable),
        .fi_serial_sel_0_o(fi_serial_sel_0),
        .fi_serial_sel_1_o(fi_serial_sel_1),
        .fi_serial_data_ingress_o(fi_serial_data_ingress),
        .fi_serial_data_egress_i(fi_serial_data_egress),

        .fi_osc_1_i(fi_osc_1),
        .fi_osc_2_i(fi_osc_2),

        .fi_trng_i(fi_trng)

    );

    dig_top u_dig_top (

        .clk_fast_i(ua_clk_fast),
        .clk_slow_i(ua_clk_slow),
        .reset_n_i(ua_reset_n),

        .clk_mux_sel_i(ua_clk_mux_sel),
        .enc_dec_sel_i(ua_enc_dec_sel),
        .start_i(ua_start),
        .done_o(ua_done),

        .ua_serial_enable_i(ua_serial_enable),
        .ua_serial_sel_0_i(ua_serial_sel_0),
        .ua_serial_sel_1_i(ua_serial_sel_1),
        .ua_serial_sel_2_i(ua_serial_sel_2),
        .ua_serial_data_ingress_i(ua_serial_data_ingress),
        .ua_serial_data_egress_o(ua_serial_data_egress),

        .fi_serial_enable_i(fi_serial_enable),
        .fi_serial_sel_0_i(fi_serial_sel_0),
        .fi_serial_sel_1_i(fi_serial_sel_1),
        .fi_serial_data_ingress_i(fi_serial_data_ingress),
        .fi_serial_data_egress_o(fi_serial_data_egress),

        .chicken_bits_1_i(ua_chicken_bits_1),

        //////////////////////////
        // Frequency injection digital control signals
        //////////////////////////

        // Bitblasted FI serial reg 0 (Oscillator enables)
        .fi_enable_osc_0_o(fi_enable_osc_0),
        .fi_enable_osc_1_o(fi_enable_osc_1),
        .fi_enable_osc_2_o(fi_enable_osc_2),
        .fi_enable_osc_3_o(fi_enable_osc_3),
        .fi_enable_osc_4_o(fi_enable_osc_4),
        .fi_enable_osc_5_o(fi_enable_osc_5),
        .fi_enable_osc_6_o(fi_enable_osc_6),
        .fi_enable_osc_7_o(fi_enable_osc_7),

        // Bitblasted FI serial reg 1 (Trimming bits)
        .fi_trimming_0_o(fi_trimming_0),
        .fi_trimming_1_o(fi_trimming_1),
        .fi_trimming_2_o(fi_trimming_2),
        .fi_trimming_3_o(fi_trimming_3),
        .fi_trimming_4_o(fi_trimming_4),
        .fi_trimming_5_o(fi_trimming_5),
        .fi_trimming_6_o(fi_trimming_6),
        .fi_trimming_7_o(fi_trimming_7),

        // Bitblasted FI serial reg 2 (OSC1 + OSC2 IO PIN mux sel)
        .fi_osc_1_mux_sel_0_o(fi_osc_1_mux_sel_0),  // Bit 0 of register
        .fi_osc_1_mux_sel_1_o(fi_osc_1_mux_sel_1),
        .fi_osc_1_mux_sel_2_o(fi_osc_1_mux_sel_2),
        .fi_osc_2_mux_sel_0_o(fi_osc_2_mux_sel_0),
        .fi_osc_2_mux_sel_1_o(fi_osc_2_mux_sel_1),
        .fi_osc_2_mux_sel_2_o(fi_osc_2_mux_sel_2),  // Bit 5 of register

        // Bitblasted FI serial reg 3 (TRNG IO PIN mux sel)
        .fi_trng_mux_sel_0_o(fi_trng_mux_sel_0),
        .fi_trng_mux_sel_1_o(fi_trng_mux_sel_1)

    );

    ana_top u_ana_top (

        ////////////////////////////
        // Digital control bits
        ////////////////////////////

        // Bitblasted FI serial reg 0 (Oscillator enables)
        .enable_osc_0_i(fi_enable_osc_0),
        .enable_osc_1_i(fi_enable_osc_1),
        .enable_osc_2_i(fi_enable_osc_2),
        .enable_osc_3_i(fi_enable_osc_3),
        .enable_osc_4_i(fi_enable_osc_4),
        .enable_osc_5_i(fi_enable_osc_5),
        .enable_osc_6_i(fi_enable_osc_6),
        .enable_osc_7_i(fi_enable_osc_7),

        // Bitblasted FI serial reg 1 (Trimming bits)
        .trimming_0_i(fi_trimming_0),
        .trimming_1_i(fi_trimming_1),
        .trimming_2_i(fi_trimming_2),
        .trimming_3_i(fi_trimming_3),
        .trimming_4_i(fi_trimming_4),
        .trimming_5_i(fi_trimming_5),
        .trimming_6_i(fi_trimming_6),
        .trimming_7_i(fi_trimming_7),

        // Bitblasted FI serial reg 2 (OSC1 + OSC2 IO PIN mux sel)
        .osc_1_mux_sel_0_i(fi_osc_1_mux_sel_0),  // Bit 0 of register
        .osc_1_mux_sel_1_i(fi_osc_1_mux_sel_1),
        .osc_1_mux_sel_2_i(fi_osc_1_mux_sel_2),
        .osc_2_mux_sel_0_i(fi_osc_2_mux_sel_0),
        .osc_2_mux_sel_1_i(fi_osc_2_mux_sel_1),
        .osc_2_mux_sel_2_i(fi_osc_2_mux_sel_2),  // Bit 5 of register

        // Bitblasted FI serial reg 3 (TRNG IO PIN mux sel)
        .trng_mux_sel_0_i(fi_trng_mux_sel_0),
        .trng_mux_sel_1_i(fi_trng_mux_sel_1),

        ////////////////////////////
        // To/From wirebonded IOs
        ////////////////////////////

        .clk_i(ua_clk_slow),
        .osc_1_o(fi_osc_1),
        .osc_2_o(fi_osc_2),
        .trng_o(fi_trng)

    );

endmodule
