// Dummy ana_top module for frequency injection analog blocks
module ana_top (

    ////////////////////////////
    // Digital control bits
    ////////////////////////////

    // Bitblasted FI serial reg 0 (Oscillator enables)
    input wire enable_osc_0_i,
    input wire enable_osc_1_i,
    input wire enable_osc_2_i,
    input wire enable_osc_3_i,
    input wire enable_osc_4_i,
    input wire enable_osc_5_i,
    input wire enable_osc_6_i,
    input wire enable_osc_7_i,

    // Bitblasted FI serial reg 1 (Trimming bits)
    input wire trimming_0_i,
    input wire trimming_1_i,
    input wire trimming_2_i,
    input wire trimming_3_i,
    input wire trimming_4_i,
    input wire trimming_5_i,
    input wire trimming_6_i,
    input wire trimming_7_i,

    // Bitblasted FI serial reg 2 (OSC1 + OSC2 IO PIN mux sel)
    input wire osc_1_mux_sel_0_i,  // Bit 0 of register
    input wire osc_1_mux_sel_1_i,
    input wire osc_1_mux_sel_2_i,
    input wire osc_2_mux_sel_0_i,
    input wire osc_2_mux_sel_1_i,
    input wire osc_2_mux_sel_2_i,  // Bit 5 of register

    // Bitblasted FI serial reg 3 (TRNG IO PIN mux sel)
    input wire trng_mux_sel_0_i,
    input wire trng_mux_sel_1_i,

    ////////////////////////////
    // To/From wirebonded IOs
    ////////////////////////////

    input wire clk_i,
    output wire osc_1_o,
    output wire osc_2_o,
    output wire trng_o

);

    // Dummy outputs
    assign osc_1_o = 1'b0;
    assign osc_2_o = 1'b0;
    assign trng_o = 1'b0;

endmodule
