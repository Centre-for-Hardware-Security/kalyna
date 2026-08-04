module crypto_output_registers (

    input logic clk_i,
    input logic reset_n_i,

    // Ciphertext inputs from crypto blocks
    input logic [127:0] kalyna_hs_ctext_i,
    input logic [127:0] kalyna_hs_enc_ctext_i,
    input logic [127:0] kalyna_lp_ctext_i,
    input logic [127:0] kalyna_secure1_ctext_i,
    input logic [127:0] kalyna_secure2_ctext_i,
    input logic [127:0] kalyna_kupyna_ctext_i,
    input logic [127:0] aes_ctext_i,

    // Hash inputs from crypto blocks
    input logic [255:0] kupyna_hs_hmsg_i,
    input logic [255:0] kupyna_lp_hmsg_i,
    input logic [255:0] kalyna_kupyna_hmsg_i,
    input logic [255:0] sha256_hmsg_i,

    // Done signals from crypto blocks
    input logic kalyna_hs_done_i,
    input logic kalyna_hs_enc_done_i,
    input logic kalyna_lp_done_i,
    input logic kalyna_secure1_done_i,
    input logic kalyna_secure2_done_i,
    input logic kupyna_hs_done_i,
    input logic kupyna_lp_done_i,
    input logic kalyna_kupyna_done_i,
    input logic aes_done_i,
    input logic sha256_done_i,

    // Registered ciphertext outputs
    output logic [127:0] kalyna_hs_ctext_reg_o,
    output logic [127:0] kalyna_hs_enc_ctext_reg_o,
    output logic [127:0] kalyna_lp_ctext_reg_o,
    output logic [127:0] kalyna_secure1_ctext_reg_o,
    output logic [127:0] kalyna_secure2_ctext_reg_o,
    output logic [127:0] kalyna_kupyna_ctext_reg_o,
    output logic [127:0] aes_ctext_reg_o,

    // Registered hash outputs
    output logic [255:0] kupyna_hs_hmsg_reg_o,
    output logic [255:0] kupyna_lp_hmsg_reg_o,
    output logic [255:0] kalyna_kupyna_hmsg_reg_o,
    output logic [255:0] sha256_hmsg_reg_o

);

    // Local registers to capture ciphertext outputs from crypto blocks (clk_i domain)
    logic[127:0] kalyna_hs_ctext_reg;
    logic[127:0] kalyna_hs_enc_ctext_reg;
    logic[127:0] kalyna_lp_ctext_reg;
    logic[127:0] kalyna_secure1_ctext_reg;
    logic[127:0] kalyna_secure2_ctext_reg;
    logic[127:0] kalyna_kupyna_ctext_reg;
    logic[127:0] aes_ctext_reg;

    // Local registers to capture hash outputs from crypto blocks (clk_i domain)
    logic[255:0] kupyna_hs_hmsg_reg;
    logic[255:0] kupyna_lp_hmsg_reg;
    logic[255:0] kalyna_kupyna_hmsg_reg;
    logic[255:0] sha256_hmsg_reg;

    // Register ciphertext outputs from crypto blocks
    // Only capture when the respective block's done signal is asserted
    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0) begin

            kalyna_hs_ctext_reg <= '0;
            kalyna_hs_enc_ctext_reg <= '0;
            kalyna_lp_ctext_reg <= '0;
            kalyna_secure1_ctext_reg <= '0;
            kalyna_secure2_ctext_reg <= '0;
            kalyna_kupyna_ctext_reg <= '0;
            aes_ctext_reg <= '0;

        end else begin

            if (kalyna_hs_done_i)
                kalyna_hs_ctext_reg <= kalyna_hs_ctext_i;

            if (kalyna_hs_enc_done_i)
                kalyna_hs_enc_ctext_reg <= kalyna_hs_enc_ctext_i;

            if (kalyna_lp_done_i)
                kalyna_lp_ctext_reg <= kalyna_lp_ctext_i;

            if (kalyna_secure1_done_i)
                kalyna_secure1_ctext_reg <= kalyna_secure1_ctext_i;

            if (kalyna_secure2_done_i)
                kalyna_secure2_ctext_reg <= kalyna_secure2_ctext_i;

            if (kalyna_kupyna_done_i)
                kalyna_kupyna_ctext_reg <= kalyna_kupyna_ctext_i;

            if (aes_done_i)
                aes_ctext_reg <= aes_ctext_i;

        end
    end

    // Register hash outputs from crypto blocks
    // Only capture when the respective block's done signal is asserted
    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0) begin

            kupyna_hs_hmsg_reg <= '0;
            kupyna_lp_hmsg_reg <= '0;
            kalyna_kupyna_hmsg_reg <= '0;
            sha256_hmsg_reg <= '0;

        end else begin

            if (kupyna_hs_done_i)
                kupyna_hs_hmsg_reg <= kupyna_hs_hmsg_i;

            if (kupyna_lp_done_i)
                kupyna_lp_hmsg_reg <= kupyna_lp_hmsg_i;

            if (kalyna_kupyna_done_i)
                kalyna_kupyna_hmsg_reg <= kalyna_kupyna_hmsg_i;

            if (sha256_done_i)
                sha256_hmsg_reg <= sha256_hmsg_i;

        end
    end

    // Assign outputs
    assign kalyna_hs_ctext_reg_o = kalyna_hs_ctext_reg;
    assign kalyna_hs_enc_ctext_reg_o = kalyna_hs_enc_ctext_reg;
    assign kalyna_lp_ctext_reg_o = kalyna_lp_ctext_reg;
    assign kalyna_secure1_ctext_reg_o = kalyna_secure1_ctext_reg;
    assign kalyna_secure2_ctext_reg_o = kalyna_secure2_ctext_reg;
    assign kalyna_kupyna_ctext_reg_o = kalyna_kupyna_ctext_reg;
    assign aes_ctext_reg_o = aes_ctext_reg;

    assign kupyna_hs_hmsg_reg_o = kupyna_hs_hmsg_reg;
    assign kupyna_lp_hmsg_reg_o = kupyna_lp_hmsg_reg;
    assign kalyna_kupyna_hmsg_reg_o = kalyna_kupyna_hmsg_reg;
    assign sha256_hmsg_reg_o = sha256_hmsg_reg;

endmodule