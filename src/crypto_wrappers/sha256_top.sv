module sha256_top
    import ua_crypto_pkg::*;
(
    input logic clk,
    input logic reset_n,
    input logic [511:0] msg_i,
    input logic start_i,
    input hash_msg_chunk_e mode_i,
    output logic [255:0] hmsg_o,
    output logic done_o
);

    logic start_q, start_rising_edge;
    logic ready, ready_q;

    always_ff @(posedge clk or negedge reset_n) begin

        if (!reset_n) begin
            start_q <= 1'b0;
            ready_q <= 1'b0;

        end else begin
            start_q <= start_i;
            ready_q <= ready;
        end

    end

    assign start_rising_edge = start_i & ~start_q;
    assign done_o = ready & ~ready_q;

    sha256_core u_sha256_core (
        .clk           (clk),
        .reset_n       (reset_n),
        .init          (start_q && (mode_i == HASH_FIRST_CHUNK)),
        .next          (start_rising_edge && (mode_i == HASH_FINAL_CHUNK)),
        .mode          (1'b1),  // Always SHA-256 mode, 1'b0 corresponds to SHA-224
        .block         (msg_i),
        .ready         (ready),
        .digest        (hmsg_o),
        .digest_valid  ()
    );

endmodule
