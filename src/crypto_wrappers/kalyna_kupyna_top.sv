module kalyna_kupyna_top
    import ua_crypto_pkg::*;
(
    input logic clk,
    input logic reset_n,
    input logic [127:0] key_i,
    input logic [127:0] ptext_i,
    input logic [511:0] msg_i,
    input logic start_kalyna_i,
    input logic start_kupyna_i,
    input logic kalyna_mode_i,
    input hash_msg_chunk_e kupyna_mode_i,
    output logic [127:0] ctext_o,
    output logic [255:0] hmsg_o,
    output logic done_o
);

    // Combined Kalyna + Kupyna implementation using kalyna_kupyna_serial64b_oboc
    localparam BLOCK_SIZE = 128;
    localparam KEY_LENGTH = 128;
    localparam CODE_LENGTH = 256;

    // Control signals for the combined module
    logic kk_sel;  // 0 for Kalyna, 1 for Kupyna
    logic block_start, hash_start, hash_stop;
    logic hash_kb_rdy_out, kk_rdy;

    // State machine and control signals similar to kupyna_hs_top
    logic hash_start_set, hash_start_clear;
    logic hash_stop_set, hash_stop_clear;

    logic start_kalyna_q, start_kupyna_q;
    logic start_kupyna_rising_edge;

    typedef enum logic[1:0] {IDLE=2'b00, KALYNA_BUSY=2'b01, KUPYNA_BUSY=2'b10} kalyna_kupyna_top_state_e;
    kalyna_kupyna_top_state_e current_state, next_state;

    // Start signal edge detection for both Kalyna and Kupyna
    always_ff @(posedge clk or negedge reset_n) begin

        if (!reset_n) begin
            start_kalyna_q <= 1'b0;
            start_kupyna_q <= 1'b0;
        end else begin
            start_kalyna_q <= start_kalyna_i;
            start_kupyna_q <= start_kupyna_i;
        end

    end

    // assign start_kalyna_rising_edge = start_kalyna_i & ~start_kalyna_q;
    assign start_kupyna_rising_edge = start_kupyna_i & ~start_kupyna_q;

    // State machine register
    always_ff @(posedge clk or negedge reset_n) begin

        if (!reset_n)
            current_state <= IDLE;

        else
            current_state <= next_state;

    end

    // Hash control signals
    always_ff @(posedge clk or negedge reset_n) begin

        if (!reset_n) begin
            hash_start <= 1'b0;
            hash_stop <= 1'b0;
        end else begin

            if (hash_start_clear)
                hash_start <= 1'b0;

            else if (hash_start_set)
                hash_start <= 1'b1;

            if (hash_stop_clear)
                hash_stop <= 1'b0;

            else if (hash_stop_set)
                hash_stop <= 1'b1;

        end

    end

    // State machine combinational logic
    always_comb begin

        hash_start_set = 1'b0;
        hash_start_clear = 1'b0;
        hash_stop_set = 1'b0;
        hash_stop_clear = 1'b0;

        kk_sel = 1'b0;
        block_start = 1'b0;

        next_state = current_state;

        case (current_state)

            IDLE: begin

                if (start_kalyna_q) begin

                    next_state = KALYNA_BUSY;

                end else if (start_kupyna_q) begin

                    next_state = KUPYNA_BUSY;

                end

            end

            KALYNA_BUSY: begin

                kk_sel = 1'b0;
                block_start = 1'b1;

                if (kk_rdy) begin
                    next_state = IDLE;
                end

            end

            KUPYNA_BUSY: begin

                kk_sel = 1'b1;

                case (kupyna_mode_i)

                    // First/Final chunk of a message
                    HASH_FIRST_CHUNK: begin

                        hash_start_set = 1'b1;

                        if (hash_kb_rdy_out) begin
                            next_state = IDLE;
                        end

                    end

                    HASH_FINAL_CHUNK: begin

                        hash_start_set = 1'b1;
                        hash_stop_set = 1'b1;

                        // if (hash_kb_rdy_out) begin
                        if (kk_rdy) begin
                            hash_start_set = 1'b0;
                            hash_stop_set = 1'b0;
                            hash_start_clear = 1'b1;
                            hash_stop_clear = 1'b1;
                            next_state = IDLE;
                        end

                    end

                endcase

            end

            default:
                next_state = IDLE;

        endcase

    end

    // Combinational done_o assignment based on operation type and mode
    // assign done_o = (current_state == KALYNA_BUSY) ? kk_rdy :
    //                 (current_state == KUPYNA_BUSY) ? hash_kb_rdy_out :
    //                 1'b0;
    assign done_o = kk_rdy;

    // Instantiate the underlying combined Kalyna+Kupyna module
    kalyna_kupyna_serial64b_oboc #(
        .BLOCK_SIZE(BLOCK_SIZE),
        .KEY_LENGTH(KEY_LENGTH),
        .CODE_LENGTH(CODE_LENGTH)
    ) u_kalyna_kupyna_core (
        .clk(clk),
        .rst(reset_n),
        .kk_sel(kk_sel),
        .block_start(block_start),
        .block_mode(kalyna_mode_i),
        .block_in(ptext_i),
        .key_in(key_i),
        .block_out(ctext_o),
        .hash_start(hash_start),
        .hash_stop(hash_stop),
        .hash_in(msg_i),
        .hash_out(hmsg_o),
        .hash_kb_rdy_out(hash_kb_rdy_out),
        .kk_rdy(kk_rdy)
    );

endmodule
