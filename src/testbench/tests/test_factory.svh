class test_factory;

    // Test registry - maps test names to test objects
    // static base_test test_registry[string];

    // Register a test in the factory
    // static function void register_test(string test_name, base_test test_obj);
    //     test_registry[test_name] = test_obj;
    //     $display("[TEST_FACTORY] Registered test: %s", test_name);
    // endfunction

    // Create and return test based on name
    static function base_test create_test(string test_name, virtual dig_top_if vif, virtual clock_if clk_slow_if, virtual clock_if clk_fast_if);

        base_test test_obj;

        case (test_name)

            "register_access_test": begin
                register_access_test reg_test = new(vif, clk_slow_if, clk_fast_if, "register_access_test");
                test_obj = reg_test;
            end

            "fi_register_access_test": begin
                fi_register_access_test fi_reg_test = new(vif, clk_slow_if, clk_fast_if, "fi_register_access_test");
                test_obj = fi_reg_test;
            end

            "kalyna_KAT_test": begin
                kalyna_KAT_test kat_test = new(vif, clk_slow_if, clk_fast_if, "kalyna_KAT_test");
                test_obj = kat_test;
            end

            "kupyna_KAT_test": begin
                kupyna_KAT_test kupyna_test = new(vif, clk_slow_if, clk_fast_if, "kupyna_KAT_test");
                test_obj = kupyna_test;
            end

            "AES_KAT_test": begin
                AES_KAT_test aes_test = new(vif, clk_slow_if, clk_fast_if, "AES_KAT_test");
                test_obj = aes_test;
            end

            "SHA256_KAT_test": begin
                SHA256_KAT_test sha256_test = new(vif, clk_slow_if, clk_fast_if, "SHA256_KAT_test");
                test_obj = sha256_test;
            end

            default: begin
                $fatal("[TEST_FACTORY] Unknown test: <%s>", test_name);
            end

        endcase

        return test_obj;

    endfunction

    // Parse plusargs and return test name
    static function string get_test_name();

        string test_name;

        if ($value$plusargs("TEST=%s", test_name)) begin
            $display("[TEST_FACTORY] Selected test from plusargs <%s>", test_name);
        end else begin
            $warning("[TEST_FACTORY] No TEST plusarg specified, using default <%s>", test_name);
        end

        return test_name;

    endfunction

endclass
