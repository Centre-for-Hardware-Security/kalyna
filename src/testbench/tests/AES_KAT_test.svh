// AES KAT Test - AES block cipher implementation with known answer tests (static values, not randomized)
class AES_KAT_test extends base_test;

    // Test vectors structure
    typedef struct {
        logic [127:0] key;
        logic [127:0] input_data;
        logic [127:0] expected_output_data;
        enc_dec_mode_e enc_dec_mode;
        string description;
    } aes_test_vector_t;

    // Test vectors for AES encryption/decryption
    aes_test_vector_t aes_vectors[$];

    function new(virtual dig_top_if vif, virtual clock_if clk_slow_vif, virtual clock_if clk_fast_vif, string name = "AES_KAT_test");
        super.new(vif, clk_slow_vif, clk_fast_vif, name);
        initialize_test_vectors();
    endfunction

    // Initialize known test vectors from NIST AES specification
    virtual function void initialize_test_vectors();

        // AES-128 test vectors from NIST FIPS 197
        aes_vectors.push_back('{
            key: 128'h000102030405060708090a0b0c0d0e0f,
            input_data: 128'h00112233445566778899aabbccddeeff,
            expected_output_data: 128'h69c4e0d86a7b0430d8cdb78070b4c55a,
            enc_dec_mode: ENC_MODE,
            description: "AES-128 Standard KAT Vector"
        });

        // AES-128 ECB test vectors from https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-38a.pdf

        // aes_vectors.push_back('{
        //     key: 128'h2b7e151628aed2a6abf7158809cf4f3c,
        //     input_data: 128'h6bc1bee22e409f96e93d7e117393172a,
        //     expected_output_data: 128'h3ad77bb40d7a3660a89ecaf32466ef97,
        //     enc_dec_mode: ENC_MODE,
        //     description: "AES-128 Encryption Test Vector 1"
        // });

        // aes_vectors.push_back('{
        //     key: 128'h2b7e151628aed2a6abf7158809cf4f3c,
        //     input_data: 128'hae2d8a571e03ac9c9eb76fac45af8e51,
        //     expected_output_data: 128'hf5d3d58503b9699de785895a96fdbaaf,
        //     enc_dec_mode: ENC_MODE,
        //     description: "AES-128 Encryption Test Vector 2"
        // });

        // aes_vectors.push_back('{
        //     key: 128'h2b7e151628aed2a6abf7158809cf4f3c,
        //     input_data: 128'h30c81c46a35ce411e5fbc1191a0a52ef,
        //     expected_output_data: 128'h43b1cd7f598ece23881b00e3ed030688,
        //     enc_dec_mode: ENC_MODE,
        //     description: "AES-128 Encryption Test Vector 3"
        // });

        // aes_vectors.push_back('{
        //     key: 128'h2b7e151628aed2a6abf7158809cf4f3c,
        //     input_data: 128'hf69f2445df4f9b17ad2b417be66c3710,
        //     expected_output_data: 128'h7b0c785e27e8ad3f8223207104725dd4,
        //     enc_dec_mode: ENC_MODE,
        //     description: "AES-128 Encryption Test Vector 3"
        // });

    endfunction

    virtual task run();

        $display("[%s] Running AES crypto test", test_name);

        // Set cipher mode (not hash mode)
        write_serial_reg(ua_crypto_pkg::REG_CIPHER_HASH_MODE, ua_crypto_pkg::CIPHER_MODE, CIPHER_HASH_MODE_WIDTH);

        // $display("[%s]---Testing AES block with slow clock---", test_name);
        // set_clock_mux(0);
        // test_aes();

        $display("[%s]---Testing AES block with fast clock---", test_name);
        set_clock_mux(1);
        test_aes();

        $display("[%s] AES crypto test completed successfully", test_name);

    endtask

    // Test AES implementation
    virtual task test_aes();

        $display("[%s] === Testing AES Block Cipher ===", test_name);

        // Select AES block
        write_serial_reg(ua_crypto_pkg::REG_BLOCK_SEL, ua_crypto_pkg::AES, BLOCK_SEL_WIDTH);
        set_fast_clock_frequency(800.0);  // 1.25ns period

        foreach(aes_vectors[i]) begin
            test_aes_cipher(aes_vectors[i], "AES");
        end

    endtask

    // Generic AES cipher test task with integrated performance benchmarking
    virtual task test_aes_cipher(aes_test_vector_t vector, string block_name);

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
        operation_cycles = (end_cycle - start_cycle) / 100ns; // Assuming 100ns clock period for slow clock (10 MHz)

        // Read and verify result using the base class method
        read_and_check_register(ua_crypto_pkg::REG_CIPHERTEXT, vector.expected_output_data, CIPHERTEXT_WIDTH);

        $display("[%s] %s %s passed (%0d cycles)", test_name, block_name, mode_str, operation_cycles);
        $display("[%s] %s cipher test passed: %s (%s: %0d cycles)",
                 test_name, block_name, vector.description, mode_str, operation_cycles);

    endtask

endclass
