module ua_serial_regs
    import ua_crypto_pkg::*;
(
    input logic clk_i,
    input logic reset_n_i,

    /////////////////////////
    // To/from chip IO
    /////////////////////////

    input logic serial_enable_i,
    input serial_reg_addr_e serial_sel_i,
    input logic serial_data_ingress_i,
    output logic serial_data_egress_o,

    /////////////////////////
    // To/from top controller, to be distributed to crypto blocks
    // (registers not present are tied to 0)
    // Each register is "memory-mapped" at an address corresponding to the index given in serial_sel_i
    /////////////////////////

    // Address 0, RW
    output logic[KEY_WIDTH-1:0] key_o,

    // Address 1, RW
    output logic[PLAINTEXT_WIDTH-1:0] plaintext_o,

    // Address 2, RW
    output logic[MESSAGE_WIDTH-1:0] message_o,

    // Address 3, RO
    input logic ciphertext_we_i,
    input logic[CIPHERTEXT_WIDTH-1:0] ciphertext_i,

    // Address 4, RO
    input logic hash_we_i,
    input logic[HASH_WIDTH-1:0] hash_i,

    // Address 5, RW
    output cipher_hash_mode_e cipher_hash_mode_o,

    // Address 6, RW
    output crypto_block_e block_sel_o,

    // Address 7, RW
    output hash_msg_chunk_e hash_msg_chunk_o

);

    // Key register
    logic key_reg_we;
    logic [KEY_WIDTH-1:0] key_reg_d, key_reg_q;

    // Plaintext register
    logic plaintext_reg_we;
    logic [PLAINTEXT_WIDTH-1:0] plaintext_reg_d, plaintext_reg_q;

    // Message register
    logic msg_reg_we;
    logic [MESSAGE_WIDTH-1:0] msg_reg_d, msg_reg_q;

    // Ciphertext register
    logic ciphertext_reg_we;
    logic [CIPHERTEXT_WIDTH-1:0] ciphertext_reg_d, ciphertext_reg_q;

    // Hash register
    logic hash_reg_we;
    logic [HASH_WIDTH-1:0] hash_reg_d, hash_reg_q;

    // Cipher/Hash mode register
    logic cipher_hash_mode_reg_we;
    cipher_hash_mode_e cipher_hash_mode_reg_d, cipher_hash_mode_reg_q;

    // Block select register
    logic block_sel_reg_we;
    crypto_block_e block_sel_reg_d, block_sel_reg_q;

    // Hash block selector register
    logic hash_msg_chunk_reg_we;
    hash_msg_chunk_e hash_msg_chunk_reg_d, hash_msg_chunk_reg_q;

    logic serial_data_egress_d, serial_data_egress_q;

    // Key register
    assign key_reg_we = (serial_sel_i == REG_KEY) && serial_enable_i;
    assign key_o = key_reg_q;

    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0)
            key_reg_q <= '0;

        else if (key_reg_we)
            key_reg_q <= {key_reg_q[KEY_WIDTH-2:0], serial_data_ingress_i};

    end

    // Plaintext register
    assign plaintext_reg_we = (serial_sel_i == REG_PLAINTEXT) && serial_enable_i;
    assign plaintext_o = plaintext_reg_q;

    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0)
            plaintext_reg_q <= '0;

        else if (plaintext_reg_we)
            plaintext_reg_q <= {plaintext_reg_q[PLAINTEXT_WIDTH-2:0], serial_data_ingress_i};

    end

    // Message register
    assign msg_reg_we = (serial_sel_i == REG_MESSAGE) && serial_enable_i;
    assign message_o = msg_reg_q;

    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0)
            msg_reg_q <= '0;

        else if (msg_reg_we)
            msg_reg_q <= {msg_reg_q[MESSAGE_WIDTH-2:0], serial_data_ingress_i};

    end

    // Ciphertext register
    assign ciphertext_reg_we = ciphertext_we_i || ((serial_sel_i == REG_CIPHERTEXT) && serial_enable_i);
    assign ciphertext_reg_d = (ciphertext_we_i) ? ciphertext_i : {ciphertext_reg_q[CIPHERTEXT_WIDTH-2:0], serial_data_ingress_i};

    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0)
            ciphertext_reg_q <= '0;

        else if (ciphertext_reg_we)
            ciphertext_reg_q <= ciphertext_reg_d;

    end

    // Hash register
    assign hash_reg_we = hash_we_i || ((serial_sel_i == REG_HASH) && serial_enable_i);
    assign hash_reg_d = (hash_we_i) ? hash_i : {hash_reg_q[HASH_WIDTH-2:0], serial_data_ingress_i};

    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0)
            hash_reg_q <= '0;

        else if (hash_reg_we)
            hash_reg_q <= hash_reg_d;

    end

    // Cipher/Hash mode register
    assign cipher_hash_mode_reg_we = (serial_sel_i == REG_CIPHER_HASH_MODE) && serial_enable_i;
    assign cipher_hash_mode_reg_d = cipher_hash_mode_e'(serial_data_ingress_i);
    assign cipher_hash_mode_o = cipher_hash_mode_reg_q;

    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0)
            cipher_hash_mode_reg_q <= CIPHER_MODE;

        else if (cipher_hash_mode_reg_we)
            cipher_hash_mode_reg_q <= cipher_hash_mode_reg_d;

    end

    // Block select register
    assign block_sel_reg_we = (serial_sel_i == REG_BLOCK_SEL) && serial_enable_i;
    assign block_sel_o = block_sel_reg_q;

    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0)
            block_sel_reg_q <= KALYNA_HS;

        else if (block_sel_reg_we)
            block_sel_reg_q <= crypto_block_e'({block_sel_reg_q[BLOCK_SEL_WIDTH-2:0], serial_data_ingress_i});

    end

    // Hash block selector register
    assign hash_msg_chunk_reg_we = (serial_sel_i == REG_HASH_MSG_CHUNK) && serial_enable_i;
    assign hash_msg_chunk_reg_d = hash_msg_chunk_e'(serial_data_ingress_i);
    assign hash_msg_chunk_o = hash_msg_chunk_reg_q;

    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0)
            hash_msg_chunk_reg_q <= HASH_FIRST_CHUNK;

        else if (hash_msg_chunk_reg_we)
            hash_msg_chunk_reg_q <= hash_msg_chunk_reg_d;

    end

    // Serial data egress FF
    always_comb begin

        unique case (serial_sel_i)

            REG_KEY: serial_data_egress_d = key_reg_q[KEY_WIDTH-1];
            REG_PLAINTEXT: serial_data_egress_d = plaintext_reg_q[PLAINTEXT_WIDTH-1];
            REG_MESSAGE: serial_data_egress_d = msg_reg_q[MESSAGE_WIDTH-1];
            REG_CIPHERTEXT: serial_data_egress_d = ciphertext_reg_q[CIPHERTEXT_WIDTH-1];
            REG_HASH: serial_data_egress_d = hash_reg_q[HASH_WIDTH-1];
            REG_CIPHER_HASH_MODE: serial_data_egress_d = logic'(cipher_hash_mode_reg_q);
            REG_BLOCK_SEL: serial_data_egress_d = block_sel_reg_q[BLOCK_SEL_WIDTH-1];
            REG_HASH_MSG_CHUNK: serial_data_egress_d = logic'(hash_msg_chunk_reg_q);

            default: serial_data_egress_d = 1'b0;

        endcase

    end

    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0)
            serial_data_egress_o <= 1'b0;

        else if (serial_enable_i)
            serial_data_egress_o <= serial_data_egress_d;

    end

endmodule
