module dig_top (

    /////////////////////////
    // To/from chip IO
    /////////////////////////

    input wire clk_fast_i,
    input wire clk_slow_i,
    input wire reset_n_i,

    input wire clk_mux_sel_i,
    input wire enc_dec_sel_i,
    input wire start_i,
    output reg done_o,

    input wire ua_serial_enable_i,
    input wire ua_serial_sel_0_i,
    input wire ua_serial_sel_1_i,
    input wire ua_serial_sel_2_i,
    input wire ua_serial_data_ingress_i,
    output reg ua_serial_data_egress_o,

    input wire fi_serial_enable_i,
    input wire fi_serial_sel_0_i,
    input wire fi_serial_sel_1_i,
    input wire fi_serial_data_ingress_i,
    output reg fi_serial_data_egress_o,

    // input wire chicken_bits_0_i,
    input wire chicken_bits_1_i,

    /////////////////////////
    // To FI analog blocks
    /////////////////////////

    // Bitblasted FI serial reg 0 (Oscillator enables)
    output wire fi_enable_osc_0_o,
    output wire fi_enable_osc_1_o,
    output wire fi_enable_osc_2_o,
    output wire fi_enable_osc_3_o,
    output wire fi_enable_osc_4_o,
    output wire fi_enable_osc_5_o,
    output wire fi_enable_osc_6_o,
    output wire fi_enable_osc_7_o,

    // Bitblasted FI serial reg 1 (Trimming bits)
    output wire fi_trimming_0_o,
    output wire fi_trimming_1_o,
    output wire fi_trimming_2_o,
    output wire fi_trimming_3_o,
    output wire fi_trimming_4_o,
    output wire fi_trimming_5_o,
    output wire fi_trimming_6_o,
    output wire fi_trimming_7_o,

    // Bitblasted FI serial reg 2 (OSC1 + OSC2 IO PIN mux sel)
    output wire fi_osc_1_mux_sel_0_o,  // Bit 0 of register
    output wire fi_osc_1_mux_sel_1_o,
    output wire fi_osc_1_mux_sel_2_o,
    output wire fi_osc_2_mux_sel_0_o,
    output wire fi_osc_2_mux_sel_1_o,
    output wire fi_osc_2_mux_sel_2_o,  // Bit 5 of register

    // Bitblasted FI serial reg 3 (TRNG IO PIN mux sel)
    output wire fi_trng_mux_sel_0_o,
    output wire fi_trng_mux_sel_1_o

);

    wire clk_kalyna_hs, clk_kalyna_hs_enc, clk_kalyna_lp, clk_kalyna_secure1, clk_kalyna_secure2, clk_kupyna_hs, clk_kupyna_lp, clk_kalyna_kupyna, clk_aes, clk_sha256;
    // wire reset_n_sync_west, reset_n_sync_east;
    wire reset_n_sync_west;

    wire enc_dec_mode_sel_sync;
    wire hash_msg_chunk;

    wire[127:0] key;
    wire[127:0] ptext;
    wire[511:0] msg;

    wire[127:0] kalyna_hs_ctext, kalyna_hs_enc_ctext, kalyna_lp_ctext, kalyna_secure1_ctext, kalyna_secure2_ctext, kalyna_kupyna_ctext, aes_ctext;
    wire[255:0] kupyna_hs_hmsg, kupyna_lp_hmsg, kalyna_kupyna_hmsg, sha256_hmsg;

    wire kalyna_hs_start, kalyna_hs_done;
    wire kalyna_hs_enc_start, kalyna_hs_enc_done;
    wire kalyna_lp_start, kalyna_lp_done;
    wire kalyna_secure1_start_kalyna, kalyna_secure1_done;
    wire kalyna_secure2_start_kalyna, kalyna_secure2_done;
    wire kupyna_lp_start, kupyna_lp_done;
    wire kupyna_hs_start, kupyna_hs_done;
    wire kalyna_kupyna_start_kalyna, kalyna_kupyna_start_kupyna, kalyna_kupyna_done;
    wire aes_start, aes_done;
    wire sha256_start, sha256_done;

    wire[7:0] fi_enable_osc;
    wire[7:0] fi_trimming;
    wire[5:0] fi_mux_osc;
    wire[1:0] fi_mux_trng;

    top_ctrl u_top_ctrl (

        /////////////////////////
        // To/from chip IO
        /////////////////////////

        .clk_fast_i(clk_fast_i),
        .clk_slow_i(clk_slow_i),
        .reset_n_i(reset_n_i),

        .clk_mux_sel_i(clk_mux_sel_i),
        // .enc_dec_sel_i(enc_dec_mode_e'(enc_dec_sel_i)),
        .enc_dec_sel_i(enc_dec_sel_i),
        .start_i(start_i),
        .done_o(done_o),

        .ua_serial_enable_i(ua_serial_enable_i),
        .ua_serial_sel_0_i(ua_serial_sel_0_i),
        .ua_serial_sel_1_i(ua_serial_sel_1_i),
        .ua_serial_sel_2_i(ua_serial_sel_2_i),
        .ua_serial_data_ingress_i(ua_serial_data_ingress_i),
        .ua_serial_data_egress_o(ua_serial_data_egress_o),

        .fi_serial_enable_i(fi_serial_enable_i),
        .fi_serial_sel_0_i(fi_serial_sel_0_i),
        .fi_serial_sel_1_i(fi_serial_sel_1_i),
        .fi_serial_data_ingress_i(fi_serial_data_ingress_i),
        .fi_serial_data_egress_o(fi_serial_data_egress_o),

        /////////////////////////
        // To/from crypto blocks
        /////////////////////////

        .clk_kalyna_hs_o(clk_kalyna_hs),
        .clk_kalyna_hs_enc_o(clk_kalyna_hs_enc),
        .clk_kalyna_lp_o(clk_kalyna_lp),
        .clk_kalyna_secure1_o(clk_kalyna_secure1),
        .clk_kalyna_secure2_o(clk_kalyna_secure2),
        .clk_kupyna_hs_o(clk_kupyna_hs),
        .clk_kupyna_lp_o(clk_kupyna_lp),
        .clk_kalyna_kupyna_o(clk_kalyna_kupyna),
        .clk_aes_o(clk_aes),
        .clk_sha256_o(clk_sha256),

        .reset_n_sync_west_o(reset_n_sync_west),
        // .reset_n_sync_west_o(reset_n_sync_west),

        .enc_dec_mode_sel_o(enc_dec_mode_sel_sync),
        .hash_msg_chunk_o(hash_msg_chunk),

        .key_o(key),
        .ptext_o(ptext),
        .msg_o(msg),

        .kalyna_hs_ctext_i(kalyna_hs_ctext),
        .kalyna_hs_enc_ctext_i(kalyna_hs_enc_ctext),
        .kalyna_lp_ctext_i(kalyna_lp_ctext),
        .kalyna_secure1_ctext_i(kalyna_secure1_ctext),
        .kalyna_secure2_ctext_i(kalyna_secure2_ctext),
        .kalyna_kupyna_ctext_i(kalyna_kupyna_ctext),
        .aes_ctext_i(aes_ctext),

        .kupyna_hs_hmsg_i(kupyna_hs_hmsg),
        .kupyna_lp_hmsg_i(kupyna_lp_hmsg),
        .kalyna_kupyna_hmsg_i(kalyna_kupyna_hmsg),
        .sha256_hmsg_i(sha256_hmsg),

        .kalyna_hs_start_o(kalyna_hs_start),
        .kalyna_hs_done_i(kalyna_hs_done),

        .kalyna_hs_enc_start_o(kalyna_hs_enc_start),
        .kalyna_hs_enc_done_i(kalyna_hs_enc_done),

        .kalyna_lp_start_o(kalyna_lp_start),
        .kalyna_lp_done_i(kalyna_lp_done),

        .kalyna_secure1_start_o(kalyna_secure1_start),
        .kalyna_secure1_done_i(kalyna_secure1_done),

        .kalyna_secure2_start_o(kalyna_secure2_start),
        .kalyna_secure2_done_i(kalyna_secure2_done),

        .kupyna_hs_start_o(kupyna_hs_start),
        .kupyna_hs_done_i(kupyna_hs_done),

        .kupyna_lp_start_o(kupyna_lp_start),
        .kupyna_lp_done_i(kupyna_lp_done),

        .kalyna_kupyna_start_kalyna_o(kalyna_kupyna_start_kalyna),
        .kalyna_kupyna_start_kupyna_o(kalyna_kupyna_start_kupyna),
        .kalyna_kupyna_done_i(kalyna_kupyna_done),

        .aes_start_o(aes_start),
        .aes_done_i(aes_done),

        .sha256_start_o(sha256_start),
        .sha256_done_i(sha256_done),

        .chicken_bits_1_i(chicken_bits_1_i),

        /////////////////////////
        // To/from FI analog blocks
        /////////////////////////

        .fi_enable_osc_o(fi_enable_osc),
        .fi_trimming_o(fi_trimming),
        .fi_mux_osc_o(fi_mux_osc),
        .fi_mux_trng_o(fi_mux_trng)

    );

    kalyna_hs_top u_kalyna_hs (
        .clk(clk_kalyna_hs),
        .reset_n(reset_n_sync_west),
        .key_i(key),
        .ptext_i(ptext),
        .start_i(kalyna_hs_start),
        .mode_i(enc_dec_mode_sel_sync),
        .ctext_o(kalyna_hs_ctext),
        .done_o(kalyna_hs_done)
    );

    kalyna_hs_enc_top u_kalyna_hs_enc (
        .clk(clk_kalyna_hs_enc),
        .reset_n(reset_n_sync_west),
        .key_i(key),
        .ptext_i(ptext),
        .start_i(kalyna_hs_enc_start),
        .ctext_o(kalyna_hs_enc_ctext),
        .done_o(kalyna_hs_enc_done)
    );

    kalyna_lp_top u_kalyna_lp (
        .clk(clk_kalyna_lp),
        .reset_n(reset_n_sync_west),
        .key_i(key),
        .ptext_i(ptext),
        .start_i(kalyna_lp_start),
        .mode_i(enc_dec_mode_sel_sync),
        .ctext_o(kalyna_lp_ctext),
        .done_o(kalyna_lp_done)
    );

    // kalyna_secure1_top removed for tapeout
    // kalyna_secure1_top u_kalyna_secure1 (
    //     .clk(clk_kalyna_secure1),
    //     .reset_n(reset_n_sync_west),
    //     .key_i(key),
    //     .ptext_i(ptext),
    //     .start_i(kalyna_secure1_start),
    //     .mode_i(enc_dec_mode_sel_sync),
    //     .ctext_o(kalyna_secure1_ctext),
    //     .done_o(kalyna_secure1_done)
    // );
    assign kalyna_secure1_ctext = 128'h0;
    assign kalyna_secure1_done = kalyna_secure1_start;

    kalyna_secure2_top u_kalyna_secure2 (
        .clk(clk_kalyna_secure2),
        .reset_n(reset_n_sync_west),
        .key_i(key),
        .ptext_i(ptext),
        .start_i(kalyna_secure2_start),
        .mode_i(enc_dec_mode_sel_sync),
        .ctext_o(kalyna_secure2_ctext),
        .done_o(kalyna_secure2_done)
    );

    // kupyna_hs_top removed for tapeout
    // kupyna_hs_top u_kupyna_hs (
    //     .clk(clk_kupyna_hs),
    //     .reset_n(reset_n_sync_west),
    //     .msg_i(msg),
    //     .start_i(kupyna_hs_start),
    //     .mode_i(hash_msg_chunk),
    //     .hmsg_o(kupyna_hs_hmsg),
    //     .done_o(kupyna_hs_done)
    // );
    assign kupyna_hs_hmsg = 256'h0;
    assign kupyna_hs_done = kupyna_hs_start;

    kupyna_lp_top u_kupyna_lp (
        .clk(clk_kupyna_lp),
        .reset_n(reset_n_sync_west),
        .msg_i(msg),
        .start_i(kupyna_lp_start),
        .mode_i(hash_msg_chunk),
        .hmsg_o(kupyna_lp_hmsg),
        .done_o(kupyna_lp_done)
    );

    kalyna_kupyna_top u_kalyna_kupyna (
        .clk(clk_kalyna_kupyna),
        .reset_n(reset_n_sync_west),
        .key_i(key),
        .ptext_i(ptext),
        .msg_i(msg),
        .start_kalyna_i(kalyna_kupyna_start_kalyna),
        .start_kupyna_i(kalyna_kupyna_start_kupyna),
        .kalyna_mode_i(enc_dec_mode_sel_sync),
        .kupyna_mode_i(hash_msg_chunk),
        .ctext_o(kalyna_kupyna_ctext),
        .hmsg_o(kalyna_kupyna_hmsg),
        .done_o(kalyna_kupyna_done)
    );

    aes_top u_aes (
        .clk(clk_aes),
        .reset_n(reset_n_sync_west),
        .key_i(key),
        .ptext_i(ptext),
        .start_i(aes_start),
        .mode_i(enc_dec_mode_sel_sync),
        .ctext_o(aes_ctext),
        .done_o(aes_done)
    );

    sha256_top u_sha256 (
        .clk(clk_sha256),
        .reset_n(reset_n_sync_west),
        .msg_i(msg),
        .start_i(sha256_start),
        .mode_i(hash_msg_chunk),
        .hmsg_o(sha256_hmsg),
        .done_o(sha256_done)
    );

    // FI serial reg 0 (Oscillator enables)
    assign fi_enable_osc_0_o = fi_enable_osc[0];
    assign fi_enable_osc_1_o = fi_enable_osc[1];
    assign fi_enable_osc_2_o = fi_enable_osc[2];
    assign fi_enable_osc_3_o = fi_enable_osc[3];
    assign fi_enable_osc_4_o = fi_enable_osc[4];
    assign fi_enable_osc_5_o = fi_enable_osc[5];
    assign fi_enable_osc_6_o = fi_enable_osc[6];
    assign fi_enable_osc_7_o = fi_enable_osc[7];

    // FI serial reg 1 (Trimming bits)
    assign fi_trimming_0_o = fi_trimming[0];
    assign fi_trimming_1_o = fi_trimming[1];
    assign fi_trimming_2_o = fi_trimming[2];
    assign fi_trimming_3_o = fi_trimming[3];
    assign fi_trimming_4_o = fi_trimming[4];
    assign fi_trimming_5_o = fi_trimming[5];
    assign fi_trimming_6_o = fi_trimming[6];
    assign fi_trimming_7_o = fi_trimming[7];

    // FI serial reg 2 (OSC1 + OSC2 IO PIN mux sel)
    assign fi_osc_1_mux_sel_0_o = fi_mux_osc[0];
    assign fi_osc_1_mux_sel_1_o = fi_mux_osc[1];
    assign fi_osc_1_mux_sel_2_o = fi_mux_osc[2];
    assign fi_osc_2_mux_sel_0_o = fi_mux_osc[3];
    assign fi_osc_2_mux_sel_1_o = fi_mux_osc[4];
    assign fi_osc_2_mux_sel_2_o = fi_mux_osc[5];

    // FI serial reg 3 (TRNG IO PIN mux sel)
    assign fi_trng_mux_sel_0_o = fi_mux_trng[0];
    assign fi_trng_mux_sel_1_o = fi_mux_trng[1];

endmodule
