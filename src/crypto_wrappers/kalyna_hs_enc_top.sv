module kalyna_hs_enc_top (
    input logic clk,
    input logic reset_n,
    input logic [127:0] key_i,
    input logic [127:0] ptext_i,
    input logic start_i,
    output logic [127:0] ctext_o,
    output logic done_o
);

    // Kalyna High Speed encryption-only implementation using kalyna_enc_block_serial_oboc
    localparam BLOCK_SIZE = 128;
    localparam KEY_LENGTH = 128;

    // Instantiate the underlying Kalyna encryption/decryption module (fixed to encryption mode)
    kalyna_enc_block_serial_oboc #(
        .BLOCK_SIZE(BLOCK_SIZE),
        .KEY_LENGTH(KEY_LENGTH)
    ) u_kalyna_hs_enc_core (
        .clk(clk),
        .rst(reset_n),
        .start(start_i),
        .block_in(ptext_i),
        .key_in(key_i),
        .block_out(ctext_o),
        .block_rdy(done_o)
    );

endmodule
