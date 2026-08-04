// Register access test - tests serial register read/write operations
class register_access_test extends base_test;

    function new(virtual dig_top_if vif, virtual clock_if clk_slow_if, virtual clock_if clk_fast_if, string name = "register_access_test");
        super.new(vif, clk_slow_if, clk_fast_if, name);
    endfunction

    virtual task run();

        $display("[%s] Running register access test", test_name);

        // Run the three phases of register testing
        phase1_individual_register_tests();
        phase2_bulk_write_read_test();
        phase3_randomized_order_test();

        $display("[%s] Register access test completed successfully", test_name);

    endtask

    // Phase 1: Individual register tests
    virtual task phase1_individual_register_tests();

        logic[KEY_WIDTH-1:0] key_data;           // 128-bit key
        logic[PLAINTEXT_WIDTH-1:0] plaintext_data; // 128-bit plaintext
        logic[MESSAGE_WIDTH-1:0] message_data;   // 512-bit message
        logic[CIPHERTEXT_WIDTH-1:0] ciphertext_data; // 128-bit ciphertext
        logic[HASH_WIDTH-1:0] hash_data;         // 256-bit hash
        logic[BLOCK_SEL_WIDTH-1:0] block_sel_data; // 4-bit block select
        logic[HASH_MSG_CHUNK_WIDTH-1:0] hash_msg_chunk_data; // Hash message chunk selector
        cipher_hash_mode_e cipher_hash_mode_data;         // 1-bit mode

        logic [511:0] read_data; // Large enough for biggest register

        // Initialize test patterns with randomized values
        if (!std::randomize(key_data))
            $error("[%s] Failed to randomize key_data", test_name);

        if (!std::randomize(plaintext_data))
            $error("[%s] Failed to randomize plaintext_data", test_name);

        if (!std::randomize(message_data))
            $error("[%s] Failed to randomize message_data", test_name);

        if (!std::randomize(ciphertext_data))
            $error("[%s] Failed to randomize ciphertext_data", test_name);

        if (!std::randomize(hash_data))
            $error("[%s] Failed to randomize hash_data", test_name);

        if (!std::randomize(block_sel_data))
            $error("[%s] Failed to randomize block_sel_data", test_name);

        if (!std::randomize(hash_msg_chunk_data))
            $error("[%s] Failed to randomize hash_msg_chunk_data", test_name);

        if (!std::randomize(cipher_hash_mode_data) with { cipher_hash_mode_data inside {CIPHER_MODE, HASH_MODE}; })
            $error("[%s] Failed to randomize cipher_hash_mode_data", test_name);

        $display("[%s] === PHASE 1: Individual Register Tests ===", test_name);

        // Test Key register (Address 0)
        write_serial_reg(ua_crypto_pkg::REG_KEY, key_data, KEY_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_KEY, {{(512-KEY_WIDTH){1'b0}}, key_data}, KEY_WIDTH);

        // Test Plaintext register (Address 1)
        write_serial_reg(ua_crypto_pkg::REG_PLAINTEXT, plaintext_data, PLAINTEXT_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_PLAINTEXT, {{(512-PLAINTEXT_WIDTH){1'b0}}, plaintext_data}, PLAINTEXT_WIDTH);

        // Test Message register (Address 2)
        write_serial_reg(ua_crypto_pkg::REG_MESSAGE, message_data, MESSAGE_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_MESSAGE, message_data, MESSAGE_WIDTH);

        // Test Ciphertext register (Address 3)
        write_serial_reg(ua_crypto_pkg::REG_CIPHERTEXT, ciphertext_data, CIPHERTEXT_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_CIPHERTEXT, {{(512-CIPHERTEXT_WIDTH){1'b0}}, ciphertext_data}, CIPHERTEXT_WIDTH);

        // Test Hash register (Address 4)
        write_serial_reg(ua_crypto_pkg::REG_HASH, hash_data, HASH_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_HASH, {{(512-HASH_WIDTH){1'b0}}, hash_data}, HASH_WIDTH);

        // Test Cipher/Hash Mode register (Address 5)
        write_serial_reg(ua_crypto_pkg::REG_CIPHER_HASH_MODE, cipher_hash_mode_data, CIPHER_HASH_MODE_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_CIPHER_HASH_MODE, {{(512-CIPHER_HASH_MODE_WIDTH){1'b0}}, cipher_hash_mode_data}, CIPHER_HASH_MODE_WIDTH);

        // Test Block Select register (Address 6)
        write_serial_reg(ua_crypto_pkg::REG_BLOCK_SEL, block_sel_data, BLOCK_SEL_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_BLOCK_SEL, {{(512-BLOCK_SEL_WIDTH){1'b0}}, block_sel_data}, BLOCK_SEL_WIDTH);

        // Test Hash Block Selector register (Address 7)
        write_serial_reg(ua_crypto_pkg::REG_HASH_MSG_CHUNK, hash_msg_chunk_data, HASH_MSG_CHUNK_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_HASH_MSG_CHUNK, {{(512-HASH_MSG_CHUNK_WIDTH){1'b0}}, hash_msg_chunk_data}, HASH_MSG_CHUNK_WIDTH);

    endtask

    // Phase 2: Bulk write then read test
    virtual task phase2_bulk_write_read_test();

        logic [511:0] read_data; // Large enough for biggest register
        logic [KEY_WIDTH-1:0] alt_key_data;
        logic [PLAINTEXT_WIDTH-1:0] alt_plaintext_data;
        logic [MESSAGE_WIDTH-1:0] alt_message_data;
        logic [CIPHERTEXT_WIDTH-1:0] alt_ciphertext_data;
        logic [HASH_WIDTH-1:0] alt_hash_data;
        logic [BLOCK_SEL_WIDTH-1:0] alt_block_sel_data;
        logic [HASH_MSG_CHUNK_WIDTH-1:0] alt_hash_msg_chunk_data;
        cipher_hash_mode_e alt_cipher_hash_mode_data;

        // Randomize all alternate data patterns for Phase 2
        if (!std::randomize(alt_key_data))
            $error("[%s] Failed to randomize alt_key_data", test_name);

        if (!std::randomize(alt_plaintext_data))
            $error("[%s] Failed to randomize alt_plaintext_data", test_name);

        if (!std::randomize(alt_message_data))
            $error("[%s] Failed to randomize alt_message_data", test_name);

        if (!std::randomize(alt_ciphertext_data))
            $error("[%s] Failed to randomize alt_ciphertext_data", test_name);

        if (!std::randomize(alt_hash_data))
            $error("[%s] Failed to randomize alt_hash_data", test_name);

        if (!std::randomize(alt_block_sel_data))
            $error("[%s] Failed to randomize alt_block_sel_data", test_name);

        if (!std::randomize(alt_hash_msg_chunk_data))
            $error("[%s] Failed to randomize alt_hash_msg_chunk_data", test_name);

        if (!std::randomize(alt_cipher_hash_mode_data) with { alt_cipher_hash_mode_data inside {CIPHER_MODE, HASH_MODE}; })
            $error("[%s] Failed to randomize alt_cipher_hash_mode_data", test_name);

        $display("[%s] === PHASE 2: Bulk Write Then Read Test ===", test_name);

        // Write all data with alternate patterns
        $display("[%s] Writing all registers with alternate data...", test_name);
        write_serial_reg(ua_crypto_pkg::REG_KEY, alt_key_data, KEY_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_PLAINTEXT, alt_plaintext_data, PLAINTEXT_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_MESSAGE, alt_message_data, MESSAGE_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_CIPHERTEXT, alt_ciphertext_data, CIPHERTEXT_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_HASH, alt_hash_data, HASH_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_CIPHER_HASH_MODE, alt_cipher_hash_mode_data, CIPHER_HASH_MODE_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_BLOCK_SEL, alt_block_sel_data, BLOCK_SEL_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_HASH_MSG_CHUNK, alt_hash_msg_chunk_data, HASH_MSG_CHUNK_WIDTH);

        // Read back and verify all data
        $display("[%s] Reading back and verifying all data...", test_name);

        read_and_check_register(ua_crypto_pkg::REG_KEY, {{(512-KEY_WIDTH){1'b0}}, alt_key_data}, KEY_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_PLAINTEXT, {{(512-PLAINTEXT_WIDTH){1'b0}}, alt_plaintext_data}, PLAINTEXT_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_MESSAGE, alt_message_data, MESSAGE_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_CIPHERTEXT, {{(512-CIPHERTEXT_WIDTH){1'b0}}, alt_ciphertext_data}, CIPHERTEXT_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_HASH, {{(512-HASH_WIDTH){1'b0}}, alt_hash_data}, HASH_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_CIPHER_HASH_MODE, {{(512-CIPHER_HASH_MODE_WIDTH){1'b0}}, alt_cipher_hash_mode_data}, CIPHER_HASH_MODE_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_BLOCK_SEL, {{(512-BLOCK_SEL_WIDTH){1'b0}}, alt_block_sel_data}, BLOCK_SEL_WIDTH);
        read_and_check_register(ua_crypto_pkg::REG_HASH_MSG_CHUNK, {{(512-HASH_MSG_CHUNK_WIDTH){1'b0}}, alt_hash_msg_chunk_data}, HASH_MSG_CHUNK_WIDTH);

    endtask

    // Phase 3: Randomized order write/read test
    virtual task phase3_randomized_order_test();

        logic[511:0] read_data; // Large enough for biggest register
        logic[KEY_WIDTH-1:0] rand_key_data;
        logic[PLAINTEXT_WIDTH-1:0] rand_plaintext_data;
        logic[MESSAGE_WIDTH-1:0] rand_message_data;
        logic[CIPHERTEXT_WIDTH-1:0] rand_ciphertext_data;
        logic[HASH_WIDTH-1:0] rand_hash_data;
        logic[BLOCK_SEL_WIDTH-1:0] rand_block_sel_data;
        logic[HASH_MSG_CHUNK_WIDTH-1:0] rand_hash_msg_chunk_data;
        cipher_hash_mode_e rand_cipher_hash_mode_data;

        // Arrays for randomized order testing
        serial_reg_addr_e write_order[8];
        serial_reg_addr_e read_order[8];
        logic[511:0] expected_data[8]; // Store expected values for each register

        // Randomize all test data patterns for Phase 3
        if (!std::randomize(rand_key_data))
            $error("[%s] Failed to randomize rand_key_data", test_name);

        if (!std::randomize(rand_plaintext_data))
            $error("[%s] Failed to randomize rand_plaintext_data", test_name);

        if (!std::randomize(rand_message_data))
            $error("[%s] Failed to randomize rand_message_data", test_name);

        if (!std::randomize(rand_ciphertext_data))
            $error("[%s] Failed to randomize rand_ciphertext_data", test_name);

        if (!std::randomize(rand_hash_data))
            $error("[%s] Failed to randomize rand_hash_data", test_name);

        if (!std::randomize(rand_block_sel_data))
            $error("[%s] Failed to randomize rand_block_sel_data", test_name);

        if (!std::randomize(rand_hash_msg_chunk_data))
            $error("[%s] Failed to randomize rand_hash_msg_chunk_data", test_name);

        if (!std::randomize(rand_cipher_hash_mode_data) with { rand_cipher_hash_mode_data inside {CIPHER_MODE, HASH_MODE}; })
            $error("[%s] Failed to randomize rand_cipher_hash_mode_data", test_name);

        $display("[%s] === PHASE 3: Randomized Order Write/Read Test ===", test_name);

        // Initialize register order arrays
        write_order[0] = ua_crypto_pkg::REG_KEY;
        write_order[1] = ua_crypto_pkg::REG_PLAINTEXT;
        write_order[2] = ua_crypto_pkg::REG_MESSAGE;
        write_order[3] = ua_crypto_pkg::REG_CIPHERTEXT;
        write_order[4] = ua_crypto_pkg::REG_HASH;
        write_order[5] = ua_crypto_pkg::REG_CIPHER_HASH_MODE;
        write_order[6] = ua_crypto_pkg::REG_BLOCK_SEL;
        write_order[7] = ua_crypto_pkg::REG_HASH_MSG_CHUNK;

        read_order[0] = ua_crypto_pkg::REG_KEY;
        read_order[1] = ua_crypto_pkg::REG_PLAINTEXT;
        read_order[2] = ua_crypto_pkg::REG_MESSAGE;
        read_order[3] = ua_crypto_pkg::REG_CIPHERTEXT;
        read_order[4] = ua_crypto_pkg::REG_HASH;
        read_order[5] = ua_crypto_pkg::REG_CIPHER_HASH_MODE;
        read_order[6] = ua_crypto_pkg::REG_BLOCK_SEL;
        read_order[7] = ua_crypto_pkg::REG_HASH_MSG_CHUNK;

        // Randomize the write and read order arrays
        write_order.shuffle();
        read_order.shuffle();

        // Store expected data for each register
        expected_data[0] = {{(512-KEY_WIDTH){1'b0}}, rand_key_data};
        expected_data[1] = {{(512-PLAINTEXT_WIDTH){1'b0}}, rand_plaintext_data};
        expected_data[2] = rand_message_data;
        expected_data[3] = {{(512-CIPHERTEXT_WIDTH){1'b0}}, rand_ciphertext_data};
        expected_data[4] = {{(512-HASH_WIDTH){1'b0}}, rand_hash_data};
        expected_data[5] = {{(512-CIPHER_HASH_MODE_WIDTH){1'b0}}, rand_cipher_hash_mode_data};
        expected_data[6] = {{(512-BLOCK_SEL_WIDTH){1'b0}}, rand_block_sel_data};
        expected_data[7] = {{(512-HASH_MSG_CHUNK_WIDTH){1'b0}}, rand_hash_msg_chunk_data};

        // Clear all registers first
        $display("[%s] Clearing all registers...", test_name);
        write_serial_reg(ua_crypto_pkg::REG_KEY, {KEY_WIDTH{1'b0}}, KEY_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_PLAINTEXT, {PLAINTEXT_WIDTH{1'b0}}, PLAINTEXT_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_MESSAGE, {MESSAGE_WIDTH{1'b0}}, MESSAGE_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_CIPHERTEXT, {CIPHERTEXT_WIDTH{1'b0}}, CIPHERTEXT_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_HASH, {HASH_WIDTH{1'b0}}, HASH_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_CIPHER_HASH_MODE, {CIPHER_HASH_MODE_WIDTH{1'b0}}, CIPHER_HASH_MODE_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_BLOCK_SEL, {BLOCK_SEL_WIDTH{1'b0}}, BLOCK_SEL_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_HASH_MSG_CHUNK, {HASH_MSG_CHUNK_WIDTH{1'b0}}, HASH_MSG_CHUNK_WIDTH);

        // Write all data in randomized order
        $display("[%s] Writing all registers in randomized order...", test_name);
        for (int i = 0; i < 8; i++) begin

            case (write_order[i])
                ua_crypto_pkg::REG_KEY:
                    write_serial_reg(write_order[i], rand_key_data, KEY_WIDTH);

                ua_crypto_pkg::REG_PLAINTEXT:
                    write_serial_reg(write_order[i], rand_plaintext_data, PLAINTEXT_WIDTH);

                ua_crypto_pkg::REG_MESSAGE:
                    write_serial_reg(write_order[i], rand_message_data, MESSAGE_WIDTH);

                ua_crypto_pkg::REG_CIPHERTEXT:
                    write_serial_reg(write_order[i], rand_ciphertext_data, CIPHERTEXT_WIDTH);

                ua_crypto_pkg::REG_HASH:
                    write_serial_reg(write_order[i], rand_hash_data, HASH_WIDTH);

                ua_crypto_pkg::REG_CIPHER_HASH_MODE:
                    write_serial_reg(write_order[i], rand_cipher_hash_mode_data, CIPHER_HASH_MODE_WIDTH);

                ua_crypto_pkg::REG_BLOCK_SEL:
                    write_serial_reg(write_order[i], rand_block_sel_data, BLOCK_SEL_WIDTH);

                ua_crypto_pkg::REG_HASH_MSG_CHUNK:
                    write_serial_reg(write_order[i], rand_hash_msg_chunk_data, HASH_MSG_CHUNK_WIDTH);

            endcase

        end

        // Small delay between write and read phases
        repeat(20) @(negedge vif.clk_slow);

        // Read back and verify all data in randomized order
        $display("[%s] Reading back and verifying all data in randomized order...", test_name);
        for (int i = 0; i < 8; i++) begin
            case (read_order[i])
                ua_crypto_pkg::REG_KEY:
                    read_and_check_register(read_order[i], {{(512-KEY_WIDTH){1'b0}}, rand_key_data}, KEY_WIDTH);
                ua_crypto_pkg::REG_PLAINTEXT:
                    read_and_check_register(read_order[i], {{(512-PLAINTEXT_WIDTH){1'b0}}, rand_plaintext_data}, PLAINTEXT_WIDTH);
                ua_crypto_pkg::REG_MESSAGE:
                    read_and_check_register(read_order[i], rand_message_data, MESSAGE_WIDTH);
                ua_crypto_pkg::REG_CIPHERTEXT:
                    read_and_check_register(read_order[i], {{(512-CIPHERTEXT_WIDTH){1'b0}}, rand_ciphertext_data}, CIPHERTEXT_WIDTH);
                ua_crypto_pkg::REG_HASH:
                    read_and_check_register(read_order[i], {{(512-HASH_WIDTH){1'b0}}, rand_hash_data}, HASH_WIDTH);
                ua_crypto_pkg::REG_CIPHER_HASH_MODE:
                    read_and_check_register(read_order[i], {{(512-CIPHER_HASH_MODE_WIDTH){1'b0}}, rand_cipher_hash_mode_data}, CIPHER_HASH_MODE_WIDTH);
                ua_crypto_pkg::REG_BLOCK_SEL:
                    read_and_check_register(read_order[i], {{(512-BLOCK_SEL_WIDTH){1'b0}}, rand_block_sel_data}, BLOCK_SEL_WIDTH);
                ua_crypto_pkg::REG_HASH_MSG_CHUNK:
                    read_and_check_register(read_order[i], {{(512-HASH_MSG_CHUNK_WIDTH){1'b0}}, rand_hash_msg_chunk_data}, HASH_MSG_CHUNK_WIDTH);
            endcase
        end
    endtask

endclass
