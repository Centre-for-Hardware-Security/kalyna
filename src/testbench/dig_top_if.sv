// Interface for dig_top module
interface dig_top_if
    import ua_crypto_pkg::*;
(
    input logic clk_fast,
    input logic clk_slow
);

    // Clock and reset signals
    logic reset_n;

    // Control signals
    logic clk_mux_sel;
    enc_dec_mode_e enc_dec_sel;
    logic start;
    logic done;

    // UA Serial interface signals
    logic serial_enable;
    logic serial_sel_0;
    logic serial_sel_1;
    logic serial_sel_2;
    logic serial_data_ingress;
    logic serial_data_egress;

    // FI (Frequency Injection) Serial interface signals
    logic fi_serial_enable;
    logic fi_serial_sel_0;
    logic fi_serial_sel_1;
    logic fi_serial_data_ingress;
    logic fi_serial_data_egress;

    ////////////////////////////////////////
    // Helper methods for common operations
    ////////////////////////////////////////

    // Reset sequence
    task reset_sequence();
        reset_n = 1'b1;
        repeat(10) @(negedge clk_slow);
        reset_n = 1'b0;
        repeat(10) @(negedge clk_slow);
        reset_n = 1'b1;
        repeat(5) @(negedge clk_slow);
    endtask

    // Serial write operation
    task serial_write(input serial_reg_addr_e addr, input [511:0] data, input int num_bits = 32);

        @(negedge clk_slow);

        serial_enable = 1'b1;
        {serial_sel_2, serial_sel_1, serial_sel_0} = addr;

        for (int i = num_bits-1; i >= 0; i--) begin
            serial_data_ingress = data[i];
            @(negedge clk_slow);
        end

        serial_enable = 1'b0;
        @(negedge clk_slow);
    endtask

    // Serial read operation
    task serial_read(input serial_reg_addr_e addr, output logic [511:0] data, input int num_bits = 32);

        data = '0;

        @(negedge clk_slow);

        serial_enable = 1'b1;
        {serial_sel_2, serial_sel_1, serial_sel_0} = addr;

        for (int i = num_bits-1; i >= 0; i--) begin
            @(negedge clk_slow);
            data[i] = serial_data_egress;
        end

        serial_enable = 1'b0;
        @(negedge clk_slow);

    endtask

    // Serial read and write operation daisy chain style: as bits shift out, new bits shift in
    task serial_read_and_write(
        input serial_reg_addr_e addr,
        output logic [511:0] read_data,
        input [511:0] write_data,
        input int num_bits = 32
    );
        read_data = '0;
        serial_enable = 1'b1;
        {serial_sel_2, serial_sel_1, serial_sel_0} = addr;

        // Simultaneously shift in write_data while shifting out read_data
        for (int i = num_bits-1; i >= 0; i--) begin
            serial_data_ingress = write_data[i];  // Drive new bit in
            @(negedge clk_slow);
            read_data[i] = serial_data_egress;    // Capture bit shifted out
        end

        serial_enable = 1'b0;
        @(negedge clk_slow);

    endtask

    // Start operation and wait for done
    task start_and_wait_done(input int timeout_clk_slow_cycles = 10000, input int start_cycles = 50);

        int cycle_count = 0;

        @(negedge clk_slow);
        start = 1'b1;

        // Keep start asserted for the specified number of cycles
        repeat (start_cycles)
            @(negedge clk_slow);

        start = 1'b0;

        repeat (5)
            @(negedge clk_slow);

        // Wait for done or timeout
        while (!done && cycle_count < timeout_clk_slow_cycles) begin

            @(negedge clk_slow);
            cycle_count++;

            if (cycle_count >= timeout_clk_slow_cycles)
                $fatal("Timeout waiting for done signal after <%0d> cycles", timeout_clk_slow_cycles);

        end

    endtask

    ////////////////////////////////////////
    // FI (Frequency Injection) Serial interface helper methods
    ////////////////////////////////////////

    // FI Serial write operation
    task fi_serial_write(input fi_serial_reg_addr_e addr, input [7:0] data, input int num_bits = 8);

        @(negedge clk_slow);

        fi_serial_enable = 1'b1;
        {fi_serial_sel_1, fi_serial_sel_0} = addr;

        for (int i = num_bits-1; i >= 0; i--) begin
            fi_serial_data_ingress = data[i];
            @(negedge clk_slow);
        end

        fi_serial_enable = 1'b0;
        @(negedge clk_slow);

    endtask

    // FI Serial read operation
    task fi_serial_read(input fi_serial_reg_addr_e addr, output logic [7:0] data, input int num_bits = 8);

        data = '0;

        @(negedge clk_slow);

        fi_serial_enable = 1'b1;
        {fi_serial_sel_1, fi_serial_sel_0} = addr;

        for (int i = num_bits-1; i >= 0; i--) begin
            @(negedge clk_slow);
            data[i] = fi_serial_data_egress;
        end

        fi_serial_enable = 1'b0;
        @(negedge clk_slow);

    endtask

    // FI Serial read and write operation daisy chain style
    task fi_serial_read_and_write(
        input fi_serial_reg_addr_e addr,
        output logic [7:0] read_data,
        input [7:0] write_data,
        input int num_bits = 8
    );
        read_data = '0;
        fi_serial_enable = 1'b1;
        {fi_serial_sel_1, fi_serial_sel_0} = addr;

        // Simultaneously shift in write_data while shifting out read_data
        for (int i = num_bits-1; i >= 0; i--) begin
            fi_serial_data_ingress = write_data[i];  // Drive new bit in
            @(negedge clk_slow);
            read_data[i] = fi_serial_data_egress;    // Capture bit shifted out
        end

        fi_serial_enable = 1'b0;
        @(negedge clk_slow);

    endtask

endinterface
