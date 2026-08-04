// FI Register access test, tests FI serial register read/write operations
class fi_register_access_test extends base_test;

    function new(virtual dig_top_if vif, virtual clock_if clk_slow_if, virtual clock_if clk_fast_if, string name = "fi_register_access_test");
        super.new(vif, clk_slow_if, clk_fast_if, name);
    endfunction

    virtual task run();

        $display("[%s] Running FI register access test", test_name);

        phase1_individual_fi_register_tests();
        phase2_bulk_fi_write_read_test();
        phase3_randomized_fi_order_test();

        $display("[%s] FI register access test completed successfully", test_name);

    endtask

    // Phase 1: Individual FI register tests
    virtual task phase1_individual_fi_register_tests();

        logic[7:0] enable_osc_data;  // 8-bit oscillator enables
        logic[7:0] trimming_data;    // 8-bit trimming values
        logic[5:0] mux_osc_data;     // 6-bit OSC mux enables
        logic[1:0] mux_trng_data;    // 2-bit TRNG mux enables

        // Initialize test patterns with randomized values
        if (!std::randomize(enable_osc_data))
            $error("[%s] Failed to randomize enable_osc_data", test_name);

        if (!std::randomize(trimming_data))
            $error("[%s] Failed to randomize trimming_data", test_name);

        if (!std::randomize(mux_osc_data))
            $error("[%s] Failed to randomize mux_osc_data", test_name);

        if (!std::randomize(mux_trng_data))
            $error("[%s] Failed to randomize mux_trng_data", test_name);

        $display("[%s] === PHASE 1: Individual FI Register Tests ===", test_name);

        // Test Enable Oscillators register (Address 0)
        $display("[%s] Testing FI_REG_ENABLE_OSC (8 bits)", test_name);
        write_fi_serial_reg(ua_crypto_pkg::FI_REG_ENABLE_OSC, enable_osc_data, 8);
        read_and_check_fi_register(ua_crypto_pkg::FI_REG_ENABLE_OSC, enable_osc_data, 8);

        // Test Trimming register (Address 1)
        $display("[%s] Testing FI_REG_TRIMMING (8 bits)", test_name);
        write_fi_serial_reg(ua_crypto_pkg::FI_REG_TRIMMING, trimming_data, 8);
        read_and_check_fi_register(ua_crypto_pkg::FI_REG_TRIMMING, trimming_data, 8);

        // Test Enable MUX OSC register (Address 2)
        $display("[%s] Testing FI_REG_OSC_MUX_SEL (6 bits)", test_name);
        write_fi_serial_reg(ua_crypto_pkg::FI_REG_OSC_MUX_SEL, mux_osc_data, 6);
        read_and_check_fi_register(ua_crypto_pkg::FI_REG_OSC_MUX_SEL, mux_osc_data, 6);

        // Test Enable MUX TRNG register (Address 3)
        $display("[%s] Testing FI_REG_TRNG_MUX_SEL (2 bits)", test_name);
        write_fi_serial_reg(ua_crypto_pkg::FI_REG_TRNG_MUX_SEL, mux_trng_data, 2);
        read_and_check_fi_register(ua_crypto_pkg::FI_REG_TRNG_MUX_SEL, mux_trng_data, 2);

        $display("[%s] Phase 1 completed successfully", test_name);

    endtask

    // Phase 2: Bulk write then read test
    virtual task phase2_bulk_fi_write_read_test();

        logic[7:0] alt_enable_osc_data;
        logic[7:0] alt_trimming_data;
        logic[5:0] alt_mux_osc_data;
        logic[1:0] alt_mux_trng_data;

        // Generate different test patterns
        if (!std::randomize(alt_enable_osc_data))
            $error("[%s] Failed to randomize alt_enable_osc_data", test_name);

        if (!std::randomize(alt_trimming_data))
            $error("[%s] Failed to randomize alt_trimming_data", test_name);

        if (!std::randomize(alt_mux_osc_data))
            $error("[%s] Failed to randomize alt_mux_osc_data", test_name);

        if (!std::randomize(alt_mux_trng_data))
            $error("[%s] Failed to randomize alt_mux_trng_data", test_name);

        $display("[%s] === PHASE 2: Bulk FI Write/Read Test ===", test_name);

        // Write all FI registers first
        $display("[%s] Writing all FI registers with new data", test_name);
        write_fi_serial_reg(ua_crypto_pkg::FI_REG_ENABLE_OSC, alt_enable_osc_data, 8);
        write_fi_serial_reg(ua_crypto_pkg::FI_REG_TRIMMING, alt_trimming_data, 8);
        write_fi_serial_reg(ua_crypto_pkg::FI_REG_OSC_MUX_SEL, alt_mux_osc_data, 6);
        write_fi_serial_reg(ua_crypto_pkg::FI_REG_TRNG_MUX_SEL, alt_mux_trng_data, 2);

        // Now read all registers back and verify
        $display("[%s] Reading back all FI registers", test_name);

        read_and_check_fi_register(ua_crypto_pkg::FI_REG_ENABLE_OSC, alt_enable_osc_data, 8);
        read_and_check_fi_register(ua_crypto_pkg::FI_REG_TRIMMING, alt_trimming_data, 8);
        read_and_check_fi_register(ua_crypto_pkg::FI_REG_OSC_MUX_SEL, alt_mux_osc_data, 6);
        read_and_check_fi_register(ua_crypto_pkg::FI_REG_TRNG_MUX_SEL, alt_mux_trng_data, 2);

        $display("[%s] Phase 2 completed successfully", test_name);

    endtask

    // Phase 3: Randomized order test
    virtual task phase3_randomized_fi_order_test();

        logic[7:0] rand_enable_osc_data;
        logic[7:0] rand_trimming_data;
        logic[5:0] rand_mux_osc_data;
        logic[1:0] rand_mux_trng_data;

        // Test register accesses in randomized order
        int test_order[4] = {0, 1, 2, 3};

        $display("[%s] === PHASE 3: Randomized Order FI Test ===", test_name);

        // Shuffle the test order
        test_order.shuffle();

        // Generate test data
        if (!std::randomize(rand_enable_osc_data))
            $error("[%s] Failed to randomize rand_enable_osc_data", test_name);

        if (!std::randomize(rand_trimming_data))
            $error("[%s] Failed to randomize rand_trimming_data", test_name);

        if (!std::randomize(rand_mux_osc_data))
            $error("[%s] Failed to randomize rand_mux_osc_data", test_name);

        if (!std::randomize(rand_mux_trng_data))
            $error("[%s] Failed to randomize rand_mux_trng_data", test_name);

        $display("[%s] Testing FI registers in randomized order", test_name);

        // Test in randomized order
        foreach (test_order[i]) begin

            case (test_order[i])

                0: begin
                    write_fi_serial_reg(ua_crypto_pkg::FI_REG_ENABLE_OSC, rand_enable_osc_data, 8);
                    read_and_check_fi_register(ua_crypto_pkg::FI_REG_ENABLE_OSC, rand_enable_osc_data, 8);
                end

                1: begin
                    write_fi_serial_reg(ua_crypto_pkg::FI_REG_TRIMMING, rand_trimming_data, 8);
                    read_and_check_fi_register(ua_crypto_pkg::FI_REG_TRIMMING, rand_trimming_data, 8);
                end

                2: begin
                    write_fi_serial_reg(ua_crypto_pkg::FI_REG_OSC_MUX_SEL, rand_mux_osc_data, 6);
                    read_and_check_fi_register(ua_crypto_pkg::FI_REG_OSC_MUX_SEL, rand_mux_osc_data, 6);
                end

                3: begin
                    write_fi_serial_reg(ua_crypto_pkg::FI_REG_TRNG_MUX_SEL, rand_mux_trng_data, 2);
                    read_and_check_fi_register(ua_crypto_pkg::FI_REG_TRNG_MUX_SEL, rand_mux_trng_data, 2);
                end

            endcase
        end

        $display("[%s] Phase 3 completed successfully", test_name);

    endtask

endclass
