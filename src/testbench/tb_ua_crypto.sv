// Main testbench module for dig_top with class-based test environment
import test_library_pkg::*;

module tb_ua_crypto;

    localparam string TIME_UNIT = "ns"; // Default time unit for display

    logic clk_slow;
    logic clk_fast;

    clock_if clk_slow_if (
        .CLOCK_NAME("clk_slow"),
        .clk(clk_slow)
    );

    clock_if clk_fast_if (
        .CLOCK_NAME("clk_fast"),
        .clk(clk_fast)
    );

    dig_top_if dig_if (
        .clk_fast(clk_fast),
        .clk_slow(clk_slow)
    );

    chip_top u_chip_top (

        ////////////////////////////
        // ua_crypto IO
        ////////////////////////////

        .ua_clk_slow_i(clk_slow),
        .ua_clk_fast_i(clk_fast),
        .ua_reset_n_i(dig_if.reset_n),

        .ua_clk_mux_sel_i(dig_if.clk_mux_sel),
        .ua_enc_dec_sel_i(dig_if.enc_dec_sel),

        .ua_start_i(dig_if.start),
        .ua_done_o(dig_if.done),

        .ua_serial_enable_i(dig_if.serial_enable),
        .ua_serial_sel_0_i(dig_if.serial_sel_0),
        .ua_serial_sel_1_i(dig_if.serial_sel_1),
        .ua_serial_sel_2_i(dig_if.serial_sel_2),
        .ua_serial_data_ingress_i(dig_if.serial_data_ingress),
        .ua_serial_data_egress_o(dig_if.serial_data_egress),

        .ua_chicken_bits_1_i(1'b0),

        ////////////////////////////
        // Frequency injection IO
        ////////////////////////////

        .fi_serial_enable_i(dig_if.fi_serial_enable),
        .fi_serial_sel_0_i(dig_if.fi_serial_sel_0),
        .fi_serial_sel_1_i(dig_if.fi_serial_sel_1),
        .fi_serial_data_ingress_i(dig_if.fi_serial_data_ingress),
        .fi_serial_data_egress_o(dig_if.fi_serial_data_egress),

        // .fi_vdd_ana_i(1'b1),
        // .fi_vss_ana_i(1'b0),

        .fi_osc_1_o(),
        .fi_osc_2_o(),
        .fi_trng_o()

    );

    // Clock initialization, set default frequencies and start clocks
    initial begin

        clk_slow_if.set_frequency(10.0);    // 10 MHz default
        clk_fast_if.set_frequency(800);  // 800 MHz default

        clk_slow_if.start_clock();
        clk_fast_if.start_clock();

    end

    // Initialize interface signals
    initial begin

        dig_if.reset_n = 1'b0;
        dig_if.clk_mux_sel = 1'b0;
        dig_if.enc_dec_sel = 1'b0;
        dig_if.start = 1'b0;
        dig_if.serial_enable = 1'b0;
        dig_if.serial_sel_0 = 1'b0;
        dig_if.serial_sel_1 = 1'b0;
        dig_if.serial_sel_2 = 1'b0;
        dig_if.serial_data_ingress = 1'b0;

        // Initialize FI interface signals
        dig_if.fi_serial_enable = 1'b0;
        dig_if.fi_serial_sel_0 = 1'b0;
        dig_if.fi_serial_sel_1 = 1'b0;
        dig_if.fi_serial_data_ingress = 1'b0;

    end

    // Main test execution
    initial begin

        // Test execution logic
        string test_name;
        base_test current_test;

        int time_unit_lut[string] = '{"s": 0, "ms": -3, "us": -6, "ns": -9, "ps": -12, "fs":-15};

        // Wait for initial setup
        #200ns;

        $timeformat(time_unit_lut[TIME_UNIT], 0, TIME_UNIT, 0);

        // Parse command line arguments
        test_name = test_factory::get_test_name();

        // Create the test
        current_test = test_factory::create_test(test_name, dig_if, clk_slow_if, clk_fast_if);

        if (current_test == null) begin
            $error("[TB] Failed to create test: %s", test_name);
            $finish();
        end

        $display("========================================");
        $display("Running Test: %s", test_name);
        $display("Start Time: %0t", $realtime());
        $display("========================================");

        // Execute the test
        current_test.execute();

        $display("========================================");
        $display("Test Completed: %s", test_name);
        $display("End Time: %0t", $realtime());
        $display("========================================");

        // Small delay before finishing
        repeat(10)
            @(posedge dig_if.clk_slow);

        $finish();

    end

    // Dump waves to VCD if requested, simulator-agnostic
    initial begin
        if ($test$plusargs("DUMP_VCD")) begin
            $dumpfile("tb_ua_crypto.vcd");
            $dumpvars(0, tb_ua_crypto);
            $display("[TB] VCD dumping enabled");
        end
    end

endmodule
