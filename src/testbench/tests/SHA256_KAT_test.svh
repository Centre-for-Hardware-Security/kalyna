// SHA-256 KAT Test - SHA-256 hash function implementation with known answer tests (static values, not randomized)
class SHA256_KAT_test extends base_test;

    // Test vectors structure for SHA-256
    typedef struct {
        logic [511:0] message;
        logic [255:0] expected_hash;
        string description;
    } sha256_test_vector_t;

    // Multi-block test vector structure for SHA-256
    typedef struct {
        logic [511:0] first_block;
        logic [511:0] middle_blocks[$];
        logic [255:0] expected_hash;
        string description;
    } sha256_multiblock_test_vector_t;

    // Test vectors for SHA-256 hashing
    sha256_test_vector_t sha256_vectors[$];
    sha256_multiblock_test_vector_t sha256_multiblock_vectors[$];

    function new(virtual dig_top_if vif, virtual clock_if clk_slow_if, virtual clock_if clk_fast_if, string name = "SHA256_KAT_test");
        super.new(vif, clk_slow_if, clk_fast_if, name);
        initialize_test_vectors();
        initialize_multiblock_test_vectors();
    endfunction

    // Initialize known test vectors from NIST SHA-256 specification
    virtual function void initialize_test_vectors();

        // NIST SHA-256 test vectors from FIPS 180-4
        // Test case 1: Single block message (448 bits + 64-bit length = 512 bits total)
        sha256_vectors.push_back('{
            message: 512'h61626380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018,
            expected_hash: 256'hba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad,
            description: "SHA-256 'abc' test vector"
        });

        // Test case 2: Empty message (padding + length = 512 bits total)
        // sha256_vectors.push_back('{
        //     message: 512'h80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
        //     expected_hash: 256'he3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855,
        //     description: "SHA-256 empty message test vector"
        // });

        // // Test case 3: Single character 'a' (8 bits + padding + 64-bit length = 512 bits total)
        // sha256_vectors.push_back('{
        //     message: 512'h61800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008,
        //     expected_hash: 256'hca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb,
        //     description: "SHA-256 single 'a' character test vector"
        // });

        // // Test case 4: Message "message digest"
        // sha256_vectors.push_back('{
        //     message: 512'h6d657373616765206469676573748000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070,
        //     expected_hash: 256'hf7846f55cf23e14eebeab5b4e1550cad5b509e3348fbc4efa3a1413d393cb650,
        //     description: "SHA-256 'message digest' test vector"
        // });

        // // Test case 5: Alphabet string "abcdefghijklmnopqrstuvwxyz"
        // sha256_vectors.push_back('{
        //     message: 512'h6162636465666768696a6b6c6d6e6f707172737475767778797a80000000000000000000000000000000000000000000000000000000000000000000000000d0,
        //     expected_hash: 256'h71c480df93d6ae2f1efad1447c66c9525e316218cf51fc8d9ed832f2daf18b73,
        //     description: "SHA-256 alphabet test vector"
        // });

        // // Test case 6: String "ua crypto sha256 block test case string for sha256 impl"
        // sha256_vectors.push_back('{
        //     message: 512'h75612063727970746f2073686132353620626c6f636b2074657374206361736520737472696e6720666f722073686132353620696d706c8000000000000001b8,
        //     expected_hash: 256'hab1a770b08e0a28ef78442ac6d135621c7afbc179d6ddbb0b9edf946288ecc1f,
        //     description: "SHA-256 'ua crypto sha256 block test case string for sha256 impl' test vector"
        // });

    endfunction

    // Initialize multi-block test vectors for stress testing address 7 (hash block selector)
    virtual function void initialize_multiblock_test_vectors();

        sha256_multiblock_test_vector_t vector1;
        sha256_multiblock_test_vector_t vector2;

        // Multi-block test case 1: Two-block message
        // "The quick brown fox jumps over the lazy dog. This message spans multiple blocks to test multiple block functionality"
        vector1.first_block = 512'h54686520717569636b2062726f776e20666f78206a756d7073206f76657220746865206c617a7920646f672e2054686973206d657373616765207370616e7320;
        vector1.middle_blocks.push_back(512'h6d756c7469706c6520626c6f636b7320746f2074657374206d756c7469706c6520626c6f636b2066756e6374696f6e616c6974798000000000000000000003a0);
        vector1.expected_hash = 256'h6e66375fa3051c34de7c9a0f3fc741777e90d47b3814770669e0467ec3b0dbdc;  // Expected hash for this specific message
        vector1.description = "-------SHA-256 two-block message test for hash block selector-------";
        sha256_multiblock_vectors.push_back(vector1);

        // Multi-block test case 2: Three-block message
        // "The quick brown fox jumps over the lazy dog. This message spans three different blocks to test multiple block functionality even further to ensure it is really working as intended"
        vector2.first_block = 512'h54686520717569636b2062726f776e20666f78206a756d7073206f76657220746865206c617a7920646f672e2054686973206d657373616765207370616e7320;
        vector2.middle_blocks.push_back(512'h746872656520646966666572656e7420626c6f636b7320746f2074657374206d756c7469706c6520626c6f636b2066756e6374696f6e616c697479206576656e);
        vector2.middle_blocks.push_back(512'h206675727468657220746f20656e73757265206974206973207265616c6c7920776f726b696e6720617320696e74656e64656480000000000000000000000598);
        vector2.expected_hash = 256'h5b65fc48e5374dc72285523ed4857afea80101d4bca4937c939923190e7f7761;  // Expected hash for this specific message
        vector2.description = "-------SHA-256 three-block message test for hash block selector-------";
        sha256_multiblock_vectors.push_back(vector2);

    endfunction

    virtual task run();

        $display("[%s] Running SHA-256 crypto test", test_name);

        // Set hash mode (not cipher mode)
        write_serial_reg(ua_crypto_pkg::REG_CIPHER_HASH_MODE, ua_crypto_pkg::HASH_MODE, CIPHER_HASH_MODE_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_BLOCK_SEL, ua_crypto_pkg::SHA256, BLOCK_SEL_WIDTH);

        // $display("[%s]---Testing SHA-256 block with slow clock---", test_name);
        // set_clock_mux(0);

        // // Run single-block tests first
        // foreach(sha256_vectors[i])
        //     test_sha256_hash(sha256_vectors[i], "SHA-256");

        // Run multi-block tests to stress address 7 (hash block selector)
        // foreach(sha256_multiblock_vectors[i])
        //     test_sha256_multiblock_hash(sha256_multiblock_vectors[i], "SHA-256-MULTIBLOCK");

        $display("[%s]---Testing SHA-256 block with fast clock---", test_name);
        set_fast_clock_frequency(500.0);  // 2ns period
        set_clock_mux(1);

        // Run single-block tests first
        foreach(sha256_vectors[i])
            test_sha256_hash(sha256_vectors[i], "SHA-256");

        // Run multi-block tests to stress address 7 (hash block selector)
        // foreach(sha256_multiblock_vectors[i])
        //     test_sha256_multiblock_hash(sha256_multiblock_vectors[i], "SHA-256-MULTIBLOCK");

        $display("[%s] SHA-256 crypto test completed successfully", test_name);

    endtask

    // Generic SHA-256 hash test task with integrated performance benchmarking
    virtual task test_sha256_hash(sha256_test_vector_t vector, string block_name);

        realtime start_cycle, end_cycle;
        int operation_cycles;

        $display("[%s] Testing %s: %s", test_name, block_name, vector.description);
        $display("[%s] %s Hash Test", test_name, block_name);

        // Load message data (512-bit message for SHA-256)
        write_serial_reg(ua_crypto_pkg::REG_MESSAGE, vector.message, MESSAGE_WIDTH);

        // Set hash block selector to first block (default for single-block)
        write_serial_reg(ua_crypto_pkg::REG_HASH_MSG_CHUNK, ua_crypto_pkg::HASH_FIRST_CHUNK, HASH_MSG_CHUNK_WIDTH);

        // Measure operation performance
        start_cycle = $realtime();
        start_operation();
        end_cycle = $realtime();
        operation_cycles = (end_cycle - start_cycle) / 100ns; // Assuming 100ns clock period for slow clock (10 MHz)

        // Read and verify result using the base class method
        read_and_check_register(ua_crypto_pkg::REG_HASH, vector.expected_hash, HASH_WIDTH);

        $display("[%s] %s hash test passed (%0d cycles)", test_name, block_name, operation_cycles);
        $display("[%s] %s hash test passed: %s (Hash: %0d cycles)", test_name, block_name, vector.description, operation_cycles);

    endtask

    // Multi-block SHA-256 hash test task to stress test address 7 (hash block selector)
    virtual task test_sha256_multiblock_hash(sha256_multiblock_test_vector_t vector, string block_name);

        realtime start_cycle, end_cycle, total_start, total_end;
        int operation_cycles, total_cycles;
        logic [255:0] intermediate_hash, final_hash;

        $display("[%s] Testing %s: %s", test_name, block_name, vector.description);
        $display("[%s] %s Multi-Block Hash Test - %0d blocks total", test_name, block_name, 1 + vector.middle_blocks.size());

        total_start = $realtime();

        // Process first block with HASH_FIRST_CHUNK mode
        $display("[%s] Processing first block with HASH_FIRST_CHUNK mode", test_name);
        write_serial_reg(ua_crypto_pkg::REG_MESSAGE, vector.first_block, MESSAGE_WIDTH);
        write_serial_reg(ua_crypto_pkg::REG_HASH_MSG_CHUNK, ua_crypto_pkg::HASH_FIRST_CHUNK, HASH_MSG_CHUNK_WIDTH);

        start_cycle = $realtime();
        start_operation();
        end_cycle = $realtime();
        operation_cycles = (end_cycle - start_cycle) / 100ns;

        // Read intermediate hash result
        read_serial_reg(ua_crypto_pkg::REG_HASH, intermediate_hash, HASH_WIDTH);
        $display("[%s] First block processed (%0d cycles), intermediate hash: %h", test_name, operation_cycles, intermediate_hash);

        // Process each middle block with HASH_FINAL_CHUNK mode as it doesnt matter for SHA-256, any block except first can be treated as final
        foreach(vector.middle_blocks[i]) begin

            $display("[%s] Processing middle block %0d with HASH_FINAL_CHUNK mode", test_name, i+1);
            write_serial_reg(ua_crypto_pkg::REG_MESSAGE, vector.middle_blocks[i], MESSAGE_WIDTH);
            write_serial_reg(ua_crypto_pkg::REG_HASH_MSG_CHUNK, ua_crypto_pkg::HASH_FINAL_CHUNK, HASH_MSG_CHUNK_WIDTH);

            start_cycle = $realtime();
            start_operation();
            end_cycle = $realtime();
            operation_cycles = (end_cycle - start_cycle) / 100ns;

            // Read intermediate hash result (except for last block where it's final)
            read_serial_reg(ua_crypto_pkg::REG_HASH, intermediate_hash, HASH_WIDTH);
            if (i == vector.middle_blocks.size() - 1) begin
                final_hash = intermediate_hash;
                $display("[%s] Final block processed (%0d cycles), final hash: %h", test_name, operation_cycles, final_hash);
            end else begin
                $display("[%s] Middle block %0d processed (%0d cycles), intermediate hash: %h", test_name, i+1, operation_cycles, intermediate_hash);
            end

        end

        total_end = $realtime();
        total_cycles = (total_end - total_start) / 100ns;

        // Verify final result
        if (final_hash == vector.expected_hash) begin
            $display("[%s] %s multi-block hash test PASSED: %s (Total: %0d cycles)", test_name, block_name, vector.description, total_cycles);
        end else begin
            $error("[%s] %s multi-block hash test FAILED: %s", test_name, block_name, vector.description);
            $error("[%s] Expected: %h", test_name, vector.expected_hash);
            $error("[%s] Got:      %h", test_name, final_hash);
        end

    endtask

endclass
