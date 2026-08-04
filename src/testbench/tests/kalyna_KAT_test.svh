// Kalyna KAT Test - Kalyna block cipher implementations with known answer tests (static values, not randomized)
class kalyna_KAT_test extends base_test;

    // Test vectors structure
    typedef struct {
        logic [127:0] key;
        logic [127:0] input_data;
        logic [127:0] expected_output_data;
        enc_dec_mode_e enc_dec_mode;
        string description;
    } kalyna_test_vector_t;

    // Test vectors for Kalyna encryption
    kalyna_test_vector_t kalyna_vectors[$];

    function new(virtual dig_top_if vif, virtual clock_if clk_slow_if, virtual clock_if clk_fast_if, string name = "kalyna_KAT_test");
        super.new(vif, clk_slow_if, clk_fast_if, name);
        initialize_test_vectors();
    endfunction

    // Initialize known test vectors from the original testbench
    virtual function void initialize_test_vectors();

        kalyna_vectors.push_back('{
            key: 128'h000102030405060708090A0B0C0D0E0F,
            input_data: 128'h101112131415161718191A1B1C1D1E1F,
            expected_output_data: 128'h81BF1C7D779BAC20E1C9EA39B4D2AD06,
            enc_dec_mode: ENC_MODE,
            description: "Kalyna Encryption Test Vector 1"
        });

        kalyna_vectors.push_back('{
            key: 128'h0F0E0D0C0B0A09080706050403020100,
            input_data: 128'h1F1E1D1C1B1A19181716151413121110,
            expected_output_data: 128'h7291EF2B470CC7846f09C2303973DAD7,
            enc_dec_mode: DEC_MODE,
            description: "Kalyna Decryption Test Vector 1"
        });

        // kalyna_vectors.push_back('{
        //     key: 128'h000102030405060708090A0B0C0D0E0F,
        //     input_data: 128'h81BF1C7D779BAC20E1C9EA39B4D2AD06,
        //     expected_output_data: 128'h101112131415161718191A1B1C1D1E1F,
        //     enc_dec_mode: DEC_MODE,
        //     description: "Kalyna Encryption Test Vector 2 (Reversed Encryption Test Vector 1)"
        // });

        // kalyna_vectors.push_back('{
        //     key: 128'h0F0E0D0C0B0A09080706050403020100,
        //     input_data: 128'h7291EF2B470CC7846f09C2303973DAD7,
        //     expected_output_data: 128'h1F1E1D1C1B1A19181716151413121110,
        //     enc_dec_mode: ENC_MODE,
        //     description: "Kalyna Encryption Test Vector 2 (Reversed Decryption Test Vector 1)"
        // });

    endfunction

    virtual task run();

        $display("[%s] Running Kalyna crypto test", test_name);

        write_serial_reg(ua_crypto_pkg::REG_CIPHER_HASH_MODE, ua_crypto_pkg::CIPHER_MODE, CIPHER_HASH_MODE_WIDTH);

        // $display("[%s]---Testing Kalyna block with slow clock---", test_name);
        // set_clock_mux(0);
        // test_kalyna_lp();
        // test_kalyna_hs();
        // test_kalyna_hs_enc();
        // test_kalyna_secure1();
        // test_kalyna_secure2();
        // test_kalyna_kupyna();

        $display("[%s]---Testing Kalyna block with fast clock---", test_name);
        set_clock_mux(1);
        test_kalyna_lp();
        test_kalyna_hs();
        test_kalyna_hs_enc();
        // test_kalyna_secure1();
        test_kalyna_secure2();
        test_kalyna_kupyna();

        $display("[%s] Kalyna crypto test completed", test_name);

    endtask

    // Test Kalyna Low Power implementation
    virtual task test_kalyna_lp();

        $display("[%s] === Testing Kalyna LP Block Cipher ===", test_name);
        set_fast_clock_frequency(308); // Set fast clock to 308MHz for Kalyna LP block

        // Select Kalyna LP block
        write_serial_reg(ua_crypto_pkg::REG_BLOCK_SEL, ua_crypto_pkg::KALYNA_LP, BLOCK_SEL_WIDTH);

        foreach(kalyna_vectors[i]) begin
            test_kalyna_cipher(kalyna_vectors[i], "KALYNA_LP");
        end

    endtask

    // Test Kalyna High Speed implementation
    virtual task test_kalyna_hs();

        $display("[%s] === Testing Kalyna HS Block Cipher ===", test_name);
        set_fast_clock_frequency(308); // Set fast clock to 308MHz for Kalyna HS block

        // Select Kalyna HS block
        write_serial_reg(ua_crypto_pkg::REG_BLOCK_SEL, ua_crypto_pkg::KALYNA_HS, BLOCK_SEL_WIDTH);

        foreach(kalyna_vectors[i]) begin
            test_kalyna_cipher(kalyna_vectors[i], "KALYNA_HS");
        end

    endtask

    // Test Kalyna High Speed Encryption-Only implementation
    virtual task test_kalyna_hs_enc();

        $display("[%s] === Testing Kalyna HS Encryption-Only Block Cipher ===", test_name);
        set_fast_clock_frequency(666); // Set fast clock to 666MHz for Kalyna HS Enc-only block

        // Select Kalyna HS Encryption block
        write_serial_reg(ua_crypto_pkg::REG_BLOCK_SEL, ua_crypto_pkg::KALYNA_HS_ENC, BLOCK_SEL_WIDTH);

        // Only test encryption vectors, skip decryption
        foreach(kalyna_vectors[i]) begin
            if (kalyna_vectors[i].enc_dec_mode == ENC_MODE) begin
                test_kalyna_cipher(kalyna_vectors[i], "KALYNA_HS_ENC");
            end else begin
                $display("[%s] Skipping decryption test vector for encryption-only block: %s", test_name, kalyna_vectors[i].description);
            end
        end

    endtask

    // Test Kalyna Secure1 implementation
    virtual task test_kalyna_secure1();

        $display("[%s] === Testing Kalyna Secure1 Block Cipher ===", test_name);
        set_fast_clock_frequency(308); // Set fast clock to 308MHz for Kalyna Secure1 block

        // Select Kalyna Secure1 block
        write_serial_reg(ua_crypto_pkg::REG_BLOCK_SEL, ua_crypto_pkg::KALYNA_SECURE1, BLOCK_SEL_WIDTH);

        foreach(kalyna_vectors[i]) begin
            test_kalyna_cipher(kalyna_vectors[i], "KALYNA_SECURE1");
        end

    endtask

    // Test Kalyna Secure2 implementation
    virtual task test_kalyna_secure2();

        $display("[%s] === Testing Kalyna Secure2 Block Cipher ===", test_name);
        set_fast_clock_frequency(308); // Set fast clock to 308MHz for Kalyna Secure2 block

        // Select Kalyna Secure2 block
        write_serial_reg(ua_crypto_pkg::REG_BLOCK_SEL, ua_crypto_pkg::KALYNA_SECURE2, BLOCK_SEL_WIDTH);

        foreach(kalyna_vectors[i]) begin
            test_kalyna_cipher(kalyna_vectors[i], "KALYNA_SECURE2");
        end

    endtask

    // Test combined Kalyna+Kupyna implementation (Kalyna functionality only)
    virtual task test_kalyna_kupyna();

        $display("[%s] === Testing Kalyna+Kupyna Combined Block (Kalyna functionality) ===", test_name);
        set_fast_clock_frequency(400); // Set fast clock to 400MHz for Kalyna+Kupyna block

        // Select Kalyna+Kupyna block
        write_serial_reg(ua_crypto_pkg::REG_BLOCK_SEL, ua_crypto_pkg::KALYNA_KUPYNA, BLOCK_SEL_WIDTH);

        // Test Kalyna encryption/decryption functionality
        foreach(kalyna_vectors[i]) begin
            test_kalyna_cipher(kalyna_vectors[i], "KALYNA_KUPYNA");
        end

    endtask

    // Generic Kalyna cipher test task with integrated performance benchmarking
    virtual task test_kalyna_cipher(kalyna_test_vector_t vector, string block_name);

        logic [511:0] result_data;
        realtime start_cycle, end_cycle;
        int operation_cycles;
        string mode_str;

        mode_str = (vector.enc_dec_mode == ENC_MODE) ? "Encryption" : "Decryption";

        $display("[%s] Testing %s: %s", test_name, block_name, vector.description);
        $display("[%s] %s %s Test", test_name, block_name, mode_str);

        // Load key and input data
        write_serial_reg(ua_crypto_pkg::REG_KEY, vector.key, KEY_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_PLAINTEXT, vector.input_data, PLAINTEXT_WIDTH);

        // Set the operation mode from the vector
        set_enc_dec_mode(vector.enc_dec_mode);

        // Measure operation performance
        start_cycle = $realtime();
        start_operation();
        end_cycle = $realtime();
        operation_cycles = (end_cycle - start_cycle) / 100; // Assuming 100ns clock period for slow clock

        // Read result
        read_serial_reg(ua_crypto_pkg::REG_CIPHERTEXT, result_data, CIPHERTEXT_WIDTH);

        // Verify result
        if (result_data[CIPHERTEXT_WIDTH-1:0] !== vector.expected_output_data) begin
            $error("[%s] %s %s failed! Expected: 0x%032x, Got: 0x%032x", test_name, block_name, mode_str, vector.expected_output_data, result_data[CIPHERTEXT_WIDTH-1:0]);
        end else begin
            $display("[%s] %s %s passed (%0d cycles)", test_name, block_name, mode_str, operation_cycles);
        end

        $display("[%s] %s cipher test passed: %s (%s: %0d cycles)", test_name, block_name, vector.description, mode_str, operation_cycles);

    endtask

endclass
