module kalyna_lp_top (
    input logic clk,
    input logic reset_n,
    input logic [127:0] key_i,
    input logic [127:0] ptext_i,
    input logic start_i,
    input logic mode_i,
    output logic [127:0] ctext_o,
    output logic done_o
);

    // Kalyna Low Power implementation using kalyna_encdec_block_serial64b_oboc
    parameter BLOCK_SIZE = 128;
    parameter KEY_LENGTH = 128;

    // Instantiate the underlying Kalyna encryption/decryption module
    kalyna_encdec_block_serial64b_oboc #(
        .BLOCK_SIZE(BLOCK_SIZE),
        .KEY_LENGTH(KEY_LENGTH)
    ) u_kalyna_core (
        .clk(clk),
        .rst(reset_n),
        .start(start_i),
        .mode(mode_i),
        .block_in(ptext_i),
        .key_in(key_i),
        .block_out(ctext_o),
        .block_rdy(done_o)
    );

endmodule
