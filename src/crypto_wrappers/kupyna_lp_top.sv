module kupyna_lp_top
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

    // Kupyna Low Power hash implementation using kupyna_hash_serial64b_reuse
    localparam CODE_LENGTH = 256;

    // Internal signals for hash operation control
    logic hash_start, hash_stop;
    logic hash_rdy, kb_rdy_out;

    logic hash_start_set, hash_start_clear;
    logic hash_stop_set, hash_stop_clear;

    logic start_q, start_rising_edge;

    typedef enum logic[0:0] {IDLE=1'b0, BUSY=1'b1} kupyna_hs_top_state_e;
    kupyna_hs_top_state_e current_state, next_state;

    always_ff @(posedge clk or negedge reset_n) begin

        if (!reset_n) begin
            start_q <= 1'b0;

        end else begin
            start_q <= start_i;
        end

    end

    assign start_rising_edge = start_i & ~start_q;

    always_ff @(posedge clk or negedge reset_n) begin

        if (!reset_n)
            current_state <= IDLE;

        else
            current_state <= next_state;

    end

    always_ff @(posedge clk or negedge reset_n) begin

        if (!reset_n)
            hash_start <= '0;

        else if (hash_start_set)
            hash_start <= 1'b1;

        else if (hash_start_clear)
            hash_start <= 1'b0;

    end

    always_ff @(posedge clk or negedge reset_n) begin

        if (!reset_n)
            hash_stop <= '0;

        else if (hash_stop_set)
            hash_stop <= 1'b1;

        else if (hash_stop_clear)
            hash_stop <= 1'b0;

    end

    always_comb begin

        hash_start_set = 1'b0;
        hash_start_clear = 1'b0;
        hash_stop_set = 1'b0;
        hash_stop_clear = 1'b0;

        next_state = current_state;

        case (current_state)

            IDLE: begin

                case (mode_i)

                    // First block of a multi-block message
                    HASH_FIRST_CHUNK: begin

                        if (start_q) begin

                            hash_start_set = 1'b1;

                            next_state = BUSY;

                        end else
                            next_state = IDLE;

                    end

                    // 1 block message or the final block of a multi-block message
                    HASH_FINAL_CHUNK: begin

                        if (start_q) begin

                            hash_start_set = 1'b1;
                            hash_stop_set = 1'b1;

                            next_state = BUSY;

                        end else begin

                            hash_start_clear = 1'b1;
                            hash_stop_clear = 1'b1;

                            next_state = IDLE;

                        end

                    end

                endcase

            end

            BUSY: begin

                case (mode_i)

                    HASH_FIRST_CHUNK: begin

                        if (kb_rdy_out) begin
                            next_state = IDLE;
                        end else
                            next_state = BUSY;

                    end

                    HASH_FINAL_CHUNK: begin

                        if (hash_rdy) begin
                            next_state = IDLE;
                        end else
                            next_state = BUSY;

                    end

                endcase

            end

        endcase

    end

    assign done_o = (mode_i == HASH_FINAL_CHUNK) ? hash_rdy : kb_rdy_out;

    // Instantiate the underlying Kupyna hash module
    kupyna_hash_serial64b_reuse #(
        .CODE_LENGTH(CODE_LENGTH)
    ) u_kupyna_core (
        .clk(clk),
        .rst(reset_n),
        .hash_start(hash_start),
        .hash_stop(hash_stop),
        .msg_in(msg_i),
        .hash_out(hmsg_o),
        .hash_rdy(hash_rdy),
        .kb_rdy_out(kb_rdy_out)
    );

endmodule
