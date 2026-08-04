module top_ctrl
    import ua_crypto_pkg::*;
(

    input logic clk_fast_i,  // 800 MHz top for AES
    input logic clk_slow_i,  // 10 MHz
    input logic reset_n_i,

    // This is assumed to be quasi-static, no need to worry about CDC here
    input logic clk_mux_sel_i,

    input enc_dec_mode_e enc_dec_sel_i,
    input logic start_i,
    output logic done_o,

    input logic ua_serial_enable_i,
    input logic ua_serial_sel_0_i,
    input logic ua_serial_sel_1_i,
    input logic ua_serial_sel_2_i,
    input logic ua_serial_data_ingress_i,
    output logic ua_serial_data_egress_o,

    // FI (Frequency Injection) serial interface
    input logic fi_serial_enable_i,
    input logic fi_serial_sel_0_i,
    input logic fi_serial_sel_1_i,
    input logic fi_serial_data_ingress_i,
    output logic fi_serial_data_egress_o,

    // Synced to clk_muxed domain
    // input logic chicken_bits_0_i,  // Power switch override to all 1s (removed)
    input logic chicken_bits_1_i,  // ICG enable override to all 1s

    output logic clk_kalyna_hs_o,
    output logic clk_kalyna_lp_o,
    output logic clk_kalyna_secure1_o,
    output logic clk_kalyna_secure2_o,
    output logic clk_kupyna_hs_o,
    output logic clk_kupyna_lp_o,
    output logic clk_kalyna_kupyna_o,
    output logic clk_aes_o,
    output logic clk_sha256_o,
    output logic clk_kalyna_hs_enc_o,

    output logic reset_n_sync_west_o,
    output logic reset_n_sync_east_o,

    output enc_dec_mode_e enc_dec_mode_sel_o,
    output hash_msg_chunk_e hash_msg_chunk_o,

    output logic[127:0] key_o,
    output logic[127:0] ptext_o,
    output logic[511:0] msg_o,

    input logic[127:0] kalyna_hs_ctext_i,
    input logic[127:0] kalyna_hs_enc_ctext_i,
    input logic[127:0] kalyna_lp_ctext_i,
    input logic[127:0] kalyna_secure1_ctext_i,
    input logic[127:0] kalyna_secure2_ctext_i,
    input logic[127:0] kalyna_kupyna_ctext_i,
    input logic[127:0] aes_ctext_i,

    input logic[255:0] kupyna_hs_hmsg_i,
    input logic[255:0] kalyna_kupyna_hmsg_i,
    input logic[255:0] kupyna_lp_hmsg_i,
    input logic[255:0] sha256_hmsg_i,

    output logic kalyna_hs_start_o,
    input logic kalyna_hs_done_i,

    output logic kalyna_hs_enc_start_o,
    input logic kalyna_hs_enc_done_i,

    output logic kalyna_lp_start_o,
    input logic kalyna_lp_done_i,

    output logic kalyna_secure1_start_o,
    input logic kalyna_secure1_done_i,

    output logic kalyna_secure2_start_o,
    input logic kalyna_secure2_done_i,

    output logic kupyna_hs_start_o,
    input logic kupyna_hs_done_i,

    output logic kupyna_lp_start_o,
    input logic kupyna_lp_done_i,

    output logic kalyna_kupyna_start_kalyna_o,
    output logic kalyna_kupyna_start_kupyna_o,
    input logic kalyna_kupyna_done_i,

    output logic aes_start_o,
    input logic aes_done_i,

    output logic sha256_start_o,
    input logic sha256_done_i,

    // Frequency Injection serial register outputs
    output logic[7:0] fi_enable_osc_o,
    output logic[7:0] fi_trimming_o,
    output logic[5:0] fi_mux_osc_o,
    output logic[1:0] fi_mux_trng_o

);

    logic clk_muxed;
    logic reset_n_sync;
    logic start_sync;
    logic clk_mux_sel_sync;
    // logic chicken_bits_0_sync;
    logic chicken_bits_1_sync;

    logic[127:0] key;
    logic[127:0] ptext;
    logic[511:0] msg;
    logic[127:0] ciphertext;
    logic[255:0] hash;
    cipher_hash_mode_e cipher_hash_mode;
    logic ciphertext_we;
    logic hash_we;
    crypto_block_e block_sel;

    typedef enum logic[2:0] {IDLE, ENABLE_BLOCK_CLOCK, WAIT_ENABLE_BLOCK_CLOCK, START_OP, RUN, WAIT_FINISH, CAPTURE_RESULT} state_e;

    state_e state, state_next;

    // Generic timing counter for FSM delays
    // FIXME: 8 is arbitrary, could be smaller
    localparam int unsigned TIMING_COUNTER_WIDTH = 4;
    localparam logic[TIMING_COUNTER_WIDTH-1:0] ICG_ENABLE_WAIT_CYCLES = 4'd15;  // Number of clk_slow_i cycles to wait after enabling ICGs
    localparam logic[TIMING_COUNTER_WIDTH-1:0] COOLDOWN_WAIT_CYCLES = 4'd15;  // Number of clk_slow_i cycles to wait after start_i pin has been deasserted until asserting done_o

    logic[TIMING_COUNTER_WIDTH-1:0] timing_counter;
    logic[TIMING_COUNTER_WIDTH-1:0] timing_counter_load_value;
    logic timing_counter_load;
    logic timing_counter_done;

    // Clock enable signals for each crypto block (registers)
    logic clk_en_kalyna_hs_reg;
    logic clk_en_kalyna_hs_enc_reg;
    logic clk_en_kalyna_lp_reg;
    logic clk_en_kalyna_secure1_reg;
    logic clk_en_kalyna_secure2_reg;
    logic clk_en_kupyna_hs_reg;
    logic clk_en_kupyna_lp_reg;
    logic clk_en_kalyna_kupyna_reg;
    logic clk_en_aes_reg;
    logic clk_en_sha256_reg;

    // Synchronized ICG enable signals in clk_muxed domain
    logic clk_en_kalyna_hs_sync;
    logic clk_en_kalyna_hs_enc_sync;
    logic clk_en_kalyna_lp_sync;
    logic clk_en_kalyna_secure1_sync;
    logic clk_en_kalyna_secure2_sync;
    logic clk_en_kupyna_hs_sync;
    logic clk_en_kupyna_lp_sync;
    logic clk_en_kalyna_kupyna_sync;
    logic clk_en_aes_sync;
    logic clk_en_sha256_sync;

    // FSM control signals for clock enable registers
    logic clk_enable_blocks;
    logic clk_disable_all_blocks;

    // Start signal generation using sync instances
    logic start_selected_block;
    logic stop_block;
    logic kalyna_hs_start_sync;
    logic kalyna_lp_start_sync;
    logic kalyna_secure1_start_sync;
    logic kalyna_secure2_start_sync;
    logic kupyna_hs_start_sync;
    logic kupyna_lp_start_sync;
    logic kalyna_kupyna_start_kalyna_sync;
    logic kalyna_kupyna_start_kupyna_sync;
    logic aes_start_sync;
    logic sha256_start_sync;
    logic kalyna_hs_enc_start_sync;

    // Block-specific start enable signals (based on selected block)
    logic kalyna_hs_start;
    logic kalyna_lp_start;
    logic kalyna_secure1_start;
    logic kalyna_secure2_start;
    logic kupyna_hs_start;
    logic kupyna_lp_start;
    logic kalyna_kupyna_start_kalyna_en;
    logic kalyna_kupyna_start_kupyna_en;
    logic aes_start;
    logic sha256_start;
    logic kalyna_hs_enc_start;

    // Done output register
    logic done_reg;
    logic done_reg_set;
    logic done_reg_clear;

    // Operation done signal for selected block
    logic operation_done, operation_done_buffered, operation_done_q;

    // Outputs from crypto output registers module
    logic[127:0] kalyna_hs_ctext_reg;
    logic[127:0] kalyna_hs_enc_ctext_reg;
    logic[127:0] kalyna_lp_ctext_reg;
    logic[127:0] kalyna_secure1_ctext_reg;
    logic[127:0] kalyna_secure2_ctext_reg;
    logic[127:0] kalyna_kupyna_ctext_reg;
    logic[127:0] aes_ctext_reg;

    logic[255:0] kupyna_hs_hmsg_reg;
    logic[255:0] kupyna_lp_hmsg_reg;
    logic[255:0] kalyna_kupyna_hmsg_reg;
    logic[255:0] sha256_hmsg_reg;

    // GFM slow-fast clock mux with glitch-free switching
    // clk_mux_glitch_free u_clk_mux_glitch_free (
    //     .clks_i({clk_slow_i, clk_fast_i}),
    //     .test_clk_i(1'b0),
    //     .test_en_i(1'b0),
    //     .async_rstn_i(reset_n_i),
    //     .async_sel_i(clk_mux_sel_i),
    //     .clk_o(clk_muxed)
    // );
    // We can use a regular clock mux here because clk_muxed feeds only ICGs that are only enabled
    // after clock is stable, glitch-free switching is not needed
    tc_clk_mux2 u_tc_clk_mux2 (
        .clk0_i(clk_slow_i),
        .clk1_i(clk_fast_i),
        .clk_sel_i(clk_mux_sel_sync),
        .clk_o(clk_muxed)
    );

    sync u_clk_mux_sel_sync (
        .clk_i      (clk_slow_i),
        .rst_ni     (reset_n_i),
        .serial_i   (clk_mux_sel_i),
        .serial_o   (clk_mux_sel_sync)
    );

    // Reset sync (to clk_slow domain)
    rstgen u_rstgen (
        .clk_i      (clk_slow_i),
        .rst_ni     (reset_n_i),
        .test_mode_i(1'b0),
        .rst_no     (reset_n_sync),
        .init_no    ()
    );

    // Assign reset output from register
    assign reset_n_sync_west_o = reset_n_sync;
    assign reset_n_sync_east_o = reset_n_sync;

    // Integrated Clock Gates for each crypto block
    // chicken_bits_1_sync: Override ICG enables to all 1s
    // Use synchronized ICG enables to clk_muxed domain
    // KALYNA_HS ICG
    tc_clk_gating u_icg_kalyna_hs (
        .clk_i(clk_muxed),
        .en_i(chicken_bits_1_sync | clk_en_kalyna_hs_sync),
        .test_en_i(1'b0),
        .clk_o(clk_kalyna_hs_o)
    );

    // KALYNA_HS_ENC ICG
    tc_clk_gating u_icg_kalyna_hs_enc (
        .clk_i(clk_muxed),
        .en_i(chicken_bits_1_sync | clk_en_kalyna_hs_enc_sync),
        .test_en_i(1'b0),
        .clk_o(clk_kalyna_hs_enc_o)
    );

    // KALYNA_LP ICG
    tc_clk_gating u_icg_kalyna_lp (
        .clk_i(clk_muxed),
        .en_i(chicken_bits_1_sync | clk_en_kalyna_lp_sync),
        .test_en_i(1'b0),
        .clk_o(clk_kalyna_lp_o)
    );

    // KALYNA_SECURE1 ICG
    tc_clk_gating u_icg_kalyna_secure1 (
        .clk_i(clk_muxed),
        .en_i(chicken_bits_1_sync | clk_en_kalyna_secure1_sync),
        .test_en_i(1'b0),
        .clk_o(clk_kalyna_secure1_o)
    );

    // KALYNA_SECURE2 ICG
    tc_clk_gating u_icg_kalyna_secure2 (
        .clk_i(clk_muxed),
        .en_i(chicken_bits_1_sync | clk_en_kalyna_secure2_sync),
        .test_en_i(1'b0),
        .clk_o(clk_kalyna_secure2_o)
    );

    // KUPYNA_HS ICG
    tc_clk_gating u_icg_kupyna_hs (
        .clk_i(clk_muxed),
        .en_i(chicken_bits_1_sync | clk_en_kupyna_hs_sync),
        .test_en_i(1'b0),
        .clk_o(clk_kupyna_hs_o)
    );

    // KUPYNA_LP ICG
    tc_clk_gating u_icg_kupyna_lp (
        .clk_i(clk_muxed),
        .en_i(chicken_bits_1_sync | clk_en_kupyna_lp_sync),
        .test_en_i(1'b0),
        .clk_o(clk_kupyna_lp_o)
    );

    // KALYNA_KUPYNA_LP ICG
    tc_clk_gating u_icg_kalyna_kupyna (
        .clk_i(clk_muxed),
        .en_i(chicken_bits_1_sync | clk_en_kalyna_kupyna_sync),
        .test_en_i(1'b0),
        .clk_o(clk_kalyna_kupyna_o)
    );

    // AES ICG
    tc_clk_gating u_icg_aes (
        .clk_i(clk_muxed),
        .en_i(chicken_bits_1_sync | clk_en_aes_sync),
        .test_en_i(1'b0),
        .clk_o(clk_aes_o)
    );

    // SHA256 ICG
    tc_clk_gating u_icg_sha256 (
        .clk_i(clk_muxed),
        .en_i(chicken_bits_1_sync | clk_en_sha256_sync),
        .test_en_i(1'b0),
        .clk_o(clk_sha256_o)
    );

    // Crypto output registers module
    crypto_output_registers u_crypto_output_registers (
        .clk_i(clk_muxed),
        .reset_n_i(reset_n_sync),

        // Ciphertext inputs from crypto blocks
        .kalyna_hs_ctext_i(kalyna_hs_ctext_i),
        .kalyna_hs_enc_ctext_i(kalyna_hs_enc_ctext_i),
        .kalyna_lp_ctext_i(kalyna_lp_ctext_i),
        .kalyna_secure1_ctext_i(kalyna_secure1_ctext_i),
        .kalyna_secure2_ctext_i(kalyna_secure2_ctext_i),
        .kalyna_kupyna_ctext_i(kalyna_kupyna_ctext_i),
        .aes_ctext_i(aes_ctext_i),

        // Hash inputs from crypto blocks
        .kupyna_hs_hmsg_i(kupyna_hs_hmsg_i),
        .kupyna_lp_hmsg_i(kupyna_lp_hmsg_i),
        .kalyna_kupyna_hmsg_i(kalyna_kupyna_hmsg_i),
        .sha256_hmsg_i(sha256_hmsg_i),

        // Done signals from crypto blocks
        .kalyna_hs_done_i(kalyna_hs_done_i),
        .kalyna_hs_enc_done_i(kalyna_hs_enc_done_i),
        .kalyna_lp_done_i(kalyna_lp_done_i),
        .kalyna_secure1_done_i(kalyna_secure1_done_i),
        .kalyna_secure2_done_i(kalyna_secure2_done_i),
        .kupyna_hs_done_i(kupyna_hs_done_i),
        .kupyna_lp_done_i(kupyna_lp_done_i),
        .kalyna_kupyna_done_i(kalyna_kupyna_done_i),
        .aes_done_i(aes_done_i),
        .sha256_done_i(sha256_done_i),

        // Registered outputs
        .kalyna_hs_ctext_reg_o(kalyna_hs_ctext_reg),
        .kalyna_hs_enc_ctext_reg_o(kalyna_hs_enc_ctext_reg),
        .kalyna_lp_ctext_reg_o(kalyna_lp_ctext_reg),
        .kalyna_secure1_ctext_reg_o(kalyna_secure1_ctext_reg),
        .kalyna_secure2_ctext_reg_o(kalyna_secure2_ctext_reg),
        .kalyna_kupyna_ctext_reg_o(kalyna_kupyna_ctext_reg),
        .aes_ctext_reg_o(aes_ctext_reg),

        .kupyna_hs_hmsg_reg_o(kupyna_hs_hmsg_reg),
        .kupyna_lp_hmsg_reg_o(kupyna_lp_hmsg_reg),
        .kalyna_kupyna_hmsg_reg_o(kalyna_kupyna_hmsg_reg),
        .sha256_hmsg_reg_o(sha256_hmsg_reg)
    );

    // Sync enc_dec_mode_sel_i to enc_dec_mode_sel_o
    sync u_sync_bit_enc_dec_mode (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (enc_dec_sel_i),
        .serial_o   (enc_dec_mode_sel_o)
    );

    // Sync start_i to clk_slow_i
    sync u_sync_bit_start (
        .clk_i      (clk_slow_i),
        .rst_ni     (reset_n_sync),
        .serial_i   (start_i),
        .serial_o   (start_sync)
    );

    // Sync chicken bits to clk_slow domain
    // sync u_sync_chicken_bits_0 (
    //     .clk_i      (clk_muxed),
    //     .rst_ni     (reset_n_sync),
    //     .serial_i   (chicken_bits_0_i),
    //     .serial_o   (chicken_bits_0_sync)
    // );

    sync u_sync_chicken_bits_1 (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (chicken_bits_1_i),
        .serial_o   (chicken_bits_1_sync)
    );

    // Synchronize ICG enable signals from clk_slow_i domain to clk_muxed domain
    sync u_sync_clk_en_kalyna_hs (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (clk_en_kalyna_hs_reg),
        .serial_o   (clk_en_kalyna_hs_sync)
    );

    sync u_sync_clk_en_kalyna_hs_enc (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (clk_en_kalyna_hs_enc_reg),
        .serial_o   (clk_en_kalyna_hs_enc_sync)
    );

    sync u_sync_clk_en_kalyna_lp (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (clk_en_kalyna_lp_reg),
        .serial_o   (clk_en_kalyna_lp_sync)
    );

    sync u_sync_clk_en_kalyna_secure1 (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (clk_en_kalyna_secure1_reg),
        .serial_o   (clk_en_kalyna_secure1_sync)
    );

    sync u_sync_clk_en_kalyna_secure2 (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (clk_en_kalyna_secure2_reg),
        .serial_o   (clk_en_kalyna_secure2_sync)
    );

    sync u_sync_clk_en_kupyna_hs (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (clk_en_kupyna_hs_reg),
        .serial_o   (clk_en_kupyna_hs_sync)
    );

    sync u_sync_clk_en_kupyna_lp (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (clk_en_kupyna_lp_reg),
        .serial_o   (clk_en_kupyna_lp_sync)
    );

    sync u_sync_clk_en_kalyna_kupyna (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (clk_en_kalyna_kupyna_reg),
        .serial_o   (clk_en_kalyna_kupyna_sync)
    );

    sync u_sync_clk_en_aes (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (clk_en_aes_reg),
        .serial_o   (clk_en_aes_sync)
    );

    sync u_sync_clk_en_sha256 (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (clk_en_sha256_reg),
        .serial_o   (clk_en_sha256_sync)
    );

    // Sync instances for start signal generation - these generate continuously asserted signals
    // when master_start_block is asserted and block is enabled
    // NOTE: Uses top_ctrl reset (synced to clk_slow) for reset_n_i, may need false path constraints in SDC
    sync u_sync_kalyna_hs_start (
        .clk_i      (clk_muxed),  // Use block's clock domain
        .rst_ni     (reset_n_sync),
        .serial_i   (kalyna_hs_start),
        .serial_o   (kalyna_hs_start_sync)
    );

    sync u_sync_kalyna_lp_start (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (kalyna_lp_start),
        .serial_o   (kalyna_lp_start_sync)
    );

    sync u_sync_kalyna_secure1_start (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (kalyna_secure1_start),
        .serial_o   (kalyna_secure1_start_sync)
    );

    sync u_sync_kalyna_secure2_start (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (kalyna_secure2_start),
        .serial_o   (kalyna_secure2_start_sync)
    );

    sync u_sync_kupyna_hs_start (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (kupyna_hs_start),
        .serial_o   (kupyna_hs_start_sync)
    );

    sync u_sync_kupyna_lp_start (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (kupyna_lp_start),
        .serial_o   (kupyna_lp_start_sync)
    );

    sync u_sync_kalyna_kupyna_start_kalyna (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (kalyna_kupyna_start_kalyna_en),
        .serial_o   (kalyna_kupyna_start_kalyna_sync)
    );

    sync u_sync_kalyna_kupyna_start_kupyna (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (kalyna_kupyna_start_kupyna_en),
        .serial_o   (kalyna_kupyna_start_kupyna_sync)
    );

    sync u_sync_aes_start (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (aes_start),
        .serial_o   (aes_start_sync)
    );

    sync u_sync_sha256_start (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (sha256_start),
        .serial_o   (sha256_start_sync)
    );

    sync u_sync_kalyna_hs_enc_start (
        .clk_i      (clk_muxed),
        .rst_ni     (reset_n_sync),
        .serial_i   (kalyna_hs_enc_start),
        .serial_o   (kalyna_hs_enc_start_sync)
    );

    // "Memory-mapped registers" for crypto blocks
    ua_serial_regs u_ua_serial_regs (

        .clk_i                      (clk_slow_i),
        .reset_n_i                  (reset_n_sync),

        /////////////////////////
        // To/from chip IO
        /////////////////////////

        .serial_enable_i            (ua_serial_enable_i),
        .serial_sel_i               ({ua_serial_sel_2_i, ua_serial_sel_1_i, ua_serial_sel_0_i}),
        .serial_data_ingress_i      (ua_serial_data_ingress_i),
        .serial_data_egress_o       (ua_serial_data_egress_o),

        /////////////////////////
        // To/from top controller, to be distributed to crypto blocks
        /////////////////////////

        .key_o                      (key),
        .plaintext_o                (ptext),
        .message_o                  (msg),

        .ciphertext_we_i            (ciphertext_we),
        .ciphertext_i               (ciphertext),

        .hash_we_i                  (hash_we),  // Always write hash when available
        .hash_i                     (hash),

        .cipher_hash_mode_o         (cipher_hash_mode),

        .block_sel_o                (block_sel),

        .hash_msg_chunk_o           (hash_msg_chunk_o)

    );

    // Clock enable registers controlled by FSM signals
    // These registers are in clk_slow_i domain and are synchronized to clk_muxed domain for ICGs
    always_ff @(posedge clk_slow_i or negedge reset_n_sync) begin

        if (reset_n_sync == 1'b0) begin

            clk_en_kalyna_hs_reg <= 1'b0;
            clk_en_kalyna_hs_enc_reg <= 1'b0;
            clk_en_kalyna_lp_reg <= 1'b0;
            clk_en_kalyna_secure1_reg <= 1'b0;
            clk_en_kalyna_secure2_reg <= 1'b0;
            clk_en_kupyna_hs_reg <= 1'b0;
            clk_en_kupyna_lp_reg <= 1'b0;
            clk_en_kalyna_kupyna_reg <= 1'b0;
            clk_en_aes_reg <= 1'b0;
            clk_en_sha256_reg <= 1'b0;

        end else if (clk_disable_all_blocks) begin

            // Disable all block clocks
            clk_en_kalyna_hs_reg <= 1'b0;
            clk_en_kalyna_hs_enc_reg <= 1'b0;
            clk_en_kalyna_lp_reg <= 1'b0;
            clk_en_kalyna_secure1_reg <= 1'b0;
            clk_en_kalyna_secure2_reg <= 1'b0;
            clk_en_kupyna_hs_reg <= 1'b0;
            clk_en_kupyna_lp_reg <= 1'b0;
            clk_en_kalyna_kupyna_reg <= 1'b0;
            clk_en_aes_reg <= 1'b0;
            clk_en_sha256_reg <= 1'b0;

        end else if (clk_enable_blocks) begin

            // Enable clock for selected block only
            unique case (block_sel)
                KALYNA_HS: clk_en_kalyna_hs_reg <= 1'b1;
                KALYNA_HS_ENC: clk_en_kalyna_hs_enc_reg <= 1'b1;
                KALYNA_LP: clk_en_kalyna_lp_reg <= 1'b1;
                KALYNA_SECURE1: clk_en_kalyna_secure1_reg <= 1'b1;
                KALYNA_SECURE2: clk_en_kalyna_secure2_reg <= 1'b1;
                KUPYNA_HS: clk_en_kupyna_hs_reg <= 1'b1;
                KUPYNA_LP: clk_en_kupyna_lp_reg <= 1'b1;
                KALYNA_KUPYNA: clk_en_kalyna_kupyna_reg <= 1'b1;
                AES: clk_en_aes_reg <= 1'b1;
                SHA256: clk_en_sha256_reg <= 1'b1;
                default: ; // Keep all disabled for invalid selections
            endcase

        end
    end

    // Start enable signals generation based on selected block and cipher_hash_mode
    // These are now registers that are loaded when start_selected_block is asserted
    always_ff @(posedge clk_slow_i or negedge reset_n_sync) begin

        if (reset_n_sync == 1'b0) begin

            kalyna_hs_start <= 1'b0;
            kalyna_hs_enc_start <= 1'b0;
            kalyna_lp_start <= 1'b0;
            kalyna_secure1_start <= 1'b0;
            kalyna_secure2_start <= 1'b0;
            kupyna_hs_start <= 1'b0;
            kupyna_lp_start <= 1'b0;
            kalyna_kupyna_start_kalyna_en <= 1'b0;
            kalyna_kupyna_start_kupyna_en <= 1'b0;
            aes_start <= 1'b0;
            sha256_start <= 1'b0;

        end else if (start_selected_block) begin

            unique case (block_sel)

                KALYNA_HS: kalyna_hs_start <= 1'b1;
                KALYNA_HS_ENC: kalyna_hs_enc_start <= 1'b1;
                KALYNA_LP: kalyna_lp_start <= 1'b1;
                KALYNA_SECURE1: kalyna_secure1_start <= 1'b1;
                KALYNA_SECURE2: kalyna_secure2_start <= 1'b1;
                KUPYNA_HS: kupyna_hs_start <= 1'b1;
                KUPYNA_LP: kupyna_lp_start <= 1'b1;
                KALYNA_KUPYNA: begin
                    kalyna_kupyna_start_kalyna_en <= (cipher_hash_mode == CIPHER_MODE);  // Enable Kalyna for cipher mode
                    kalyna_kupyna_start_kupyna_en <= (cipher_hash_mode == HASH_MODE);   // Enable Kupyna for hash mode
                end
                AES: aes_start <= 1'b1;
                SHA256: sha256_start <= 1'b1;
            endcase

        end else if (stop_block) begin

            // Clear all start enables
            kalyna_hs_start <= 1'b0;
            kalyna_hs_enc_start <= 1'b0;
            kalyna_lp_start <= 1'b0;
            kalyna_secure1_start <= 1'b0;
            kalyna_secure2_start <= 1'b0;
            kupyna_hs_start <= 1'b0;
            kupyna_lp_start <= 1'b0;
            kalyna_kupyna_start_kalyna_en <= 1'b0;
            kalyna_kupyna_start_kupyna_en <= 1'b0;
            aes_start <= 1'b0;
            sha256_start <= 1'b0;

        end

    end

    // Generic timing counter for FSM delays
    always_ff @(posedge clk_slow_i or negedge reset_n_sync) begin

        if (reset_n_sync == 1'b0)
            timing_counter <= '0;

        else if (timing_counter_load)
            timing_counter <= timing_counter_load_value - 1'b1;  // Load counter with specified value

        else if (timing_counter != '0)
            timing_counter <= timing_counter - 1'b1;  // Count down

    end

    // Counter done signal
    assign timing_counter_done = (timing_counter == '0);

    // Multiplexer for operation done signal based on selected block
    // This is only relevant when running on slow clock
    always_comb begin

        if (reset_n_sync == 1'b0) begin
            operation_done = 1'b0;

        end else begin

            // Slow clk, operation_done determined done condition in the control FSM
            if (clk_mux_sel_sync == 1'b0) begin

                unique case (block_sel)
                    KALYNA_HS: operation_done = kalyna_hs_done_i;
                    KALYNA_HS_ENC: operation_done = kalyna_hs_enc_done_i;
                    KALYNA_LP: operation_done = kalyna_lp_done_i;
                    KALYNA_SECURE1: operation_done = kalyna_secure1_done_i;
                    KALYNA_SECURE2: operation_done = kalyna_secure2_done_i;
                    KUPYNA_HS: operation_done = kupyna_hs_done_i;
                    KUPYNA_LP: operation_done = kupyna_lp_done_i;
                    KALYNA_KUPYNA: operation_done = kalyna_kupyna_done_i;
                    AES: operation_done = aes_done_i;
                    SHA256: operation_done = sha256_done_i;
                    default: operation_done = 1'b0;
                endcase

            // If fast clock is selected, timing counter on clk_slow is used to control FSM state transitions
            end else begin
                operation_done = 1'b0;
            end

        end

    end

    // Buffer for operation_done signal
    // We need this buffer here to hang a false path constraint on it in the fast clock SDC
    tc_clk_buffer u_operation_done_buffer (
        .clk_i(operation_done),
        .clk_o(operation_done_buffered)
    );

    always_ff @(posedge clk_slow_i or negedge reset_n_sync) begin

        if (reset_n_sync == 1'b0)
            operation_done_q <= 1'b0;

        else
            operation_done_q <= operation_done_buffered;

    end

    // Mux ciphertext inputs to serial regs based on block_sel
    always_comb begin

        ciphertext = '0;

        unique case (block_sel)

            KALYNA_HS: ciphertext = kalyna_hs_ctext_reg;
            KALYNA_HS_ENC: ciphertext = kalyna_hs_enc_ctext_reg;
            KALYNA_LP: ciphertext = kalyna_lp_ctext_reg;
            KALYNA_SECURE1: ciphertext = kalyna_secure1_ctext_reg;
            KALYNA_SECURE2: ciphertext = kalyna_secure2_ctext_reg;
            KALYNA_KUPYNA: ciphertext = kalyna_kupyna_ctext_reg;
            AES: ciphertext = aes_ctext_reg;
            default: ciphertext = '0;

        endcase

    end

    // Mux hash inputs to serial regs based on block_sel
    always_comb begin

        hash = '0;

        unique case (block_sel)

            KUPYNA_HS: hash = kupyna_hs_hmsg_reg;
            KUPYNA_LP: hash = kupyna_lp_hmsg_reg;
            KALYNA_KUPYNA: hash = kalyna_kupyna_hmsg_reg;
            SHA256: hash = sha256_hmsg_reg;
            default: hash = '0;

        endcase

    end

    always_ff @(posedge clk_slow_i or negedge reset_n_sync) begin

        if (reset_n_sync == 1'b0)
            state <= IDLE;

        else
            state <= state_next;

    end

    always_comb begin

        timing_counter_load = 1'b0;
        timing_counter_load_value = ICG_ENABLE_WAIT_CYCLES;

        clk_enable_blocks = 1'b0;
        clk_disable_all_blocks = 1'b0;

        start_selected_block = 1'b0;
        stop_block = 1'b0;

        ciphertext_we = 1'b0;
        hash_we = 1'b0;

        done_reg_set = 1'b0;
        done_reg_clear = 1'b0;

        state_next = state;

        unique case (state)

            // Wait for synchronized start signal
            // Once the start signal comes in assume all config regs have been set
            IDLE: begin

                if (start_sync) begin
                    done_reg_clear = 1'b1;  // Clear done when starting a new operation
                    state_next = ENABLE_BLOCK_CLOCK;
                end

            end

            // Enable clock to the selected block
            ENABLE_BLOCK_CLOCK: begin

                clk_enable_blocks = 1'b1;  // Enable clock for selected block

                timing_counter_load = 1'b1;
                timing_counter_load_value = ICG_ENABLE_WAIT_CYCLES;

                state_next = WAIT_ENABLE_BLOCK_CLOCK;

            end

            // Wait until enable is seen by the selected block's ICG
            WAIT_ENABLE_BLOCK_CLOCK: begin

                if (timing_counter_done)
                    state_next = START_OP;

            end

            // Start the operation on the selected block
            START_OP: begin
                start_selected_block = 1'b1;  // Generate start pulse for selected block
                state_next = RUN;
            end

            // Keep starting new operation as long as start pin is asserted
            RUN: begin

                if (!start_sync) begin

                    stop_block = 1'b1;

                    // clk_fast selected, load counter for cooldown cycles before capturing result
                    if (clk_mux_sel_sync) begin
                        timing_counter_load = 1'b1;
                        timing_counter_load_value = COOLDOWN_WAIT_CYCLES;
                    end

                    state_next = WAIT_FINISH;

                end else begin
                    start_selected_block = 1'b1;  // Keep start signal active during operation
                end

            end

            // Cooldown cycles on clk_slow domain
            // if clk mux is set to clk_fast, wait for a set amount of cycles before capturing result
            // if clk mux is set to clk_slow, wait for block ready signal
            WAIT_FINISH: begin

                // clk_slow selected, wait for next rising edge on operation_done_q
                if (!clk_mux_sel_sync) begin

                    if (operation_done_q)
                        state_next = CAPTURE_RESULT;

                // clk_fast selected, wait for a set amount of cycles before capturing result
                end else begin

                    if (timing_counter_done)
                        state_next = CAPTURE_RESULT;

                end

            end

            // Toggle ciphertext_we or hash_we to capture result in serial regs
            // Note that even though the data registers in crypto_output_registers are in the clk_muxed domain,
            // ciphertext_we and hash_we are generated in clk_slow domain after COOLDOWN_WAIT_CYCLES clk_slow cycles,
            // making this CDC safe when using clk_fast
            CAPTURE_RESULT: begin

                ciphertext_we = (cipher_hash_mode == CIPHER_MODE);
                hash_we = (cipher_hash_mode == HASH_MODE);

                done_reg_set = 1'b1;  // Set done when operation is done
                clk_disable_all_blocks = 1'b1;  // Disable all block clocks
                state_next = IDLE;

            end

            default:
                state_next = IDLE;

        endcase

    end

    // Assign ua_serial_regs data outputs to crypto blocks
    assign key_o = key;
    assign ptext_o = ptext;
    assign msg_o = msg;

    // Assign start outputs from sync signals combined with enable signals
    assign kalyna_hs_start_o = kalyna_hs_start_sync;
    assign kalyna_hs_enc_start_o = kalyna_hs_enc_start_sync;
    assign kalyna_lp_start_o = kalyna_lp_start_sync;
    assign kalyna_secure1_start_o = kalyna_secure1_start_sync;
    assign kalyna_secure2_start_o = kalyna_secure2_start_sync;
    assign kupyna_hs_start_o = kupyna_hs_start_sync;
    assign kupyna_lp_start_o = kupyna_lp_start_sync;
    assign kalyna_kupyna_start_kalyna_o = kalyna_kupyna_start_kalyna_sync;
    assign kalyna_kupyna_start_kupyna_o = kalyna_kupyna_start_kupyna_sync;
    assign aes_start_o = aes_start_sync;
    assign sha256_start_o = sha256_start_sync;

    // Done output register controlled by FSM signals
    always_ff @(posedge clk_slow_i or negedge reset_n_sync) begin

        if (reset_n_sync == 1'b0)
            done_reg <= 1'b0;

        else if (done_reg_clear)
            done_reg <= 1'b0;

        else if (done_reg_set)
            done_reg <= 1'b1;

    end

    // Assign done output from register
    assign done_o = done_reg;

    // Frequency Injection serial registers
    fi_serial_regs u_fi_serial_regs (

        .clk_i(clk_slow_i),
        .reset_n_i(reset_n_sync),

        /////////////////////////
        // To/from chip IO
        /////////////////////////

        .serial_enable_i(fi_serial_enable_i),
        .serial_sel_i({fi_serial_sel_1_i, fi_serial_sel_0_i}),
        .serial_data_ingress_i(fi_serial_data_ingress_i),
        .serial_data_egress_o(fi_serial_data_egress_o),

        /////////////////////////
        // To frequency injection blocks
        /////////////////////////

        .enable_osc_o(fi_enable_osc_o),
        .trimming_o(fi_trimming_o),
        .mux_osc_o(fi_mux_osc_o),
        .mux_trng_o(fi_mux_trng_o)

    );

endmodule
