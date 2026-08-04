// Kupyna KAT Test - Kupyna hash function implementation with known answer tests (static values, not randomized)
class kupyna_KAT_test extends base_test;

    // Test vectors structure for Kupyna single-block tests
    typedef struct {
        logic [511:0] message;
        logic [255:0] expected_hash;
        string description;
    } kupyna_test_vector_t;

    // Test vectors for Kupyna hashing
    kupyna_test_vector_t kupyna_vectors[$];

    function new(virtual dig_top_if vif, virtual clock_if clk_slow_if, virtual clock_if clk_fast_if, string name = "kupyna_KAT_test");
        super.new(vif, clk_slow_if, clk_fast_if, name);
        initialize_test_vectors();
    endfunction

    // Initialize known single-block test vectors from kalyna_kupyna_tb.v
    virtual function void initialize_test_vectors();

        // Test vector 1: Single block message from kalyna_kupyna_tb.v
        // Message: FFFFFFFFFFFF80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000000000000000000000
        // Expected hash: F61C61F8BF3F6A4512FC27FC500A1D92A81BD8CDAB1CE4785216F21756F3BE27
        kupyna_vectors.push_back('{
            message: 512'hFFFFFFFFFFFF80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000000000000000000000,
            expected_hash: 256'hF61C61F8BF3F6A4512FC27FC500A1D92A81BD8CDAB1CE4785216F21756F3BE27,
            description: "-------Kupyna single block test vector from kalyna_kupyna_tb.v-------"
        });

    endfunction

    virtual task run();

        $display("[%s] Running Kupyna crypto test", test_name);

        // Set hash mode (not cipher mode)
        write_serial_reg(ua_crypto_pkg::REG_CIPHER_HASH_MODE, ua_crypto_pkg::HASH_MODE, CIPHER_HASH_MODE_WIDTH);

        // $display("[%s] ---Running block tests with slow clock---", test_name);
        // set_clock_mux(1'b0);
        // test_kupyna_lp();
        // test_kalyna_kupyna_as_kupyna();

        $display("[%s] ---Running block tests with fast clock---", test_name);
        set_clock_mux(1'b1);
        test_kupyna_lp();
        test_kalyna_kupyna_as_kupyna();

        $display("[%s] Kupyna crypto test completed", test_name);

    endtask

    // Test Kupyna Low Power implementation
    virtual task test_kupyna_lp();

        $display("[%s] === Testing Kupyna LP ===", test_name);

        // Select Kupyna LP block
        write_serial_reg(ua_crypto_pkg::REG_BLOCK_SEL, ua_crypto_pkg::KUPYNA_LP, BLOCK_SEL_WIDTH);
        set_fast_clock_frequency(400.0);  // 2.5ns period

        $display("[%s] Testing Kupyna LP variant - Single Block Tests", test_name);
        foreach(kupyna_vectors[i])
            test_kupyna_hash(kupyna_vectors[i], "Kupyna_LP_SINGLEBLOCK");

        // $display("[%s] Testing Kupyna LP variant - Multi-Block Tests", test_name);
        // foreach(kupyna_multiblock_vectors[i])
        //     test_kupyna_multiblock_hash(kupyna_multiblock_vectors[i], "Kupyna_LP_MULTIBLOCK");

    endtask

    // Test KALYNA_KUPYNA block in Kupyna mode
    virtual task test_kalyna_kupyna_as_kupyna();

        $display("[%s] === Testing KALYNA_KUPYNA in Kupyna Mode ===", test_name);

        // Select KALYNA_KUPYNA block
        write_serial_reg(ua_crypto_pkg::REG_BLOCK_SEL, ua_crypto_pkg::KALYNA_KUPYNA, BLOCK_SEL_WIDTH);
        set_fast_clock_frequency(400.0);  // 2.5ns period

        $display("[%s] Testing KALYNA_KUPYNA block in Kupyna mode - Single Block Tests", test_name);
        foreach(kupyna_vectors[i])
            test_kupyna_hash(kupyna_vectors[i], "KALYNA_KUPYNA_AS_KUPYNA_SINGLEBLOCK");

        // $display("[%s] Testing KALYNA_KUPYNA block in Kupyna mode - Multi-Block Tests", test_name);
        // foreach(kupyna_multiblock_vectors[i])
        //     test_kupyna_multiblock_hash(kupyna_multiblock_vectors[i], "KALYNA_KUPYNA_AS_KUPYNA_MULTIBLOCK");

    endtask

    // Generic Kupyna hash test task with integrated performance benchmarking
    virtual task test_kupyna_hash(kupyna_test_vector_t vector, string block_name);

        realtime start_cycle, end_cycle;
        int operation_cycles;

        $display("[%s] Testing %s: %s", test_name, block_name, vector.description);
        $display("[%s] %s Hash Test", test_name, block_name);

        // Load message data (512-bit message for Kupyna)
        write_serial_reg(ua_crypto_pkg::REG_MESSAGE, vector.message, MESSAGE_WIDTH);

        // Set hash message chunk specifier to HASH_FINAL_CHUNK (default for single-block)
        // Note that this is different from SHA-256 where we use HASH_FIRST_CHUNK for single-block messages
        write_serial_reg(ua_crypto_pkg::REG_HASH_MSG_CHUNK, ua_crypto_pkg::HASH_FINAL_CHUNK, HASH_MSG_CHUNK_WIDTH);

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

endclass