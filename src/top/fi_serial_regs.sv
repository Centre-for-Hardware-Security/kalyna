module fi_serial_regs
    import ua_crypto_pkg::*;
(

    input logic clk_i,
    input logic reset_n_i,

    /////////////////////////
    // To/from chip IO
    /////////////////////////

    input logic serial_enable_i,
    input fi_serial_reg_addr_e serial_sel_i,
    input logic serial_data_ingress_i,
    output logic serial_data_egress_o,

    /////////////////////////
    // To/from frequency injection blocks
    // Each register is "memory-mapped" at an address corresponding to the index given in serial_sel_i
    /////////////////////////

    // Address 0, RW: Enable oscillators (8 bits)
    output logic[7:0] enable_osc_o,

    // Address 1, RW: Trimming (8 bits)
    output logic[7:0] trimming_o,

    // Address 2, RW: MUX OSC1 sel + MUX OSC2 sel (6 bits)
    output logic[5:0] mux_osc_o,

    // Address 3, RW: MUX TRNG sel (2 bits)
    output logic[1:0] mux_trng_o

);

    // Enable oscillators register (8 bits)
    logic enable_osc_reg_we;
    logic[7:0] enable_osc_reg_q;

    // Trimming register (8 bits)
    logic trimming_reg_we;
    logic[7:0] trimming_reg_q;

    //  MUX OSC register (6 bits)
    logic mux_osc_reg_we;
    logic[5:0] mux_osc_reg_q;

    // MUX TRNG register (2 bits)
    logic mux_trng_reg_we;
    logic[1:0] mux_trng_reg_q;

    logic serial_data_egress_d, serial_data_egress_q;

    // Enable oscillators register
    assign enable_osc_reg_we = (serial_sel_i == FI_REG_ENABLE_OSC) && serial_enable_i;
    assign enable_osc_o = enable_osc_reg_q;

    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0)
            enable_osc_reg_q <= '0;

        else if (enable_osc_reg_we)
            enable_osc_reg_q <= {enable_osc_reg_q[6:0], serial_data_ingress_i};

    end

    // Trimming register
    assign trimming_reg_we = (serial_sel_i == FI_REG_TRIMMING) && serial_enable_i;
    assign trimming_o = trimming_reg_q;

    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0)
            trimming_reg_q <= '0;

        else if (trimming_reg_we)
            trimming_reg_q <= {trimming_reg_q[6:0], serial_data_ingress_i};

    end

    // Enable MUX OSC register
    assign mux_osc_reg_we = (serial_sel_i == FI_REG_OSC_MUX_SEL) && serial_enable_i;
    assign mux_osc_o = mux_osc_reg_q;

    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0)
            mux_osc_reg_q <= '0;

        else if (mux_osc_reg_we)
            mux_osc_reg_q <= {mux_osc_reg_q[4:0], serial_data_ingress_i};

    end

    // MUX TRNG register
    assign mux_trng_reg_we = (serial_sel_i == FI_REG_TRNG_MUX_SEL) && serial_enable_i;
    assign mux_trng_o = mux_trng_reg_q;

    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0)
            mux_trng_reg_q <= '0;

        else if (mux_trng_reg_we)
            mux_trng_reg_q <= {mux_trng_reg_q[0], serial_data_ingress_i};

    end

    // Serial data egress mux
    always_comb begin
        unique case (serial_sel_i)
            FI_REG_ENABLE_OSC:  serial_data_egress_d = enable_osc_reg_q[7];
            FI_REG_TRIMMING:    serial_data_egress_d = trimming_reg_q[7];
            FI_REG_OSC_MUX_SEL:  serial_data_egress_d = mux_osc_reg_q[5];
            FI_REG_TRNG_MUX_SEL: serial_data_egress_d = mux_trng_reg_q[1];
            default:            serial_data_egress_d = 1'b0;
        endcase
    end

    // Serial data egress register
    always_ff @(posedge clk_i or negedge reset_n_i) begin

        if (reset_n_i == 1'b0)
            serial_data_egress_q <= 1'b0;

        else
            serial_data_egress_q <= serial_data_egress_d;

    end

    assign serial_data_egress_o = serial_data_egress_q;

endmodule
