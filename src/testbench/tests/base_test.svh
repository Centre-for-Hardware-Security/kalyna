// Base test class for dig_top testbench environment
class base_test;

    // Virtual interface handle
    virtual dig_top_if vif;
    virtual clock_if clk_slow_vif;
    virtual clock_if clk_fast_vif;

    // Test configuration
    string test_name;
    int timeout_cycles = 50000;
    bit verbose = 0;

    // Constructor
    function new(virtual dig_top_if vif, virtual clock_if clk_slow_vif, virtual clock_if clk_fast_vif, string name = "base_test");

        this.vif = vif;
        this.clk_slow_vif = clk_slow_vif;
        this.clk_fast_vif = clk_fast_vif;

        this.test_name = name;

        // Check for verbose mode
        if ($test$plusargs("VERBOSE")) begin
            verbose = 1;
        end

        // Override timeout if specified
        if ($value$plusargs("TIMEOUT=%d", timeout_cycles)) begin
            $display("[%s] Using timeout: %0d cycles", test_name, timeout_cycles);
        end

    endfunction

    // Clock configuration methods
    virtual task set_default_clock_frequencies();

        // Default frequencies, can be overridden by derived tests
        set_slow_clock_frequency(10.0);    // 10 MHz
        set_fast_clock_frequency(1000.0);  // 1 GHz

        if (verbose)
            $display("[%s] Set default clock frequencies: slow=%.2f MHz, fast=%.2f MHz", test_name, 10.0, 1000.0);

    endtask

    virtual task set_slow_clock_frequency(input real freq_mhz);

        if (verbose)
            $display("[%s] Setting slow clock frequency to %.2f MHz", test_name, freq_mhz);

        clk_slow_vif.restart_clock(freq_mhz);

    endtask

    virtual task set_fast_clock_frequency(input real freq_mhz);

        if (verbose)
            $display("[%s] Setting fast clock frequency to %.2f MHz", test_name, freq_mhz);

        clk_fast_vif.restart_clock(freq_mhz);

    endtask

    virtual function real get_slow_clock_frequency();
        return clk_slow_vif.get_frequency();
    endfunction

    virtual function real get_fast_clock_frequency();
        return clk_fast_vif.get_frequency();
    endfunction

    virtual task wait_slow_clocks(input int num_cycles);
        repeat(num_cycles) @(posedge clk_slow_vif.clk);
    endtask

    virtual task wait_fast_clocks(input int num_cycles);
        repeat(num_cycles) @(posedge clk_fast_vif.clk);
    endtask

    // Virtual methods to be overridden by derived tests
    virtual task setup();

        set_default_clock_frequencies();

        if (verbose)
            $display("[%s] Resetting DUT", test_name);

        vif.reset_sequence();

        if (verbose)
            $display("[%s] Reset DUT done", test_name);

    endtask

    virtual task run();
        $fatal("[%s] Unexpected base_test run() method called, override it in child class", test_name);
    endtask

    virtual task cleanup();

        if (verbose)
            $display("[%s] Starting cleanup phase", test_name);

        // Reset all control signals
        vif.start = 1'b0;
        vif.serial_enable = 1'b0;
        vif.clk_mux_sel = 1'b0;
        vif.enc_dec_sel = ENC_MODE;

        repeat(10)
            @(posedge vif.clk_slow);

        if (verbose)
            $display("[%s] Cleanup completed", test_name);

    endtask

    // Main test execution
    virtual task execute();

        $display("[%s] Test starting at time <%0t>", test_name, $time);

        fork

            begin
                setup();
                run();
                cleanup();
                $display("[%s] Test completed at time <%0t>", test_name, $time);
            end

            begin

                // Timeout watchdog
                repeat(timeout_cycles)
                    @(posedge vif.clk_slow);

                $error("[%s] Test timeout after <%0d> cycles", test_name, timeout_cycles);

            end

        join_any disable fork;

    endtask

    // Helper methods for common operations

    // Write to serial register
    task write_serial_reg(input serial_reg_addr_e addr, input logic [511:0] data, input int num_bits = 32);

        string data_str;

        if (verbose) begin
            data_str = $sformatf("%0x", data);
            if (data_str.len() > (num_bits+3)/4) begin
                data_str = data_str.substr(data_str.len()-(num_bits+3)/4, data_str.len()-1);
            end
            $display("[%s] Writing <0x%s> to register <%s, addr 0b%03b>", test_name, data_str, addr.name(), addr);
        end

        vif.serial_write(addr, data, num_bits);

    endtask

    // Read from serial register
    task read_serial_reg(input serial_reg_addr_e addr, output logic [511:0] data, input int num_bits = 32);

        string data_str;

        vif.serial_read(addr, data, num_bits);

        if (verbose) begin
            data_str = $sformatf("%0x", data);
            if (data_str.len() > (num_bits+3)/4) begin
                data_str = data_str.substr(data_str.len()-(num_bits+3)/4, data_str.len()-1);
            end
            $display("[%s] Read <0x%s> from register <%s, addr 0b%03b>", test_name, data_str, addr.name(), addr);
        end

    endtask

    // Read and check register actual value against expected value
    virtual task read_and_check_register(
        input serial_reg_addr_e reg_addr,
        input logic [511:0] expected_value,
        input int width
    );
        logic [511:0] read_data;
        string reg_name;
        string expected_str, read_str;
        logic [511:0] mask;
        logic [511:0] xor_result;

        reg_name = reg_addr.name();

        read_serial_reg(reg_addr, read_data, width);

        // Create mask for the specified width
        mask = (512'b1 << width) - 1;
        xor_result = (read_data ^ expected_value) & mask;

        // NOTE: We can to a direct read_data[width-1:0] !== expected_value[width-1:0] because "width" is not a constant expression and the LRM forbids that
        if (xor_result != 0) begin

            // Format the values as strings to avoid variable part-select issues
            expected_str = $sformatf("%0x", expected_value);
            read_str = $sformatf("%0x", read_data);

            // Extract only the needed bits for display
            if (expected_str.len() > (width+3)/4) begin
                expected_str = expected_str.substr(expected_str.len()-(width+3)/4, expected_str.len()-1);
            end
            if (read_str.len() > (width+3)/4) begin
                read_str = read_str.substr(read_str.len()-(width+3)/4, read_str.len()-1);
            end

            $error("[%s] %s test mismatch! Expected: 0x%s, Got: 0x%s", test_name, reg_name, expected_str, read_str);

        end else begin
            $display("[%s] <%s> match", test_name, reg_name);
        end

    endtask

    // Write to FI serial register
    task write_fi_serial_reg(input fi_serial_reg_addr_e addr, input logic [31:0] data, input int num_bits = 8);

        string data_str;

        if (verbose) begin
            data_str = $sformatf("%0x", data);
            if (data_str.len() > (num_bits+3)/4) begin
                data_str = data_str.substr(data_str.len()-(num_bits+3)/4, data_str.len()-1);
            end
            $display("[%s] Writing <0x%s> to FI register <%s, addr 0b%02b>", test_name, data_str, addr.name(), addr);
        end

        vif.fi_serial_write(addr, data, num_bits);

    endtask

    // Read from FI serial register
    task read_fi_serial_reg(input fi_serial_reg_addr_e addr, output logic [31:0] data, input int num_bits = 8);

        string data_str;

        vif.fi_serial_read(addr, data, num_bits);

        if (verbose) begin
            data_str = $sformatf("%0x", data);
            if (data_str.len() > (num_bits+3)/4) begin
                data_str = data_str.substr(data_str.len()-(num_bits+3)/4, data_str.len()-1);
            end
            $display("[%s] Read <0x%s> from FI register <%s, addr 0b%02b>", test_name, data_str, addr.name(), addr);
        end

    endtask

    // Read and check FI register actual value against expected value
    virtual task read_and_check_fi_register(
        input fi_serial_reg_addr_e reg_addr,
        input logic [31:0] expected_value,
        input int width
    );
        logic [31:0] read_data;
        string reg_name;
        string expected_str, read_str;
        logic [31:0] mask;
        logic [31:0] xor_result;

        reg_name = reg_addr.name();

        read_fi_serial_reg(reg_addr, read_data, width);

        // Create mask for the specified width
        mask = (32'b1 << width) - 1;
        xor_result = (read_data ^ expected_value) & mask;

        // NOTE: We can to a direct read_data[width-1:0] !== expected_value[width-1:0] because "width" is not a constant expression and the LRM forbids that
        if (xor_result != 0) begin

            // Format the values as strings to avoid variable part-select issues
            expected_str = $sformatf("%0x", expected_value);
            read_str = $sformatf("%0x", read_data);

            // Extract only the needed bits for display
            if (expected_str.len() > (width+3)/4) begin
                expected_str = expected_str.substr(expected_str.len()-(width+3)/4, expected_str.len()-1);
            end
            if (read_str.len() > (width+3)/4) begin
                read_str = read_str.substr(read_str.len()-(width+3)/4, read_str.len()-1);
            end

            $error("[%s] %s test mismatch! Expected: 0x%s, Got: 0x%s", test_name, reg_name, expected_str, read_str);

        end else begin
            $display("[%s] <%s> match", test_name, reg_name);
        end

    endtask

    // Start operation and wait for completion
    task start_operation(input int start_cycles = 50);

        // if (verbose)
            $display("[%s] Starting operation at <%t> for %0d cycles", test_name, $realtime(), start_cycles);

        vif.start_and_wait_done(timeout_cycles, start_cycles);

        // if (verbose)
            $display("[%s] Operation completed at <%t>", test_name, $realtime());

    endtask

    // Set clock mux selection
    task set_clock_mux(input logic sel);

        if (verbose)
            $display("[%s] Setting clock mux to <%s>", test_name, sel ? "clk_fast" : "clk_slow");

        vif.clk_mux_sel = sel;

        @(posedge vif.clk_slow);

    endtask

    // Set encryption/decryption mode
    task set_enc_dec_mode(input enc_dec_mode_e mode);

        if (verbose)
            $display("[%s] Setting mode to <%s>", test_name, mode.name());

        vif.enc_dec_sel = mode;

        @(posedge vif.clk_slow);

    endtask

endclass
