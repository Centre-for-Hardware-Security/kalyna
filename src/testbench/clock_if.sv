// Clock interface for configurable frequency clock generation
interface clock_if  (
    input string CLOCK_NAME,
    output logic clk
);

    // Clock configuration
    realtime period = 100ns;  // Default 10 MHz (100ns period)
    realtime half_period = 50ns;
    real frequency_mhz = 10.0;
    bit clock_enabled = 1'b0;

    initial begin
        clk = 1'b0;
    end

    // Task to set clock frequency
    task set_frequency(input real freq_mhz);

        bit enable_again = clock_enabled;

        if (clock_enabled) begin
            $display("[%s] Warning: Changing frequency while clock is running, stopping clock first", CLOCK_NAME);
            stop_clock();
        end

        frequency_mhz = freq_mhz;
        period = 1000.0 / freq_mhz; // Convert MHz to ns period
        half_period = period / 2.0;

        $display("[%s] Clock frequency set to %.2f MHz (period: %.2f ns)", CLOCK_NAME, frequency_mhz, period);

        if (enable_again) begin
            start_clock();
        end

    endtask

    // Task to start clock generation
    task start_clock();

        if (clock_enabled) begin
            $display("[%s] Warning: Clock already running", CLOCK_NAME);
            return;
        end

        clock_enabled = 1'b1;

        $display("[%s] Starting clock at %.2f MHz", CLOCK_NAME, frequency_mhz);

        fork
            begin
                while (clock_enabled) begin
                    #half_period clk = ~clk;
                end
            end
        join_none

    endtask

    // Task to stop clock generation
    task stop_clock();

        if (!clock_enabled) begin
            $display("[%s] Warning: Clock already stopped", CLOCK_NAME);
            return;
        end

        wait (clk === 1'b0);

        clock_enabled = 1'b0;
        $display("[%s] Stopping clock", CLOCK_NAME);

        // Wait a bit to ensure clock generation loop exits
        #(half_period * 2);
        // clk = 1'b0; // Ensure clock ends in known state

    endtask

    // Task to restart clock with new frequency
    task restart_clock(input real freq_mhz);
        stop_clock();
        set_frequency(freq_mhz);
        start_clock();
    endtask

    // Function to get current frequency
    function real get_frequency();
        return frequency_mhz;
    endfunction

    // Function to get current period
    function realtime get_period();
        return period;
    endfunction

    // Function to check if clock is running
    function bit is_running();
        return clock_enabled;
    endfunction

endinterface
