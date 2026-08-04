module aes_top (
    input logic clk,
    input logic reset_n,
    input logic [127:0] key_i,
    input logic [127:0] ptext_i,
    input logic start_i,
    input logic mode_i,
    output logic [127:0] ctext_o,
    output logic done_o
);

    logic init, next;
    logic aes_ready_flag;
    logic aes_ready_flag_q;

    typedef enum logic[1:0] {IDLE, INITIALIZING, RUN, RUNNING} state_t;
    state_t current_state, next_state;

    always_ff @(posedge clk or negedge reset_n) begin

        if (!reset_n) begin
            current_state <= IDLE;
            aes_ready_flag_q <= 1'b0;
        end else begin
            current_state <= next_state;
            aes_ready_flag_q <= aes_ready_flag;
        end

    end

    always_comb begin

        init = 1'b0;
        next = 1'b0;

        next_state = current_state;

        case (current_state)

            IDLE: begin

                init = start_i;  // Assert init only once after reset

                if (start_i)
                    next_state = INITIALIZING;

            end

            INITIALIZING: begin

                if (aes_ready_flag)
                    next_state = RUN;

            end

            RUN: begin

                next = 1'b1;  // Assert next to start processing the block
                next_state = RUNNING;

            end

            RUNNING: begin

                if (aes_ready_flag && start_i) begin
                    init = 1'b1;
                    next_state = INITIALIZING;
                end

            end

        endcase

    end

    assign done_o = aes_ready_flag & ~aes_ready_flag_q;

    aes_core u_aes_core (

        .clk(clk),
        .reset_n(reset_n),

        .encdec(1'b0),  // On-the-fly decryption not supported
        .init(init),
        .next(next),
        .ready(aes_ready_flag),

        .key({key_i, 128'd0}),
        .keylen(1'b0),  // always 128-bit key

        .block(ptext_i),
        .result(ctext_o),
        .result_valid()

    );

endmodule
