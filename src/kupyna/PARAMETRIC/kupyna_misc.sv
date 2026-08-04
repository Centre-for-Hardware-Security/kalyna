///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Description: This file includes the main building blocks of the KUPYNA hash function                                                              //
// Parallel - kupyna_hash_parallel                   - Full combinational logic                                                                      //
// Serial   - kupyna_hash_serial_2clk                - Serial with all rounds in two clk cycles                                                      //
// Serial   - kupyna_hash_serial_2rnd                - Serial with two rounds in one clk cycle                                                       //
// Serial   - kupyna_hash_serial                     - Serial with a single round in one clk cycle                                                   //
// Serial   - kupyna_hash_serial64b                  - Serial with a single column in state matrix in one clock cycle                                //
// Serial   - kupyna_hash_serial_2clk_reuse          - Serial with all rounds in two clk cycles reusing the XOR transformation                       //
// Serial   - kupyna_hash_serial_2rnd_reuse          - Serial with two rounds in one clk cycle reusing the XOR transformation                        //
// Serial   - kupyna_hash_serial_reuse               - Serial with a single round in one clk cycle reusing the XOR transformation                    //
// Serial   - kupyna_hash_serial64b_reuse            - Serial with a single column in state matrix in one clock cycle reusing the XOR transformation //
// Serial   - kupyna_hash_serial_oboc_reuse          - Serial with 64-bit operations in one clock cycle reusing all operations                       //
// The NOOPT parameter is used to choose the non-optimized linear transformation and S-boxes                                                         //
// The OPT parameter is used to choose the optimized linear transformation for the number of XOR gates and the optimized S-boxes                     //
// The BHA parameter is used to realize the 64-bit adder using a generic adder                                                                       //
// The KSA parameter is used to realize the 64-bit adder using the Kogge-Stone adder                                                                 //
// The SEMI parameter is used to implement the serial64b implementations with BLOCK_SIZE-bit adder, otherwise FULL should be declared                //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

`include "ksa.v"

`define OPT
`define KSA
`define SEMI

//CMVM GF - OPTIMIZED in TERMS of the NUMBER of XOR GATES - 492 XOR GATES
module cmvm_gf_opt (mds_in0, mds_in1, mds_in2, mds_in3, mds_in4, mds_in5, mds_in6, mds_in7, mds_out0, mds_out1, mds_out2, mds_out3, mds_out4, mds_out5, mds_out6, mds_out7);

input [7:0] mds_in0, mds_in1, mds_in2, mds_in3, mds_in4, mds_in5, mds_in6, mds_in7;
output [7:0] mds_out0, mds_out1, mds_out2, mds_out3, mds_out4, mds_out5, mds_out6, mds_out7;

// S1: (+1*X47+1*X55) = +X47<<0 +X55<<0
wire sub_exp1;
assign sub_exp1 = mds_in5[6] ^ mds_in6[6];

// S2: (+1*X7+1*X63) = +X7<<0 +X63<<0
wire sub_exp2;
assign sub_exp2 = mds_in0[6] ^ mds_in7[6];

// S3: (+1*X15+1*X23) = +X15<<0 +X23<<0
wire sub_exp3;
assign sub_exp3 = mds_in1[6] ^ mds_in2[6];

// S4: (+1*X31+1*X39) = +X31<<0 +X39<<0
wire sub_exp4;
assign sub_exp4 = mds_in3[6] ^ mds_in4[6];

// S5: (+1*X48+1*X56) = +X48<<0 +X56<<0
wire sub_exp5;
assign sub_exp5 = mds_in5[7] ^ mds_in6[7];

// S6: (+1*X8+1*X32) = +X8<<0 +X32<<0
wire sub_exp6;
assign sub_exp6 = mds_in0[7] ^ mds_in3[7];

// S7: (+1*X16+1*X24) = +X16<<0 +X24<<0
wire sub_exp7;
assign sub_exp7 = mds_in1[7] ^ mds_in2[7];

// S8: (+1*X40+1*X64) = +X40<<0 +X64<<0
wire sub_exp8;
assign sub_exp8 = mds_in4[7] ^ mds_in7[7];

// S9: (+1*X23+1*X63) = +X23<<0 +X63<<0
wire sub_exp9;
assign sub_exp9 = mds_in2[6] ^ mds_in7[6];

// S10: (+1*X31+1*X55) = +X31<<0 +X55<<0
wire sub_exp10;
assign sub_exp10 = mds_in3[6] ^ mds_in6[6];

// S11: (+1*X15+1*X39) = +X15<<0 +X39<<0
wire sub_exp11;
assign sub_exp11 = mds_in1[6] ^ mds_in4[6];

// S12: (+1*X7+1*X47) = +X7<<0 +X47<<0
wire sub_exp12;
assign sub_exp12 = mds_in0[6] ^ mds_in5[6];

// S13: (+1*X30+1*X40+1*X64) = +X30<<0 +S8<<0
wire sub_exp13;
assign sub_exp13 = mds_in3[5] ^ sub_exp8;

// S14: (+1*X38+1*X46) = +X38<<0 +X46<<0
wire sub_exp14;
assign sub_exp14 = mds_in4[5] ^ mds_in5[5];

// S15: (+1*X16+1*X24+1*X54) = +X54<<0 +S7<<0
wire sub_exp15;
assign sub_exp15 = mds_in6[5] ^ sub_exp7;

// S16: (+1*X8+1*X32+1*X62) = +X62<<0 +S6<<0
wire sub_exp16;
assign sub_exp16 = mds_in7[5] ^ sub_exp6;

// S17: (+1*X6+1*X14) = +X6<<0 +X14<<0
wire sub_exp17;
assign sub_exp17 = mds_in0[5] ^ mds_in1[5];

// S18: (+1*X22+1*X48+1*X56) = +X22<<0 +S5<<0
wire sub_exp18;
assign sub_exp18 = mds_in2[5] ^ sub_exp5;

// S19: (+1*X1+1*X9) = +X1<<0 +X9<<0
wire sub_exp19;
assign sub_exp19 = mds_in0[0] ^ mds_in1[0];

// S20: (+1*X17+1*X25) = +X17<<0 +X25<<0
wire sub_exp20;
assign sub_exp20 = mds_in2[0] ^ mds_in3[0];

// S21: (+1*X49+1*X57) = +X49<<0 +X57<<0
wire sub_exp21;
assign sub_exp21 = mds_in6[0] ^ mds_in7[0];

// S22: (+1*X33+1*X41) = +X33<<0 +X41<<0
wire sub_exp22;
assign sub_exp22 = mds_in4[0] ^ mds_in5[0];

// S23: (+1*X2+1*X10) = +X2<<0 +X10<<0
wire sub_exp23;
assign sub_exp23 = mds_in0[1] ^ mds_in1[1];

// S24: (+1*X18+1*X26) = +X18<<0 +X26<<0
wire sub_exp24;
assign sub_exp24 = mds_in2[1] ^ mds_in3[1];

// S25: (+1*X50+1*X58) = +X50<<0 +X58<<0
wire sub_exp25;
assign sub_exp25 = mds_in6[1] ^ mds_in7[1];

// S26: (+1*X34+1*X42) = +X34<<0 +X42<<0
wire sub_exp26;
assign sub_exp26 = mds_in4[1] ^ mds_in5[1];

// S27: (+1*X4+1*X12) = +X4<<0 +X12<<0
wire sub_exp27;
assign sub_exp27 = mds_in0[3] ^ mds_in1[3];

// S28: (+1*X20+1*X28) = +X20<<0 +X28<<0
wire sub_exp28;
assign sub_exp28 = mds_in2[3] ^ mds_in3[3];

// S29: (+1*X52+1*X60) = +X52<<0 +X60<<0
wire sub_exp29;
assign sub_exp29 = mds_in6[3] ^ mds_in7[3];

// S30: (+1*X36+1*X44) = +X36<<0 +X44<<0
wire sub_exp30;
assign sub_exp30 = mds_in4[3] ^ mds_in5[3];

// S31: (+1*X3+1*X11) = +X3<<0 +X11<<0
wire sub_exp31;
assign sub_exp31 = mds_in0[2] ^ mds_in1[2];

// S32: (+1*X19+1*X27) = +X19<<0 +X27<<0
wire sub_exp32;
assign sub_exp32 = mds_in2[2] ^ mds_in3[2];

// S33: (+1*X51+1*X59) = +X51<<0 +X59<<0
wire sub_exp33;
assign sub_exp33 = mds_in6[2] ^ mds_in7[2];

// S34: (+1*X35+1*X43) = +X35<<0 +X43<<0
wire sub_exp34;
assign sub_exp34 = mds_in4[2] ^ mds_in5[2];

// S35: (+1*X21+1*X47+1*X55) = +X21<<0 +S1<<0
wire sub_exp35;
assign sub_exp35 = mds_in2[4] ^ sub_exp1;

// S36: (+1*X5+1*X13) = +X5<<0 +X13<<0
wire sub_exp36;
assign sub_exp36 = mds_in0[4] ^ mds_in1[4];

// S37: (+1*X53+1*X61) = +X53<<0 +X61<<0
wire sub_exp37;
assign sub_exp37 = mds_in6[4] ^ mds_in7[4];

// S38: (+1*X37+1*X45) = +X37<<0 +X45<<0
wire sub_exp38;
assign sub_exp38 = mds_in4[4] ^ mds_in5[4];

// S39: (+1*X15+1*X23+1*X31+1*X55) = +S3<<0 +S10<<0
wire sub_exp39;
assign sub_exp39 = sub_exp3 ^ sub_exp10;

// S40: (+1*X15+1*X23+1*X62) = +X62<<0 +S3<<0
wire sub_exp40;
assign sub_exp40 = mds_in7[5] ^ sub_exp3;

// S41: (+1*X24+1*X38) = +X24<<0 +X38<<0
wire sub_exp41;
assign sub_exp41 = mds_in2[7] ^ mds_in4[5];

// S42: (+1*X6+1*X56) = +X6<<0 +X56<<0
wire sub_exp42;
assign sub_exp42 = mds_in0[5] ^ mds_in6[7];

// S43: (+1*X8+1*X16) = +X8<<0 +X16<<0
wire sub_exp43;
assign sub_exp43 = mds_in0[7] ^ mds_in1[7];

// S44: (+1*X8+1*X48) = +X8<<0 +X48<<0
wire sub_exp44;
assign sub_exp44 = mds_in0[7] ^ mds_in5[7];

// S45: (+1*X40+1*X48) = +X40<<0 +X48<<0
wire sub_exp45;
assign sub_exp45 = mds_in4[7] ^ mds_in5[7];

// S46: (+1*X16+1*X40) = +X16<<0 +X40<<0
wire sub_exp46;
assign sub_exp46 = mds_in1[7] ^ mds_in4[7];

// S47: (+1*X7+1*X31+1*X39+1*X47) = +S4<<0 +S12<<0
wire sub_exp47;
assign sub_exp47 = sub_exp4 ^ sub_exp12;

// S48: (+1*X7+1*X63+1*X64) = +X64<<0 +S2<<0
wire sub_exp48;
assign sub_exp48 = mds_in7[7] ^ sub_exp2;

// S49: (+1*X15+1*X39+1*X54) = +X54<<0 +S11<<0
wire sub_exp49;
assign sub_exp49 = mds_in6[5] ^ sub_exp11;

// S50: (+1*X15+1*X32) = +X15<<0 +X32<<0
wire sub_exp50;
assign sub_exp50 = mds_in1[6] ^ mds_in3[7];

// S51: (+1*X14+1*X31+1*X39) = +X14<<0 +S4<<0
wire sub_exp51;
assign sub_exp51 = mds_in1[5] ^ sub_exp4;

// S52: (+1*X7+1*X22+1*X31+1*X39+1*X47) = +X22<<0 +S47<<0
wire sub_exp52;
assign sub_exp52 = mds_in2[5] ^ sub_exp47;

// S53: (+1*X21+1*X29+1*X47+1*X55) = +X29<<0 +S35<<0
wire sub_exp53;
assign sub_exp53 = mds_in3[4] ^ sub_exp35;

// S54: (+1*X5+1*X29) = +X5<<0 +X29<<0
wire sub_exp54;
assign sub_exp54 = mds_in0[4] ^ mds_in3[4];

// S55: (+1*X18+1*X42) = +X18<<0 +X42<<0
wire sub_exp55;
assign sub_exp55 = mds_in2[1] ^ mds_in5[1];

// S56: (+1*X6+1*X14+1*X22+1*X48+1*X56) = +S17<<0 +S18<<0
wire sub_exp56;
assign sub_exp56 = sub_exp17 ^ sub_exp18;

// S57: (+1*X33+1*X57) = +X33<<0 +X57<<0
wire sub_exp57;
assign sub_exp57 = mds_in4[0] ^ mds_in7[0];

// S58: (+1*X34+1*X58) = +X34<<0 +X58<<0
wire sub_exp58;
assign sub_exp58 = mds_in4[1] ^ mds_in7[1];

// S59: (+1*X35+1*X59) = +X35<<0 +X59<<0
wire sub_exp59;
assign sub_exp59 = mds_in4[2] ^ mds_in7[2];

// S60: (+1*X2+1*X26) = +X2<<0 +X26<<0
wire sub_exp60;
assign sub_exp60 = mds_in0[1] ^ mds_in3[1];

// S61: (+1*X3+1*X27) = +X3<<0 +X27<<0
wire sub_exp61;
assign sub_exp61 = mds_in0[2] ^ mds_in3[2];

// S62: (+1*X15+1*X23+1*X48+1*X62) = +X48<<0 +S40<<0
wire sub_exp62;
assign sub_exp62 = mds_in5[7] ^ sub_exp40;

// S63: (+1*X35+1*X43+1*X56) = +X56<<0 +S34<<0
wire sub_exp63;
assign sub_exp63 = mds_in6[7] ^ sub_exp34;

// S64: (+1*X9+1*X49) = +X9<<0 +X49<<0
wire sub_exp64;
assign sub_exp64 = mds_in1[0] ^ mds_in6[0];

// S65: (+1*X10+1*X50) = +X10<<0 +X50<<0
wire sub_exp65;
assign sub_exp65 = mds_in1[1] ^ mds_in6[1];

// S66: (+1*X11+1*X51) = +X11<<0 +X51<<0
wire sub_exp66;
assign sub_exp66 = mds_in1[2] ^ mds_in6[2];

// S67: (+1*X3+1*X11+1*X24) = +X24<<0 +S31<<0
wire sub_exp67;
assign sub_exp67 = mds_in2[7] ^ sub_exp31;

// S68: (+1*X16+1*X24+1*X38+1*X46+1*X54) = +S14<<0 +S15<<0
wire sub_exp68;
assign sub_exp68 = sub_exp14 ^ sub_exp15;

// S69: (+1*X19+1*X43) = +X19<<0 +X43<<0
wire sub_exp69;
assign sub_exp69 = mds_in2[2] ^ mds_in5[2];

// S70: (+1*X37+1*X61) = +X37<<0 +X61<<0
wire sub_exp70;
assign sub_exp70 = mds_in4[4] ^ mds_in7[4];

// S71: (+1*X4+1*X28) = +X4<<0 +X28<<0
wire sub_exp71;
assign sub_exp71 = mds_in0[3] ^ mds_in3[3];

// S72: (+1*X44+1*X63) = +X44<<0 +X63<<0
wire sub_exp72;
assign sub_exp72 = mds_in5[3] ^ mds_in7[6];

// S73: (+1*X13+1*X53) = +X13<<0 +X53<<0
wire sub_exp73;
assign sub_exp73 = mds_in1[4] ^ mds_in6[4];

// S74: (+1*X23+1*X47+1*X55+1*X63) = +S1<<0 +S9<<0
wire sub_exp74;
assign sub_exp74 = sub_exp1 ^ sub_exp9;

// S75: (+1*X17+1*X41) = +X17<<0 +X41<<0
wire sub_exp75;
assign sub_exp75 = mds_in2[0] ^ mds_in5[0];

// S76: (+1*X39+1*X64) = +X39<<0 +X64<<0
wire sub_exp76;
assign sub_exp76 = mds_in4[6] ^ mds_in7[7];

// S77: (+1*X30+1*X64) = +X30<<0 +X64<<0
wire sub_exp77;
assign sub_exp77 = mds_in3[5] ^ mds_in7[7];

// S78: (+1*X16+1*X30) = +X16<<0 +X30<<0
wire sub_exp78;
assign sub_exp78 = mds_in1[7] ^ mds_in3[5];

// S79: (+1*X15+1*X30+1*X39) = +X30<<0 +S11<<0
wire sub_exp79;
assign sub_exp79 = mds_in3[5] ^ sub_exp11;

// S80: (+1*X7+1*X21) = +X7<<0 +X21<<0
wire sub_exp80;
assign sub_exp80 = mds_in0[6] ^ mds_in2[4];

// S81: (+1*X1+1*X25) = +X1<<0 +X25<<0
wire sub_exp81;
assign sub_exp81 = mds_in0[0] ^ mds_in3[0];

// S82: (+1*X36+1*X60) = +X36<<0 +X60<<0
wire sub_exp82;
assign sub_exp82 = mds_in4[3] ^ mds_in7[3];

// S83: (+1*X7+1*X55+1*X63) = +X55<<0 +S2<<0
wire sub_exp83;
assign sub_exp83 = mds_in6[6] ^ sub_exp2;

// S84: (+1*X12+1*X52) = +X12<<0 +X52<<0
wire sub_exp84;
assign sub_exp84 = mds_in1[3] ^ mds_in6[3];

// S85: (+1*X31+1*X46) = +X31<<0 +X46<<0
wire sub_exp85;
assign sub_exp85 = mds_in3[6] ^ mds_in5[5];

// S86: (+1*X24+1*X41) = +X24<<0 +X41<<0
wire sub_exp86;
assign sub_exp86 = mds_in2[7] ^ mds_in5[0];

// S87: (+1*X1+1*X9+1*X17+1*X41) = +S19<<0 +S75<<0
wire sub_exp87;
assign sub_exp87 = sub_exp19 ^ sub_exp75;

// S88: (+1*X3+1*X11+1*X50) = +X50<<0 +S31<<0
wire sub_exp88;
assign sub_exp88 = mds_in6[1] ^ sub_exp31;

// S89: (+1*X4+1*X12+1*X51) = +X51<<0 +S27<<0
wire sub_exp89;
assign sub_exp89 = mds_in6[2] ^ sub_exp27;

// S90: (+1*X9+1*X56) = +X9<<0 +X56<<0
wire sub_exp90;
assign sub_exp90 = mds_in1[0] ^ mds_in6[7];

// S91: (+1*X3+1*X20+1*X28) = +X3<<0 +S28<<0
wire sub_exp91;
assign sub_exp91 = mds_in0[2] ^ sub_exp28;

// S92: (+1*X9+1*X33+1*X41+1*X49) = +S22<<0 +S64<<0
wire sub_exp92;
assign sub_exp92 = sub_exp22 ^ sub_exp64;

// S93: (+1*X15+1*X32+1*X61) = +X61<<0 +S50<<0
wire sub_exp93;
assign sub_exp93 = mds_in7[4] ^ sub_exp50;

// S94: (+1*X18+1*X35+1*X43) = +X18<<0 +S34<<0
wire sub_exp94;
assign sub_exp94 = mds_in2[1] ^ sub_exp34;

// S95: (+1*X33+1*X50+1*X58) = +X33<<0 +S25<<0
wire sub_exp95;
assign sub_exp95 = mds_in4[0] ^ sub_exp25;

// S96: (+1*X2+1*X26+1*X50+1*X58) = +S25<<0 +S60<<0
wire sub_exp96;
assign sub_exp96 = sub_exp25 ^ sub_exp60;

// S97: (+1*X20+1*X28+1*X36+1*X60) = +S28<<0 +S82<<0
wire sub_exp97;
assign sub_exp97 = sub_exp28 ^ sub_exp82;

// S98: (+1*X24+1*X38+1*X52) = +X52<<0 +S41<<0
wire sub_exp98;
assign sub_exp98 = mds_in6[3] ^ sub_exp41;

// S99: (+1*X35+1*X52+1*X60) = +X35<<0 +S29<<0
wire sub_exp99;
assign sub_exp99 = mds_in4[2] ^ sub_exp29;

// S100: (+1*X4+1*X28+1*X52+1*X60) = +S29<<0 +S71<<0
wire sub_exp100;
assign sub_exp100 = sub_exp29 ^ sub_exp71;

// S101: (+1*X18+1*X26+1*X34+1*X58) = +S24<<0 +S58<<0
wire sub_exp101;
assign sub_exp101 = sub_exp24 ^ sub_exp58;

// S102: (+1*X1+1*X18+1*X26) = +X1<<0 +S24<<0
wire sub_exp102;
assign sub_exp102 = mds_in0[0] ^ sub_exp24;

// S103: (+1*X45+1*X63) = +X45<<0 +X63<<0
wire sub_exp103;
assign sub_exp103 = mds_in5[4] ^ mds_in7[6];

// S104: (+1*X2+1*X19+1*X27) = +X2<<0 +S32<<0
wire sub_exp104;
assign sub_exp104 = mds_in0[1] ^ sub_exp32;

// S105: (+1*X5+1*X29+1*X53+1*X61) = +S37<<0 +S54<<0
wire sub_exp105;
assign sub_exp105 = sub_exp37 ^ sub_exp54;

// S106: (+1*X45+1*X54) = +X45<<0 +X54<<0
wire sub_exp106;
assign sub_exp106 = mds_in5[4] ^ mds_in6[5];

// S107: (+1*X24+1*X30+1*X40+1*X64) = +X24<<0 +S13<<0
wire sub_exp107;
assign sub_exp107 = mds_in2[7] ^ sub_exp13;

// S108: (+1*X6+1*X14+1*X16+1*X22+1*X40+1*X48+1*X56) = +S46<<0 +S56<<0
wire sub_exp108;
assign sub_exp108 = sub_exp46 ^ sub_exp56;

// S109: (+1*X12+1*X36+1*X44+1*X52) = +S30<<0 +S84<<0
wire sub_exp109;
assign sub_exp109 = sub_exp30 ^ sub_exp84;

// S110: (+1*X19+1*X36+1*X44) = +X19<<0 +S30<<0
wire sub_exp110;
assign sub_exp110 = mds_in2[2] ^ sub_exp30;

// S111: (+1*X2+1*X10+1*X18+1*X42) = +S23<<0 +S55<<0
wire sub_exp111;
assign sub_exp111 = sub_exp23 ^ sub_exp55;

// S112: (+1*X2+1*X10+1*X49) = +X49<<0 +S23<<0
wire sub_exp112;
assign sub_exp112 = mds_in6[0] ^ sub_exp23;

// S113: (+1*X7+1*X32) = +X7<<0 +X32<<0
wire sub_exp113;
assign sub_exp113 = mds_in0[6] ^ mds_in3[7];

// S114: (+1*X34+1*X51+1*X59) = +X34<<0 +S33<<0
wire sub_exp114;
assign sub_exp114 = mds_in4[1] ^ sub_exp33;

// S115: (+1*X11+1*X46) = +X11<<0 +X46<<0
wire sub_exp115;
assign sub_exp115 = mds_in1[2] ^ mds_in5[5];

// S116: (+1*X7+1*X31+1*X55+1*X63+1*X64) = +S10<<0 +S48<<0
wire sub_exp116;
assign sub_exp116 = sub_exp10 ^ sub_exp48;

// S117: (+1*X17+1*X25+1*X33+1*X57) = +S20<<0 +S57<<0
wire sub_exp117;
assign sub_exp117 = sub_exp20 ^ sub_exp57;

// S118: (+1*X8+1*X17+1*X25) = +X8<<0 +S20<<0
wire sub_exp118;
assign sub_exp118 = mds_in0[7] ^ sub_exp20;

// S119: (+1*X7+1*X15+1*X39+1*X54+1*X63+1*X64) = +S48<<0 +S49<<0
wire sub_exp119;
assign sub_exp119 = sub_exp48 ^ sub_exp49;

// S120: (+1*X16+1*X24+1*X51+1*X59) = +S7<<0 +S33<<0
wire sub_exp120;
assign sub_exp120 = sub_exp7 ^ sub_exp33;

// S121: (+1*X6+1*X15+1*X23+1*X31+1*X55) = +X6<<0 +S39<<0
wire sub_exp121;
assign sub_exp121 = mds_in0[5] ^ sub_exp39;

// S122: (+1*X16+1*X17+1*X24) = +X17<<0 +S7<<0
wire sub_exp122;
assign sub_exp122 = mds_in2[0] ^ sub_exp7;

// S123: (+1*X32+1*X37+1*X45) = +X32<<0 +S38<<0
wire sub_exp123;
assign sub_exp123 = mds_in3[7] ^ sub_exp38;

// S124: (+1*X23+1*X38+1*X47+1*X55+1*X63) = +X38<<0 +S74<<0
wire sub_exp124;
assign sub_exp124 = mds_in4[5] ^ sub_exp74;

// S125: (+1*X23+1*X38+1*X47+1*X48+1*X55+1*X56+1*X63) = +S5<<0 +S124<<0
wire sub_exp125;
assign sub_exp125 = sub_exp5 ^ sub_exp124;

// S126: (+1*X19+1*X27+1*X49+1*X57) = +S21<<0 +S32<<0
wire sub_exp126;
assign sub_exp126 = sub_exp21 ^ sub_exp32;

// S127: (+1*X20+1*X44) = +X20<<0 +X44<<0
wire sub_exp127;
assign sub_exp127 = mds_in2[3] ^ mds_in5[3];

// S128: (+1*X39+1*X53) = +X39<<0 +X53<<0
wire sub_exp128;
assign sub_exp128 = mds_in4[6] ^ mds_in6[4];

// S129: (+1*X21+1*X23+1*X29+1*X47+1*X55+1*X63) = +S9<<0 +S53<<0
wire sub_exp129;
assign sub_exp129 = sub_exp9 ^ sub_exp53;

// S130: (+1*X10+1*X34+1*X42+1*X50) = +S26<<0 +S65<<0
wire sub_exp130;
assign sub_exp130 = sub_exp26 ^ sub_exp65;

// S131: (+1*X22+1*X56) = +X22<<0 +X56<<0
wire sub_exp131;
assign sub_exp131 = mds_in2[5] ^ mds_in6[7];

// S132: (+1*X8+1*X22+1*X32+1*X56+1*X62) = +S16<<0 +S131<<0
wire sub_exp132;
assign sub_exp132 = sub_exp16 ^ sub_exp131;

// S133: (+1*X8+1*X12+1*X32) = +X12<<0 +S6<<0
wire sub_exp133;
assign sub_exp133 = mds_in1[3] ^ sub_exp6;

// S134: (+1*X31+1*X46+1*X51+1*X59) = +S33<<0 +S85<<0
wire sub_exp134;
assign sub_exp134 = sub_exp33 ^ sub_exp85;

// S135: (+1*X7+1*X31+1*X46+1*X51+1*X59+1*X63) = +S2<<0 +S134<<0
wire sub_exp135;
assign sub_exp135 = sub_exp2 ^ sub_exp134;

// S136: (+1*X21+1*X29+1*X37+1*X47+1*X55+1*X61) = +S53<<0 +S70<<0
wire sub_exp136;
assign sub_exp136 = sub_exp53 ^ sub_exp70;

// S137: (+1*X8+1*X16+1*X55) = +X55<<0 +S43<<0
wire sub_exp137;
assign sub_exp137 = mds_in6[6] ^ sub_exp43;

// S138: (+1*X6+1*X38+1*X46+1*X56) = +S14<<0 +S42<<0
wire sub_exp138;
assign sub_exp138 = sub_exp14 ^ sub_exp42;

// S139: (+1*X6+1*X30+1*X38+1*X40+1*X46+1*X56+1*X64) = +S13<<0 +S138<<0
wire sub_exp139;
assign sub_exp139 = sub_exp13 ^ sub_exp138;

// S140: (+1*X7+1*X15+1*X23+1*X47+1*X62) = +S12<<0 +S40<<0
wire sub_exp140;
assign sub_exp140 = sub_exp12 ^ sub_exp40;

// S141: (+1*X7+1*X8+1*X15+1*X16+1*X23+1*X47+1*X62) = +S43<<0 +S140<<0
wire sub_exp141;
assign sub_exp141 = sub_exp43 ^ sub_exp140;

// S142: (+1*X7+1*X28+1*X63) = +X28<<0 +S2<<0
wire sub_exp142;
assign sub_exp142 = mds_in3[3] ^ sub_exp2;

// S143: (+1*X7+1*X28+1*X47+1*X63) = +X47<<0 +S142<<0
wire sub_exp143;
assign sub_exp143 = mds_in5[6] ^ sub_exp142;

// S144: (+1*X3+1*X11+1*X15+1*X23+1*X24+1*X48+1*X62) = +S62<<0 +S67<<0
wire sub_exp144;
assign sub_exp144 = sub_exp62 ^ sub_exp67;

// S145: (+1*X29+1*X47) = +X29<<0 +X47<<0
wire sub_exp145;
assign sub_exp145 = mds_in3[4] ^ mds_in5[6];

// S146: (+1*X14+1*X22+1*X48+1*X56) = +X14<<0 +S18<<0
wire sub_exp146;
assign sub_exp146 = mds_in1[5] ^ sub_exp18;

// S147: (+1*X30+1*X38+1*X64) = +X38<<0 +S77<<0
wire sub_exp147;
assign sub_exp147 = mds_in4[5] ^ sub_exp77;

// S148: (+1*X8+1*X30+1*X32+1*X38+1*X62+1*X64) = +S16<<0 +S147<<0
wire sub_exp148;
assign sub_exp148 = sub_exp16 ^ sub_exp147;

// S149: (+1*X14+1*X16+1*X24+1*X38+1*X46+1*X54) = +X14<<0 +S68<<0
wire sub_exp149;
assign sub_exp149 = mds_in1[5] ^ sub_exp68;

// S150: (+1*X8+1*X14+1*X16+1*X24+1*X38+1*X46+1*X48+1*X54) = +S44<<0 +S149<<0
wire sub_exp150;
assign sub_exp150 = sub_exp44 ^ sub_exp149;

// S151: (+1*X5+1*X13+1*X23) = +X23<<0 +S36<<0
wire sub_exp151;
assign sub_exp151 = mds_in2[6] ^ sub_exp36;

// S152: (+1*X23+1*X40+1*X48) = +X23<<0 +S45<<0
wire sub_exp152;
assign sub_exp152 = mds_in2[6] ^ sub_exp45;

// S153: (+1*X36+1*X53+1*X61) = +X36<<0 +S37<<0
wire sub_exp153;
assign sub_exp153 = mds_in4[3] ^ sub_exp37;

// S154: (+1*X7+1*X8+1*X22+1*X31+1*X39+1*X47+1*X48) = +S44<<0 +S52<<0
wire sub_exp154;
assign sub_exp154 = sub_exp44 ^ sub_exp52;

// S155: (+1*X7+1*X15+1*X21+1*X23+1*X31+1*X55) = +S39<<0 +S80<<0
wire sub_exp155;
assign sub_exp155 = sub_exp39 ^ sub_exp80;

// S156: (+1*X6+1*X20+1*X56) = +X20<<0 +S42<<0
wire sub_exp156;
assign sub_exp156 = mds_in2[3] ^ sub_exp42;

// S157: (+1*X5+1*X29+1*X37+1*X45) = +S38<<0 +S54<<0
wire sub_exp157;
assign sub_exp157 = sub_exp38 ^ sub_exp54;

// S158: (+1*X5+1*X7+1*X29+1*X37+1*X45+1*X55+1*X63) = +S83<<0 +S157<<0
wire sub_exp158;
assign sub_exp158 = sub_exp83 ^ sub_exp157;

// S159: (+1*X4+1*X16+1*X40) = +X4<<0 +S46<<0
wire sub_exp159;
assign sub_exp159 = mds_in0[3] ^ sub_exp46;

// S160: (+1*X4+1*X15+1*X16+1*X39+1*X40+1*X54) = +S49<<0 +S159<<0
wire sub_exp160;
assign sub_exp160 = sub_exp49 ^ sub_exp159;

// S161: (+1*X6+1*X8+1*X14+1*X32+1*X62) = +S16<<0 +S17<<0
wire sub_exp161;
assign sub_exp161 = sub_exp16 ^ sub_exp17;

// S162: (+1*X6+1*X8+1*X14+1*X24+1*X32+1*X38+1*X62) = +S41<<0 +S161<<0
wire sub_exp162;
assign sub_exp162 = sub_exp41 ^ sub_exp161;

// S163: (+1*X15+1*X60) = +X15<<0 +X60<<0
wire sub_exp163;
assign sub_exp163 = mds_in1[6] ^ mds_in7[3];

// S164: (+1*X14+1*X23+1*X31+1*X39+1*X63) = +S9<<0 +S51<<0
wire sub_exp164;
assign sub_exp164 = sub_exp9 ^ sub_exp51;

// S165: (+1*X14+1*X23+1*X31+1*X32+1*X39+1*X63) = +X32<<0 +S164<<0
wire sub_exp165;
assign sub_exp165 = mds_in3[7] ^ sub_exp164;

// S166: (+1*X32+1*X40) = +X32<<0 +X40<<0
wire sub_exp166;
assign sub_exp166 = mds_in3[7] ^ mds_in4[7];

// S167: (+1*X7+1*X22+1*X31+1*X32+1*X39+1*X40+1*X47) = +S52<<0 +S166<<0
wire sub_exp167;
assign sub_exp167 = sub_exp52 ^ sub_exp166;

// S168: (+1*X40+1*X47+1*X48+1*X55) = +S1<<0 +S45<<0
wire sub_exp168;
assign sub_exp168 = sub_exp1 ^ sub_exp45;

// S169: (+1*X15+1*X30+1*X39+1*X40+1*X47+1*X48+1*X55) = +S79<<0 +S168<<0
wire sub_exp169;
assign sub_exp169 = sub_exp79 ^ sub_exp168;

// S170: (+1*X16+1*X30+1*X35+1*X43+1*X56) = +S63<<0 +S78<<0
wire sub_exp170;
assign sub_exp170 = sub_exp63 ^ sub_exp78;

// S171: (+1*X15+1*X31+1*X39+1*X60) = +S4<<0 +S163<<0
wire sub_exp171;
assign sub_exp171 = sub_exp4 ^ sub_exp163;

// S172: (+1*X21+1*X45+1*X47+1*X55) = +X45<<0 +S35<<0
wire sub_exp172;
assign sub_exp172 = mds_in5[4] ^ sub_exp35;

// S173: (+1*X5+1*X13+1*X21+1*X45+1*X47+1*X55) = +S36<<0 +S172<<0
wire sub_exp173;
assign sub_exp173 = sub_exp36 ^ sub_exp172;

// S174: (+1*X6+1*X62) = +X6<<0 +X62<<0
wire sub_exp174;
assign sub_exp174 = mds_in0[5] ^ mds_in7[5];

// S175: (+1*X16+1*X24+1*X30+1*X40+1*X54+1*X64) = +S13<<0 +S15<<0
wire sub_exp175;
assign sub_exp175 = sub_exp13 ^ sub_exp15;

// S176: (+1*X6+1*X16+1*X24+1*X30+1*X40+1*X54+1*X62+1*X64) = +S174<<0 +S175<<0
wire sub_exp176;
assign sub_exp176 = sub_exp174 ^ sub_exp175;

// S177: (+1*X15+1*X23+1*X40+1*X64) = +S3<<0 +S8<<0
wire sub_exp177;
assign sub_exp177 = sub_exp3 ^ sub_exp8;

// S178: (+1*X14+1*X19+1*X27+1*X31+1*X39) = +S32<<0 +S51<<0
wire sub_exp178;
assign sub_exp178 = sub_exp32 ^ sub_exp51;

// S179: (+1*X14+1*X15+1*X19+1*X23+1*X27+1*X31+1*X39+1*X40+1*X64) = +S177<<0 +S178<<0
wire sub_exp179;
assign sub_exp179 = sub_exp177 ^ sub_exp178;

// S180: (+1*X1+1*X9+1*X49) = +X49<<0 +S19<<0
wire sub_exp180;
assign sub_exp180 = mds_in6[0] ^ sub_exp19;

// S181: (+1*X1+1*X9+1*X17+1*X25+1*X49) = +S180<<0 +S20<<0
wire sub_exp181;
assign sub_exp181 = sub_exp180 ^ sub_exp20;

// O1: (+1*X1+1*X9+1*X17+1*X23+1*X25+1*X38+1*X47+1*X48+1*X49+1*X55+1*X56+1*X63) = +S181<<0 +S125<<0
assign mds_out0[0] = sub_exp181 ^ sub_exp125;

// S182: (+1*X48+1*X50+1*X56) = +X50<<0 +S5<<0
wire sub_exp182;
assign sub_exp182 = mds_in6[1] ^ sub_exp5;

// S183: (+1*X18+1*X26+1*X39+1*X64) = +S76<<0 +S24<<0
wire sub_exp183;
assign sub_exp183 = sub_exp76 ^ sub_exp24;

// S184: (+1*X24+1*X41+1*X48+1*X50+1*X56) = +S182<<0 +S86<<0
wire sub_exp184;
assign sub_exp184 = sub_exp182 ^ sub_exp86;

// S185: (+1*X2+1*X10+1*X18+1*X26+1*X39+1*X49+1*X64) = +S112<<0 +S183<<0
wire sub_exp185;
assign sub_exp185 = sub_exp112 ^ sub_exp183;

// O2: (+1*X2+1*X10+1*X18+1*X24+1*X26+1*X39+1*X41+1*X48+1*X49+1*X50+1*X56+1*X64) = +S184<<0 +S185<<0
assign mds_out0[1] = sub_exp184 ^ sub_exp185;

// S186: (+1*X40+1*X42) = +X40<<0 +X42<<0
wire sub_exp186;
assign sub_exp186 = mds_in4[7] ^ mds_in5[1];

// S187: (+1*X40+1*X42+1*X51) = +S186<<0 +X51<<0
wire sub_exp187;
assign sub_exp187 = sub_exp186 ^ mds_in6[2];

// S188: (+1*X17+1*X40+1*X41+1*X42+1*X51) = +S187<<0 +S75<<0
wire sub_exp188;
assign sub_exp188 = sub_exp187 ^ sub_exp75;

// S189: (+1*X3+1*X11+1*X19+1*X27+1*X49+1*X50+1*X57) = +S126<<0 +S88<<0
wire sub_exp189;
assign sub_exp189 = sub_exp126 ^ sub_exp88;

// S190: (+1*X3+1*X11+1*X17+1*X19+1*X27+1*X40+1*X41+1*X42+1*X49+1*X50+1*X51+1*X57) = +S188<<0 +S189<<0
wire sub_exp190;
assign sub_exp190 = sub_exp188 ^ sub_exp189;

// O3: (+1*X3+1*X11+1*X17+1*X19+1*X23+1*X27+1*X38+1*X40+1*X41+1*X42+1*X47+1*X48+1*X49+1*X50+1*X51+1*X55+1*X56+1*X57+1*X63) = +S190<<0 +S125<<0
assign mds_out0[2] = sub_exp190 ^ sub_exp125;

// S191: (+1*X20+1*X28+1*X43) = +X43<<0 +S28<<0
wire sub_exp191;
assign sub_exp191 = mds_in5[2] ^ sub_exp28;

// S192: (+1*X18+1*X39+1*X42+1*X64) = +S76<<0 +S55<<0
wire sub_exp192;
assign sub_exp192 = sub_exp76 ^ sub_exp55;

// S193: (+1*X18+1*X20+1*X28+1*X39+1*X42+1*X43+1*X64) = +S191<<0 +S192<<0
wire sub_exp193;
assign sub_exp193 = sub_exp191 ^ sub_exp192;

// S194: (+1*X4+1*X12+1*X23+1*X47+1*X51+1*X55+1*X63) = +S89<<0 +S74<<0
wire sub_exp194;
assign sub_exp194 = sub_exp89 ^ sub_exp74;

// S195: (+1*X24+1*X33+1*X38+1*X50+1*X52+1*X58) = +S98<<0 +S95<<0
wire sub_exp195;
assign sub_exp195 = sub_exp98 ^ sub_exp95;

// S196: (+1*X4+1*X12+1*X18+1*X20+1*X23+1*X28+1*X39+1*X42+1*X43+1*X47+1*X51+1*X55+1*X63+1*X64) = +S193<<0 +S194<<0
wire sub_exp196;
assign sub_exp196 = sub_exp193 ^ sub_exp194;

// O4: (+1*X4+1*X12+1*X18+1*X20+1*X23+1*X24+1*X28+1*X33+1*X38+1*X39+1*X42+1*X43+1*X47+1*X50+1*X51+1*X52+1*X55+1*X58+1*X63+1*X64) = +S196<<0 +S195<<0
assign mds_out0[3] = sub_exp196 ^ sub_exp195;

// S197: (+1*X40+1*X44+1*X64) = +X44<<0 +S8<<0
wire sub_exp197;
assign sub_exp197 = mds_in5[3] ^ sub_exp8;

// S198: (+1*X5+1*X13+1*X19+1*X43) = +S69<<0 +S36<<0
wire sub_exp198;
assign sub_exp198 = sub_exp69 ^ sub_exp36;

// S199: (+1*X39+1*X40+1*X44+1*X53+1*X64) = +S197<<0 +S128<<0
wire sub_exp199;
assign sub_exp199 = sub_exp197 ^ sub_exp128;

// S200: (+1*X5+1*X13+1*X19+1*X24+1*X38+1*X43+1*X52) = +S98<<0 +S198<<0
wire sub_exp200;
assign sub_exp200 = sub_exp98 ^ sub_exp198;

// S201: (+1*X34+1*X39+1*X40+1*X44+1*X51+1*X53+1*X59+1*X64) = +S199<<0 +S114<<0
wire sub_exp201;
assign sub_exp201 = sub_exp199 ^ sub_exp114;

// S202: (+1*X5+1*X13+1*X19+1*X24+1*X34+1*X38+1*X39+1*X40+1*X43+1*X44+1*X51+1*X52+1*X53+1*X59+1*X64) = +S201<<0 +S200<<0
wire sub_exp202;
assign sub_exp202 = sub_exp201 ^ sub_exp200;

// O5: (+1*X5+1*X13+1*X19+1*X21+1*X23+1*X24+1*X29+1*X34+1*X38+1*X39+1*X40+1*X43+1*X44+1*X47+1*X51+1*X52+1*X53+1*X55+1*X59+1*X63+1*X64) = +S202<<0 +S129<<0
assign mds_out0[4] = sub_exp202 ^ sub_exp129;

// S203: (+1*X20+1*X44+1*X45+1*X54) = +S106<<0 +S127<<0
wire sub_exp203;
assign sub_exp203 = sub_exp106 ^ sub_exp127;

// S204: (+1*X20+1*X39+1*X44+1*X45+1*X53+1*X54) = +S203<<0 +S128<<0
wire sub_exp204;
assign sub_exp204 = sub_exp203 ^ sub_exp128;

// S205: (+1*X24+1*X30+1*X35+1*X40+1*X52+1*X60+1*X64) = +S107<<0 +S99<<0
wire sub_exp205;
assign sub_exp205 = sub_exp107 ^ sub_exp99;

// S206: (+1*X6+1*X14+1*X22+1*X24+1*X30+1*X35+1*X40+1*X48+1*X52+1*X56+1*X60+1*X64) = +S56<<0 +S205<<0
wire sub_exp206;
assign sub_exp206 = sub_exp56 ^ sub_exp205;

// O6: (+1*X6+1*X14+1*X20+1*X22+1*X24+1*X30+1*X35+1*X39+1*X40+1*X44+1*X45+1*X48+1*X52+1*X53+1*X54+1*X56+1*X60+1*X64) = +S206<<0 +S204<<0
assign mds_out0[5] = sub_exp206 ^ sub_exp204;

// S207: (+1*X40+1*X46) = +X40<<0 +X46<<0
wire sub_exp207;
assign sub_exp207 = mds_in4[7] ^ mds_in5[5];

// S208: (+1*X40+1*X45+1*X46+1*X54) = +S207<<0 +S106<<0
wire sub_exp208;
assign sub_exp208 = sub_exp207 ^ sub_exp106;

// S209: (+1*X36+1*X40+1*X45+1*X46+1*X53+1*X54+1*X61) = +S208<<0 +S153<<0
wire sub_exp209;
assign sub_exp209 = sub_exp208 ^ sub_exp153;

// O7: (+1*X7+1*X15+1*X21+1*X23+1*X31+1*X36+1*X40+1*X45+1*X46+1*X53+1*X54+1*X55+1*X61) = +S209<<0 +S155<<0
assign mds_out0[6] = sub_exp209 ^ sub_exp155;

// S210: (+1*X37+1*X46) = +X37<<0 +X46<<0
wire sub_exp210;
assign sub_exp210 = mds_in4[4] ^ mds_in5[5];

// S211: (+1*X37+1*X46+1*X47+1*X55) = +S210<<0 +S1<<0
wire sub_exp211;
assign sub_exp211 = sub_exp210 ^ sub_exp1;

// S212: (+1*X16+1*X24+1*X37+1*X46+1*X47+1*X54+1*X55) = +S211<<0 +S15<<0
wire sub_exp212;
assign sub_exp212 = sub_exp211 ^ sub_exp15;

// O8: (+1*X8+1*X16+1*X22+1*X24+1*X32+1*X37+1*X46+1*X47+1*X54+1*X55+1*X56+1*X62) = +S212<<0 +S132<<0
assign mds_out0[7] = sub_exp212 ^ sub_exp132;

// S213: (+1*X9+1*X46+1*X56) = +X46<<0 +S90<<0
wire sub_exp213;
assign sub_exp213 = mds_in5[5] ^ sub_exp90;

// S214: (+1*X9+1*X17+1*X25+1*X33+1*X46+1*X56+1*X57) = +S213<<0 +S117<<0
wire sub_exp214;
assign sub_exp214 = sub_exp213 ^ sub_exp117;

// O9: (+1*X7+1*X9+1*X17+1*X25+1*X31+1*X33+1*X46+1*X55+1*X56+1*X57+1*X63+1*X64) = +S214<<0 +S116<<0
assign mds_out1[0] = sub_exp214 ^ sub_exp116;

// S215: (+1*X10+1*X47) = +X10<<0 +X47<<0
wire sub_exp215;
assign sub_exp215 = mds_in1[1] ^ mds_in5[6];

// S216: (+1*X56+1*X64) = +X64<<0 +X56<<0
wire sub_exp216;
assign sub_exp216 = mds_in7[7] ^ mds_in6[7];

// S217: (+1*X10+1*X47+1*X56+1*X64) = +S215<<0 +S216<<0
wire sub_exp217;
assign sub_exp217 = sub_exp215 ^ sub_exp216;

// S218: (+1*X8+1*X32+1*X49+1*X57) = +S21<<0 +S6<<0
wire sub_exp218;
assign sub_exp218 = sub_exp21 ^ sub_exp6;

// S219: (+1*X8+1*X10+1*X32+1*X47+1*X49+1*X56+1*X57+1*X64) = +S217<<0 +S218<<0
wire sub_exp219;
assign sub_exp219 = sub_exp217 ^ sub_exp218;

// O10: (+1*X8+1*X10+1*X18+1*X26+1*X32+1*X34+1*X47+1*X49+1*X56+1*X57+1*X58+1*X64) = +S219<<0 +S101<<0
assign mds_out1[1] = sub_exp219 ^ sub_exp101;

// S220: (+1*X48+1*X50+1*X56+1*X58) = +S5<<0 +S25<<0
wire sub_exp220;
assign sub_exp220 = sub_exp5 ^ sub_exp25;

// S221: (+1*X1+1*X25+1*X35+1*X59) = +S81<<0 +S59<<0
wire sub_exp221;
assign sub_exp221 = sub_exp81 ^ sub_exp59;

// S222: (+1*X11+1*X46+1*X48+1*X50+1*X56+1*X58) = +S220<<0 +S115<<0
wire sub_exp222;
assign sub_exp222 = sub_exp220 ^ sub_exp115;

// S223: (+1*X1+1*X19+1*X25+1*X27+1*X35+1*X49+1*X57+1*X59) = +S126<<0 +S221<<0
wire sub_exp223;
assign sub_exp223 = sub_exp126 ^ sub_exp221;

// S224: (+1*X1+1*X11+1*X19+1*X25+1*X27+1*X35+1*X46+1*X48+1*X49+1*X50+1*X56+1*X57+1*X58+1*X59) = +S222<<0 +S223<<0
wire sub_exp224;
assign sub_exp224 = sub_exp222 ^ sub_exp223;

// O11: (+1*X1+1*X7+1*X11+1*X19+1*X25+1*X27+1*X31+1*X35+1*X46+1*X48+1*X49+1*X50+1*X55+1*X56+1*X57+1*X58+1*X59+1*X63+1*X64) = +S224<<0 +S116<<0
assign mds_out1[2] = sub_exp224 ^ sub_exp116;

// S225: (+1*X41+1*X47+1*X55) = +X41<<0 +S1<<0
wire sub_exp225;
assign sub_exp225 = mds_in5[0] ^ sub_exp1;

// S226: (+1*X2+1*X26+1*X41+1*X47+1*X50+1*X55+1*X58) = +S225<<0 +S96<<0
wire sub_exp226;
assign sub_exp226 = sub_exp225 ^ sub_exp96;

// S227: (+1*X8+1*X12+1*X20+1*X28+1*X32+1*X36+1*X60) = +S133<<0 +S97<<0
wire sub_exp227;
assign sub_exp227 = sub_exp133 ^ sub_exp97;

// S228: (+1*X2+1*X8+1*X12+1*X20+1*X26+1*X28+1*X32+1*X36+1*X41+1*X47+1*X50+1*X55+1*X58+1*X60) = +S226<<0 +S227<<0
wire sub_exp228;
assign sub_exp228 = sub_exp226 ^ sub_exp227;

// O12: (+1*X2+1*X7+1*X8+1*X12+1*X20+1*X26+1*X28+1*X31+1*X32+1*X36+1*X41+1*X46+1*X47+1*X50+1*X51+1*X55+1*X58+1*X59+1*X60+1*X63) = +S228<<0 +S135<<0
assign mds_out1[3] = sub_exp228 ^ sub_exp135;

// S229: (+1*X13+1*X42) = +X13<<0 +X42<<0
wire sub_exp229;
assign sub_exp229 = mds_in1[4] ^ mds_in5[1];

// S230: (+1*X13+1*X42+1*X48) = +S229<<0 +X48<<0
wire sub_exp230;
assign sub_exp230 = sub_exp229 ^ mds_in5[7];

// S231: (+1*X8+1*X32+1*X52+1*X60) = +S29<<0 +S6<<0
wire sub_exp231;
assign sub_exp231 = sub_exp29 ^ sub_exp6;

// S232: (+1*X3+1*X13+1*X27+1*X42+1*X48) = +S230<<0 +S61<<0
wire sub_exp232;
assign sub_exp232 = sub_exp230 ^ sub_exp61;

// S233: (+1*X3+1*X8+1*X13+1*X27+1*X32+1*X42+1*X48+1*X52+1*X60) = +S232<<0 +S231<<0
wire sub_exp233;
assign sub_exp233 = sub_exp232 ^ sub_exp231;

// S234: (+1*X7+1*X21+1*X29+1*X31+1*X37+1*X46+1*X47+1*X51+1*X55+1*X59+1*X61+1*X63) = +S136<<0 +S135<<0
wire sub_exp234;
assign sub_exp234 = sub_exp136 ^ sub_exp135;

// O13: (+1*X3+1*X7+1*X8+1*X13+1*X21+1*X27+1*X29+1*X31+1*X32+1*X37+1*X42+1*X46+1*X47+1*X48+1*X51+1*X52+1*X55+1*X59+1*X60+1*X61+1*X63) = +S233<<0 +S234<<0
assign mds_out1[4] = sub_exp233 ^ sub_exp234;

// S235: (+1*X43+1*X47) = +X43<<0 +X47<<0
wire sub_exp235;
assign sub_exp235 = mds_in5[2] ^ mds_in5[6];

// S236: (+1*X43+1*X47+1*X53+1*X61) = +S235<<0 +S37<<0
wire sub_exp236;
assign sub_exp236 = sub_exp235 ^ sub_exp37;

// S237: (+1*X4+1*X28+1*X43+1*X47+1*X52+1*X53+1*X60+1*X61) = +S236<<0 +S100<<0
wire sub_exp237;
assign sub_exp237 = sub_exp236 ^ sub_exp100;

// S238: (+1*X4+1*X14+1*X22+1*X28+1*X43+1*X47+1*X48+1*X52+1*X53+1*X56+1*X60+1*X61) = +S237<<0 +S146<<0
wire sub_exp238;
assign sub_exp238 = sub_exp237 ^ sub_exp146;

// O14: (+1*X4+1*X8+1*X14+1*X22+1*X28+1*X30+1*X32+1*X38+1*X43+1*X47+1*X48+1*X52+1*X53+1*X56+1*X60+1*X61+1*X62+1*X64) = +S238<<0 +S148<<0
assign mds_out1[5] = sub_exp238 ^ sub_exp148;

// S239: (+1*X31+1*X39+1*X54) = +X54<<0 +S4<<0
wire sub_exp239;
assign sub_exp239 = mds_in6[5] ^ sub_exp4;

// S240: (+1*X31+1*X39+1*X44+1*X54+1*X63) = +S239<<0 +S72<<0
wire sub_exp240;
assign sub_exp240 = sub_exp239 ^ sub_exp72;

// S241: (+1*X5+1*X15+1*X23+1*X29+1*X48+1*X53+1*X61+1*X62) = +S105<<0 +S62<<0
wire sub_exp241;
assign sub_exp241 = sub_exp105 ^ sub_exp62;

// O15: (+1*X5+1*X15+1*X23+1*X29+1*X31+1*X39+1*X44+1*X48+1*X53+1*X54+1*X61+1*X62+1*X63) = +S240<<0 +S241<<0
assign mds_out1[6] = sub_exp240 ^ sub_exp241;

// S242: (+1*X32+1*X55) = +X32<<0 +X55<<0
wire sub_exp242;
assign sub_exp242 = mds_in3[7] ^ mds_in6[6];

// S243: (+1*X32+1*X45+1*X55+1*X63) = +S242<<0 +S103<<0
wire sub_exp243;
assign sub_exp243 = sub_exp242 ^ sub_exp103;

// O16: (+1*X6+1*X16+1*X24+1*X30+1*X32+1*X40+1*X45+1*X54+1*X55+1*X62+1*X63+1*X64) = +S243<<0 +S176<<0
assign mds_out1[7] = sub_exp243 ^ sub_exp176;

// S244: (+1*X1+1*X33+1*X41) = +X1<<0 +S22<<0
wire sub_exp244;
assign sub_exp244 = mds_in0[0] ^ sub_exp22;

// S245: (+1*X1+1*X8+1*X17+1*X25+1*X33+1*X41) = +S244<<0 +S118<<0
wire sub_exp245;
assign sub_exp245 = sub_exp244 ^ sub_exp118;

// O17: (+1*X1+1*X7+1*X8+1*X15+1*X17+1*X25+1*X33+1*X39+1*X41+1*X54+1*X63+1*X64) = +S245<<0 +S119<<0
assign mds_out2[0] = sub_exp245 ^ sub_exp119;

// S246: (+1*X2+1*X57) = +X2<<0 +X57<<0
wire sub_exp246;
assign sub_exp246 = mds_in0[1] ^ mds_in7[0];

// S247: (+1*X2+1*X40+1*X57+1*X64) = +S246<<0 +S8<<0
wire sub_exp247;
assign sub_exp247 = sub_exp246 ^ sub_exp8;

// S248: (+1*X2+1*X34+1*X40+1*X42+1*X57+1*X64) = +S247<<0 +S26<<0
wire sub_exp248;
assign sub_exp248 = sub_exp247 ^ sub_exp26;

// S249: (+1*X1+1*X8+1*X16+1*X18+1*X26+1*X55) = +S137<<0 +S102<<0
wire sub_exp249;
assign sub_exp249 = sub_exp137 ^ sub_exp102;

// O18: (+1*X1+1*X2+1*X8+1*X16+1*X18+1*X26+1*X34+1*X40+1*X42+1*X55+1*X57+1*X64) = +S248<<0 +S249<<0
assign mds_out2[1] = sub_exp248 ^ sub_exp249;

// S250: (+1*X3+1*X8) = +X3<<0 +X8<<0
wire sub_exp250;
assign sub_exp250 = mds_in0[2] ^ mds_in0[7];

// S251: (+1*X3+1*X8+1*X58) = +S250<<0 +X58<<0
wire sub_exp251;
assign sub_exp251 = sub_exp250 ^ mds_in7[1];

// S252: (+1*X1+1*X9+1*X33+1*X57) = +S57<<0 +S19<<0
wire sub_exp252;
assign sub_exp252 = sub_exp57 ^ sub_exp19;

// S253: (+1*X1+1*X3+1*X8+1*X9+1*X33+1*X57+1*X58) = +S251<<0 +S252<<0
wire sub_exp253;
assign sub_exp253 = sub_exp251 ^ sub_exp252;

// S254: (+1*X2+1*X19+1*X27+1*X35+1*X43+1*X56) = +S104<<0 +S63<<0
wire sub_exp254;
assign sub_exp254 = sub_exp104 ^ sub_exp63;

// S255: (+1*X1+1*X2+1*X3+1*X8+1*X9+1*X19+1*X27+1*X33+1*X35+1*X43+1*X56+1*X57+1*X58) = +S253<<0 +S254<<0
wire sub_exp255;
assign sub_exp255 = sub_exp253 ^ sub_exp254;

// O19: (+1*X1+1*X2+1*X3+1*X7+1*X8+1*X9+1*X15+1*X19+1*X27+1*X33+1*X35+1*X39+1*X43+1*X54+1*X56+1*X57+1*X58+1*X63+1*X64) = +S255<<0 +S119<<0
assign mds_out2[2] = sub_exp255 ^ sub_exp119;

// S256: (+1*X36+1*X44+1*X59) = +X59<<0 +S30<<0
wire sub_exp256;
assign sub_exp256 = mds_in7[2] ^ sub_exp30;

// S257: (+1*X34+1*X36+1*X44+1*X58+1*X59) = +S256<<0 +S58<<0
wire sub_exp257;
assign sub_exp257 = sub_exp256 ^ sub_exp58;

// S258: (+1*X3+1*X7+1*X20+1*X28+1*X55+1*X63) = +S91<<0 +S83<<0
wire sub_exp258;
assign sub_exp258 = sub_exp91 ^ sub_exp83;

// S259: (+1*X2+1*X10+1*X34+1*X36+1*X44+1*X49+1*X58+1*X59) = +S257<<0 +S112<<0
wire sub_exp259;
assign sub_exp259 = sub_exp257 ^ sub_exp112;

// S260: (+1*X2+1*X3+1*X7+1*X10+1*X20+1*X28+1*X34+1*X36+1*X44+1*X49+1*X55+1*X58+1*X59+1*X63) = +S259<<0 +S258<<0
wire sub_exp260;
assign sub_exp260 = sub_exp259 ^ sub_exp258;

// O20: (+1*X2+1*X3+1*X4+1*X7+1*X10+1*X15+1*X16+1*X20+1*X28+1*X34+1*X36+1*X39+1*X40+1*X44+1*X49+1*X54+1*X55+1*X58+1*X59+1*X63) = +S260<<0 +S160<<0
assign mds_out2[3] = sub_exp260 ^ sub_exp160;

// S261: (+1*X21+1*X56) = +X21<<0 +X56<<0
wire sub_exp261;
assign sub_exp261 = mds_in2[4] ^ mds_in6[7];

// S262: (+1*X21+1*X56+1*X60) = +S261<<0 +X60<<0
wire sub_exp262;
assign sub_exp262 = sub_exp261 ^ mds_in7[3];

// S263: (+1*X21+1*X35+1*X56+1*X59+1*X60) = +S262<<0 +S59<<0
wire sub_exp263;
assign sub_exp263 = sub_exp262 ^ sub_exp59;

// S264: (+1*X3+1*X11+1*X21+1*X35+1*X50+1*X56+1*X59+1*X60) = +S263<<0 +S88<<0
wire sub_exp264;
assign sub_exp264 = sub_exp263 ^ sub_exp88;

// S265: (+1*X3+1*X5+1*X7+1*X11+1*X21+1*X29+1*X35+1*X37+1*X45+1*X50+1*X55+1*X56+1*X59+1*X60+1*X63) = +S264<<0 +S158<<0
wire sub_exp265;
assign sub_exp265 = sub_exp264 ^ sub_exp158;

// O21: (+1*X3+1*X4+1*X5+1*X7+1*X11+1*X15+1*X16+1*X21+1*X29+1*X35+1*X37+1*X39+1*X40+1*X45+1*X50+1*X54+1*X55+1*X56+1*X59+1*X60+1*X63) = +S265<<0 +S160<<0
assign mds_out2[4] = sub_exp265 ^ sub_exp160;

// S266: (+1*X5+1*X22) = +X5<<0 +X22<<0
wire sub_exp266;
assign sub_exp266 = mds_in0[4] ^ mds_in2[5];

// S267: (+1*X5+1*X22+1*X61) = +S266<<0 +X61<<0
wire sub_exp267;
assign sub_exp267 = sub_exp266 ^ mds_in7[4];

// S268: (+1*X5+1*X22+1*X36+1*X60+1*X61) = +S267<<0 +S82<<0
wire sub_exp268;
assign sub_exp268 = sub_exp267 ^ sub_exp82;

// S269: (+1*X4+1*X8+1*X12+1*X16+1*X51+1*X55) = +S137<<0 +S89<<0
wire sub_exp269;
assign sub_exp269 = sub_exp137 ^ sub_exp89;

// S270: (+1*X4+1*X5+1*X8+1*X12+1*X16+1*X22+1*X36+1*X51+1*X55+1*X60+1*X61) = +S268<<0 +S269<<0
wire sub_exp270;
assign sub_exp270 = sub_exp268 ^ sub_exp269;

// O22: (+1*X4+1*X5+1*X6+1*X8+1*X12+1*X16+1*X22+1*X30+1*X36+1*X38+1*X40+1*X46+1*X51+1*X55+1*X56+1*X60+1*X61+1*X64) = +S270<<0 +S139<<0
assign mds_out2[5] = sub_exp270 ^ sub_exp139;

// S271: (+1*X52+1*X62) = +X52<<0 +X62<<0
wire sub_exp271;
assign sub_exp271 = mds_in6[3] ^ mds_in7[5];

// S272: (+1*X6+1*X52+1*X56+1*X62) = +S271<<0 +S42<<0
wire sub_exp272;
assign sub_exp272 = sub_exp271 ^ sub_exp42;

// S273: (+1*X6+1*X37+1*X52+1*X56+1*X61+1*X62) = +S272<<0 +S70<<0
wire sub_exp273;
assign sub_exp273 = sub_exp272 ^ sub_exp70;

// S274: (+1*X5+1*X7+1*X13+1*X23+1*X31+1*X39+1*X47) = +S151<<0 +S47<<0
wire sub_exp274;
assign sub_exp274 = sub_exp151 ^ sub_exp47;

// O23: (+1*X5+1*X6+1*X7+1*X13+1*X23+1*X31+1*X37+1*X39+1*X47+1*X52+1*X56+1*X61+1*X62) = +S273<<0 +S274<<0
assign mds_out2[6] = sub_exp273 ^ sub_exp274;

// S275: (+1*X7+1*X53+1*X63) = +X53<<0 +S2<<0
wire sub_exp275;
assign sub_exp275 = mds_in6[4] ^ sub_exp2;

// S276: (+1*X7+1*X40+1*X48+1*X53+1*X63) = +S275<<0 +S45<<0
wire sub_exp276;
assign sub_exp276 = sub_exp275 ^ sub_exp45;

// O24: (+1*X6+1*X7+1*X8+1*X14+1*X24+1*X32+1*X38+1*X40+1*X48+1*X53+1*X62+1*X63) = +S276<<0 +S162<<0
assign mds_out2[7] = sub_exp276 ^ sub_exp162;

// S277: (+1*X9+1*X25+1*X33+1*X41+1*X49) = +X25<<0 +S92<<0
wire sub_exp277;
assign sub_exp277 = mds_in3[0] ^ sub_exp92;

// O25: (+1*X7+1*X8+1*X9+1*X15+1*X16+1*X23+1*X25+1*X33+1*X41+1*X47+1*X49+1*X62) = +S277<<0 +S141<<0
assign mds_out3[0] = sub_exp277 ^ sub_exp141;

// S278: (+1*X26+1*X63) = +X26<<0 +X63<<0
wire sub_exp278;
assign sub_exp278 = mds_in3[1] ^ mds_in7[6];

// S279: (+1*X16+1*X24+1*X26+1*X63) = +S278<<0 +S7<<0
wire sub_exp279;
assign sub_exp279 = sub_exp278 ^ sub_exp7;

// S280: (+1*X1+1*X8+1*X9+1*X48) = +S44<<0 +S19<<0
wire sub_exp280;
assign sub_exp280 = sub_exp44 ^ sub_exp19;

// S281: (+1*X1+1*X8+1*X9+1*X16+1*X24+1*X26+1*X48+1*X63) = +S279<<0 +S280<<0
wire sub_exp281;
assign sub_exp281 = sub_exp279 ^ sub_exp280;

// O26: (+1*X1+1*X8+1*X9+1*X10+1*X16+1*X24+1*X26+1*X34+1*X42+1*X48+1*X50+1*X63) = +S281<<0 +S130<<0
assign mds_out3[1] = sub_exp281 ^ sub_exp130;

// S282: (+1*X27+1*X64) = +X27<<0 +X64<<0
wire sub_exp282;
assign sub_exp282 = mds_in3[2] ^ mds_in7[7];

// S283: (+1*X2+1*X10+1*X27+1*X64) = +S282<<0 +S23<<0
wire sub_exp283;
assign sub_exp283 = sub_exp282 ^ sub_exp23;

// S284: (+1*X11+1*X35+1*X43+1*X51) = +S66<<0 +S34<<0
wire sub_exp284;
assign sub_exp284 = sub_exp66 ^ sub_exp34;

// S285: (+1*X2+1*X10+1*X11+1*X27+1*X35+1*X43+1*X51+1*X64) = +S283<<0 +S284<<0
wire sub_exp285;
assign sub_exp285 = sub_exp283 ^ sub_exp284;

// S286: (+1*X1+1*X2+1*X9+1*X10+1*X11+1*X17+1*X27+1*X35+1*X41+1*X43+1*X51+1*X64) = +S285<<0 +S87<<0
wire sub_exp286;
assign sub_exp286 = sub_exp285 ^ sub_exp87;

// O27: (+1*X1+1*X2+1*X7+1*X8+1*X9+1*X10+1*X11+1*X15+1*X16+1*X17+1*X23+1*X27+1*X35+1*X41+1*X43+1*X47+1*X51+1*X62+1*X64) = +S286<<0 +S141<<0
assign mds_out3[2] = sub_exp286 ^ sub_exp141;

// S287: (+1*X12+1*X36+1*X44+1*X52+1*X57) = +X57<<0 +S109<<0
wire sub_exp287;
assign sub_exp287 = mds_in7[0] ^ sub_exp109;

// S288: (+1*X2+1*X7+1*X10+1*X18+1*X28+1*X42+1*X47+1*X63) = +S143<<0 +S111<<0
wire sub_exp288;
assign sub_exp288 = sub_exp143 ^ sub_exp111;

// S289: (+1*X2+1*X7+1*X10+1*X12+1*X18+1*X28+1*X36+1*X42+1*X44+1*X47+1*X52+1*X57+1*X63) = +S287<<0 +S288<<0
wire sub_exp289;
assign sub_exp289 = sub_exp287 ^ sub_exp288;

// O28: (+1*X2+1*X3+1*X7+1*X10+1*X11+1*X12+1*X15+1*X18+1*X23+1*X24+1*X28+1*X36+1*X42+1*X44+1*X47+1*X48+1*X52+1*X57+1*X62+1*X63) = +S289<<0 +S144<<0
assign mds_out3[3] = sub_exp289 ^ sub_exp144;

// S290: (+1*X4+1*X12+1*X58) = +X58<<0 +S27<<0
wire sub_exp290;
assign sub_exp290 = mds_in7[1] ^ sub_exp27;

// S291: (+1*X19+1*X37+1*X43+1*X45) = +S69<<0 +S38<<0
wire sub_exp291;
assign sub_exp291 = sub_exp69 ^ sub_exp38;

// S292: (+1*X13+1*X29+1*X47+1*X53) = +S145<<0 +S73<<0
wire sub_exp292;
assign sub_exp292 = sub_exp145 ^ sub_exp73;

// S293: (+1*X4+1*X12+1*X19+1*X37+1*X43+1*X45+1*X58) = +S290<<0 +S291<<0
wire sub_exp293;
assign sub_exp293 = sub_exp290 ^ sub_exp291;

// S294: (+1*X7+1*X13+1*X29+1*X47+1*X53+1*X63+1*X64) = +S292<<0 +S48<<0
wire sub_exp294;
assign sub_exp294 = sub_exp292 ^ sub_exp48;

// S295: (+1*X4+1*X7+1*X12+1*X13+1*X19+1*X29+1*X37+1*X43+1*X45+1*X47+1*X53+1*X58+1*X63+1*X64) = +S293<<0 +S294<<0
wire sub_exp295;
assign sub_exp295 = sub_exp293 ^ sub_exp294;

// O29: (+1*X3+1*X4+1*X7+1*X11+1*X12+1*X13+1*X15+1*X19+1*X23+1*X24+1*X29+1*X37+1*X43+1*X45+1*X47+1*X48+1*X53+1*X58+1*X62+1*X63+1*X64) = +S295<<0 +S144<<0
assign mds_out3[4] = sub_exp295 ^ sub_exp144;

// S296: (+1*X20+1*X59) = +X20<<0 +X59<<0
wire sub_exp296;
assign sub_exp296 = mds_in2[3] ^ mds_in7[2];

// S297: (+1*X4+1*X12+1*X20+1*X59) = +S296<<0 +S27<<0
wire sub_exp297;
assign sub_exp297 = sub_exp296 ^ sub_exp27;

// S298: (+1*X5+1*X13+1*X44+1*X63) = +S72<<0 +S36<<0
wire sub_exp298;
assign sub_exp298 = sub_exp72 ^ sub_exp36;

// S299: (+1*X4+1*X12+1*X20+1*X30+1*X59+1*X64) = +S297<<0 +S77<<0
wire sub_exp299;
assign sub_exp299 = sub_exp297 ^ sub_exp77;

// S300: (+1*X4+1*X5+1*X12+1*X13+1*X20+1*X30+1*X44+1*X59+1*X63+1*X64) = +S299<<0 +S298<<0
wire sub_exp300;
assign sub_exp300 = sub_exp299 ^ sub_exp298;

// O30: (+1*X4+1*X5+1*X8+1*X12+1*X13+1*X14+1*X16+1*X20+1*X24+1*X30+1*X38+1*X44+1*X46+1*X48+1*X54+1*X59+1*X63+1*X64) = +S300<<0 +S150<<0
assign mds_out3[5] = sub_exp300 ^ sub_exp150;

// S301: (+1*X6+1*X14+1*X64) = +X64<<0 +S17<<0
wire sub_exp301;
assign sub_exp301 = mds_in7[7] ^ sub_exp17;

// S302: (+1*X6+1*X14+1*X15+1*X31+1*X39+1*X60+1*X64) = +S301<<0 +S171<<0
wire sub_exp302;
assign sub_exp302 = sub_exp301 ^ sub_exp171;

// O31: (+1*X5+1*X6+1*X13+1*X14+1*X15+1*X21+1*X31+1*X39+1*X45+1*X47+1*X55+1*X60+1*X64) = +S302<<0 +S173<<0
assign mds_out3[6] = sub_exp302 ^ sub_exp173;

// S303: (+1*X7+1*X46) = +X7<<0 +X46<<0
wire sub_exp303;
assign sub_exp303 = mds_in0[6] ^ mds_in5[5];

// S304: (+1*X7+1*X15+1*X32+1*X46+1*X61) = +S303<<0 +S93<<0
wire sub_exp304;
assign sub_exp304 = sub_exp303 ^ sub_exp93;

// O32: (+1*X6+1*X7+1*X14+1*X15+1*X16+1*X22+1*X32+1*X40+1*X46+1*X48+1*X56+1*X61) = +S304<<0 +S108<<0
assign mds_out3[7] = sub_exp304 ^ sub_exp108;

// S305: (+1*X33+1*X41+1*X49+1*X57) = +S21<<0 +S22<<0
wire sub_exp305;
assign sub_exp305 = sub_exp21 ^ sub_exp22;

// S306: (+1*X16+1*X17+1*X24+1*X33+1*X41+1*X49+1*X57) = +S305<<0 +S122<<0
wire sub_exp306;
assign sub_exp306 = sub_exp305 ^ sub_exp122;

// O33: (+1*X6+1*X15+1*X16+1*X17+1*X23+1*X24+1*X31+1*X33+1*X41+1*X49+1*X55+1*X57) = +S306<<0 +S121<<0
assign mds_out4[0] = sub_exp306 ^ sub_exp121;

// S307: (+1*X18+1*X50+1*X58) = +X18<<0 +S25<<0
wire sub_exp307;
assign sub_exp307 = mds_in2[1] ^ sub_exp25;

// S308: (+1*X9+1*X34+1*X42+1*X56) = +S90<<0 +S26<<0
wire sub_exp308;
assign sub_exp308 = sub_exp90 ^ sub_exp26;

// S309: (+1*X7+1*X18+1*X32+1*X50+1*X58) = +S307<<0 +S113<<0
wire sub_exp309;
assign sub_exp309 = sub_exp307 ^ sub_exp113;

// S310: (+1*X9+1*X16+1*X17+1*X24+1*X34+1*X42+1*X56) = +S122<<0 +S308<<0
wire sub_exp310;
assign sub_exp310 = sub_exp122 ^ sub_exp308;

// O34: (+1*X7+1*X9+1*X16+1*X17+1*X18+1*X24+1*X32+1*X34+1*X42+1*X50+1*X56+1*X58) = +S309<<0 +S310<<0
assign mds_out4[1] = sub_exp309 ^ sub_exp310;

// S311: (+1*X10+1*X19) = +X10<<0 +X19<<0
wire sub_exp311;
assign sub_exp311 = mds_in1[1] ^ mds_in2[2];

// S312: (+1*X9+1*X10+1*X19+1*X49) = +S311<<0 +S64<<0
wire sub_exp312;
assign sub_exp312 = sub_exp311 ^ sub_exp64;

// S313: (+1*X9+1*X10+1*X18+1*X19+1*X35+1*X43+1*X49) = +S312<<0 +S94<<0
wire sub_exp313;
assign sub_exp313 = sub_exp312 ^ sub_exp94;

// S314: (+1*X8+1*X16+1*X17+1*X24+1*X25+1*X51+1*X59) = +S120<<0 +S118<<0
wire sub_exp314;
assign sub_exp314 = sub_exp120 ^ sub_exp118;

// S315: (+1*X8+1*X9+1*X10+1*X16+1*X17+1*X18+1*X19+1*X24+1*X25+1*X35+1*X43+1*X49+1*X51+1*X59) = +S313<<0 +S314<<0
wire sub_exp315;
assign sub_exp315 = sub_exp313 ^ sub_exp314;

// O35: (+1*X6+1*X8+1*X9+1*X10+1*X15+1*X16+1*X17+1*X18+1*X19+1*X23+1*X24+1*X25+1*X31+1*X35+1*X43+1*X49+1*X51+1*X55+1*X59) = +S315<<0 +S121<<0
assign mds_out4[2] = sub_exp315 ^ sub_exp121;

// S316: (+1*X11+1*X52+1*X60) = +X11<<0 +S29<<0
wire sub_exp316;
assign sub_exp316 = mds_in1[2] ^ sub_exp29;

// S317: (+1*X7+1*X10+1*X32+1*X50) = +S113<<0 +S65<<0
wire sub_exp317;
assign sub_exp317 = sub_exp113 ^ sub_exp65;

// S318: (+1*X11+1*X15+1*X23+1*X31+1*X52+1*X55+1*X60) = +S316<<0 +S39<<0
wire sub_exp318;
assign sub_exp318 = sub_exp316 ^ sub_exp39;

// S319: (+1*X1+1*X7+1*X10+1*X18+1*X26+1*X32+1*X50) = +S102<<0 +S317<<0
wire sub_exp319;
assign sub_exp319 = sub_exp102 ^ sub_exp317;

// S320: (+1*X6+1*X19+1*X20+1*X36+1*X44+1*X56) = +S156<<0 +S110<<0
wire sub_exp320;
assign sub_exp320 = sub_exp156 ^ sub_exp110;

// S321: (+1*X1+1*X7+1*X10+1*X11+1*X15+1*X18+1*X23+1*X26+1*X31+1*X32+1*X50+1*X52+1*X55+1*X60) = +S318<<0 +S319<<0
wire sub_exp321;
assign sub_exp321 = sub_exp318 ^ sub_exp319;

// O36: (+1*X1+1*X6+1*X7+1*X10+1*X11+1*X15+1*X18+1*X19+1*X20+1*X23+1*X26+1*X31+1*X32+1*X36+1*X44+1*X50+1*X52+1*X55+1*X56+1*X60) = +S321<<0 +S320<<0
assign mds_out4[3] = sub_exp321 ^ sub_exp320;

// S322: (+1*X37+1*X45+1*X53+1*X61) = +S37<<0 +S38<<0
wire sub_exp322;
assign sub_exp322 = sub_exp37 ^ sub_exp38;

// S323: (+1*X11+1*X37+1*X45+1*X51+1*X53+1*X61) = +S322<<0 +S66<<0
wire sub_exp323;
assign sub_exp323 = sub_exp322 ^ sub_exp66;

// S324: (+1*X2+1*X8+1*X12+1*X19+1*X27+1*X32) = +S133<<0 +S104<<0
wire sub_exp324;
assign sub_exp324 = sub_exp133 ^ sub_exp104;

// S325: (+1*X6+1*X11+1*X20+1*X37+1*X45+1*X51+1*X53+1*X56+1*X61) = +S323<<0 +S156<<0
wire sub_exp325;
assign sub_exp325 = sub_exp323 ^ sub_exp156;

// S326: (+1*X2+1*X7+1*X8+1*X12+1*X15+1*X19+1*X21+1*X23+1*X27+1*X31+1*X32+1*X55) = +S155<<0 +S324<<0
wire sub_exp326;
assign sub_exp326 = sub_exp155 ^ sub_exp324;

// O37: (+1*X2+1*X6+1*X7+1*X8+1*X11+1*X12+1*X15+1*X19+1*X20+1*X21+1*X23+1*X27+1*X31+1*X32+1*X37+1*X45+1*X51+1*X53+1*X55+1*X56+1*X61) = +S325<<0 +S326<<0
assign mds_out4[4] = sub_exp325 ^ sub_exp326;

// S327: (+1*X7+1*X13+1*X21) = +X13<<0 +S80<<0
wire sub_exp327;
assign sub_exp327 = mds_in1[4] ^ sub_exp80;

// S328: (+1*X7+1*X12+1*X13+1*X21+1*X52) = +S327<<0 +S84<<0
wire sub_exp328;
assign sub_exp328 = sub_exp327 ^ sub_exp84;

// S329: (+1*X3+1*X7+1*X12+1*X13+1*X20+1*X21+1*X28+1*X52) = +S328<<0 +S91<<0
wire sub_exp329;
assign sub_exp329 = sub_exp328 ^ sub_exp91;

// S330: (+1*X3+1*X7+1*X12+1*X13+1*X16+1*X20+1*X21+1*X24+1*X28+1*X38+1*X46+1*X52+1*X54) = +S329<<0 +S68<<0
wire sub_exp330;
assign sub_exp330 = sub_exp329 ^ sub_exp68;

// O38: (+1*X3+1*X7+1*X8+1*X12+1*X13+1*X16+1*X20+1*X21+1*X22+1*X24+1*X28+1*X32+1*X38+1*X46+1*X52+1*X54+1*X56+1*X62) = +S330<<0 +S132<<0
assign mds_out4[5] = sub_exp330 ^ sub_exp132;

// S331: (+1*X4+1*X8) = +X4<<0 +X8<<0
wire sub_exp331;
assign sub_exp331 = mds_in0[3] ^ mds_in0[7];

// S332: (+1*X14+1*X22) = +X22<<0 +X14<<0
wire sub_exp332;
assign sub_exp332 = mds_in2[5] ^ mds_in1[5];

// S333: (+1*X4+1*X8+1*X39) = +S331<<0 +X39<<0
wire sub_exp333;
assign sub_exp333 = sub_exp331 ^ mds_in4[6];

// S334: (+1*X13+1*X14+1*X22+1*X53) = +S73<<0 +S332<<0
wire sub_exp334;
assign sub_exp334 = sub_exp73 ^ sub_exp332;

// S335: (+1*X4+1*X8+1*X13+1*X14+1*X22+1*X39+1*X53) = +S333<<0 +S334<<0
wire sub_exp335;
assign sub_exp335 = sub_exp333 ^ sub_exp334;

// O39: (+1*X4+1*X8+1*X13+1*X14+1*X21+1*X22+1*X23+1*X29+1*X39+1*X47+1*X53+1*X55+1*X63) = +S335<<0 +S129<<0
assign mds_out4[6] = sub_exp335 ^ sub_exp129;

// S336: (+1*X5+1*X54) = +X5<<0 +X54<<0
wire sub_exp336;
assign sub_exp336 = mds_in0[4] ^ mds_in6[5];

// S337: (+1*X5+1*X15+1*X23+1*X54) = +S336<<0 +S3<<0
wire sub_exp337;
assign sub_exp337 = sub_exp336 ^ sub_exp3;

// S338: (+1*X5+1*X15+1*X23+1*X24+1*X30+1*X40+1*X54+1*X64) = +S337<<0 +S107<<0
wire sub_exp338;
assign sub_exp338 = sub_exp337 ^ sub_exp107;

// O40: (+1*X5+1*X14+1*X15+1*X22+1*X23+1*X24+1*X30+1*X40+1*X48+1*X54+1*X56+1*X64) = +S338<<0 +S146<<0
assign mds_out4[7] = sub_exp338 ^ sub_exp146;

// S339: (+1*X1+1*X25+1*X49+1*X57) = +S21<<0 +S81<<0
wire sub_exp339;
assign sub_exp339 = sub_exp21 ^ sub_exp81;

// S340: (+1*X1+1*X24+1*X25+1*X41+1*X49+1*X57) = +S339<<0 +S86<<0
wire sub_exp340;
assign sub_exp340 = sub_exp339 ^ sub_exp86;

// O41: (+1*X1+1*X14+1*X23+1*X24+1*X25+1*X31+1*X32+1*X39+1*X41+1*X49+1*X57+1*X63) = +S340<<0 +S165<<0
assign mds_out5[0] = sub_exp340 ^ sub_exp165;

// S341: (+1*X24+1*X42) = +X24<<0 +X42<<0
wire sub_exp341;
assign sub_exp341 = mds_in2[7] ^ mds_in5[1];

// S342: (+1*X24+1*X40+1*X42+1*X64) = +S341<<0 +S8<<0
wire sub_exp342;
assign sub_exp342 = sub_exp341 ^ sub_exp8;

// S343: (+1*X15+1*X17+1*X25+1*X32) = +S50<<0 +S20<<0
wire sub_exp343;
assign sub_exp343 = sub_exp50 ^ sub_exp20;

// S344: (+1*X15+1*X17+1*X24+1*X25+1*X32+1*X40+1*X42+1*X64) = +S342<<0 +S343<<0
wire sub_exp344;
assign sub_exp344 = sub_exp342 ^ sub_exp343;

// O42: (+1*X2+1*X15+1*X17+1*X24+1*X25+1*X26+1*X32+1*X40+1*X42+1*X50+1*X58+1*X64) = +S344<<0 +S96<<0
assign mds_out5[1] = sub_exp344 ^ sub_exp96;

// S345: (+1*X18+1*X26+1*X43) = +X43<<0 +S24<<0
wire sub_exp345;
assign sub_exp345 = mds_in5[2] ^ sub_exp24;

// S346: (+1*X3+1*X18+1*X26+1*X27+1*X43) = +S345<<0 +S61<<0
wire sub_exp346;
assign sub_exp346 = sub_exp345 ^ sub_exp61;

// S347: (+1*X16+1*X17+1*X24+1*X25+1*X33+1*X51+1*X57+1*X59) = +S120<<0 +S117<<0
wire sub_exp347;
assign sub_exp347 = sub_exp120 ^ sub_exp117;

// S348: (+1*X3+1*X16+1*X17+1*X18+1*X24+1*X25+1*X26+1*X27+1*X33+1*X43+1*X51+1*X57+1*X59) = +S346<<0 +S347<<0
wire sub_exp348;
assign sub_exp348 = sub_exp346 ^ sub_exp347;

// O43: (+1*X3+1*X14+1*X16+1*X17+1*X18+1*X23+1*X24+1*X25+1*X26+1*X27+1*X31+1*X32+1*X33+1*X39+1*X43+1*X51+1*X57+1*X59+1*X63) = +S348<<0 +S165<<0
assign mds_out5[2] = sub_exp348 ^ sub_exp165;

// S349: (+1*X9+1*X44+1*X63) = +X9<<0 +S72<<0
wire sub_exp349;
assign sub_exp349 = mds_in1[0] ^ sub_exp72;

// S350: (+1*X4+1*X9+1*X28+1*X44+1*X52+1*X60+1*X63) = +S349<<0 +S100<<0
wire sub_exp350;
assign sub_exp350 = sub_exp349 ^ sub_exp100;

// S351: (+1*X4+1*X9+1*X18+1*X26+1*X28+1*X34+1*X44+1*X52+1*X58+1*X60+1*X63) = +S350<<0 +S101<<0
wire sub_exp351;
assign sub_exp351 = sub_exp350 ^ sub_exp101;

// O44: (+1*X4+1*X9+1*X14+1*X15+1*X18+1*X19+1*X23+1*X26+1*X27+1*X28+1*X31+1*X34+1*X39+1*X40+1*X44+1*X52+1*X58+1*X60+1*X63+1*X64) = +S351<<0 +S179<<0
assign mds_out5[3] = sub_exp351 ^ sub_exp179;

// S352: (+1*X10+1*X16) = +X10<<0 +X16<<0
wire sub_exp352;
assign sub_exp352 = mds_in1[1] ^ mds_in1[7];

// S353: (+1*X10+1*X16+1*X20+1*X28) = +S352<<0 +S28<<0
wire sub_exp353;
assign sub_exp353 = sub_exp352 ^ sub_exp28;

// S354: (+1*X35+1*X45+1*X59+1*X63) = +S103<<0 +S59<<0
wire sub_exp354;
assign sub_exp354 = sub_exp103 ^ sub_exp59;

// S355: (+1*X10+1*X16+1*X20+1*X28+1*X35+1*X45+1*X59+1*X63) = +S353<<0 +S354<<0
wire sub_exp355;
assign sub_exp355 = sub_exp353 ^ sub_exp354;

// S356: (+1*X5+1*X10+1*X16+1*X20+1*X28+1*X29+1*X35+1*X45+1*X53+1*X59+1*X61+1*X63) = +S355<<0 +S105<<0
wire sub_exp356;
assign sub_exp356 = sub_exp355 ^ sub_exp105;

// O45: (+1*X5+1*X10+1*X14+1*X15+1*X16+1*X19+1*X20+1*X23+1*X27+1*X28+1*X29+1*X31+1*X35+1*X39+1*X40+1*X45+1*X53+1*X59+1*X61+1*X63+1*X64) = +S356<<0 +S179<<0
assign mds_out5[4] = sub_exp356 ^ sub_exp179;

// S357: (+1*X21+1*X29) = +X21<<0 +X29<<0
wire sub_exp357;
assign sub_exp357 = mds_in2[4] ^ mds_in3[4];

// S358: (+1*X15+1*X21+1*X29+1*X32) = +S357<<0 +S50<<0
wire sub_exp358;
assign sub_exp358 = sub_exp357 ^ sub_exp50;

// S359: (+1*X11+1*X15+1*X21+1*X29+1*X32+1*X46) = +S358<<0 +S115<<0
wire sub_exp359;
assign sub_exp359 = sub_exp358 ^ sub_exp115;

// S360: (+1*X11+1*X15+1*X20+1*X21+1*X28+1*X29+1*X32+1*X36+1*X46+1*X60) = +S359<<0 +S97<<0
wire sub_exp360;
assign sub_exp360 = sub_exp359 ^ sub_exp97;

// O46: (+1*X6+1*X11+1*X15+1*X16+1*X20+1*X21+1*X24+1*X28+1*X29+1*X30+1*X32+1*X36+1*X40+1*X46+1*X54+1*X60+1*X62+1*X64) = +S360<<0 +S176<<0
assign mds_out5[5] = sub_exp360 ^ sub_exp176;

// S361: (+1*X12+1*X22) = +X12<<0 +X22<<0
wire sub_exp361;
assign sub_exp361 = mds_in1[3] ^ mds_in2[5];

// S362: (+1*X12+1*X22+1*X31) = +S361<<0 +X31<<0
wire sub_exp362;
assign sub_exp362 = sub_exp361 ^ mds_in3[6];

// S363: (+1*X7+1*X16+1*X30+1*X63) = +S78<<0 +S2<<0
wire sub_exp363;
assign sub_exp363 = sub_exp78 ^ sub_exp2;

// S364: (+1*X7+1*X12+1*X16+1*X22+1*X30+1*X31+1*X63) = +S362<<0 +S363<<0
wire sub_exp364;
assign sub_exp364 = sub_exp362 ^ sub_exp363;

// O47: (+1*X7+1*X12+1*X16+1*X21+1*X22+1*X29+1*X30+1*X31+1*X37+1*X47+1*X55+1*X61+1*X63) = +S364<<0 +S136<<0
assign mds_out5[6] = sub_exp364 ^ sub_exp136;

// S365: (+1*X13+1*X23) = +X13<<0 +X23<<0
wire sub_exp365;
assign sub_exp365 = mds_in1[4] ^ mds_in2[6];

// S366: (+1*X13+1*X23+1*X31) = +S365<<0 +X31<<0
wire sub_exp366;
assign sub_exp366 = sub_exp365 ^ mds_in3[6];

// S367: (+1*X13+1*X22+1*X23+1*X31+1*X48+1*X56) = +S366<<0 +S18<<0
wire sub_exp367;
assign sub_exp367 = sub_exp366 ^ sub_exp18;

// O48: (+1*X8+1*X13+1*X22+1*X23+1*X30+1*X31+1*X32+1*X38+1*X48+1*X56+1*X62+1*X64) = +S367<<0 +S148<<0
assign mds_out5[7] = sub_exp367 ^ sub_exp148;

// S368: (+1*X1+1*X9+1*X33) = +X33<<0 +S19<<0
wire sub_exp368;
assign sub_exp368 = mds_in4[0] ^ sub_exp19;

// S369: (+1*X1+1*X9+1*X33+1*X49+1*X57) = +S368<<0 +S21<<0
wire sub_exp369;
assign sub_exp369 = sub_exp368 ^ sub_exp21;

// O49: (+1*X1+1*X7+1*X9+1*X22+1*X31+1*X32+1*X33+1*X39+1*X40+1*X47+1*X49+1*X57) = +S369<<0 +S167<<0
assign mds_out6[0] = sub_exp369 ^ sub_exp167;

// S370: (+1*X25+1*X34) = +X25<<0 +X34<<0
wire sub_exp370;
assign sub_exp370 = mds_in3[0] ^ mds_in4[1];

// S371: (+1*X8+1*X25+1*X32+1*X34) = +S370<<0 +S6<<0
wire sub_exp371;
assign sub_exp371 = sub_exp370 ^ sub_exp6;

// S372: (+1*X2+1*X8+1*X10+1*X25+1*X32+1*X34) = +S371<<0 +S23<<0
wire sub_exp372;
assign sub_exp372 = sub_exp371 ^ sub_exp23;

// S373: (+1*X23+1*X33+1*X40+1*X48+1*X50+1*X58) = +S152<<0 +S95<<0
wire sub_exp373;
assign sub_exp373 = sub_exp152 ^ sub_exp95;

// O50: (+1*X2+1*X8+1*X10+1*X23+1*X25+1*X32+1*X33+1*X34+1*X40+1*X48+1*X50+1*X58) = +S372<<0 +S373<<0
assign mds_out6[1] = sub_exp372 ^ sub_exp373;

// S374: (+1*X26+1*X35) = +X26<<0 +X35<<0
wire sub_exp374;
assign sub_exp374 = mds_in3[1] ^ mds_in4[2];

// S375: (+1*X26+1*X33+1*X35+1*X41) = +S374<<0 +S22<<0
wire sub_exp375;
assign sub_exp375 = sub_exp374 ^ sub_exp22;

// S376: (+1*X1+1*X25+1*X26+1*X33+1*X35+1*X41) = +S375<<0 +S81<<0
wire sub_exp376;
assign sub_exp376 = sub_exp375 ^ sub_exp81;

// S377: (+1*X3+1*X11+1*X24+1*X34+1*X51+1*X59) = +S114<<0 +S67<<0
wire sub_exp377;
assign sub_exp377 = sub_exp114 ^ sub_exp67;

// S378: (+1*X1+1*X3+1*X11+1*X24+1*X25+1*X26+1*X33+1*X34+1*X35+1*X41+1*X51+1*X59) = +S376<<0 +S377<<0
wire sub_exp378;
assign sub_exp378 = sub_exp376 ^ sub_exp377;

// O51: (+1*X1+1*X3+1*X7+1*X11+1*X22+1*X24+1*X25+1*X26+1*X31+1*X32+1*X33+1*X34+1*X35+1*X39+1*X40+1*X41+1*X47+1*X51+1*X59) = +S378<<0 +S167<<0
assign mds_out6[2] = sub_exp378 ^ sub_exp167;

// S379: (+1*X17+1*X23) = +X17<<0 +X23<<0
wire sub_exp379;
assign sub_exp379 = mds_in2[0] ^ mds_in2[6];

// S380: (+1*X27+1*X36) = +X36<<0 +X27<<0
wire sub_exp380;
assign sub_exp380 = mds_in4[3] ^ mds_in3[2];

// S381: (+1*X17+1*X23+1*X27+1*X36) = +S379<<0 +S380<<0
wire sub_exp381;
assign sub_exp381 = sub_exp379 ^ sub_exp380;

// S382: (+1*X4+1*X12+1*X34+1*X42) = +S27<<0 +S26<<0
wire sub_exp382;
assign sub_exp382 = sub_exp27 ^ sub_exp26;

// S383: (+1*X2+1*X17+1*X23+1*X26+1*X27+1*X36) = +S381<<0 +S60<<0
wire sub_exp383;
assign sub_exp383 = sub_exp381 ^ sub_exp60;

// S384: (+1*X4+1*X12+1*X34+1*X35+1*X42+1*X52+1*X60) = +S99<<0 +S382<<0
wire sub_exp384;
assign sub_exp384 = sub_exp99 ^ sub_exp382;

// S385: (+1*X2+1*X4+1*X12+1*X17+1*X23+1*X26+1*X27+1*X34+1*X35+1*X36+1*X42+1*X52+1*X60) = +S383<<0 +S384<<0
wire sub_exp385;
assign sub_exp385 = sub_exp383 ^ sub_exp384;

// O52: (+1*X2+1*X4+1*X7+1*X8+1*X12+1*X17+1*X22+1*X23+1*X26+1*X27+1*X31+1*X34+1*X35+1*X36+1*X39+1*X42+1*X47+1*X48+1*X52+1*X60) = +S385<<0 +S154<<0
assign mds_out6[3] = sub_exp385 ^ sub_exp154;

// S386: (+1*X24+1*X28) = +X24<<0 +X28<<0
wire sub_exp386;
assign sub_exp386 = mds_in2[7] ^ mds_in3[3];

// S387: (+1*X24+1*X28+1*X37) = +S386<<0 +X37<<0
wire sub_exp387;
assign sub_exp387 = sub_exp386 ^ mds_in4[4];

// S388: (+1*X3+1*X24+1*X27+1*X28+1*X37) = +S387<<0 +S61<<0
wire sub_exp388;
assign sub_exp388 = sub_exp387 ^ sub_exp61;

// S389: (+1*X5+1*X13+1*X18+1*X23+1*X35+1*X43) = +S151<<0 +S94<<0
wire sub_exp389;
assign sub_exp389 = sub_exp151 ^ sub_exp94;

// S390: (+1*X3+1*X24+1*X27+1*X28+1*X36+1*X37+1*X53+1*X61) = +S388<<0 +S153<<0
wire sub_exp390;
assign sub_exp390 = sub_exp388 ^ sub_exp153;

// S391: (+1*X3+1*X5+1*X13+1*X18+1*X23+1*X24+1*X27+1*X28+1*X35+1*X36+1*X37+1*X43+1*X53+1*X61) = +S390<<0 +S389<<0
wire sub_exp391;
assign sub_exp391 = sub_exp390 ^ sub_exp389;

// O53: (+1*X3+1*X5+1*X7+1*X8+1*X13+1*X18+1*X22+1*X23+1*X24+1*X27+1*X28+1*X31+1*X35+1*X36+1*X37+1*X39+1*X43+1*X47+1*X48+1*X53+1*X61) = +S391<<0 +S154<<0
assign mds_out6[4] = sub_exp391 ^ sub_exp154;

// S392: (+1*X29+1*X37) = +X29<<0 +X37<<0
wire sub_exp392;
assign sub_exp392 = mds_in3[4] ^ mds_in4[4];

// S393: (+1*X29+1*X37+1*X54) = +S392<<0 +X54<<0
wire sub_exp393;
assign sub_exp393 = sub_exp392 ^ mds_in6[5];

// S394: (+1*X4+1*X28+1*X29+1*X37+1*X54) = +S393<<0 +S71<<0
wire sub_exp394;
assign sub_exp394 = sub_exp393 ^ sub_exp71;

// S395: (+1*X19+1*X23+1*X36+1*X40+1*X44+1*X48) = +S152<<0 +S110<<0
wire sub_exp395;
assign sub_exp395 = sub_exp152 ^ sub_exp110;

// S396: (+1*X4+1*X19+1*X23+1*X28+1*X29+1*X36+1*X37+1*X40+1*X44+1*X48+1*X54) = +S394<<0 +S395<<0
wire sub_exp396;
assign sub_exp396 = sub_exp394 ^ sub_exp395;

// O54: (+1*X4+1*X6+1*X8+1*X14+1*X19+1*X23+1*X24+1*X28+1*X29+1*X32+1*X36+1*X37+1*X38+1*X40+1*X44+1*X48+1*X54+1*X62) = +S396<<0 +S162<<0
assign mds_out6[5] = sub_exp396 ^ sub_exp162;

// S397: (+1*X20+1*X24+1*X38) = +X20<<0 +S41<<0
wire sub_exp397;
assign sub_exp397 = mds_in2[3] ^ sub_exp41;

// S398: (+1*X15+1*X20+1*X24+1*X30+1*X38+1*X39) = +S397<<0 +S79<<0
wire sub_exp398;
assign sub_exp398 = sub_exp397 ^ sub_exp79;

// O55: (+1*X5+1*X7+1*X15+1*X20+1*X24+1*X29+1*X30+1*X37+1*X38+1*X39+1*X45+1*X55+1*X63) = +S398<<0 +S158<<0
assign mds_out6[6] = sub_exp398 ^ sub_exp158;

// S399: (+1*X21+1*X31+1*X39) = +X21<<0 +S4<<0
wire sub_exp399;
assign sub_exp399 = mds_in2[4] ^ sub_exp4;

// S400: (+1*X8+1*X16+1*X21+1*X31+1*X39) = +S399<<0 +S43<<0
wire sub_exp400;
assign sub_exp400 = sub_exp399 ^ sub_exp43;

// O56: (+1*X6+1*X8+1*X16+1*X21+1*X30+1*X31+1*X38+1*X39+1*X40+1*X46+1*X56+1*X64) = +S400<<0 +S139<<0
assign mds_out6[7] = sub_exp400 ^ sub_exp139;

// S401: (+1*X1+1*X9+1*X17+1*X41+1*X57) = +X57<<0 +S87<<0
wire sub_exp401;
assign sub_exp401 = mds_in7[0] ^ sub_exp87;

// O57: (+1*X1+1*X9+1*X15+1*X17+1*X30+1*X39+1*X40+1*X41+1*X47+1*X48+1*X55+1*X57) = +S401<<0 +S169<<0
assign mds_out7[0] = sub_exp401 ^ sub_exp169;

// S402: (+1*X31+1*X58) = +X31<<0 +X58<<0
wire sub_exp402;
assign sub_exp402 = mds_in3[6] ^ mds_in7[1];

// S403: (+1*X31+1*X48+1*X56+1*X58) = +S402<<0 +S5<<0
wire sub_exp403;
assign sub_exp403 = sub_exp402 ^ sub_exp5;

// S404: (+1*X16+1*X33+1*X40+1*X41) = +S46<<0 +S22<<0
wire sub_exp404;
assign sub_exp404 = sub_exp46 ^ sub_exp22;

// S405: (+1*X16+1*X31+1*X33+1*X40+1*X41+1*X48+1*X56+1*X58) = +S403<<0 +S404<<0
wire sub_exp405;
assign sub_exp405 = sub_exp403 ^ sub_exp404;

// O58: (+1*X2+1*X10+1*X16+1*X18+1*X31+1*X33+1*X40+1*X41+1*X42+1*X48+1*X56+1*X58) = +S405<<0 +S111<<0
assign mds_out7[1] = sub_exp405 ^ sub_exp111;

// S406: (+1*X32+1*X59) = +X32<<0 +X59<<0
wire sub_exp406;
assign sub_exp406 = mds_in3[7] ^ mds_in7[2];

// S407: (+1*X32+1*X34+1*X42+1*X59) = +S406<<0 +S26<<0
wire sub_exp407;
assign sub_exp407 = sub_exp406 ^ sub_exp26;

// S408: (+1*X3+1*X11+1*X19+1*X43) = +S69<<0 +S31<<0
wire sub_exp408;
assign sub_exp408 = sub_exp69 ^ sub_exp31;

// S409: (+1*X3+1*X11+1*X19+1*X32+1*X34+1*X42+1*X43+1*X59) = +S407<<0 +S408<<0
wire sub_exp409;
assign sub_exp409 = sub_exp407 ^ sub_exp408;

// S410: (+1*X3+1*X9+1*X11+1*X19+1*X32+1*X33+1*X34+1*X41+1*X42+1*X43+1*X49+1*X59) = +S409<<0 +S92<<0
wire sub_exp410;
assign sub_exp410 = sub_exp409 ^ sub_exp92;

// O59: (+1*X3+1*X9+1*X11+1*X15+1*X19+1*X30+1*X32+1*X33+1*X34+1*X39+1*X40+1*X41+1*X42+1*X43+1*X47+1*X48+1*X49+1*X55+1*X59) = +S410<<0 +S169<<0
assign mds_out7[2] = sub_exp410 ^ sub_exp169;

// S411: (+1*X25+1*X47+1*X55) = +X25<<0 +S1<<0
wire sub_exp411;
assign sub_exp411 = mds_in3[0] ^ sub_exp1;

// S412: (+1*X4+1*X12+1*X20+1*X44) = +S127<<0 +S27<<0
wire sub_exp412;
assign sub_exp412 = sub_exp127 ^ sub_exp27;

// S413: (+1*X4+1*X12+1*X20+1*X25+1*X44+1*X47+1*X55) = +S411<<0 +S412<<0
wire sub_exp413;
assign sub_exp413 = sub_exp411 ^ sub_exp412;

// S414: (+1*X10+1*X15+1*X31+1*X34+1*X39+1*X42+1*X50+1*X60) = +S171<<0 +S130<<0
wire sub_exp414;
assign sub_exp414 = sub_exp171 ^ sub_exp130;

// S415: (+1*X4+1*X10+1*X12+1*X15+1*X20+1*X25+1*X31+1*X34+1*X39+1*X42+1*X44+1*X47+1*X50+1*X55+1*X60) = +S413<<0 +S414<<0
wire sub_exp415;
assign sub_exp415 = sub_exp413 ^ sub_exp414;

// O60: (+1*X4+1*X10+1*X12+1*X15+1*X16+1*X20+1*X25+1*X30+1*X31+1*X34+1*X35+1*X39+1*X42+1*X43+1*X44+1*X47+1*X50+1*X55+1*X56+1*X60) = +S415<<0 +S170<<0
assign mds_out7[3] = sub_exp415 ^ sub_exp170;

// S416: (+1*X26+1*X31+1*X39) = +X26<<0 +S4<<0
wire sub_exp416;
assign sub_exp416 = mds_in3[1] ^ sub_exp4;

// S417: (+1*X11+1*X36+1*X44+1*X51) = +S66<<0 +S30<<0
wire sub_exp417;
assign sub_exp417 = sub_exp66 ^ sub_exp30;

// S418: (+1*X11+1*X26+1*X31+1*X36+1*X39+1*X44+1*X51) = +S416<<0 +S417<<0
wire sub_exp418;
assign sub_exp418 = sub_exp416 ^ sub_exp417;

// S419: (+1*X11+1*X15+1*X26+1*X31+1*X32+1*X36+1*X39+1*X44+1*X51+1*X61) = +S418<<0 +S93<<0
wire sub_exp419;
assign sub_exp419 = sub_exp418 ^ sub_exp93;

// S420: (+1*X5+1*X13+1*X16+1*X21+1*X30+1*X35+1*X43+1*X45+1*X47+1*X55+1*X56) = +S173<<0 +S170<<0
wire sub_exp420;
assign sub_exp420 = sub_exp173 ^ sub_exp170;

// O61: (+1*X5+1*X11+1*X13+1*X15+1*X16+1*X21+1*X26+1*X30+1*X31+1*X32+1*X35+1*X36+1*X39+1*X43+1*X44+1*X45+1*X47+1*X51+1*X55+1*X56+1*X61) = +S419<<0 +S420<<0
assign mds_out7[4] = sub_exp419 ^ sub_exp420;

// S421: (+1*X27+1*X62) = +X27<<0 +X62<<0
wire sub_exp421;
assign sub_exp421 = mds_in3[2] ^ mds_in7[5];

// S422: (+1*X27+1*X31+1*X46+1*X62) = +S421<<0 +S85<<0
wire sub_exp422;
assign sub_exp422 = sub_exp421 ^ sub_exp85;

// S423: (+1*X12+1*X27+1*X31+1*X36+1*X44+1*X46+1*X52+1*X62) = +S422<<0 +S109<<0
wire sub_exp423;
assign sub_exp423 = sub_exp422 ^ sub_exp109;

// S424: (+1*X12+1*X27+1*X31+1*X32+1*X36+1*X37+1*X44+1*X45+1*X46+1*X52+1*X62) = +S423<<0 +S123<<0
wire sub_exp424;
assign sub_exp424 = sub_exp423 ^ sub_exp123;

// O62: (+1*X6+1*X12+1*X14+1*X16+1*X22+1*X27+1*X31+1*X32+1*X36+1*X37+1*X40+1*X44+1*X45+1*X46+1*X48+1*X52+1*X56+1*X62) = +S424<<0 +S108<<0
assign mds_out7[5] = sub_exp424 ^ sub_exp108;

// S425: (+1*X15+1*X23+1*X38+1*X46) = +S3<<0 +S14<<0
wire sub_exp425;
assign sub_exp425 = sub_exp3 ^ sub_exp14;

// S426: (+1*X13+1*X15+1*X23+1*X38+1*X46+1*X53) = +S425<<0 +S73<<0
wire sub_exp426;
assign sub_exp426 = sub_exp425 ^ sub_exp73;

// S427: (+1*X7+1*X28+1*X32+1*X37+1*X45+1*X47+1*X63) = +S143<<0 +S123<<0
wire sub_exp427;
assign sub_exp427 = sub_exp143 ^ sub_exp123;

// O63: (+1*X7+1*X13+1*X15+1*X23+1*X28+1*X32+1*X37+1*X38+1*X45+1*X46+1*X47+1*X53+1*X63) = +S426<<0 +S427<<0
assign mds_out7[6] = sub_exp426 ^ sub_exp427;

// S428: (+1*X29+1*X39+1*X47+1*X64) = +S76<<0 +S145<<0
wire sub_exp428;
assign sub_exp428 = sub_exp76 ^ sub_exp145;

// O64: (+1*X8+1*X14+1*X16+1*X24+1*X29+1*X38+1*X39+1*X46+1*X47+1*X48+1*X54+1*X64) = +S428<<0 +S150<<0
assign mds_out7[7] = sub_exp428 ^ sub_exp150;

endmodule

//CMVM GF - 952 XOR GATES
module cmvm_gf (mds_in0, mds_in1, mds_in2, mds_in3, mds_in4, mds_in5, mds_in6, mds_in7, mds_out0, mds_out1, mds_out2, mds_out3, mds_out4, mds_out5, mds_out6, mds_out7);

input [7:0] mds_in0, mds_in1, mds_in2, mds_in3, mds_in4, mds_in5, mds_in6, mds_in7;
output [7:0] mds_out0, mds_out1, mds_out2, mds_out3, mds_out4, mds_out5, mds_out6, mds_out7;

assign mds_out0[0] = mds_in0[0] ^ mds_in1[0] ^ mds_in2[0] ^ mds_in3[0] ^ mds_in6[0] ^ mds_in2[6] ^ mds_in4[5] ^ mds_in5[7] ^ mds_in5[6] ^ mds_in6[7] ^ mds_in6[6] ^ mds_in7[6];
assign mds_out0[1] = mds_in0[1] ^ mds_in1[1] ^ mds_in2[1] ^ mds_in3[1] ^ mds_in5[0] ^ mds_in6[1] ^ mds_in6[0] ^ mds_in2[7] ^ mds_in4[6] ^ mds_in5[7] ^ mds_in6[7] ^ mds_in7[7];
assign mds_out0[2] = mds_in0[2] ^ mds_in1[2] ^ mds_in2[2] ^ mds_in2[0] ^ mds_in3[2] ^ mds_in5[1] ^ mds_in5[0] ^ mds_in6[2] ^ mds_in6[1] ^ mds_in6[0] ^ mds_in7[0] ^ mds_in4[7] ^ mds_in2[6] ^ mds_in4[5] ^ mds_in5[7] ^ mds_in5[6] ^ mds_in6[7] ^ mds_in6[6] ^ mds_in7[6];
assign mds_out0[3] = mds_in0[3] ^ mds_in1[3] ^ mds_in2[3] ^ mds_in2[1] ^ mds_in3[3] ^ mds_in4[0] ^ mds_in5[2] ^ mds_in5[1] ^ mds_in6[3] ^ mds_in6[2] ^ mds_in6[1] ^ mds_in7[1] ^ mds_in2[7] ^ mds_in4[6] ^ mds_in7[7] ^ mds_in2[6] ^ mds_in4[5] ^ mds_in5[6] ^ mds_in6[6] ^ mds_in7[6];
assign mds_out0[4] = mds_in0[4] ^ mds_in1[4] ^ mds_in2[4] ^ mds_in2[2] ^ mds_in3[4] ^ mds_in4[1] ^ mds_in5[3] ^ mds_in5[2] ^ mds_in6[4] ^ mds_in6[3] ^ mds_in6[2] ^ mds_in7[2] ^ mds_in4[7] ^ mds_in2[7] ^ mds_in4[6] ^ mds_in7[7] ^ mds_in2[6] ^ mds_in4[5] ^ mds_in5[6] ^ mds_in6[6] ^ mds_in7[6];
assign mds_out0[5] = mds_in0[5] ^ mds_in1[5] ^ mds_in2[5] ^ mds_in2[3] ^ mds_in3[5] ^ mds_in4[2] ^ mds_in5[4] ^ mds_in5[3] ^ mds_in6[5] ^ mds_in6[4] ^ mds_in6[3] ^ mds_in7[3] ^ mds_in4[7] ^ mds_in2[7] ^ mds_in4[6] ^ mds_in5[7] ^ mds_in6[7] ^ mds_in7[7];
assign mds_out0[6] = mds_in0[6] ^ mds_in1[6] ^ mds_in2[6] ^ mds_in2[4] ^ mds_in3[6] ^ mds_in4[3] ^ mds_in5[5] ^ mds_in5[4] ^ mds_in6[6] ^ mds_in6[5] ^ mds_in6[4] ^ mds_in7[4] ^ mds_in4[7];
assign mds_out0[7] = mds_in0[7] ^ mds_in1[7] ^ mds_in2[7] ^ mds_in2[5] ^ mds_in3[7] ^ mds_in4[4] ^ mds_in5[6] ^ mds_in5[5] ^ mds_in6[7] ^ mds_in6[6] ^ mds_in6[5] ^ mds_in7[5];

assign mds_out1[0] = mds_in1[0] ^ mds_in2[0] ^ mds_in3[0] ^ mds_in4[0] ^ mds_in7[0] ^ mds_in0[6] ^ mds_in3[6] ^ mds_in5[5] ^ mds_in6[7] ^ mds_in6[6] ^ mds_in7[7] ^ mds_in7[6];
assign mds_out1[1] = mds_in1[1] ^ mds_in2[1] ^ mds_in3[1] ^ mds_in4[1] ^ mds_in6[0] ^ mds_in7[1] ^ mds_in7[0] ^ mds_in0[7] ^ mds_in3[7] ^ mds_in5[6] ^ mds_in6[7] ^ mds_in7[7];
assign mds_out1[2] = mds_in0[0] ^ mds_in1[2] ^ mds_in2[2] ^ mds_in3[2] ^ mds_in3[0] ^ mds_in4[2] ^ mds_in6[1] ^ mds_in6[0] ^ mds_in7[2] ^ mds_in7[1] ^ mds_in7[0] ^ mds_in5[7] ^ mds_in0[6] ^ mds_in3[6] ^ mds_in5[5] ^ mds_in6[7] ^ mds_in6[6] ^ mds_in7[7] ^ mds_in7[6];
assign mds_out1[3] = mds_in0[1] ^ mds_in1[3] ^ mds_in2[3] ^ mds_in3[3] ^ mds_in3[1] ^ mds_in4[3] ^ mds_in5[0] ^ mds_in6[2] ^ mds_in6[1] ^ mds_in7[3] ^ mds_in7[2] ^ mds_in7[1] ^ mds_in0[7] ^ mds_in3[7] ^ mds_in5[6] ^ mds_in0[6] ^ mds_in3[6] ^ mds_in5[5] ^ mds_in6[6] ^ mds_in7[6];
assign mds_out1[4] = mds_in0[2] ^ mds_in1[4] ^ mds_in2[4] ^ mds_in3[4] ^ mds_in3[2] ^ mds_in4[4] ^ mds_in5[1] ^ mds_in6[3] ^ mds_in6[2] ^ mds_in7[4] ^ mds_in7[3] ^ mds_in7[2] ^ mds_in5[7] ^ mds_in0[7] ^ mds_in3[7] ^ mds_in5[6] ^ mds_in0[6] ^ mds_in3[6] ^ mds_in5[5] ^ mds_in6[6] ^ mds_in7[6];
assign mds_out1[5] = mds_in0[3] ^ mds_in1[5] ^ mds_in2[5] ^ mds_in3[5] ^ mds_in3[3] ^ mds_in4[5] ^ mds_in5[2] ^ mds_in6[4] ^ mds_in6[3] ^ mds_in7[5] ^ mds_in7[4] ^ mds_in7[3] ^ mds_in5[7] ^ mds_in0[7] ^ mds_in3[7] ^ mds_in5[6] ^ mds_in6[7] ^ mds_in7[7];
assign mds_out1[6] = mds_in0[4] ^ mds_in1[6] ^ mds_in2[6] ^ mds_in3[6] ^ mds_in3[4] ^ mds_in4[6] ^ mds_in5[3] ^ mds_in6[5] ^ mds_in6[4] ^ mds_in7[6] ^ mds_in7[5] ^ mds_in7[4] ^ mds_in5[7];
assign mds_out1[7] = mds_in0[5] ^ mds_in1[7] ^ mds_in2[7] ^ mds_in3[7] ^ mds_in3[5] ^ mds_in4[7] ^ mds_in5[4] ^ mds_in6[6] ^ mds_in6[5] ^ mds_in7[7] ^ mds_in7[6] ^ mds_in7[5];

assign mds_out2[0] = mds_in0[0] ^ mds_in2[0] ^ mds_in3[0] ^ mds_in4[0] ^ mds_in5[0] ^ mds_in0[7] ^ mds_in0[6] ^ mds_in1[6] ^ mds_in4[6] ^ mds_in6[5] ^ mds_in7[7] ^ mds_in7[6];
assign mds_out2[1] = mds_in0[1] ^ mds_in0[0] ^ mds_in2[1] ^ mds_in3[1] ^ mds_in4[1] ^ mds_in5[1] ^ mds_in7[0] ^ mds_in0[7] ^ mds_in1[7] ^ mds_in4[7] ^ mds_in6[6] ^ mds_in7[7];
assign mds_out2[2] = mds_in0[2] ^ mds_in0[1] ^ mds_in0[0] ^ mds_in1[0] ^ mds_in2[2] ^ mds_in3[2] ^ mds_in4[2] ^ mds_in4[0] ^ mds_in5[2] ^ mds_in7[1] ^ mds_in7[0] ^ mds_in6[7] ^ mds_in0[7] ^ mds_in0[6] ^ mds_in1[6] ^ mds_in4[6] ^ mds_in6[5] ^ mds_in7[7] ^ mds_in7[6];
assign mds_out2[3] = mds_in0[3] ^ mds_in0[2] ^ mds_in0[1] ^ mds_in1[1] ^ mds_in2[3] ^ mds_in3[3] ^ mds_in4[3] ^ mds_in4[1] ^ mds_in5[3] ^ mds_in6[0] ^ mds_in7[2] ^ mds_in7[1] ^ mds_in1[7] ^ mds_in4[7] ^ mds_in6[6] ^ mds_in0[6] ^ mds_in1[6] ^ mds_in4[6] ^ mds_in6[5] ^ mds_in7[6];
assign mds_out2[4] = mds_in0[4] ^ mds_in0[3] ^ mds_in0[2] ^ mds_in1[2] ^ mds_in2[4] ^ mds_in3[4] ^ mds_in4[4] ^ mds_in4[2] ^ mds_in5[4] ^ mds_in6[1] ^ mds_in7[3] ^ mds_in7[2] ^ mds_in6[7] ^ mds_in1[7] ^ mds_in4[7] ^ mds_in6[6] ^ mds_in0[6] ^ mds_in1[6] ^ mds_in4[6] ^ mds_in6[5] ^ mds_in7[6];
assign mds_out2[5] = mds_in0[5] ^ mds_in0[4] ^ mds_in0[3] ^ mds_in1[3] ^ mds_in2[5] ^ mds_in3[5] ^ mds_in4[5] ^ mds_in4[3] ^ mds_in5[5] ^ mds_in6[2] ^ mds_in7[4] ^ mds_in7[3] ^ mds_in6[7] ^ mds_in0[7] ^ mds_in1[7] ^ mds_in4[7] ^ mds_in6[6] ^ mds_in7[7];
assign mds_out2[6] = mds_in0[6] ^ mds_in0[5] ^ mds_in0[4] ^ mds_in1[4] ^ mds_in2[6] ^ mds_in3[6] ^ mds_in4[6] ^ mds_in4[4] ^ mds_in5[6] ^ mds_in6[3] ^ mds_in7[5] ^ mds_in7[4] ^ mds_in6[7];
assign mds_out2[7] = mds_in0[7] ^ mds_in0[6] ^ mds_in0[5] ^ mds_in1[5] ^ mds_in2[7] ^ mds_in3[7] ^ mds_in4[7] ^ mds_in4[5] ^ mds_in5[7] ^ mds_in6[4] ^ mds_in7[6] ^ mds_in7[5];

assign mds_out3[0] = mds_in1[0] ^ mds_in3[0] ^ mds_in4[0] ^ mds_in5[0] ^ mds_in6[0] ^ mds_in0[7] ^ mds_in0[6] ^ mds_in1[7] ^ mds_in1[6] ^ mds_in2[6] ^ mds_in5[6] ^ mds_in7[5];
assign mds_out3[1] = mds_in0[0] ^ mds_in1[1] ^ mds_in1[0] ^ mds_in3[1] ^ mds_in4[1] ^ mds_in5[1] ^ mds_in6[1] ^ mds_in0[7] ^ mds_in1[7] ^ mds_in2[7] ^ mds_in5[7] ^ mds_in7[6];
assign mds_out3[2] = mds_in0[1] ^ mds_in0[0] ^ mds_in1[2] ^ mds_in1[1] ^ mds_in1[0] ^ mds_in2[0] ^ mds_in3[2] ^ mds_in4[2] ^ mds_in5[2] ^ mds_in5[0] ^ mds_in6[2] ^ mds_in7[7] ^ mds_in0[7] ^ mds_in0[6] ^ mds_in1[7] ^ mds_in1[6] ^ mds_in2[6] ^ mds_in5[6] ^ mds_in7[5];
assign mds_out3[3] = mds_in0[2] ^ mds_in0[1] ^ mds_in1[3] ^ mds_in1[2] ^ mds_in1[1] ^ mds_in2[1] ^ mds_in3[3] ^ mds_in4[3] ^ mds_in5[3] ^ mds_in5[1] ^ mds_in6[3] ^ mds_in7[0] ^ mds_in2[7] ^ mds_in5[7] ^ mds_in7[6] ^ mds_in0[6] ^ mds_in1[6] ^ mds_in2[6] ^ mds_in5[6] ^ mds_in7[5];
assign mds_out3[4] = mds_in0[3] ^ mds_in0[2] ^ mds_in1[4] ^ mds_in1[3] ^ mds_in1[2] ^ mds_in2[2] ^ mds_in3[4] ^ mds_in4[4] ^ mds_in5[4] ^ mds_in5[2] ^ mds_in6[4] ^ mds_in7[1] ^ mds_in7[7] ^ mds_in2[7] ^ mds_in5[7] ^ mds_in7[6] ^ mds_in0[6] ^ mds_in1[6] ^ mds_in2[6] ^ mds_in5[6] ^ mds_in7[5];
assign mds_out3[5] = mds_in0[4] ^ mds_in0[3] ^ mds_in1[5] ^ mds_in1[4] ^ mds_in1[3] ^ mds_in2[3] ^ mds_in3[5] ^ mds_in4[5] ^ mds_in5[5] ^ mds_in5[3] ^ mds_in6[5] ^ mds_in7[2] ^ mds_in7[7] ^ mds_in0[7] ^ mds_in1[7] ^ mds_in2[7] ^ mds_in5[7] ^ mds_in7[6];
assign mds_out3[6] = mds_in0[5] ^ mds_in0[4] ^ mds_in1[6] ^ mds_in1[5] ^ mds_in1[4] ^ mds_in2[4] ^ mds_in3[6] ^ mds_in4[6] ^ mds_in5[6] ^ mds_in5[4] ^ mds_in6[6] ^ mds_in7[3] ^ mds_in7[7];
assign mds_out3[7] = mds_in0[6] ^ mds_in0[5] ^ mds_in1[7] ^ mds_in1[6] ^ mds_in1[5] ^ mds_in2[5] ^ mds_in3[7] ^ mds_in4[7] ^ mds_in5[7] ^ mds_in5[5] ^ mds_in6[7] ^ mds_in7[4];

assign mds_out4[0] = mds_in2[0] ^ mds_in4[0] ^ mds_in5[0] ^ mds_in6[0] ^ mds_in7[0] ^ mds_in0[5] ^ mds_in1[7] ^ mds_in1[6] ^ mds_in2[7] ^ mds_in2[6] ^ mds_in3[6] ^ mds_in6[6];
assign mds_out4[1] = mds_in1[0] ^ mds_in2[1] ^ mds_in2[0] ^ mds_in4[1] ^ mds_in5[1] ^ mds_in6[1] ^ mds_in7[1] ^ mds_in0[6] ^ mds_in1[7] ^ mds_in2[7] ^ mds_in3[7] ^ mds_in6[7];
assign mds_out4[2] = mds_in1[1] ^ mds_in1[0] ^ mds_in2[2] ^ mds_in2[1] ^ mds_in2[0] ^ mds_in3[0] ^ mds_in4[2] ^ mds_in5[2] ^ mds_in6[2] ^ mds_in6[0] ^ mds_in7[2] ^ mds_in0[7] ^ mds_in0[5] ^ mds_in1[7] ^ mds_in1[6] ^ mds_in2[7] ^ mds_in2[6] ^ mds_in3[6] ^ mds_in6[6];
assign mds_out4[3] = mds_in0[0] ^ mds_in1[2] ^ mds_in1[1] ^ mds_in2[3] ^ mds_in2[2] ^ mds_in2[1] ^ mds_in3[1] ^ mds_in4[3] ^ mds_in5[3] ^ mds_in6[3] ^ mds_in6[1] ^ mds_in7[3] ^ mds_in0[6] ^ mds_in3[7] ^ mds_in6[7] ^ mds_in0[5] ^ mds_in1[6] ^ mds_in2[6] ^ mds_in3[6] ^ mds_in6[6];
assign mds_out4[4] = mds_in0[1] ^ mds_in1[3] ^ mds_in1[2] ^ mds_in2[4] ^ mds_in2[3] ^ mds_in2[2] ^ mds_in3[2] ^ mds_in4[4] ^ mds_in5[4] ^ mds_in6[4] ^ mds_in6[2] ^ mds_in7[4] ^ mds_in0[7] ^ mds_in0[6] ^ mds_in3[7] ^ mds_in6[7] ^ mds_in0[5] ^ mds_in1[6] ^ mds_in2[6] ^ mds_in3[6] ^ mds_in6[6];
assign mds_out4[5] = mds_in0[2] ^ mds_in1[4] ^ mds_in1[3] ^ mds_in2[5] ^ mds_in2[4] ^ mds_in2[3] ^ mds_in3[3] ^ mds_in4[5] ^ mds_in5[5] ^ mds_in6[5] ^ mds_in6[3] ^ mds_in7[5] ^ mds_in0[7] ^ mds_in0[6] ^ mds_in1[7] ^ mds_in2[7] ^ mds_in3[7] ^ mds_in6[7];
assign mds_out4[6] = mds_in0[3] ^ mds_in1[5] ^ mds_in1[4] ^ mds_in2[6] ^ mds_in2[5] ^ mds_in2[4] ^ mds_in3[4] ^ mds_in4[6] ^ mds_in5[6] ^ mds_in6[6] ^ mds_in6[4] ^ mds_in7[6] ^ mds_in0[7];
assign mds_out4[7] = mds_in0[4] ^ mds_in1[6] ^ mds_in1[5] ^ mds_in2[7] ^ mds_in2[6] ^ mds_in2[5] ^ mds_in3[5] ^ mds_in4[7] ^ mds_in5[7] ^ mds_in6[7] ^ mds_in6[5] ^ mds_in7[7];

assign mds_out5[0] = mds_in0[0] ^ mds_in3[0] ^ mds_in5[0] ^ mds_in6[0] ^ mds_in7[0] ^ mds_in1[5] ^ mds_in2[7] ^ mds_in2[6] ^ mds_in3[7] ^ mds_in3[6] ^ mds_in4[6] ^ mds_in7[6];
assign mds_out5[1] = mds_in0[1] ^ mds_in2[0] ^ mds_in3[1] ^ mds_in3[0] ^ mds_in5[1] ^ mds_in6[1] ^ mds_in7[1] ^ mds_in1[6] ^ mds_in2[7] ^ mds_in3[7] ^ mds_in4[7] ^ mds_in7[7];
assign mds_out5[2] = mds_in0[2] ^ mds_in2[1] ^ mds_in2[0] ^ mds_in3[2] ^ mds_in3[1] ^ mds_in3[0] ^ mds_in4[0] ^ mds_in5[2] ^ mds_in6[2] ^ mds_in7[2] ^ mds_in7[0] ^ mds_in1[7] ^ mds_in1[5] ^ mds_in2[7] ^ mds_in2[6] ^ mds_in3[7] ^ mds_in3[6] ^ mds_in4[6] ^ mds_in7[6];
assign mds_out5[3] = mds_in0[3] ^ mds_in1[0] ^ mds_in2[2] ^ mds_in2[1] ^ mds_in3[3] ^ mds_in3[2] ^ mds_in3[1] ^ mds_in4[1] ^ mds_in5[3] ^ mds_in6[3] ^ mds_in7[3] ^ mds_in7[1] ^ mds_in1[6] ^ mds_in4[7] ^ mds_in7[7] ^ mds_in1[5] ^ mds_in2[6] ^ mds_in3[6] ^ mds_in4[6] ^ mds_in7[6];
assign mds_out5[4] = mds_in0[4] ^ mds_in1[1] ^ mds_in2[3] ^ mds_in2[2] ^ mds_in3[4] ^ mds_in3[3] ^ mds_in3[2] ^ mds_in4[2] ^ mds_in5[4] ^ mds_in6[4] ^ mds_in7[4] ^ mds_in7[2] ^ mds_in1[7] ^ mds_in1[6] ^ mds_in4[7] ^ mds_in7[7] ^ mds_in1[5] ^ mds_in2[6] ^ mds_in3[6] ^ mds_in4[6] ^ mds_in7[6];
assign mds_out5[5] = mds_in0[5] ^ mds_in1[2] ^ mds_in2[4] ^ mds_in2[3] ^ mds_in3[5] ^ mds_in3[4] ^ mds_in3[3] ^ mds_in4[3] ^ mds_in5[5] ^ mds_in6[5] ^ mds_in7[5] ^ mds_in7[3] ^ mds_in1[7] ^ mds_in1[6] ^ mds_in2[7] ^ mds_in3[7] ^ mds_in4[7] ^ mds_in7[7];
assign mds_out5[6] = mds_in0[6] ^ mds_in1[3] ^ mds_in2[5] ^ mds_in2[4] ^ mds_in3[6] ^ mds_in3[5] ^ mds_in3[4] ^ mds_in4[4] ^ mds_in5[6] ^ mds_in6[6] ^ mds_in7[6] ^ mds_in7[4] ^ mds_in1[7];
assign mds_out5[7] = mds_in0[7] ^ mds_in1[4] ^ mds_in2[6] ^ mds_in2[5] ^ mds_in3[7] ^ mds_in3[6] ^ mds_in3[5] ^ mds_in4[5] ^ mds_in5[7] ^ mds_in6[7] ^ mds_in7[7] ^ mds_in7[5];

assign mds_out6[0] = mds_in0[0] ^ mds_in1[0] ^ mds_in4[0] ^ mds_in6[0] ^ mds_in7[0] ^ mds_in0[6] ^ mds_in2[5] ^ mds_in3[7] ^ mds_in3[6] ^ mds_in4[7] ^ mds_in4[6] ^ mds_in5[6];
assign mds_out6[1] = mds_in0[1] ^ mds_in1[1] ^ mds_in3[0] ^ mds_in4[1] ^ mds_in4[0] ^ mds_in6[1] ^ mds_in7[1] ^ mds_in0[7] ^ mds_in2[6] ^ mds_in3[7] ^ mds_in4[7] ^ mds_in5[7];
assign mds_out6[2] = mds_in0[2] ^ mds_in0[0] ^ mds_in1[2] ^ mds_in3[1] ^ mds_in3[0] ^ mds_in4[2] ^ mds_in4[1] ^ mds_in4[0] ^ mds_in5[0] ^ mds_in6[2] ^ mds_in7[2] ^ mds_in2[7] ^ mds_in0[6] ^ mds_in2[5] ^ mds_in3[7] ^ mds_in3[6] ^ mds_in4[7] ^ mds_in4[6] ^ mds_in5[6];
assign mds_out6[3] = mds_in0[3] ^ mds_in0[1] ^ mds_in1[3] ^ mds_in2[0] ^ mds_in3[2] ^ mds_in3[1] ^ mds_in4[3] ^ mds_in4[2] ^ mds_in4[1] ^ mds_in5[1] ^ mds_in6[3] ^ mds_in7[3] ^ mds_in0[7] ^ mds_in2[6] ^ mds_in5[7] ^ mds_in0[6] ^ mds_in2[5] ^ mds_in3[6] ^ mds_in4[6] ^ mds_in5[6];
assign mds_out6[4] = mds_in0[4] ^ mds_in0[2] ^ mds_in1[4] ^ mds_in2[1] ^ mds_in3[3] ^ mds_in3[2] ^ mds_in4[4] ^ mds_in4[3] ^ mds_in4[2] ^ mds_in5[2] ^ mds_in6[4] ^ mds_in7[4] ^ mds_in2[7] ^ mds_in0[7] ^ mds_in2[6] ^ mds_in5[7] ^ mds_in0[6] ^ mds_in2[5] ^ mds_in3[6] ^ mds_in4[6] ^ mds_in5[6];
assign mds_out6[5] = mds_in0[5] ^ mds_in0[3] ^ mds_in1[5] ^ mds_in2[2] ^ mds_in3[4] ^ mds_in3[3] ^ mds_in4[5] ^ mds_in4[4] ^ mds_in4[3] ^ mds_in5[3] ^ mds_in6[5] ^ mds_in7[5] ^ mds_in2[7] ^ mds_in0[7] ^ mds_in2[6] ^ mds_in3[7] ^ mds_in4[7] ^ mds_in5[7];
assign mds_out6[6] = mds_in0[6] ^ mds_in0[4] ^ mds_in1[6] ^ mds_in2[3] ^ mds_in3[5] ^ mds_in3[4] ^ mds_in4[6] ^ mds_in4[5] ^ mds_in4[4] ^ mds_in5[4] ^ mds_in6[6] ^ mds_in7[6] ^ mds_in2[7];
assign mds_out6[7] = mds_in0[7] ^ mds_in0[5] ^ mds_in1[7] ^ mds_in2[4] ^ mds_in3[6] ^ mds_in3[5] ^ mds_in4[7] ^ mds_in4[6] ^ mds_in4[5] ^ mds_in5[5] ^ mds_in6[7] ^ mds_in7[7];

assign mds_out7[0] = mds_in0[0] ^ mds_in1[0] ^ mds_in2[0] ^ mds_in5[0] ^ mds_in7[0] ^ mds_in1[6] ^ mds_in3[5] ^ mds_in4[7] ^ mds_in4[6] ^ mds_in5[7] ^ mds_in5[6] ^ mds_in6[6];
assign mds_out7[1] = mds_in0[1] ^ mds_in1[1] ^ mds_in2[1] ^ mds_in4[0] ^ mds_in5[1] ^ mds_in5[0] ^ mds_in7[1] ^ mds_in1[7] ^ mds_in3[6] ^ mds_in4[7] ^ mds_in5[7] ^ mds_in6[7];
assign mds_out7[2] = mds_in0[2] ^ mds_in1[2] ^ mds_in1[0] ^ mds_in2[2] ^ mds_in4[1] ^ mds_in4[0] ^ mds_in5[2] ^ mds_in5[1] ^ mds_in5[0] ^ mds_in6[0] ^ mds_in7[2] ^ mds_in3[7] ^ mds_in1[6] ^ mds_in3[5] ^ mds_in4[7] ^ mds_in4[6] ^ mds_in5[7] ^ mds_in5[6] ^ mds_in6[6];
assign mds_out7[3] = mds_in0[3] ^ mds_in1[3] ^ mds_in1[1] ^ mds_in2[3] ^ mds_in3[0] ^ mds_in4[2] ^ mds_in4[1] ^ mds_in5[3] ^ mds_in5[2] ^ mds_in5[1] ^ mds_in6[1] ^ mds_in7[3] ^ mds_in1[7] ^ mds_in3[6] ^ mds_in6[7] ^ mds_in1[6] ^ mds_in3[5] ^ mds_in4[6] ^ mds_in5[6] ^ mds_in6[6];
assign mds_out7[4] = mds_in0[4] ^ mds_in1[4] ^ mds_in1[2] ^ mds_in2[4] ^ mds_in3[1] ^ mds_in4[3] ^ mds_in4[2] ^ mds_in5[4] ^ mds_in5[3] ^ mds_in5[2] ^ mds_in6[2] ^ mds_in7[4] ^ mds_in3[7] ^ mds_in1[7] ^ mds_in3[6] ^ mds_in6[7] ^ mds_in1[6] ^ mds_in3[5] ^ mds_in4[6] ^ mds_in5[6] ^ mds_in6[6];
assign mds_out7[5] = mds_in0[5] ^ mds_in1[5] ^ mds_in1[3] ^ mds_in2[5] ^ mds_in3[2] ^ mds_in4[4] ^ mds_in4[3] ^ mds_in5[5] ^ mds_in5[4] ^ mds_in5[3] ^ mds_in6[3] ^ mds_in7[5] ^ mds_in3[7] ^ mds_in1[7] ^ mds_in3[6] ^ mds_in4[7] ^ mds_in5[7] ^ mds_in6[7];
assign mds_out7[6] = mds_in0[6] ^ mds_in1[6] ^ mds_in1[4] ^ mds_in2[6] ^ mds_in3[3] ^ mds_in4[5] ^ mds_in4[4] ^ mds_in5[6] ^ mds_in5[5] ^ mds_in5[4] ^ mds_in6[4] ^ mds_in7[6] ^ mds_in3[7];
assign mds_out7[7] = mds_in0[7] ^ mds_in1[7] ^ mds_in1[5] ^ mds_in2[7] ^ mds_in3[4] ^ mds_in4[6] ^ mds_in4[5] ^ mds_in5[7] ^ mds_in5[6] ^ mds_in5[5] ^ mds_in6[5] ^ mds_in7[7];

endmodule

//SBOX 0
module sbox_0 (sbox_in, sbox_out);

input [7:0] sbox_in;
output reg [7:0] sbox_out;

always @ (*) begin
  case (sbox_in)
    8'b00000000 : sbox_out = 8'hA8;
    8'b00000001 : sbox_out = 8'h43;
    8'b00000010 : sbox_out = 8'h5F;
    8'b00000011 : sbox_out = 8'h06;
    8'b00000100 : sbox_out = 8'h6B;
    8'b00000101 : sbox_out = 8'h75;
    8'b00000110 : sbox_out = 8'h6C;
    8'b00000111 : sbox_out = 8'h59;
    8'b00001000 : sbox_out = 8'h71;
    8'b00001001 : sbox_out = 8'hDF;
    8'b00001010 : sbox_out = 8'h87;
    8'b00001011 : sbox_out = 8'h95;
    8'b00001100 : sbox_out = 8'h17;
    8'b00001101 : sbox_out = 8'hF0;
    8'b00001110 : sbox_out = 8'hD8;
    8'b00001111 : sbox_out = 8'h09;

    8'b00010000 : sbox_out = 8'h6D;
    8'b00010001 : sbox_out = 8'hF3;
    8'b00010010 : sbox_out = 8'h1D;
    8'b00010011 : sbox_out = 8'hCB;
    8'b00010100 : sbox_out = 8'hC9;
    8'b00010101 : sbox_out = 8'h4D;
    8'b00010110 : sbox_out = 8'h2C;
    8'b00010111 : sbox_out = 8'hAF;
    8'b00011000 : sbox_out = 8'h79;
    8'b00011001 : sbox_out = 8'hE0;
    8'b00011010 : sbox_out = 8'h97;
    8'b00011011 : sbox_out = 8'hFD;
    8'b00011100 : sbox_out = 8'h6F;
    8'b00011101 : sbox_out = 8'h4B;
    8'b00011110 : sbox_out = 8'h45;
    8'b00011111 : sbox_out = 8'h39;

    8'b00100000 : sbox_out = 8'h3E;
    8'b00100001 : sbox_out = 8'hDD;
    8'b00100010 : sbox_out = 8'hA3;
    8'b00100011 : sbox_out = 8'h4F;
    8'b00100100 : sbox_out = 8'hB4;
    8'b00100101 : sbox_out = 8'hB6;
    8'b00100110 : sbox_out = 8'h9A;
    8'b00100111 : sbox_out = 8'h0E;
    8'b00101000 : sbox_out = 8'h1F;
    8'b00101001 : sbox_out = 8'hBF;
    8'b00101010 : sbox_out = 8'h15;
    8'b00101011 : sbox_out = 8'hE1;
    8'b00101100 : sbox_out = 8'h49;
    8'b00101101 : sbox_out = 8'hD2;
    8'b00101110 : sbox_out = 8'h93;
    8'b00101111 : sbox_out = 8'hC6;

    8'b00110000 : sbox_out = 8'h92;
    8'b00110001 : sbox_out = 8'h72;
    8'b00110010 : sbox_out = 8'h9E;
    8'b00110011 : sbox_out = 8'h61;
    8'b00110100 : sbox_out = 8'hD1;
    8'b00110101 : sbox_out = 8'h63;
    8'b00110110 : sbox_out = 8'hFA;
    8'b00110111 : sbox_out = 8'hEE;
    8'b00111000 : sbox_out = 8'hF4;
    8'b00111001 : sbox_out = 8'h19;
    8'b00111010 : sbox_out = 8'hD5;
    8'b00111011 : sbox_out = 8'hAD;
    8'b00111100 : sbox_out = 8'h58;
    8'b00111101 : sbox_out = 8'hA4;
    8'b00111110 : sbox_out = 8'hBB;
    8'b00111111 : sbox_out = 8'hA1;

    8'b01000000 : sbox_out = 8'hDC;
    8'b01000001 : sbox_out = 8'hF2;
    8'b01000010 : sbox_out = 8'h83;
    8'b01000011 : sbox_out = 8'h37;
    8'b01000100 : sbox_out = 8'h42;
    8'b01000101 : sbox_out = 8'hE4;
    8'b01000110 : sbox_out = 8'h7A;
    8'b01000111 : sbox_out = 8'h32;
    8'b01001000 : sbox_out = 8'h9C;
    8'b01001001 : sbox_out = 8'hCC;
    8'b01001010 : sbox_out = 8'hAB;
    8'b01001011 : sbox_out = 8'h4A;
    8'b01001100 : sbox_out = 8'h8F;
    8'b01001101 : sbox_out = 8'h6E;
    8'b01001110 : sbox_out = 8'h04;
    8'b01001111 : sbox_out = 8'h27;

    8'b01010000 : sbox_out = 8'h2E;
    8'b01010001 : sbox_out = 8'hE7;
    8'b01010010 : sbox_out = 8'hE2;
    8'b01010011 : sbox_out = 8'h5A;
    8'b01010100 : sbox_out = 8'h96;
    8'b01010101 : sbox_out = 8'h16;
    8'b01010110 : sbox_out = 8'h23;
    8'b01010111 : sbox_out = 8'h2B;
    8'b01011000 : sbox_out = 8'hC2;
    8'b01011001 : sbox_out = 8'h65;
    8'b01011010 : sbox_out = 8'h66;
    8'b01011011 : sbox_out = 8'h0F;
    8'b01011100 : sbox_out = 8'hBC;
    8'b01011101 : sbox_out = 8'hA9;
    8'b01011110 : sbox_out = 8'h47;
    8'b01011111 : sbox_out = 8'h41;

    8'b01100000 : sbox_out = 8'h34;
    8'b01100001 : sbox_out = 8'h48;
    8'b01100010 : sbox_out = 8'hFC;
    8'b01100011 : sbox_out = 8'hB7;
    8'b01100100 : sbox_out = 8'h6A;
    8'b01100101 : sbox_out = 8'h88;
    8'b01100110 : sbox_out = 8'hA5;
    8'b01100111 : sbox_out = 8'h53;
    8'b01101000 : sbox_out = 8'h86;
    8'b01101001 : sbox_out = 8'hF9;
    8'b01101010 : sbox_out = 8'h5B;
    8'b01101011 : sbox_out = 8'hDB;
    8'b01101100 : sbox_out = 8'h38;
    8'b01101101 : sbox_out = 8'h7B;
    8'b01101110 : sbox_out = 8'hC3;
    8'b01101111 : sbox_out = 8'h1E;

    8'b01110000 : sbox_out = 8'h22;
    8'b01110001 : sbox_out = 8'h33;
    8'b01110010 : sbox_out = 8'h24;
    8'b01110011 : sbox_out = 8'h28;
    8'b01110100 : sbox_out = 8'h36;
    8'b01110101 : sbox_out = 8'hC7;
    8'b01110110 : sbox_out = 8'hB2;
    8'b01110111 : sbox_out = 8'h3B;
    8'b01111000 : sbox_out = 8'h8E;
    8'b01111001 : sbox_out = 8'h77;
    8'b01111010 : sbox_out = 8'hBA;
    8'b01111011 : sbox_out = 8'hF5;
    8'b01111100 : sbox_out = 8'h14;
    8'b01111101 : sbox_out = 8'h9F;
    8'b01111110 : sbox_out = 8'h08;
    8'b01111111 : sbox_out = 8'h55;

    8'b10000000 : sbox_out = 8'h9B;
    8'b10000001 : sbox_out = 8'h4C;
    8'b10000010 : sbox_out = 8'hFE;
    8'b10000011 : sbox_out = 8'h60;
    8'b10000100 : sbox_out = 8'h5C;
    8'b10000101 : sbox_out = 8'hDA;
    8'b10000110 : sbox_out = 8'h18;
    8'b10000111 : sbox_out = 8'h46;
    8'b10001000 : sbox_out = 8'hCD;
    8'b10001001 : sbox_out = 8'h7D;
    8'b10001010 : sbox_out = 8'h21;
    8'b10001011 : sbox_out = 8'hB0;
    8'b10001100 : sbox_out = 8'h3F;
    8'b10001101 : sbox_out = 8'h1B;
    8'b10001110 : sbox_out = 8'h89;
    8'b10001111 : sbox_out = 8'hFF;

    8'b10010000 : sbox_out = 8'hEB;
    8'b10010001 : sbox_out = 8'h84;
    8'b10010010 : sbox_out = 8'h69;
    8'b10010011 : sbox_out = 8'h3A;
    8'b10010100 : sbox_out = 8'h9D;
    8'b10010101 : sbox_out = 8'hD7;
    8'b10010110 : sbox_out = 8'hD3;
    8'b10010111 : sbox_out = 8'h70;
    8'b10011000 : sbox_out = 8'h67;
    8'b10011001 : sbox_out = 8'h40;
    8'b10011010 : sbox_out = 8'hB5;
    8'b10011011 : sbox_out = 8'hDE;
    8'b10011100 : sbox_out = 8'h5D;
    8'b10011101 : sbox_out = 8'h30;
    8'b10011110 : sbox_out = 8'h91;
    8'b10011111 : sbox_out = 8'hB1;

    8'b10100000 : sbox_out = 8'h78;
    8'b10100001 : sbox_out = 8'h11;
    8'b10100010 : sbox_out = 8'h01;
    8'b10100011 : sbox_out = 8'hE5;
    8'b10100100 : sbox_out = 8'h00;
    8'b10100101 : sbox_out = 8'h68;
    8'b10100110 : sbox_out = 8'h98;
    8'b10100111 : sbox_out = 8'hA0;
    8'b10101000 : sbox_out = 8'hC5;
    8'b10101001 : sbox_out = 8'h02;
    8'b10101010 : sbox_out = 8'hA6;
    8'b10101011 : sbox_out = 8'h74;
    8'b10101100 : sbox_out = 8'h2D;
    8'b10101101 : sbox_out = 8'h0B;
    8'b10101110 : sbox_out = 8'hA2;
    8'b10101111 : sbox_out = 8'h76;

    8'b10110000 : sbox_out = 8'hB3;
    8'b10110001 : sbox_out = 8'hBE;
    8'b10110010 : sbox_out = 8'hCE;
    8'b10110011 : sbox_out = 8'hBD;
    8'b10110100 : sbox_out = 8'hAE;
    8'b10110101 : sbox_out = 8'hE9;
    8'b10110110 : sbox_out = 8'h8A;
    8'b10110111 : sbox_out = 8'h31;
    8'b10111000 : sbox_out = 8'h1C;
    8'b10111001 : sbox_out = 8'hEC;
    8'b10111010 : sbox_out = 8'hF1;
    8'b10111011 : sbox_out = 8'h99;
    8'b10111100 : sbox_out = 8'h94;
    8'b10111101 : sbox_out = 8'hAA;
    8'b10111110 : sbox_out = 8'hF6;
    8'b10111111 : sbox_out = 8'h26;

    8'b11000000 : sbox_out = 8'h2F;
    8'b11000001 : sbox_out = 8'hEF;
    8'b11000010 : sbox_out = 8'hE8;
    8'b11000011 : sbox_out = 8'h8C;
    8'b11000100 : sbox_out = 8'h35;
    8'b11000101 : sbox_out = 8'h03;
    8'b11000110 : sbox_out = 8'hD4;
    8'b11000111 : sbox_out = 8'h7F;
    8'b11001000 : sbox_out = 8'hFB;
    8'b11001001 : sbox_out = 8'h05;
    8'b11001010 : sbox_out = 8'hC1;
    8'b11001011 : sbox_out = 8'h5E;
    8'b11001100 : sbox_out = 8'h90;
    8'b11001101 : sbox_out = 8'h20;
    8'b11001110 : sbox_out = 8'h3D;
    8'b11001111 : sbox_out = 8'h82;

    8'b11010000 : sbox_out = 8'hF7;
    8'b11010001 : sbox_out = 8'hEA;
    8'b11010010 : sbox_out = 8'h0A;
    8'b11010011 : sbox_out = 8'h0D;
    8'b11010100 : sbox_out = 8'h7E;
    8'b11010101 : sbox_out = 8'hF8;
    8'b11010110 : sbox_out = 8'h50;
    8'b11010111 : sbox_out = 8'h1A;
    8'b11011000 : sbox_out = 8'hC4;
    8'b11011001 : sbox_out = 8'h07;
    8'b11011010 : sbox_out = 8'h57;
    8'b11011011 : sbox_out = 8'hB8;
    8'b11011100 : sbox_out = 8'h3C;
    8'b11011101 : sbox_out = 8'h62;
    8'b11011110 : sbox_out = 8'hE3;
    8'b11011111 : sbox_out = 8'hC8;

    8'b11100000 : sbox_out = 8'hAC;
    8'b11100001 : sbox_out = 8'h52;
    8'b11100010 : sbox_out = 8'h64;
    8'b11100011 : sbox_out = 8'h10;
    8'b11100100 : sbox_out = 8'hD0;
    8'b11100101 : sbox_out = 8'hD9;
    8'b11100110 : sbox_out = 8'h13;
    8'b11100111 : sbox_out = 8'h0C;
    8'b11101000 : sbox_out = 8'h12;
    8'b11101001 : sbox_out = 8'h29;
    8'b11101010 : sbox_out = 8'h51;
    8'b11101011 : sbox_out = 8'hB9;
    8'b11101100 : sbox_out = 8'hCF;
    8'b11101101 : sbox_out = 8'hD6;
    8'b11101110 : sbox_out = 8'h73;
    8'b11101111 : sbox_out = 8'h8D;

    8'b11110000 : sbox_out = 8'h81;
    8'b11110001 : sbox_out = 8'h54;
    8'b11110010 : sbox_out = 8'hC0;
    8'b11110011 : sbox_out = 8'hED;
    8'b11110100 : sbox_out = 8'h4E;
    8'b11110101 : sbox_out = 8'h44;
    8'b11110110 : sbox_out = 8'hA7;
    8'b11110111 : sbox_out = 8'h2A;
    8'b11111000 : sbox_out = 8'h85;
    8'b11111001 : sbox_out = 8'h25;
    8'b11111010 : sbox_out = 8'hE6;
    8'b11111011 : sbox_out = 8'hCA;
    8'b11111100 : sbox_out = 8'h7C;
    8'b11111101 : sbox_out = 8'h8B;
    8'b11111110 : sbox_out = 8'h56;
    8'b11111111 : sbox_out = 8'h80;
    default : sbox_out = 8'd0;
  endcase
end

endmodule

//SBOX 0 - Alternative 6
module sbox_0_alt6 (sbox_in, sbox_out);

input [7:0] sbox_in;
output reg [7:0] sbox_out;

always @ (*) begin
  if (sbox_in[7:2] == 6'b000000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hA8;
      2'b01 : sbox_out = 8'h43;
      2'b10 : sbox_out = 8'h5F;
      2'b11 : sbox_out = 8'h06;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h6B;
      2'b01 : sbox_out = 8'h75;
      2'b10 : sbox_out = 8'h6C;
      2'b11 : sbox_out = 8'h59;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h71;
      2'b01 : sbox_out = 8'hDF;
      2'b10 : sbox_out = 8'h87;
      2'b11 : sbox_out = 8'h95;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h17;
      2'b01 : sbox_out = 8'hF0;
      2'b10 : sbox_out = 8'hD8;
      2'b11 : sbox_out = 8'h09;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h6D;
      2'b01 : sbox_out = 8'hF3;
      2'b10 : sbox_out = 8'h1D;
      2'b11 : sbox_out = 8'hCB;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hC9;
      2'b01 : sbox_out = 8'h4D;
      2'b10 : sbox_out = 8'h2C;
      2'b11 : sbox_out = 8'hAF;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h79;
      2'b01 : sbox_out = 8'hE0;
      2'b10 : sbox_out = 8'h97;
      2'b11 : sbox_out = 8'hFD;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h6F;
      2'b01 : sbox_out = 8'h4B;
      2'b10 : sbox_out = 8'h45;
      2'b11 : sbox_out = 8'h39;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h3E;
      2'b01 : sbox_out = 8'hDD;
      2'b10 : sbox_out = 8'hA3;
      2'b11 : sbox_out = 8'h4F;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hB4;
      2'b01 : sbox_out = 8'hB6;
      2'b10 : sbox_out = 8'h9A;
      2'b11 : sbox_out = 8'h0E;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h1F;
      2'b01 : sbox_out = 8'hBF;
      2'b10 : sbox_out = 8'h15;
      2'b11 : sbox_out = 8'hE1;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h49;
      2'b01 : sbox_out = 8'hD2;
      2'b10 : sbox_out = 8'h93;
      2'b11 : sbox_out = 8'hC6;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h92;
      2'b01 : sbox_out = 8'h72;
      2'b10 : sbox_out = 8'h9E;
      2'b11 : sbox_out = 8'h61;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hD1;
      2'b01 : sbox_out = 8'h63;
      2'b10 : sbox_out = 8'hFA;
      2'b11 : sbox_out = 8'hEE;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hF4;
      2'b01 : sbox_out = 8'h19;
      2'b10 : sbox_out = 8'hD5;
      2'b11 : sbox_out = 8'hAD;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h58;
      2'b01 : sbox_out = 8'hA4;
      2'b10 : sbox_out = 8'hBB;
      2'b11 : sbox_out = 8'hA1;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hDC;
      2'b01 : sbox_out = 8'hF2;
      2'b10 : sbox_out = 8'h83;
      2'b11 : sbox_out = 8'h37;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h42;
      2'b01 : sbox_out = 8'hE4;
      2'b10 : sbox_out = 8'h7A;
      2'b11 : sbox_out = 8'h32;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h9C;
      2'b01 : sbox_out = 8'hCC;
      2'b10 : sbox_out = 8'hAB;
      2'b11 : sbox_out = 8'h4A;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h8F;
      2'b01 : sbox_out = 8'h6E;
      2'b10 : sbox_out = 8'h04;
      2'b11 : sbox_out = 8'h27;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h2E;
      2'b01 : sbox_out = 8'hE7;
      2'b10 : sbox_out = 8'hE2;
      2'b11 : sbox_out = 8'h5A;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h96;
      2'b01 : sbox_out = 8'h16;
      2'b10 : sbox_out = 8'h23;
      2'b11 : sbox_out = 8'h2B;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hC2;
      2'b01 : sbox_out = 8'h65;
      2'b10 : sbox_out = 8'h66;
      2'b11 : sbox_out = 8'h0F;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hBC;
      2'b01 : sbox_out = 8'hA9;
      2'b10 : sbox_out = 8'h47;
      2'b11 : sbox_out = 8'h41;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h34;
      2'b01 : sbox_out = 8'h48;
      2'b10 : sbox_out = 8'hFC;
      2'b11 : sbox_out = 8'hB7;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h6A;
      2'b01 : sbox_out = 8'h88;
      2'b10 : sbox_out = 8'hA5;
      2'b11 : sbox_out = 8'h53;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h86;
      2'b01 : sbox_out = 8'hF9;
      2'b10 : sbox_out = 8'h5B;
      2'b11 : sbox_out = 8'hDB;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h38;
      2'b01 : sbox_out = 8'h7B;
      2'b10 : sbox_out = 8'hC3;
      2'b11 : sbox_out = 8'h1E;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h22;
      2'b01 : sbox_out = 8'h33;
      2'b10 : sbox_out = 8'h24;
      2'b11 : sbox_out = 8'h28;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h36;
      2'b01 : sbox_out = 8'hC7;
      2'b10 : sbox_out = 8'hB2;
      2'b11 : sbox_out = 8'h3B;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h8E;
      2'b01 : sbox_out = 8'h77;
      2'b10 : sbox_out = 8'hBA;
      2'b11 : sbox_out = 8'hF5;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h14;
      2'b01 : sbox_out = 8'h9F;
      2'b10 : sbox_out = 8'h08;
      2'b11 : sbox_out = 8'h55;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h9B;
      2'b01 : sbox_out = 8'h4C;
      2'b10 : sbox_out = 8'hFE;
      2'b11 : sbox_out = 8'h60;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h5C;
      2'b01 : sbox_out = 8'hDA;
      2'b10 : sbox_out = 8'h18;
      2'b11 : sbox_out = 8'h46;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hCD;
      2'b01 : sbox_out = 8'h7D;
      2'b10 : sbox_out = 8'h21;
      2'b11 : sbox_out = 8'hB0;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h3F;
      2'b01 : sbox_out = 8'h1B;
      2'b10 : sbox_out = 8'h89;
      2'b11 : sbox_out = 8'hFF;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hEB;
      2'b01 : sbox_out = 8'h84;
      2'b10 : sbox_out = 8'h69;
      2'b11 : sbox_out = 8'h3A;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h9D;
      2'b01 : sbox_out = 8'hD7;
      2'b10 : sbox_out = 8'hD3;
      2'b11 : sbox_out = 8'h70;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h67;
      2'b01 : sbox_out = 8'h40;
      2'b10 : sbox_out = 8'hB5;
      2'b11 : sbox_out = 8'hDE;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h5D;
      2'b01 : sbox_out = 8'h30;
      2'b10 : sbox_out = 8'h91;
      2'b11 : sbox_out = 8'hB1;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h78;
      2'b01 : sbox_out = 8'h11;
      2'b10 : sbox_out = 8'h01;
      2'b11 : sbox_out = 8'hE5;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h00;
      2'b01 : sbox_out = 8'h68;
      2'b10 : sbox_out = 8'h98;
      2'b11 : sbox_out = 8'hA0;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hC5;
      2'b01 : sbox_out = 8'h02;
      2'b10 : sbox_out = 8'hA6;
      2'b11 : sbox_out = 8'h74;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h2D;
      2'b01 : sbox_out = 8'h0B;
      2'b10 : sbox_out = 8'hA2;
      2'b11 : sbox_out = 8'h76;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hB3;
      2'b01 : sbox_out = 8'hBE;
      2'b10 : sbox_out = 8'hCE;
      2'b11 : sbox_out = 8'hBD;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hAE;
      2'b01 : sbox_out = 8'hE9;
      2'b10 : sbox_out = 8'h8A;
      2'b11 : sbox_out = 8'h31;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h1C;
      2'b01 : sbox_out = 8'hEC;
      2'b10 : sbox_out = 8'hF1;
      2'b11 : sbox_out = 8'h99;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h94;
      2'b01 : sbox_out = 8'hAA;
      2'b10 : sbox_out = 8'hF6;
      2'b11 : sbox_out = 8'h26;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h2F;
      2'b01 : sbox_out = 8'hEF;
      2'b10 : sbox_out = 8'hE8;
      2'b11 : sbox_out = 8'h8C;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h35;
      2'b01 : sbox_out = 8'h03;
      2'b10 : sbox_out = 8'hD4;
      2'b11 : sbox_out = 8'h7F;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hFB;
      2'b01 : sbox_out = 8'h05;
      2'b10 : sbox_out = 8'hC1;
      2'b11 : sbox_out = 8'h5E;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h90;
      2'b01 : sbox_out = 8'h20;
      2'b10 : sbox_out = 8'h3D;
      2'b11 : sbox_out = 8'h82;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hF7;
      2'b01 : sbox_out = 8'hEA;
      2'b10 : sbox_out = 8'h0A;
      2'b11 : sbox_out = 8'h0D;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h7E;
      2'b01 : sbox_out = 8'hF8;
      2'b10 : sbox_out = 8'h50;
      2'b11 : sbox_out = 8'h1A;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hC4;
      2'b01 : sbox_out = 8'h07;
      2'b10 : sbox_out = 8'h57;
      2'b11 : sbox_out = 8'hB8;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h3C;
      2'b01 : sbox_out = 8'h62;
      2'b10 : sbox_out = 8'hE3;
      2'b11 : sbox_out = 8'hC8;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hAC;
      2'b01 : sbox_out = 8'h52;
      2'b10 : sbox_out = 8'h64;
      2'b11 : sbox_out = 8'h10;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hD0;
      2'b01 : sbox_out = 8'hD9;
      2'b10 : sbox_out = 8'h13;
      2'b11 : sbox_out = 8'h0C;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h12;
      2'b01 : sbox_out = 8'h29;
      2'b10 : sbox_out = 8'h51;
      2'b11 : sbox_out = 8'hB9;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hCF;
      2'b01 : sbox_out = 8'hD6;
      2'b10 : sbox_out = 8'h73;
      2'b11 : sbox_out = 8'h8D;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h81;
      2'b01 : sbox_out = 8'h54;
      2'b10 : sbox_out = 8'hC0;
      2'b11 : sbox_out = 8'hED;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h4E;
      2'b01 : sbox_out = 8'h44;
      2'b10 : sbox_out = 8'hA7;
      2'b11 : sbox_out = 8'h2A;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h85;
      2'b01 : sbox_out = 8'h25;
      2'b10 : sbox_out = 8'hE6;
      2'b11 : sbox_out = 8'hCA;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h7C;
      2'b01 : sbox_out = 8'h8B;
      2'b10 : sbox_out = 8'h56;
      2'b11 : sbox_out = 8'h80;
      default : sbox_out = 8'd0;
    endcase
  end
  else begin
    sbox_out = 8'd0;
  end
end

endmodule

// SBOX 1
module sbox_1 (sbox_in, sbox_out);

input [7:0] sbox_in;
output reg [7:0] sbox_out;

always @ (*) begin
  case (sbox_in)
    8'b00000000 : sbox_out = 8'hCE;
    8'b00000001 : sbox_out = 8'hBB;
    8'b00000010 : sbox_out = 8'hEB;
    8'b00000011 : sbox_out = 8'h92;
    8'b00000100 : sbox_out = 8'hEA;
    8'b00000101 : sbox_out = 8'hCB;
    8'b00000110 : sbox_out = 8'h13;
    8'b00000111 : sbox_out = 8'hC1;
    8'b00001000 : sbox_out = 8'hE9;
    8'b00001001 : sbox_out = 8'h3A;
    8'b00001010 : sbox_out = 8'hD6;
    8'b00001011 : sbox_out = 8'hB2;
    8'b00001100 : sbox_out = 8'hD2;
    8'b00001101 : sbox_out = 8'h90;
    8'b00001110 : sbox_out = 8'h17;
    8'b00001111 : sbox_out = 8'hF8;

    8'b00010000 : sbox_out = 8'h42;
    8'b00010001 : sbox_out = 8'h15;
    8'b00010010 : sbox_out = 8'h56;
    8'b00010011 : sbox_out = 8'hB4;
    8'b00010100 : sbox_out = 8'h65;
    8'b00010101 : sbox_out = 8'h1C;
    8'b00010110 : sbox_out = 8'h88;
    8'b00010111 : sbox_out = 8'h43;
    8'b00011000 : sbox_out = 8'hC5;
    8'b00011001 : sbox_out = 8'h5C;
    8'b00011010 : sbox_out = 8'h36;
    8'b00011011 : sbox_out = 8'hBA;
    8'b00011100 : sbox_out = 8'hF5;
    8'b00011101 : sbox_out = 8'h57;
    8'b00011110 : sbox_out = 8'h67;
    8'b00011111 : sbox_out = 8'h8D;

    8'b00100000 : sbox_out = 8'h31;
    8'b00100001 : sbox_out = 8'hF6;
    8'b00100010 : sbox_out = 8'h64;
    8'b00100011 : sbox_out = 8'h58;
    8'b00100100 : sbox_out = 8'h9E;
    8'b00100101 : sbox_out = 8'hF4;
    8'b00100110 : sbox_out = 8'h22;
    8'b00100111 : sbox_out = 8'hAA;
    8'b00101000 : sbox_out = 8'h75;
    8'b00101001 : sbox_out = 8'h0F;
    8'b00101010 : sbox_out = 8'h02;
    8'b00101011 : sbox_out = 8'hB1;
    8'b00101100 : sbox_out = 8'hDF;
    8'b00101101 : sbox_out = 8'h6D;
    8'b00101110 : sbox_out = 8'h73;
    8'b00101111 : sbox_out = 8'h4D;

    8'b00110000 : sbox_out = 8'h7C;
    8'b00110001 : sbox_out = 8'h26;
    8'b00110010 : sbox_out = 8'h2E;
    8'b00110011 : sbox_out = 8'hF7;
    8'b00110100 : sbox_out = 8'h08;
    8'b00110101 : sbox_out = 8'h5D;
    8'b00110110 : sbox_out = 8'h44;
    8'b00110111 : sbox_out = 8'h3E;
    8'b00111000 : sbox_out = 8'h9F;
    8'b00111001 : sbox_out = 8'h14;
    8'b00111010 : sbox_out = 8'hC8;
    8'b00111011 : sbox_out = 8'hAE;
    8'b00111100 : sbox_out = 8'h54;
    8'b00111101 : sbox_out = 8'h10;
    8'b00111110 : sbox_out = 8'hD8;
    8'b00111111 : sbox_out = 8'hBC;

    8'b01000000 : sbox_out = 8'h1A;
    8'b01000001 : sbox_out = 8'h6B;
    8'b01000010 : sbox_out = 8'h69;
    8'b01000011 : sbox_out = 8'hF3;
    8'b01000100 : sbox_out = 8'hBD;
    8'b01000101 : sbox_out = 8'h33;
    8'b01000110 : sbox_out = 8'hAB;
    8'b01000111 : sbox_out = 8'hFA;
    8'b01001000 : sbox_out = 8'hD1;
    8'b01001001 : sbox_out = 8'h9B;
    8'b01001010 : sbox_out = 8'h68;
    8'b01001011 : sbox_out = 8'h4E;
    8'b01001100 : sbox_out = 8'h16;
    8'b01001101 : sbox_out = 8'h95;
    8'b01001110 : sbox_out = 8'h91;
    8'b01001111 : sbox_out = 8'hEE;

    8'b01010000 : sbox_out = 8'h4C;
    8'b01010001 : sbox_out = 8'h63;
    8'b01010010 : sbox_out = 8'h8E;
    8'b01010011 : sbox_out = 8'h5B;
    8'b01010100 : sbox_out = 8'hCC;
    8'b01010101 : sbox_out = 8'h3C;
    8'b01010110 : sbox_out = 8'h19;
    8'b01010111 : sbox_out = 8'hA1;
    8'b01011000 : sbox_out = 8'h81;
    8'b01011001 : sbox_out = 8'h49;
    8'b01011010 : sbox_out = 8'h7B;
    8'b01011011 : sbox_out = 8'hD9;
    8'b01011100 : sbox_out = 8'h6F;
    8'b01011101 : sbox_out = 8'h37;
    8'b01011110 : sbox_out = 8'h60;
    8'b01011111 : sbox_out = 8'hCA;

    8'b01100000 : sbox_out = 8'hE7;
    8'b01100001 : sbox_out = 8'h2B;
    8'b01100010 : sbox_out = 8'h48;
    8'b01100011 : sbox_out = 8'hFD;
    8'b01100100 : sbox_out = 8'h96;
    8'b01100101 : sbox_out = 8'h45;
    8'b01100110 : sbox_out = 8'hFC;
    8'b01100111 : sbox_out = 8'h41;
    8'b01101000 : sbox_out = 8'h12;
    8'b01101001 : sbox_out = 8'h0D;
    8'b01101010 : sbox_out = 8'h79;
    8'b01101011 : sbox_out = 8'hE5;
    8'b01101100 : sbox_out = 8'h89;
    8'b01101101 : sbox_out = 8'h8C;
    8'b01101110 : sbox_out = 8'hE3;
    8'b01101111 : sbox_out = 8'h20;

    8'b01110000 : sbox_out = 8'h30;
    8'b01110001 : sbox_out = 8'hDC;
    8'b01110010 : sbox_out = 8'hB7;
    8'b01110011 : sbox_out = 8'h6C;
    8'b01110100 : sbox_out = 8'h4A;
    8'b01110101 : sbox_out = 8'hB5;
    8'b01110110 : sbox_out = 8'h3F;
    8'b01110111 : sbox_out = 8'h97;
    8'b01111000 : sbox_out = 8'hD4;
    8'b01111001 : sbox_out = 8'h62;
    8'b01111010 : sbox_out = 8'h2D;
    8'b01111011 : sbox_out = 8'h06;
    8'b01111100 : sbox_out = 8'hA4;
    8'b01111101 : sbox_out = 8'hA5;
    8'b01111110 : sbox_out = 8'h83;
    8'b01111111 : sbox_out = 8'h5F;

    8'b10000000 : sbox_out = 8'h2A;
    8'b10000001 : sbox_out = 8'hDA;
    8'b10000010 : sbox_out = 8'hC9;
    8'b10000011 : sbox_out = 8'h00;
    8'b10000100 : sbox_out = 8'h7E;
    8'b10000101 : sbox_out = 8'hA2;
    8'b10000110 : sbox_out = 8'h55;
    8'b10000111 : sbox_out = 8'hBF;
    8'b10001000 : sbox_out = 8'h11;
    8'b10001001 : sbox_out = 8'hD5;
    8'b10001010 : sbox_out = 8'h9C;
    8'b10001011 : sbox_out = 8'hCF;
    8'b10001100 : sbox_out = 8'h0E;
    8'b10001101 : sbox_out = 8'h0A;
    8'b10001110 : sbox_out = 8'h3D;
    8'b10001111 : sbox_out = 8'h51;

    8'b10010000 : sbox_out = 8'h7D;
    8'b10010001 : sbox_out = 8'h93;
    8'b10010010 : sbox_out = 8'h1B;
    8'b10010011 : sbox_out = 8'hFE;
    8'b10010100 : sbox_out = 8'hC4;
    8'b10010101 : sbox_out = 8'h47;
    8'b10010110 : sbox_out = 8'h09;
    8'b10010111 : sbox_out = 8'h86;
    8'b10011000 : sbox_out = 8'h0B;
    8'b10011001 : sbox_out = 8'h8F;
    8'b10011010 : sbox_out = 8'h9D;
    8'b10011011 : sbox_out = 8'h6A;
    8'b10011100 : sbox_out = 8'h07;
    8'b10011101 : sbox_out = 8'hB9;
    8'b10011110 : sbox_out = 8'hB0;
    8'b10011111 : sbox_out = 8'h98;

    8'b10100000 : sbox_out = 8'h18;
    8'b10100001 : sbox_out = 8'h32;
    8'b10100010 : sbox_out = 8'h71;
    8'b10100011 : sbox_out = 8'h4B;
    8'b10100100 : sbox_out = 8'hEF;
    8'b10100101 : sbox_out = 8'h3B;
    8'b10100110 : sbox_out = 8'h70;
    8'b10100111 : sbox_out = 8'hA0;
    8'b10101000 : sbox_out = 8'hE4;
    8'b10101001 : sbox_out = 8'h40;
    8'b10101010 : sbox_out = 8'hFF;
    8'b10101011 : sbox_out = 8'hC3;
    8'b10101100 : sbox_out = 8'hA9;
    8'b10101101 : sbox_out = 8'hE6;
    8'b10101110 : sbox_out = 8'h78;
    8'b10101111 : sbox_out = 8'hF9;

    8'b10110000 : sbox_out = 8'h8B;
    8'b10110001 : sbox_out = 8'h46;
    8'b10110010 : sbox_out = 8'h80;
    8'b10110011 : sbox_out = 8'h1E;
    8'b10110100 : sbox_out = 8'h38;
    8'b10110101 : sbox_out = 8'hE1;
    8'b10110110 : sbox_out = 8'hB8;
    8'b10110111 : sbox_out = 8'hA8;
    8'b10111000 : sbox_out = 8'hE0;
    8'b10111001 : sbox_out = 8'h0C;
    8'b10111010 : sbox_out = 8'h23;
    8'b10111011 : sbox_out = 8'h76;
    8'b10111100 : sbox_out = 8'h1D;
    8'b10111101 : sbox_out = 8'h25;
    8'b10111110 : sbox_out = 8'h24;
    8'b10111111 : sbox_out = 8'h05;

    8'b11000000 : sbox_out = 8'hF1;
    8'b11000001 : sbox_out = 8'h6E;
    8'b11000010 : sbox_out = 8'h94;
    8'b11000011 : sbox_out = 8'h28;
    8'b11000100 : sbox_out = 8'h9A;
    8'b11000101 : sbox_out = 8'h84;
    8'b11000110 : sbox_out = 8'hE8;
    8'b11000111 : sbox_out = 8'hA3;
    8'b11001000 : sbox_out = 8'h4F;
    8'b11001001 : sbox_out = 8'h77;
    8'b11001010 : sbox_out = 8'hD3;
    8'b11001011 : sbox_out = 8'h85;
    8'b11001100 : sbox_out = 8'hE2;
    8'b11001101 : sbox_out = 8'h52;
    8'b11001110 : sbox_out = 8'hF2;
    8'b11001111 : sbox_out = 8'h82;

    8'b11010000 : sbox_out = 8'h50;
    8'b11010001 : sbox_out = 8'h7A;
    8'b11010010 : sbox_out = 8'h2F;
    8'b11010011 : sbox_out = 8'h74;
    8'b11010100 : sbox_out = 8'h53;
    8'b11010101 : sbox_out = 8'hB3;
    8'b11010110 : sbox_out = 8'h61;
    8'b11010111 : sbox_out = 8'hAF;
    8'b11011000 : sbox_out = 8'h39;
    8'b11011001 : sbox_out = 8'h35;
    8'b11011010 : sbox_out = 8'hDE;
    8'b11011011 : sbox_out = 8'hCD;
    8'b11011100 : sbox_out = 8'h1F;
    8'b11011101 : sbox_out = 8'h99;
    8'b11011110 : sbox_out = 8'hAC;
    8'b11011111 : sbox_out = 8'hAD;

    8'b11100000 : sbox_out = 8'h72;
    8'b11100001 : sbox_out = 8'h2C;
    8'b11100010 : sbox_out = 8'hDD;
    8'b11100011 : sbox_out = 8'hD0;
    8'b11100100 : sbox_out = 8'h87;
    8'b11100101 : sbox_out = 8'hBE;
    8'b11100110 : sbox_out = 8'h5E;
    8'b11100111 : sbox_out = 8'hA6;
    8'b11101000 : sbox_out = 8'hEC;
    8'b11101001 : sbox_out = 8'h04;
    8'b11101010 : sbox_out = 8'hC6;
    8'b11101011 : sbox_out = 8'h03;
    8'b11101100 : sbox_out = 8'h34;
    8'b11101101 : sbox_out = 8'hFB;
    8'b11101110 : sbox_out = 8'hDB;
    8'b11101111 : sbox_out = 8'h59;

    8'b11110000 : sbox_out = 8'hB6;
    8'b11110001 : sbox_out = 8'hC2;
    8'b11110010 : sbox_out = 8'h01;
    8'b11110011 : sbox_out = 8'hF0;
    8'b11110100 : sbox_out = 8'h5A;
    8'b11110101 : sbox_out = 8'hED;
    8'b11110110 : sbox_out = 8'hA7;
    8'b11110111 : sbox_out = 8'h66;
    8'b11111000 : sbox_out = 8'h21;
    8'b11111001 : sbox_out = 8'h7F;
    8'b11111010 : sbox_out = 8'h8A;
    8'b11111011 : sbox_out = 8'h27;
    8'b11111100 : sbox_out = 8'hC7;
    8'b11111101 : sbox_out = 8'hC0;
    8'b11111110 : sbox_out = 8'h29;
    8'b11111111 : sbox_out = 8'hD7;

    default : sbox_out = 8'd0;
  endcase
end

endmodule

//SBOX 1 - Alternative 6
module sbox_1_alt6 (sbox_in, sbox_out);

input [7:0] sbox_in;
output reg [7:0] sbox_out;

always @ (*) begin
  if (sbox_in[7:2] == 6'b000000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hCE;
      2'b01 : sbox_out = 8'hBB;
      2'b10 : sbox_out = 8'hEB;
      2'b11 : sbox_out = 8'h92;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hEA;
      2'b01 : sbox_out = 8'hCB;
      2'b10 : sbox_out = 8'h13;
      2'b11 : sbox_out = 8'hC1;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hE9;
      2'b01 : sbox_out = 8'h3A;
      2'b10 : sbox_out = 8'hD6;
      2'b11 : sbox_out = 8'hB2;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hD2;
      2'b01 : sbox_out = 8'h90;
      2'b10 : sbox_out = 8'h17;
      2'b11 : sbox_out = 8'hF8;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h42;
      2'b01 : sbox_out = 8'h15;
      2'b10 : sbox_out = 8'h56;
      2'b11 : sbox_out = 8'hB4;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h65;
      2'b01 : sbox_out = 8'h1C;
      2'b10 : sbox_out = 8'h88;
      2'b11 : sbox_out = 8'h43;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hC5;
      2'b01 : sbox_out = 8'h5C;
      2'b10 : sbox_out = 8'h36;
      2'b11 : sbox_out = 8'hBA;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hF5;
      2'b01 : sbox_out = 8'h57;
      2'b10 : sbox_out = 8'h67;
      2'b11 : sbox_out = 8'h8D;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h31;
      2'b01 : sbox_out = 8'hF6;
      2'b10 : sbox_out = 8'h64;
      2'b11 : sbox_out = 8'h58;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h9E;
      2'b01 : sbox_out = 8'hF4;
      2'b10 : sbox_out = 8'h22;
      2'b11 : sbox_out = 8'hAA;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h75;
      2'b01 : sbox_out = 8'h0F;
      2'b10 : sbox_out = 8'h02;
      2'b11 : sbox_out = 8'hB1;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hDF;
      2'b01 : sbox_out = 8'h6D;
      2'b10 : sbox_out = 8'h73;
      2'b11 : sbox_out = 8'h4D;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h7C;
      2'b01 : sbox_out = 8'h26;
      2'b10 : sbox_out = 8'h2E;
      2'b11 : sbox_out = 8'hF7;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h08;
      2'b01 : sbox_out = 8'h5D;
      2'b10 : sbox_out = 8'h44;
      2'b11 : sbox_out = 8'h3E;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h9F;
      2'b01 : sbox_out = 8'h14;
      2'b10 : sbox_out = 8'hC8;
      2'b11 : sbox_out = 8'hAE;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h54;
      2'b01 : sbox_out = 8'h10;
      2'b10 : sbox_out = 8'hD8;
      2'b11 : sbox_out = 8'hBC;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h1A;
      2'b01 : sbox_out = 8'h6B;
      2'b10 : sbox_out = 8'h69;
      2'b11 : sbox_out = 8'hF3;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hBD;
      2'b01 : sbox_out = 8'h33;
      2'b10 : sbox_out = 8'hAB;
      2'b11 : sbox_out = 8'hFA;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hD1;
      2'b01 : sbox_out = 8'h9B;
      2'b10 : sbox_out = 8'h68;
      2'b11 : sbox_out = 8'h4E;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h16;
      2'b01 : sbox_out = 8'h95;
      2'b10 : sbox_out = 8'h91;
      2'b11 : sbox_out = 8'hEE;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h4C;
      2'b01 : sbox_out = 8'h63;
      2'b10 : sbox_out = 8'h8E;
      2'b11 : sbox_out = 8'h5B;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hCC;
      2'b01 : sbox_out = 8'h3C;
      2'b10 : sbox_out = 8'h19;
      2'b11 : sbox_out = 8'hA1;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h81;
      2'b01 : sbox_out = 8'h49;
      2'b10 : sbox_out = 8'h7B;
      2'b11 : sbox_out = 8'hD9;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h6F;
      2'b01 : sbox_out = 8'h37;
      2'b10 : sbox_out = 8'h60;
      2'b11 : sbox_out = 8'hCA;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hE7;
      2'b01 : sbox_out = 8'h2B;
      2'b10 : sbox_out = 8'h48;
      2'b11 : sbox_out = 8'hFD;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h96;
      2'b01 : sbox_out = 8'h45;
      2'b10 : sbox_out = 8'hFC;
      2'b11 : sbox_out = 8'h41;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h12;
      2'b01 : sbox_out = 8'h0D;
      2'b10 : sbox_out = 8'h79;
      2'b11 : sbox_out = 8'hE5;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h89;
      2'b01 : sbox_out = 8'h8C;
      2'b10 : sbox_out = 8'hE3;
      2'b11 : sbox_out = 8'h20;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h30;
      2'b01 : sbox_out = 8'hDC;
      2'b10 : sbox_out = 8'hB7;
      2'b11 : sbox_out = 8'h6C;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h4A;
      2'b01 : sbox_out = 8'hB5;
      2'b10 : sbox_out = 8'h3F;
      2'b11 : sbox_out = 8'h97;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hD4;
      2'b01 : sbox_out = 8'h62;
      2'b10 : sbox_out = 8'h2D;
      2'b11 : sbox_out = 8'h06;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hA4;
      2'b01 : sbox_out = 8'hA5;
      2'b10 : sbox_out = 8'h83;
      2'b11 : sbox_out = 8'h5F;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h2A;
      2'b01 : sbox_out = 8'hDA;
      2'b10 : sbox_out = 8'hC9;
      2'b11 : sbox_out = 8'h00;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h7E;
      2'b01 : sbox_out = 8'hA2;
      2'b10 : sbox_out = 8'h55;
      2'b11 : sbox_out = 8'hBF;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h11;
      2'b01 : sbox_out = 8'hD5;
      2'b10 : sbox_out = 8'h9C;
      2'b11 : sbox_out = 8'hCF;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h0E;
      2'b01 : sbox_out = 8'h0A;
      2'b10 : sbox_out = 8'h3D;
      2'b11 : sbox_out = 8'h51;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h7D;
      2'b01 : sbox_out = 8'h93;
      2'b10 : sbox_out = 8'h1B;
      2'b11 : sbox_out = 8'hFE;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hC4;
      2'b01 : sbox_out = 8'h47;
      2'b10 : sbox_out = 8'h09;
      2'b11 : sbox_out = 8'h86;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h0B;
      2'b01 : sbox_out = 8'h8F;
      2'b10 : sbox_out = 8'h9D;
      2'b11 : sbox_out = 8'h6A;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h07;
      2'b01 : sbox_out = 8'hB9;
      2'b10 : sbox_out = 8'hB0;
      2'b11 : sbox_out = 8'h98;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h18;
      2'b01 : sbox_out = 8'h32;
      2'b10 : sbox_out = 8'h71;
      2'b11 : sbox_out = 8'h4B;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hEF;
      2'b01 : sbox_out = 8'h3B;
      2'b10 : sbox_out = 8'h70;
      2'b11 : sbox_out = 8'hA0;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hE4;
      2'b01 : sbox_out = 8'h40;
      2'b10 : sbox_out = 8'hFF;
      2'b11 : sbox_out = 8'hC3;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hA9;
      2'b01 : sbox_out = 8'hE6;
      2'b10 : sbox_out = 8'h78;
      2'b11 : sbox_out = 8'hF9;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h8B;
      2'b01 : sbox_out = 8'h46;
      2'b10 : sbox_out = 8'h80;
      2'b11 : sbox_out = 8'h1E;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h38;
      2'b01 : sbox_out = 8'hE1;
      2'b10 : sbox_out = 8'hB8;
      2'b11 : sbox_out = 8'hA8;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hE0;
      2'b01 : sbox_out = 8'h0C;
      2'b10 : sbox_out = 8'h23;
      2'b11 : sbox_out = 8'h76;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h1D;
      2'b01 : sbox_out = 8'h25;
      2'b10 : sbox_out = 8'h24;
      2'b11 : sbox_out = 8'h05;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hF1;
      2'b01 : sbox_out = 8'h6E;
      2'b10 : sbox_out = 8'h94;
      2'b11 : sbox_out = 8'h28;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h9A;
      2'b01 : sbox_out = 8'h84;
      2'b10 : sbox_out = 8'hE8;
      2'b11 : sbox_out = 8'hA3;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h4F;
      2'b01 : sbox_out = 8'h77;
      2'b10 : sbox_out = 8'hD3;
      2'b11 : sbox_out = 8'h85;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hE2;
      2'b01 : sbox_out = 8'h52;
      2'b10 : sbox_out = 8'hF2;
      2'b11 : sbox_out = 8'h82;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h50;
      2'b01 : sbox_out = 8'h7A;
      2'b10 : sbox_out = 8'h2F;
      2'b11 : sbox_out = 8'h74;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h53;
      2'b01 : sbox_out = 8'hB3;
      2'b10 : sbox_out = 8'h61;
      2'b11 : sbox_out = 8'hAF;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h39;
      2'b01 : sbox_out = 8'h35;
      2'b10 : sbox_out = 8'hDE;
      2'b11 : sbox_out = 8'hCD;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h1F;
      2'b01 : sbox_out = 8'h99;
      2'b10 : sbox_out = 8'hAC;
      2'b11 : sbox_out = 8'hAD;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h72;
      2'b01 : sbox_out = 8'h2C;
      2'b10 : sbox_out = 8'hDD;
      2'b11 : sbox_out = 8'hD0;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h87;
      2'b01 : sbox_out = 8'hBE;
      2'b10 : sbox_out = 8'h5E;
      2'b11 : sbox_out = 8'hA6;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hEC;
      2'b01 : sbox_out = 8'h04;
      2'b10 : sbox_out = 8'hC6;
      2'b11 : sbox_out = 8'h03;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h34;
      2'b01 : sbox_out = 8'hFB;
      2'b10 : sbox_out = 8'hDB;
      2'b11 : sbox_out = 8'h59;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hB6;
      2'b01 : sbox_out = 8'hC2;
      2'b10 : sbox_out = 8'h01;
      2'b11 : sbox_out = 8'hF0;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h5A;
      2'b01 : sbox_out = 8'hED;
      2'b10 : sbox_out = 8'hA7;
      2'b11 : sbox_out = 8'h66;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h21;
      2'b01 : sbox_out = 8'h7F;
      2'b10 : sbox_out = 8'h8A;
      2'b11 : sbox_out = 8'h27;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hC7;
      2'b01 : sbox_out = 8'hC0;
      2'b10 : sbox_out = 8'h29;
      2'b11 : sbox_out = 8'hD7;
      default : sbox_out = 8'd0;
    endcase
  end
  else begin
    sbox_out = 8'd0;
  end
end

endmodule

//SBOX 2
module sbox_2 (sbox_in, sbox_out);

input [7:0] sbox_in;
output reg [7:0] sbox_out;

always @ (*) begin
  case (sbox_in)
    8'b00000000 : sbox_out = 8'h93;
    8'b00000001 : sbox_out = 8'hD9;
    8'b00000010 : sbox_out = 8'h9A;
    8'b00000011 : sbox_out = 8'hB5;
    8'b00000100 : sbox_out = 8'h98;
    8'b00000101 : sbox_out = 8'h22;
    8'b00000110 : sbox_out = 8'h45;
    8'b00000111 : sbox_out = 8'hFC;
    8'b00001000 : sbox_out = 8'hBA;
    8'b00001001 : sbox_out = 8'h6A;
    8'b00001010 : sbox_out = 8'hDF;
    8'b00001011 : sbox_out = 8'h02;
    8'b00001100 : sbox_out = 8'h9F;
    8'b00001101 : sbox_out = 8'hDC;
    8'b00001110 : sbox_out = 8'h51;
    8'b00001111 : sbox_out = 8'h59;

    8'b00010000 : sbox_out = 8'h4A;
    8'b00010001 : sbox_out = 8'h17;
    8'b00010010 : sbox_out = 8'h2B;
    8'b00010011 : sbox_out = 8'hC2;
    8'b00010100 : sbox_out = 8'h94;
    8'b00010101 : sbox_out = 8'hF4;
    8'b00010110 : sbox_out = 8'hBB;
    8'b00010111 : sbox_out = 8'hA3;
    8'b00011000 : sbox_out = 8'h62;
    8'b00011001 : sbox_out = 8'hE4;
    8'b00011010 : sbox_out = 8'h71;
    8'b00011011 : sbox_out = 8'hD4;
    8'b00011100 : sbox_out = 8'hCD;
    8'b00011101 : sbox_out = 8'h70;
    8'b00011110 : sbox_out = 8'h16;
    8'b00011111 : sbox_out = 8'hE1;

    8'b00100000 : sbox_out = 8'h49;
    8'b00100001 : sbox_out = 8'h3C;
    8'b00100010 : sbox_out = 8'hC0;
    8'b00100011 : sbox_out = 8'hD8;
    8'b00100100 : sbox_out = 8'h5C;
    8'b00100101 : sbox_out = 8'h9B;
    8'b00100110 : sbox_out = 8'hAD;
    8'b00100111 : sbox_out = 8'h85;
    8'b00101000 : sbox_out = 8'h53;
    8'b00101001 : sbox_out = 8'hA1;
    8'b00101010 : sbox_out = 8'h7A;
    8'b00101011 : sbox_out = 8'hC8;
    8'b00101100 : sbox_out = 8'h2D;
    8'b00101101 : sbox_out = 8'hE0;
    8'b00101110 : sbox_out = 8'hD1;
    8'b00101111 : sbox_out = 8'h72;

    8'b00110000 : sbox_out = 8'hA6;
    8'b00110001 : sbox_out = 8'h2C;
    8'b00110010 : sbox_out = 8'hC4;
    8'b00110011 : sbox_out = 8'hE3;
    8'b00110100 : sbox_out = 8'h76;
    8'b00110101 : sbox_out = 8'h78;
    8'b00110110 : sbox_out = 8'hB7;
    8'b00110111 : sbox_out = 8'hB4;
    8'b00111000 : sbox_out = 8'h09;
    8'b00111001 : sbox_out = 8'h3B;
    8'b00111010 : sbox_out = 8'h0E;
    8'b00111011 : sbox_out = 8'h41;
    8'b00111100 : sbox_out = 8'h4C;
    8'b00111101 : sbox_out = 8'hDE;
    8'b00111110 : sbox_out = 8'hB2;
    8'b00111111 : sbox_out = 8'h90;

    8'b01000000 : sbox_out = 8'h25;
    8'b01000001 : sbox_out = 8'hA5;
    8'b01000010 : sbox_out = 8'hD7;
    8'b01000011 : sbox_out = 8'h03;
    8'b01000100 : sbox_out = 8'h11;
    8'b01000101 : sbox_out = 8'h00;
    8'b01000110 : sbox_out = 8'hC3;
    8'b01000111 : sbox_out = 8'h2E;
    8'b01001000 : sbox_out = 8'h92;
    8'b01001001 : sbox_out = 8'hEF;
    8'b01001010 : sbox_out = 8'h4E;
    8'b01001011 : sbox_out = 8'h12;
    8'b01001100 : sbox_out = 8'h9D;
    8'b01001101 : sbox_out = 8'h7D;
    8'b01001110 : sbox_out = 8'hCB;
    8'b01001111 : sbox_out = 8'h35;

    8'b01010000 : sbox_out = 8'h10;
    8'b01010001 : sbox_out = 8'hD5;
    8'b01010010 : sbox_out = 8'h4F;
    8'b01010011 : sbox_out = 8'h9E;
    8'b01010100 : sbox_out = 8'h4D;
    8'b01010101 : sbox_out = 8'hA9;
    8'b01010110 : sbox_out = 8'h55;
    8'b01010111 : sbox_out = 8'hC6;
    8'b01011000 : sbox_out = 8'hD0;
    8'b01011001 : sbox_out = 8'h7B;
    8'b01011010 : sbox_out = 8'h18;
    8'b01011011 : sbox_out = 8'h97;
    8'b01011100 : sbox_out = 8'hD3;
    8'b01011101 : sbox_out = 8'h36;
    8'b01011110 : sbox_out = 8'hE6;
    8'b01011111 : sbox_out = 8'h48;

    8'b01100000 : sbox_out = 8'h56;
    8'b01100001 : sbox_out = 8'h81;
    8'b01100010 : sbox_out = 8'h8F;
    8'b01100011 : sbox_out = 8'h77;
    8'b01100100 : sbox_out = 8'hCC;
    8'b01100101 : sbox_out = 8'h9C;
    8'b01100110 : sbox_out = 8'hB9;
    8'b01100111 : sbox_out = 8'hE2;
    8'b01101000 : sbox_out = 8'hAC;
    8'b01101001 : sbox_out = 8'hB8;
    8'b01101010 : sbox_out = 8'h2F;
    8'b01101011 : sbox_out = 8'h15;
    8'b01101100 : sbox_out = 8'hA4;
    8'b01101101 : sbox_out = 8'h7C;
    8'b01101110 : sbox_out = 8'hDA;
    8'b01101111 : sbox_out = 8'h38;

    8'b01110000 : sbox_out = 8'h1E;
    8'b01110001 : sbox_out = 8'h0B;
    8'b01110010 : sbox_out = 8'h05;
    8'b01110011 : sbox_out = 8'hD6;
    8'b01110100 : sbox_out = 8'h14;
    8'b01110101 : sbox_out = 8'h6E;
    8'b01110110 : sbox_out = 8'h6C;
    8'b01110111 : sbox_out = 8'h7E;
    8'b01111000 : sbox_out = 8'h66;
    8'b01111001 : sbox_out = 8'hFD;
    8'b01111010 : sbox_out = 8'hB1;
    8'b01111011 : sbox_out = 8'hE5;
    8'b01111100 : sbox_out = 8'h60;
    8'b01111101 : sbox_out = 8'hAF;
    8'b01111110 : sbox_out = 8'h5E;
    8'b01111111 : sbox_out = 8'h33;

    8'b10000000 : sbox_out = 8'h87;
    8'b10000001 : sbox_out = 8'hC9;
    8'b10000010 : sbox_out = 8'hF0;
    8'b10000011 : sbox_out = 8'h5D;
    8'b10000100 : sbox_out = 8'h6D;
    8'b10000101 : sbox_out = 8'h3F;
    8'b10000110 : sbox_out = 8'h88;
    8'b10000111 : sbox_out = 8'h8D;
    8'b10001000 : sbox_out = 8'hC7;
    8'b10001001 : sbox_out = 8'hF7;
    8'b10001010 : sbox_out = 8'h1D;
    8'b10001011 : sbox_out = 8'hE9;
    8'b10001100 : sbox_out = 8'hEC;
    8'b10001101 : sbox_out = 8'hED;
    8'b10001110 : sbox_out = 8'h80;
    8'b10001111 : sbox_out = 8'h29;

    8'b10010000 : sbox_out = 8'h27;
    8'b10010001 : sbox_out = 8'hCF;
    8'b10010010 : sbox_out = 8'h99;
    8'b10010011 : sbox_out = 8'hA8;
    8'b10010100 : sbox_out = 8'h50;
    8'b10010101 : sbox_out = 8'h0F;
    8'b10010110 : sbox_out = 8'h37;
    8'b10010111 : sbox_out = 8'h24;
    8'b10011000 : sbox_out = 8'h28;
    8'b10011001 : sbox_out = 8'h30;
    8'b10011010 : sbox_out = 8'h95;
    8'b10011011 : sbox_out = 8'hD2;
    8'b10011100 : sbox_out = 8'h3E;
    8'b10011101 : sbox_out = 8'h5B;
    8'b10011110 : sbox_out = 8'h40;
    8'b10011111 : sbox_out = 8'h83;

    8'b10100000 : sbox_out = 8'hB3;
    8'b10100001 : sbox_out = 8'h69;
    8'b10100010 : sbox_out = 8'h57;
    8'b10100011 : sbox_out = 8'h1F;
    8'b10100100 : sbox_out = 8'h07;
    8'b10100101 : sbox_out = 8'h1C;
    8'b10100110 : sbox_out = 8'h8A;
    8'b10100111 : sbox_out = 8'hBC;
    8'b10101000 : sbox_out = 8'h20;
    8'b10101001 : sbox_out = 8'hEB;
    8'b10101010 : sbox_out = 8'hCE;
    8'b10101011 : sbox_out = 8'h8E;
    8'b10101100 : sbox_out = 8'hAB;
    8'b10101101 : sbox_out = 8'hEE;
    8'b10101110 : sbox_out = 8'h31;
    8'b10101111 : sbox_out = 8'hA2;

    8'b10110000 : sbox_out = 8'h73;
    8'b10110001 : sbox_out = 8'hF9;
    8'b10110010 : sbox_out = 8'hCA;
    8'b10110011 : sbox_out = 8'h3A;
    8'b10110100 : sbox_out = 8'h1A;
    8'b10110101 : sbox_out = 8'hFB;
    8'b10110110 : sbox_out = 8'h0D;
    8'b10110111 : sbox_out = 8'hC1;
    8'b10111000 : sbox_out = 8'hFE;
    8'b10111001 : sbox_out = 8'hFA;
    8'b10111010 : sbox_out = 8'hF2;
    8'b10111011 : sbox_out = 8'h6F;
    8'b10111100 : sbox_out = 8'hBD;
    8'b10111101 : sbox_out = 8'h96;
    8'b10111110 : sbox_out = 8'hDD;
    8'b10111111 : sbox_out = 8'h43;

    8'b11000000 : sbox_out = 8'h52;
    8'b11000001 : sbox_out = 8'hB6;
    8'b11000010 : sbox_out = 8'h08;
    8'b11000011 : sbox_out = 8'hF3;
    8'b11000100 : sbox_out = 8'hAE;
    8'b11000101 : sbox_out = 8'hBE;
    8'b11000110 : sbox_out = 8'h19;
    8'b11000111 : sbox_out = 8'h89;
    8'b11001000 : sbox_out = 8'h32;
    8'b11001001 : sbox_out = 8'h26;
    8'b11001010 : sbox_out = 8'hB0;
    8'b11001011 : sbox_out = 8'hEA;
    8'b11001100 : sbox_out = 8'h4B;
    8'b11001101 : sbox_out = 8'h64;
    8'b11001110 : sbox_out = 8'h84;
    8'b11001111 : sbox_out = 8'h82;

    8'b11010000 : sbox_out = 8'h6B;
    8'b11010001 : sbox_out = 8'hF5;
    8'b11010010 : sbox_out = 8'h79;
    8'b11010011 : sbox_out = 8'hBF;
    8'b11010100 : sbox_out = 8'h01;
    8'b11010101 : sbox_out = 8'h5F;
    8'b11010110 : sbox_out = 8'h75;
    8'b11010111 : sbox_out = 8'h63;
    8'b11011000 : sbox_out = 8'h1B;
    8'b11011001 : sbox_out = 8'h23;
    8'b11011010 : sbox_out = 8'h3D;
    8'b11011011 : sbox_out = 8'h68;
    8'b11011100 : sbox_out = 8'h2A;
    8'b11011101 : sbox_out = 8'h65;
    8'b11011110 : sbox_out = 8'hE8;
    8'b11011111 : sbox_out = 8'h91;

    8'b11100000 : sbox_out = 8'hF6;
    8'b11100001 : sbox_out = 8'hFF;
    8'b11100010 : sbox_out = 8'h13;
    8'b11100011 : sbox_out = 8'h58;
    8'b11100100 : sbox_out = 8'hF1;
    8'b11100101 : sbox_out = 8'h47;
    8'b11100110 : sbox_out = 8'h0A;
    8'b11100111 : sbox_out = 8'h7F;
    8'b11101000 : sbox_out = 8'hC5;
    8'b11101001 : sbox_out = 8'hA7;
    8'b11101010 : sbox_out = 8'hE7;
    8'b11101011 : sbox_out = 8'h61;
    8'b11101100 : sbox_out = 8'h5A;
    8'b11101101 : sbox_out = 8'h06;
    8'b11101110 : sbox_out = 8'h46;
    8'b11101111 : sbox_out = 8'h44;

    8'b11110000 : sbox_out = 8'h42;
    8'b11110001 : sbox_out = 8'h04;
    8'b11110010 : sbox_out = 8'hA0;
    8'b11110011 : sbox_out = 8'hDB;
    8'b11110100 : sbox_out = 8'h39;
    8'b11110101 : sbox_out = 8'h86;
    8'b11110110 : sbox_out = 8'h54;
    8'b11110111 : sbox_out = 8'hAA;
    8'b11111000 : sbox_out = 8'h8C;
    8'b11111001 : sbox_out = 8'h34;
    8'b11111010 : sbox_out = 8'h21;
    8'b11111011 : sbox_out = 8'h8B;
    8'b11111100 : sbox_out = 8'hF8;
    8'b11111101 : sbox_out = 8'h0C;
    8'b11111110 : sbox_out = 8'h74;
    8'b11111111 : sbox_out = 8'h67;

    default : sbox_out = 8'd0;
  endcase
end

endmodule

//SBOX 2 - Alternative 6
module sbox_2_alt6 (sbox_in, sbox_out);

input [7:0] sbox_in;
output reg [7:0] sbox_out;

always @ (*) begin
  if (sbox_in[7:2] == 6'b000000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h93;
      2'b01 : sbox_out = 8'hD9;
      2'b10 : sbox_out = 8'h9A;
      2'b11 : sbox_out = 8'hB5;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h98;
      2'b01 : sbox_out = 8'h22;
      2'b10 : sbox_out = 8'h45;
      2'b11 : sbox_out = 8'hFC;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hBA;
      2'b01 : sbox_out = 8'h6A;
      2'b10 : sbox_out = 8'hDF;
      2'b11 : sbox_out = 8'h02;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h9F;
      2'b01 : sbox_out = 8'hDC;
      2'b10 : sbox_out = 8'h51;
      2'b11 : sbox_out = 8'h59;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h4A;
      2'b01 : sbox_out = 8'h17;
      2'b10 : sbox_out = 8'h2B;
      2'b11 : sbox_out = 8'hC2;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h94;
      2'b01 : sbox_out = 8'hF4;
      2'b10 : sbox_out = 8'hBB;
      2'b11 : sbox_out = 8'hA3;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h62;
      2'b01 : sbox_out = 8'hE4;
      2'b10 : sbox_out = 8'h71;
      2'b11 : sbox_out = 8'hD4;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hCD;
      2'b01 : sbox_out = 8'h70;
      2'b10 : sbox_out = 8'h16;
      2'b11 : sbox_out = 8'hE1;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h49;
      2'b01 : sbox_out = 8'h3C;
      2'b10 : sbox_out = 8'hC0;
      2'b11 : sbox_out = 8'hD8;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h5C;
      2'b01 : sbox_out = 8'h9B;
      2'b10 : sbox_out = 8'hAD;
      2'b11 : sbox_out = 8'h85;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h53;
      2'b01 : sbox_out = 8'hA1;
      2'b10 : sbox_out = 8'h7A;
      2'b11 : sbox_out = 8'hC8;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h2D;
      2'b01 : sbox_out = 8'hE0;
      2'b10 : sbox_out = 8'hD1;
      2'b11 : sbox_out = 8'h72;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hA6;
      2'b01 : sbox_out = 8'h2C;
      2'b10 : sbox_out = 8'hC4;
      2'b11 : sbox_out = 8'hE3;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h76;
      2'b01 : sbox_out = 8'h78;
      2'b10 : sbox_out = 8'hB7;
      2'b11 : sbox_out = 8'hB4;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h09;
      2'b01 : sbox_out = 8'h3B;
      2'b10 : sbox_out = 8'h0E;
      2'b11 : sbox_out = 8'h41;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h4C;
      2'b01 : sbox_out = 8'hDE;
      2'b10 : sbox_out = 8'hB2;
      2'b11 : sbox_out = 8'h90;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h25;
      2'b01 : sbox_out = 8'hA5;
      2'b10 : sbox_out = 8'hD7;
      2'b11 : sbox_out = 8'h03;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h11;
      2'b01 : sbox_out = 8'h00;
      2'b10 : sbox_out = 8'hC3;
      2'b11 : sbox_out = 8'h2E;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h92;
      2'b01 : sbox_out = 8'hEF;
      2'b10 : sbox_out = 8'h4E;
      2'b11 : sbox_out = 8'h12;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h9D;
      2'b01 : sbox_out = 8'h7D;
      2'b10 : sbox_out = 8'hCB;
      2'b11 : sbox_out = 8'h35;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h10;
      2'b01 : sbox_out = 8'hD5;
      2'b10 : sbox_out = 8'h4F;
      2'b11 : sbox_out = 8'h9E;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h4D;
      2'b01 : sbox_out = 8'hA9;
      2'b10 : sbox_out = 8'h55;
      2'b11 : sbox_out = 8'hC6;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hD0;
      2'b01 : sbox_out = 8'h7B;
      2'b10 : sbox_out = 8'h18;
      2'b11 : sbox_out = 8'h97;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hD3;
      2'b01 : sbox_out = 8'h36;
      2'b10 : sbox_out = 8'hE6;
      2'b11 : sbox_out = 8'h48;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h56;
      2'b01 : sbox_out = 8'h81;
      2'b10 : sbox_out = 8'h8F;
      2'b11 : sbox_out = 8'h77;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hCC;
      2'b01 : sbox_out = 8'h9C;
      2'b10 : sbox_out = 8'hB9;
      2'b11 : sbox_out = 8'hE2;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hAC;
      2'b01 : sbox_out = 8'hB8;
      2'b10 : sbox_out = 8'h2F;
      2'b11 : sbox_out = 8'h15;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hA4;
      2'b01 : sbox_out = 8'h7C;
      2'b10 : sbox_out = 8'hDA;
      2'b11 : sbox_out = 8'h38;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h1E;
      2'b01 : sbox_out = 8'h0B;
      2'b10 : sbox_out = 8'h05;
      2'b11 : sbox_out = 8'hD6;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h14;
      2'b01 : sbox_out = 8'h6E;
      2'b10 : sbox_out = 8'h6C;
      2'b11 : sbox_out = 8'h7E;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h66;
      2'b01 : sbox_out = 8'hFD;
      2'b10 : sbox_out = 8'hB1;
      2'b11 : sbox_out = 8'hE5;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h60;
      2'b01 : sbox_out = 8'hAF;
      2'b10 : sbox_out = 8'h5E;
      2'b11 : sbox_out = 8'h33;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h87;
      2'b01 : sbox_out = 8'hC9;
      2'b10 : sbox_out = 8'hF0;
      2'b11 : sbox_out = 8'h5D;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h6D;
      2'b01 : sbox_out = 8'h3F;
      2'b10 : sbox_out = 8'h88;
      2'b11 : sbox_out = 8'h8D;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hC7;
      2'b01 : sbox_out = 8'hF7;
      2'b10 : sbox_out = 8'h1D;
      2'b11 : sbox_out = 8'hE9;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hEC;
      2'b01 : sbox_out = 8'hED;
      2'b10 : sbox_out = 8'h80;
      2'b11 : sbox_out = 8'h29;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h27;
      2'b01 : sbox_out = 8'hCF;
      2'b10 : sbox_out = 8'h99;
      2'b11 : sbox_out = 8'hA8;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h50;
      2'b01 : sbox_out = 8'h0F;
      2'b10 : sbox_out = 8'h37;
      2'b11 : sbox_out = 8'h24;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h28;
      2'b01 : sbox_out = 8'h30;
      2'b10 : sbox_out = 8'h95;
      2'b11 : sbox_out = 8'hD2;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h3E;
      2'b01 : sbox_out = 8'h5B;
      2'b10 : sbox_out = 8'h40;
      2'b11 : sbox_out = 8'h83;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hB3;
      2'b01 : sbox_out = 8'h69;
      2'b10 : sbox_out = 8'h57;
      2'b11 : sbox_out = 8'h1F;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h07;
      2'b01 : sbox_out = 8'h1C;
      2'b10 : sbox_out = 8'h8A;
      2'b11 : sbox_out = 8'hBC;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h20;
      2'b01 : sbox_out = 8'hEB;
      2'b10 : sbox_out = 8'hCE;
      2'b11 : sbox_out = 8'h8E;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hAB;
      2'b01 : sbox_out = 8'hEE;
      2'b10 : sbox_out = 8'h31;
      2'b11 : sbox_out = 8'hA2;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h73;
      2'b01 : sbox_out = 8'hF9;
      2'b10 : sbox_out = 8'hCA;
      2'b11 : sbox_out = 8'h3A;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h1A;
      2'b01 : sbox_out = 8'hFB;
      2'b10 : sbox_out = 8'h0D;
      2'b11 : sbox_out = 8'hC1;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hFE;
      2'b01 : sbox_out = 8'hFA;
      2'b10 : sbox_out = 8'hF2;
      2'b11 : sbox_out = 8'h6F;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hBD;
      2'b01 : sbox_out = 8'h96;
      2'b10 : sbox_out = 8'hDD;
      2'b11 : sbox_out = 8'h43;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h52;
      2'b01 : sbox_out = 8'hB6;
      2'b10 : sbox_out = 8'h08;
      2'b11 : sbox_out = 8'hF3;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hAE;
      2'b01 : sbox_out = 8'hBE;
      2'b10 : sbox_out = 8'h19;
      2'b11 : sbox_out = 8'h89;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h32;
      2'b01 : sbox_out = 8'h26;
      2'b10 : sbox_out = 8'hB0;
      2'b11 : sbox_out = 8'hEA;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h4B;
      2'b01 : sbox_out = 8'h64;
      2'b10 : sbox_out = 8'h84;
      2'b11 : sbox_out = 8'h82;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h6B;
      2'b01 : sbox_out = 8'hF5;
      2'b10 : sbox_out = 8'h79;
      2'b11 : sbox_out = 8'hBF;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h01;
      2'b01 : sbox_out = 8'h5F;
      2'b10 : sbox_out = 8'h75;
      2'b11 : sbox_out = 8'h63;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h1B;
      2'b01 : sbox_out = 8'h23;
      2'b10 : sbox_out = 8'h3D;
      2'b11 : sbox_out = 8'h68;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h2A;
      2'b01 : sbox_out = 8'h65;
      2'b10 : sbox_out = 8'hE8;
      2'b11 : sbox_out = 8'h91;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hF6;
      2'b01 : sbox_out = 8'hFF;
      2'b10 : sbox_out = 8'h13;
      2'b11 : sbox_out = 8'h58;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hF1;
      2'b01 : sbox_out = 8'h47;
      2'b10 : sbox_out = 8'h0A;
      2'b11 : sbox_out = 8'h7F;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hC5;
      2'b01 : sbox_out = 8'hA7;
      2'b10 : sbox_out = 8'hE7;
      2'b11 : sbox_out = 8'h61;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h5A;
      2'b01 : sbox_out = 8'h06;
      2'b10 : sbox_out = 8'h46;
      2'b11 : sbox_out = 8'h44;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h42;
      2'b01 : sbox_out = 8'h04;
      2'b10 : sbox_out = 8'hA0;
      2'b11 : sbox_out = 8'hDB;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h39;
      2'b01 : sbox_out = 8'h86;
      2'b10 : sbox_out = 8'h54;
      2'b11 : sbox_out = 8'hAA;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h8C;
      2'b01 : sbox_out = 8'h34;
      2'b10 : sbox_out = 8'h21;
      2'b11 : sbox_out = 8'h8B;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hF8;
      2'b01 : sbox_out = 8'h0C;
      2'b10 : sbox_out = 8'h74;
      2'b11 : sbox_out = 8'h67;
      default : sbox_out = 8'd0;
    endcase
  end
  else begin
    sbox_out = 8'd0;
  end
end

endmodule

//SBOX 3
module sbox_3 (sbox_in, sbox_out);

input [7:0] sbox_in;
output reg [7:0] sbox_out;

always @ (*) begin
  case (sbox_in)
    8'b00000000 : sbox_out = 8'h68;
    8'b00000001 : sbox_out = 8'h8D;
    8'b00000010 : sbox_out = 8'hCA;
    8'b00000011 : sbox_out = 8'h4D;
    8'b00000100 : sbox_out = 8'h73;
    8'b00000101 : sbox_out = 8'h4B;
    8'b00000110 : sbox_out = 8'h4E;
    8'b00000111 : sbox_out = 8'h2A;
    8'b00001000 : sbox_out = 8'hD4;
    8'b00001001 : sbox_out = 8'h52;
    8'b00001010 : sbox_out = 8'h26;
    8'b00001011 : sbox_out = 8'hB3;
    8'b00001100 : sbox_out = 8'h54;
    8'b00001101 : sbox_out = 8'h1E;
    8'b00001110 : sbox_out = 8'h19;
    8'b00001111 : sbox_out = 8'h1F;

    8'b00010000 : sbox_out = 8'h22;
    8'b00010001 : sbox_out = 8'h03;
    8'b00010010 : sbox_out = 8'h46;
    8'b00010011 : sbox_out = 8'h3D;
    8'b00010100 : sbox_out = 8'h2D;
    8'b00010101 : sbox_out = 8'h4A;
    8'b00010110 : sbox_out = 8'h53;
    8'b00010111 : sbox_out = 8'h83;
    8'b00011000 : sbox_out = 8'h13;
    8'b00011001 : sbox_out = 8'h8A;
    8'b00011010 : sbox_out = 8'hB7;
    8'b00011011 : sbox_out = 8'hD5;
    8'b00011100 : sbox_out = 8'h25;
    8'b00011101 : sbox_out = 8'h79;
    8'b00011110 : sbox_out = 8'hF5;
    8'b00011111 : sbox_out = 8'hBD;

    8'b00100000 : sbox_out = 8'h58;
    8'b00100001 : sbox_out = 8'h2F;
    8'b00100010 : sbox_out = 8'h0D;
    8'b00100011 : sbox_out = 8'h02;
    8'b00100100 : sbox_out = 8'hED;
    8'b00100101 : sbox_out = 8'h51;
    8'b00100110 : sbox_out = 8'h9E;
    8'b00100111 : sbox_out = 8'h11;
    8'b00101000 : sbox_out = 8'hF2;
    8'b00101001 : sbox_out = 8'h3E;
    8'b00101010 : sbox_out = 8'h55;
    8'b00101011 : sbox_out = 8'h5E;
    8'b00101100 : sbox_out = 8'hD1;
    8'b00101101 : sbox_out = 8'h16;
    8'b00101110 : sbox_out = 8'h3C;
    8'b00101111 : sbox_out = 8'h66;

    8'b00110000 : sbox_out = 8'h70;
    8'b00110001 : sbox_out = 8'h5D;
    8'b00110010 : sbox_out = 8'hF3;
    8'b00110011 : sbox_out = 8'h45;
    8'b00110100 : sbox_out = 8'h40;
    8'b00110101 : sbox_out = 8'hCC;
    8'b00110110 : sbox_out = 8'hE8;
    8'b00110111 : sbox_out = 8'h94;
    8'b00111000 : sbox_out = 8'h56;
    8'b00111001 : sbox_out = 8'h08;
    8'b00111010 : sbox_out = 8'hCE;
    8'b00111011 : sbox_out = 8'h1A;
    8'b00111100 : sbox_out = 8'h3A;
    8'b00111101 : sbox_out = 8'hD2;
    8'b00111110 : sbox_out = 8'hE1;
    8'b00111111 : sbox_out = 8'hDF;

    8'b01000000 : sbox_out = 8'hB5;
    8'b01000001 : sbox_out = 8'h38;
    8'b01000010 : sbox_out = 8'h6E;
    8'b01000011 : sbox_out = 8'h0E;
    8'b01000100 : sbox_out = 8'hE5;
    8'b01000101 : sbox_out = 8'hF4;
    8'b01000110 : sbox_out = 8'hF9;
    8'b01000111 : sbox_out = 8'h86;
    8'b01001000 : sbox_out = 8'hE9;
    8'b01001001 : sbox_out = 8'h4F;
    8'b01001010 : sbox_out = 8'hD6;
    8'b01001011 : sbox_out = 8'h85;
    8'b01001100 : sbox_out = 8'h23;
    8'b01001101 : sbox_out = 8'hCF;
    8'b01001110 : sbox_out = 8'h32;
    8'b01001111 : sbox_out = 8'h99;

    8'b01010000 : sbox_out = 8'h31;
    8'b01010001 : sbox_out = 8'h14;
    8'b01010010 : sbox_out = 8'hAE;
    8'b01010011 : sbox_out = 8'hEE;
    8'b01010100 : sbox_out = 8'hC8;
    8'b01010101 : sbox_out = 8'h48;
    8'b01010110 : sbox_out = 8'hD3;
    8'b01010111 : sbox_out = 8'h30;
    8'b01011000 : sbox_out = 8'hA1;
    8'b01011001 : sbox_out = 8'h92;
    8'b01011010 : sbox_out = 8'h41;
    8'b01011011 : sbox_out = 8'hB1;
    8'b01011100 : sbox_out = 8'h18;
    8'b01011101 : sbox_out = 8'hC4;
    8'b01011110 : sbox_out = 8'h2C;
    8'b01011111 : sbox_out = 8'h71;

    8'b01100000 : sbox_out = 8'h72;
    8'b01100001 : sbox_out = 8'h44;
    8'b01100010 : sbox_out = 8'h15;
    8'b01100011 : sbox_out = 8'hFD;
    8'b01100100 : sbox_out = 8'h37;
    8'b01100101 : sbox_out = 8'hBE;
    8'b01100110 : sbox_out = 8'h5F;
    8'b01100111 : sbox_out = 8'hAA;
    8'b01101000 : sbox_out = 8'h9B;
    8'b01101001 : sbox_out = 8'h88;
    8'b01101010 : sbox_out = 8'hD8;
    8'b01101011 : sbox_out = 8'hAB;
    8'b01101100 : sbox_out = 8'h89;
    8'b01101101 : sbox_out = 8'h9C;
    8'b01101110 : sbox_out = 8'hFA;
    8'b01101111 : sbox_out = 8'h60;

    8'b01110000 : sbox_out = 8'hEA;
    8'b01110001 : sbox_out = 8'hBC;
    8'b01110010 : sbox_out = 8'h62;
    8'b01110011 : sbox_out = 8'h0C;
    8'b01110100 : sbox_out = 8'h24;
    8'b01110101 : sbox_out = 8'hA6;
    8'b01110110 : sbox_out = 8'hA8;
    8'b01110111 : sbox_out = 8'hEC;
    8'b01111000 : sbox_out = 8'h67;
    8'b01111001 : sbox_out = 8'h20;
    8'b01111010 : sbox_out = 8'hDB;
    8'b01111011 : sbox_out = 8'h7C;
    8'b01111100 : sbox_out = 8'h28;
    8'b01111101 : sbox_out = 8'hDD;
    8'b01111110 : sbox_out = 8'hAC;
    8'b01111111 : sbox_out = 8'h5B;

    8'b10000000 : sbox_out = 8'h34;
    8'b10000001 : sbox_out = 8'h7E;
    8'b10000010 : sbox_out = 8'h10;
    8'b10000011 : sbox_out = 8'hF1;
    8'b10000100 : sbox_out = 8'h7B;
    8'b10000101 : sbox_out = 8'h8F;
    8'b10000110 : sbox_out = 8'h63;
    8'b10000111 : sbox_out = 8'hA0;
    8'b10001000 : sbox_out = 8'h05;
    8'b10001001 : sbox_out = 8'h9A;
    8'b10001010 : sbox_out = 8'h43;
    8'b10001011 : sbox_out = 8'h77;
    8'b10001100 : sbox_out = 8'h21;
    8'b10001101 : sbox_out = 8'hBF;
    8'b10001110 : sbox_out = 8'h27;
    8'b10001111 : sbox_out = 8'h09;

    8'b10010000 : sbox_out = 8'hC3;
    8'b10010001 : sbox_out = 8'h9F;
    8'b10010010 : sbox_out = 8'hB6;
    8'b10010011 : sbox_out = 8'hD7;
    8'b10010100 : sbox_out = 8'h29;
    8'b10010101 : sbox_out = 8'hC2;
    8'b10010110 : sbox_out = 8'hEB;
    8'b10010111 : sbox_out = 8'hC0;
    8'b10011000 : sbox_out = 8'hA4;
    8'b10011001 : sbox_out = 8'h8B;
    8'b10011010 : sbox_out = 8'h8C;
    8'b10011011 : sbox_out = 8'h1D;
    8'b10011100 : sbox_out = 8'hFB;
    8'b10011101 : sbox_out = 8'hFF;
    8'b10011110 : sbox_out = 8'hC1;
    8'b10011111 : sbox_out = 8'hB2;

    8'b10100000 : sbox_out = 8'h97;
    8'b10100001 : sbox_out = 8'h2E;
    8'b10100010 : sbox_out = 8'hF8;
    8'b10100011 : sbox_out = 8'h65;
    8'b10100100 : sbox_out = 8'hF6;
    8'b10100101 : sbox_out = 8'h75;
    8'b10100110 : sbox_out = 8'h07;
    8'b10100111 : sbox_out = 8'h04;
    8'b10101000 : sbox_out = 8'h49;
    8'b10101001 : sbox_out = 8'h33;
    8'b10101010 : sbox_out = 8'hE4;
    8'b10101011 : sbox_out = 8'hD9;
    8'b10101100 : sbox_out = 8'hB9;
    8'b10101101 : sbox_out = 8'hD0;
    8'b10101110 : sbox_out = 8'h42;
    8'b10101111 : sbox_out = 8'hC7;

    8'b10110000 : sbox_out = 8'h6C;
    8'b10110001 : sbox_out = 8'h90;
    8'b10110010 : sbox_out = 8'h00;
    8'b10110011 : sbox_out = 8'h8E;
    8'b10110100 : sbox_out = 8'h6F;
    8'b10110101 : sbox_out = 8'h50;
    8'b10110110 : sbox_out = 8'h01;
    8'b10110111 : sbox_out = 8'hC5;
    8'b10111000 : sbox_out = 8'hDA;
    8'b10111001 : sbox_out = 8'h47;
    8'b10111010 : sbox_out = 8'h3F;
    8'b10111011 : sbox_out = 8'hCD;
    8'b10111100 : sbox_out = 8'h69;
    8'b10111101 : sbox_out = 8'hA2;
    8'b10111110 : sbox_out = 8'hE2;
    8'b10111111 : sbox_out = 8'h7A;

    8'b11000000 : sbox_out = 8'hA7;
    8'b11000001 : sbox_out = 8'hC6;
    8'b11000010 : sbox_out = 8'h93;
    8'b11000011 : sbox_out = 8'h0F;
    8'b11000100 : sbox_out = 8'h0A;
    8'b11000101 : sbox_out = 8'h06;
    8'b11000110 : sbox_out = 8'hE6;
    8'b11000111 : sbox_out = 8'h2B;
    8'b11001000 : sbox_out = 8'h96;
    8'b11001001 : sbox_out = 8'hA3;
    8'b11001010 : sbox_out = 8'h1C;
    8'b11001011 : sbox_out = 8'hAF;
    8'b11001100 : sbox_out = 8'h6A;
    8'b11001101 : sbox_out = 8'h12;
    8'b11001110 : sbox_out = 8'h84;
    8'b11001111 : sbox_out = 8'h39;

    8'b11010000 : sbox_out = 8'hE7;
    8'b11010001 : sbox_out = 8'hB0;
    8'b11010010 : sbox_out = 8'h82;
    8'b11010011 : sbox_out = 8'hF7;
    8'b11010100 : sbox_out = 8'hFE;
    8'b11010101 : sbox_out = 8'h9D;
    8'b11010110 : sbox_out = 8'h87;
    8'b11010111 : sbox_out = 8'h5C;
    8'b11011000 : sbox_out = 8'h81;
    8'b11011001 : sbox_out = 8'h35;
    8'b11011010 : sbox_out = 8'hDE;
    8'b11011011 : sbox_out = 8'hB4;
    8'b11011100 : sbox_out = 8'hA5;
    8'b11011101 : sbox_out = 8'hFC;
    8'b11011110 : sbox_out = 8'h80;
    8'b11011111 : sbox_out = 8'hEF;

    8'b11100000 : sbox_out = 8'hCB;
    8'b11100001 : sbox_out = 8'hBB;
    8'b11100010 : sbox_out = 8'h6B;
    8'b11100011 : sbox_out = 8'h76;
    8'b11100100 : sbox_out = 8'hBA;
    8'b11100101 : sbox_out = 8'h5A;
    8'b11100110 : sbox_out = 8'h7D;
    8'b11100111 : sbox_out = 8'h78;
    8'b11101000 : sbox_out = 8'h0B;
    8'b11101001 : sbox_out = 8'h95;
    8'b11101010 : sbox_out = 8'hE3;
    8'b11101011 : sbox_out = 8'hAD;
    8'b11101100 : sbox_out = 8'h74;
    8'b11101101 : sbox_out = 8'h98;
    8'b11101110 : sbox_out = 8'h3B;
    8'b11101111 : sbox_out = 8'h36;

    8'b11110000 : sbox_out = 8'h64;
    8'b11110001 : sbox_out = 8'h6D;
    8'b11110010 : sbox_out = 8'hDC;
    8'b11110011 : sbox_out = 8'hF0;
    8'b11110100 : sbox_out = 8'h59;
    8'b11110101 : sbox_out = 8'hA9;
    8'b11110110 : sbox_out = 8'h4C;
    8'b11110111 : sbox_out = 8'h17;
    8'b11111000 : sbox_out = 8'h7F;
    8'b11111001 : sbox_out = 8'h91;
    8'b11111010 : sbox_out = 8'hB8;
    8'b11111011 : sbox_out = 8'hC9;
    8'b11111100 : sbox_out = 8'h57;
    8'b11111101 : sbox_out = 8'h1B;
    8'b11111110 : sbox_out = 8'hE0;
    8'b11111111 : sbox_out = 8'h61;
    default : sbox_out = 8'd0;
  endcase
end

endmodule

//SBOX 3 - Alternative 6
module sbox_3_alt6 (sbox_in, sbox_out);

input [7:0] sbox_in;
output reg [7:0] sbox_out;

always @ (*) begin
  if (sbox_in[7:2] == 6'b000000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h68;
      2'b01 : sbox_out = 8'h8D;
      2'b10 : sbox_out = 8'hCA;
      2'b11 : sbox_out = 8'h4D;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h73;
      2'b01 : sbox_out = 8'h4B;
      2'b10 : sbox_out = 8'h4E;
      2'b11 : sbox_out = 8'h2A;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hD4;
      2'b01 : sbox_out = 8'h52;
      2'b10 : sbox_out = 8'h26;
      2'b11 : sbox_out = 8'hB3;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h54;
      2'b01 : sbox_out = 8'h1E;
      2'b10 : sbox_out = 8'h19;
      2'b11 : sbox_out = 8'h1F;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h22;
      2'b01 : sbox_out = 8'h03;
      2'b10 : sbox_out = 8'h46;
      2'b11 : sbox_out = 8'h3D;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h2D;
      2'b01 : sbox_out = 8'h4A;
      2'b10 : sbox_out = 8'h53;
      2'b11 : sbox_out = 8'h83;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h13;
      2'b01 : sbox_out = 8'h8A;
      2'b10 : sbox_out = 8'hB7;
      2'b11 : sbox_out = 8'hD5;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b000111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h25;
      2'b01 : sbox_out = 8'h79;
      2'b10 : sbox_out = 8'hF5;
      2'b11 : sbox_out = 8'hBD;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h58;
      2'b01 : sbox_out = 8'h2F;
      2'b10 : sbox_out = 8'h0D;
      2'b11 : sbox_out = 8'h02;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hED;
      2'b01 : sbox_out = 8'h51;
      2'b10 : sbox_out = 8'h9E;
      2'b11 : sbox_out = 8'h11;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hF2;
      2'b01 : sbox_out = 8'h3E;
      2'b10 : sbox_out = 8'h55;
      2'b11 : sbox_out = 8'h5E;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hD1;
      2'b01 : sbox_out = 8'h16;
      2'b10 : sbox_out = 8'h3C;
      2'b11 : sbox_out = 8'h66;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h70;
      2'b01 : sbox_out = 8'h5D;
      2'b10 : sbox_out = 8'hF3;
      2'b11 : sbox_out = 8'h45;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h40;
      2'b01 : sbox_out = 8'hCC;
      2'b10 : sbox_out = 8'hE8;
      2'b11 : sbox_out = 8'h94;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h56;
      2'b01 : sbox_out = 8'h08;
      2'b10 : sbox_out = 8'hCE;
      2'b11 : sbox_out = 8'h1A;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b001111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h3A;
      2'b01 : sbox_out = 8'hD2;
      2'b10 : sbox_out = 8'hE1;
      2'b11 : sbox_out = 8'hDF;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hB5;
      2'b01 : sbox_out = 8'h38;
      2'b10 : sbox_out = 8'h6E;
      2'b11 : sbox_out = 8'h0E;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hE5;
      2'b01 : sbox_out = 8'hF4;
      2'b10 : sbox_out = 8'hF9;
      2'b11 : sbox_out = 8'h86;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hE9;
      2'b01 : sbox_out = 8'h4F;
      2'b10 : sbox_out = 8'hD6;
      2'b11 : sbox_out = 8'h85;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h23;
      2'b01 : sbox_out = 8'hCF;
      2'b10 : sbox_out = 8'h32;
      2'b11 : sbox_out = 8'h99;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h31;
      2'b01 : sbox_out = 8'h14;
      2'b10 : sbox_out = 8'hAE;
      2'b11 : sbox_out = 8'hEE;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hC8;
      2'b01 : sbox_out = 8'h48;
      2'b10 : sbox_out = 8'hD3;
      2'b11 : sbox_out = 8'h30;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hA1;
      2'b01 : sbox_out = 8'h92;
      2'b10 : sbox_out = 8'h41;
      2'b11 : sbox_out = 8'hB1;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b010111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h18;
      2'b01 : sbox_out = 8'hC4;
      2'b10 : sbox_out = 8'h2C;
      2'b11 : sbox_out = 8'h71;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h72;
      2'b01 : sbox_out = 8'h44;
      2'b10 : sbox_out = 8'h15;
      2'b11 : sbox_out = 8'hFD;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h37;
      2'b01 : sbox_out = 8'hBE;
      2'b10 : sbox_out = 8'h5F;
      2'b11 : sbox_out = 8'hAA;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h9B;
      2'b01 : sbox_out = 8'h88;
      2'b10 : sbox_out = 8'hD8;
      2'b11 : sbox_out = 8'hAB;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h89;
      2'b01 : sbox_out = 8'h9C;
      2'b10 : sbox_out = 8'hFA;
      2'b11 : sbox_out = 8'h60;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hEA;
      2'b01 : sbox_out = 8'hBC;
      2'b10 : sbox_out = 8'h62;
      2'b11 : sbox_out = 8'h0C;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h24;
      2'b01 : sbox_out = 8'hA6;
      2'b10 : sbox_out = 8'hA8;
      2'b11 : sbox_out = 8'hEC;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h67;
      2'b01 : sbox_out = 8'h20;
      2'b10 : sbox_out = 8'hDB;
      2'b11 : sbox_out = 8'h7C;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b011111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h28;
      2'b01 : sbox_out = 8'hDD;
      2'b10 : sbox_out = 8'hAC;
      2'b11 : sbox_out = 8'h5B;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h34;
      2'b01 : sbox_out = 8'h7E;
      2'b10 : sbox_out = 8'h10;
      2'b11 : sbox_out = 8'hF1;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h7B;
      2'b01 : sbox_out = 8'h8F;
      2'b10 : sbox_out = 8'h63;
      2'b11 : sbox_out = 8'hA0;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h05;
      2'b01 : sbox_out = 8'h9A;
      2'b10 : sbox_out = 8'h43;
      2'b11 : sbox_out = 8'h77;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h21;
      2'b01 : sbox_out = 8'hBF;
      2'b10 : sbox_out = 8'h27;
      2'b11 : sbox_out = 8'h09;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hC3;
      2'b01 : sbox_out = 8'h9F;
      2'b10 : sbox_out = 8'hB6;
      2'b11 : sbox_out = 8'hD7;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h29;
      2'b01 : sbox_out = 8'hC2;
      2'b10 : sbox_out = 8'hEB;
      2'b11 : sbox_out = 8'hC0;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hA4;
      2'b01 : sbox_out = 8'h8B;
      2'b10 : sbox_out = 8'h8C;
      2'b11 : sbox_out = 8'h1D;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b100111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hFB;
      2'b01 : sbox_out = 8'hFF;
      2'b10 : sbox_out = 8'hC1;
      2'b11 : sbox_out = 8'hB2;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h97;
      2'b01 : sbox_out = 8'h2E;
      2'b10 : sbox_out = 8'hF8;
      2'b11 : sbox_out = 8'h65;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hF6;
      2'b01 : sbox_out = 8'h75;
      2'b10 : sbox_out = 8'h07;
      2'b11 : sbox_out = 8'h04;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h49;
      2'b01 : sbox_out = 8'h33;
      2'b10 : sbox_out = 8'hE4;
      2'b11 : sbox_out = 8'hD9;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hB9;
      2'b01 : sbox_out = 8'hD0;
      2'b10 : sbox_out = 8'h42;
      2'b11 : sbox_out = 8'hC7;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h6C;
      2'b01 : sbox_out = 8'h90;
      2'b10 : sbox_out = 8'h00;
      2'b11 : sbox_out = 8'h8E;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h6F;
      2'b01 : sbox_out = 8'h50;
      2'b10 : sbox_out = 8'h01;
      2'b11 : sbox_out = 8'hC5;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hDA;
      2'b01 : sbox_out = 8'h47;
      2'b10 : sbox_out = 8'h3F;
      2'b11 : sbox_out = 8'hCD;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b101111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h69;
      2'b01 : sbox_out = 8'hA2;
      2'b10 : sbox_out = 8'hE2;
      2'b11 : sbox_out = 8'h7A;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hA7;
      2'b01 : sbox_out = 8'hC6;
      2'b10 : sbox_out = 8'h93;
      2'b11 : sbox_out = 8'h0F;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h0A;
      2'b01 : sbox_out = 8'h06;
      2'b10 : sbox_out = 8'hE6;
      2'b11 : sbox_out = 8'h2B;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h96;
      2'b01 : sbox_out = 8'hA3;
      2'b10 : sbox_out = 8'h1C;
      2'b11 : sbox_out = 8'hAF;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h6A;
      2'b01 : sbox_out = 8'h12;
      2'b10 : sbox_out = 8'h84;
      2'b11 : sbox_out = 8'h39;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hE7;
      2'b01 : sbox_out = 8'hB0;
      2'b10 : sbox_out = 8'h82;
      2'b11 : sbox_out = 8'hF7;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hFE;
      2'b01 : sbox_out = 8'h9D;
      2'b10 : sbox_out = 8'h87;
      2'b11 : sbox_out = 8'h5C;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h81;
      2'b01 : sbox_out = 8'h35;
      2'b10 : sbox_out = 8'hDE;
      2'b11 : sbox_out = 8'hB4;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b110111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hA5;
      2'b01 : sbox_out = 8'hFC;
      2'b10 : sbox_out = 8'h80;
      2'b11 : sbox_out = 8'hEF;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111000) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hCB;
      2'b01 : sbox_out = 8'hBB;
      2'b10 : sbox_out = 8'h6B;
      2'b11 : sbox_out = 8'h76;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111001) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'hBA;
      2'b01 : sbox_out = 8'h5A;
      2'b10 : sbox_out = 8'h7D;
      2'b11 : sbox_out = 8'h78;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111010) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h0B;
      2'b01 : sbox_out = 8'h95;
      2'b10 : sbox_out = 8'hE3;
      2'b11 : sbox_out = 8'hAD;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111011) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h74;
      2'b01 : sbox_out = 8'h98;
      2'b10 : sbox_out = 8'h3B;
      2'b11 : sbox_out = 8'h36;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111100) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h64;
      2'b01 : sbox_out = 8'h6D;
      2'b10 : sbox_out = 8'hDC;
      2'b11 : sbox_out = 8'hF0;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111101) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h59;
      2'b01 : sbox_out = 8'hA9;
      2'b10 : sbox_out = 8'h4C;
      2'b11 : sbox_out = 8'h17;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111110) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h7F;
      2'b01 : sbox_out = 8'h91;
      2'b10 : sbox_out = 8'hB8;
      2'b11 : sbox_out = 8'hC9;
      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_in[7:2] == 6'b111111) begin
    case (sbox_in[1:0])
      2'b00 : sbox_out = 8'h57;
      2'b01 : sbox_out = 8'h1B;
      2'b10 : sbox_out = 8'hE0;
      2'b11 : sbox_out = 8'h61;
      default : sbox_out = 8'd0;
    endcase
  end
  else begin
    sbox_out = 8'd0;
  end
end

endmodule

//SBOX - 4 in 1
module sbox #(parameter BC_SIZE=7) (sbox_ind, sbox_in, sbox_out);

input [BC_SIZE-1:0] sbox_ind;
input [7:0] sbox_in;
output reg [7:0] sbox_out;

always @ (*) begin
  if (sbox_ind[1:0] == 2'b00) begin
    case (sbox_in)
      8'b00000000 : sbox_out = 8'hA8;
      8'b00000001 : sbox_out = 8'h43;
      8'b00000010 : sbox_out = 8'h5F;
      8'b00000011 : sbox_out = 8'h06;
      8'b00000100 : sbox_out = 8'h6B;
      8'b00000101 : sbox_out = 8'h75;
      8'b00000110 : sbox_out = 8'h6C;
      8'b00000111 : sbox_out = 8'h59;
      8'b00001000 : sbox_out = 8'h71;
      8'b00001001 : sbox_out = 8'hDF;
      8'b00001010 : sbox_out = 8'h87;
      8'b00001011 : sbox_out = 8'h95;
      8'b00001100 : sbox_out = 8'h17;
      8'b00001101 : sbox_out = 8'hF0;
      8'b00001110 : sbox_out = 8'hD8;
      8'b00001111 : sbox_out = 8'h09;

      8'b00010000 : sbox_out = 8'h6D;
      8'b00010001 : sbox_out = 8'hF3;
      8'b00010010 : sbox_out = 8'h1D;
      8'b00010011 : sbox_out = 8'hCB;
      8'b00010100 : sbox_out = 8'hC9;
      8'b00010101 : sbox_out = 8'h4D;
      8'b00010110 : sbox_out = 8'h2C;
      8'b00010111 : sbox_out = 8'hAF;
      8'b00011000 : sbox_out = 8'h79;
      8'b00011001 : sbox_out = 8'hE0;
      8'b00011010 : sbox_out = 8'h97;
      8'b00011011 : sbox_out = 8'hFD;
      8'b00011100 : sbox_out = 8'h6F;
      8'b00011101 : sbox_out = 8'h4B;
      8'b00011110 : sbox_out = 8'h45;
      8'b00011111 : sbox_out = 8'h39;

      8'b00100000 : sbox_out = 8'h3E;
      8'b00100001 : sbox_out = 8'hDD;
      8'b00100010 : sbox_out = 8'hA3;
      8'b00100011 : sbox_out = 8'h4F;
      8'b00100100 : sbox_out = 8'hB4;
      8'b00100101 : sbox_out = 8'hB6;
      8'b00100110 : sbox_out = 8'h9A;
      8'b00100111 : sbox_out = 8'h0E;
      8'b00101000 : sbox_out = 8'h1F;
      8'b00101001 : sbox_out = 8'hBF;
      8'b00101010 : sbox_out = 8'h15;
      8'b00101011 : sbox_out = 8'hE1;
      8'b00101100 : sbox_out = 8'h49;
      8'b00101101 : sbox_out = 8'hD2;
      8'b00101110 : sbox_out = 8'h93;
      8'b00101111 : sbox_out = 8'hC6;

      8'b00110000 : sbox_out = 8'h92;
      8'b00110001 : sbox_out = 8'h72;
      8'b00110010 : sbox_out = 8'h9E;
      8'b00110011 : sbox_out = 8'h61;
      8'b00110100 : sbox_out = 8'hD1;
      8'b00110101 : sbox_out = 8'h63;
      8'b00110110 : sbox_out = 8'hFA;
      8'b00110111 : sbox_out = 8'hEE;
      8'b00111000 : sbox_out = 8'hF4;
      8'b00111001 : sbox_out = 8'h19;
      8'b00111010 : sbox_out = 8'hD5;
      8'b00111011 : sbox_out = 8'hAD;
      8'b00111100 : sbox_out = 8'h58;
      8'b00111101 : sbox_out = 8'hA4;
      8'b00111110 : sbox_out = 8'hBB;
      8'b00111111 : sbox_out = 8'hA1;

      8'b01000000 : sbox_out = 8'hDC;
      8'b01000001 : sbox_out = 8'hF2;
      8'b01000010 : sbox_out = 8'h83;
      8'b01000011 : sbox_out = 8'h37;
      8'b01000100 : sbox_out = 8'h42;
      8'b01000101 : sbox_out = 8'hE4;
      8'b01000110 : sbox_out = 8'h7A;
      8'b01000111 : sbox_out = 8'h32;
      8'b01001000 : sbox_out = 8'h9C;
      8'b01001001 : sbox_out = 8'hCC;
      8'b01001010 : sbox_out = 8'hAB;
      8'b01001011 : sbox_out = 8'h4A;
      8'b01001100 : sbox_out = 8'h8F;
      8'b01001101 : sbox_out = 8'h6E;
      8'b01001110 : sbox_out = 8'h04;
      8'b01001111 : sbox_out = 8'h27;

      8'b01010000 : sbox_out = 8'h2E;
      8'b01010001 : sbox_out = 8'hE7;
      8'b01010010 : sbox_out = 8'hE2;
      8'b01010011 : sbox_out = 8'h5A;
      8'b01010100 : sbox_out = 8'h96;
      8'b01010101 : sbox_out = 8'h16;
      8'b01010110 : sbox_out = 8'h23;
      8'b01010111 : sbox_out = 8'h2B;
      8'b01011000 : sbox_out = 8'hC2;
      8'b01011001 : sbox_out = 8'h65;
      8'b01011010 : sbox_out = 8'h66;
      8'b01011011 : sbox_out = 8'h0F;
      8'b01011100 : sbox_out = 8'hBC;
      8'b01011101 : sbox_out = 8'hA9;
      8'b01011110 : sbox_out = 8'h47;
      8'b01011111 : sbox_out = 8'h41;

      8'b01100000 : sbox_out = 8'h34;
      8'b01100001 : sbox_out = 8'h48;
      8'b01100010 : sbox_out = 8'hFC;
      8'b01100011 : sbox_out = 8'hB7;
      8'b01100100 : sbox_out = 8'h6A;
      8'b01100101 : sbox_out = 8'h88;
      8'b01100110 : sbox_out = 8'hA5;
      8'b01100111 : sbox_out = 8'h53;
      8'b01101000 : sbox_out = 8'h86;
      8'b01101001 : sbox_out = 8'hF9;
      8'b01101010 : sbox_out = 8'h5B;
      8'b01101011 : sbox_out = 8'hDB;
      8'b01101100 : sbox_out = 8'h38;
      8'b01101101 : sbox_out = 8'h7B;
      8'b01101110 : sbox_out = 8'hC3;
      8'b01101111 : sbox_out = 8'h1E;

      8'b01110000 : sbox_out = 8'h22;
      8'b01110001 : sbox_out = 8'h33;
      8'b01110010 : sbox_out = 8'h24;
      8'b01110011 : sbox_out = 8'h28;
      8'b01110100 : sbox_out = 8'h36;
      8'b01110101 : sbox_out = 8'hC7;
      8'b01110110 : sbox_out = 8'hB2;
      8'b01110111 : sbox_out = 8'h3B;
      8'b01111000 : sbox_out = 8'h8E;
      8'b01111001 : sbox_out = 8'h77;
      8'b01111010 : sbox_out = 8'hBA;
      8'b01111011 : sbox_out = 8'hF5;
      8'b01111100 : sbox_out = 8'h14;
      8'b01111101 : sbox_out = 8'h9F;
      8'b01111110 : sbox_out = 8'h08;
      8'b01111111 : sbox_out = 8'h55;

      8'b10000000 : sbox_out = 8'h9B;
      8'b10000001 : sbox_out = 8'h4C;
      8'b10000010 : sbox_out = 8'hFE;
      8'b10000011 : sbox_out = 8'h60;
      8'b10000100 : sbox_out = 8'h5C;
      8'b10000101 : sbox_out = 8'hDA;
      8'b10000110 : sbox_out = 8'h18;
      8'b10000111 : sbox_out = 8'h46;
      8'b10001000 : sbox_out = 8'hCD;
      8'b10001001 : sbox_out = 8'h7D;
      8'b10001010 : sbox_out = 8'h21;
      8'b10001011 : sbox_out = 8'hB0;
      8'b10001100 : sbox_out = 8'h3F;
      8'b10001101 : sbox_out = 8'h1B;
      8'b10001110 : sbox_out = 8'h89;
      8'b10001111 : sbox_out = 8'hFF;

      8'b10010000 : sbox_out = 8'hEB;
      8'b10010001 : sbox_out = 8'h84;
      8'b10010010 : sbox_out = 8'h69;
      8'b10010011 : sbox_out = 8'h3A;
      8'b10010100 : sbox_out = 8'h9D;
      8'b10010101 : sbox_out = 8'hD7;
      8'b10010110 : sbox_out = 8'hD3;
      8'b10010111 : sbox_out = 8'h70;
      8'b10011000 : sbox_out = 8'h67;
      8'b10011001 : sbox_out = 8'h40;
      8'b10011010 : sbox_out = 8'hB5;
      8'b10011011 : sbox_out = 8'hDE;
      8'b10011100 : sbox_out = 8'h5D;
      8'b10011101 : sbox_out = 8'h30;
      8'b10011110 : sbox_out = 8'h91;
      8'b10011111 : sbox_out = 8'hB1;

      8'b10100000 : sbox_out = 8'h78;
      8'b10100001 : sbox_out = 8'h11;
      8'b10100010 : sbox_out = 8'h01;
      8'b10100011 : sbox_out = 8'hE5;
      8'b10100100 : sbox_out = 8'h00;
      8'b10100101 : sbox_out = 8'h68;
      8'b10100110 : sbox_out = 8'h98;
      8'b10100111 : sbox_out = 8'hA0;
      8'b10101000 : sbox_out = 8'hC5;
      8'b10101001 : sbox_out = 8'h02;
      8'b10101010 : sbox_out = 8'hA6;
      8'b10101011 : sbox_out = 8'h74;
      8'b10101100 : sbox_out = 8'h2D;
      8'b10101101 : sbox_out = 8'h0B;
      8'b10101110 : sbox_out = 8'hA2;
      8'b10101111 : sbox_out = 8'h76;

      8'b10110000 : sbox_out = 8'hB3;
      8'b10110001 : sbox_out = 8'hBE;
      8'b10110010 : sbox_out = 8'hCE;
      8'b10110011 : sbox_out = 8'hBD;
      8'b10110100 : sbox_out = 8'hAE;
      8'b10110101 : sbox_out = 8'hE9;
      8'b10110110 : sbox_out = 8'h8A;
      8'b10110111 : sbox_out = 8'h31;
      8'b10111000 : sbox_out = 8'h1C;
      8'b10111001 : sbox_out = 8'hEC;
      8'b10111010 : sbox_out = 8'hF1;
      8'b10111011 : sbox_out = 8'h99;
      8'b10111100 : sbox_out = 8'h94;
      8'b10111101 : sbox_out = 8'hAA;
      8'b10111110 : sbox_out = 8'hF6;
      8'b10111111 : sbox_out = 8'h26;

      8'b11000000 : sbox_out = 8'h2F;
      8'b11000001 : sbox_out = 8'hEF;
      8'b11000010 : sbox_out = 8'hE8;
      8'b11000011 : sbox_out = 8'h8C;
      8'b11000100 : sbox_out = 8'h35;
      8'b11000101 : sbox_out = 8'h03;
      8'b11000110 : sbox_out = 8'hD4;
      8'b11000111 : sbox_out = 8'h7F;
      8'b11001000 : sbox_out = 8'hFB;
      8'b11001001 : sbox_out = 8'h05;
      8'b11001010 : sbox_out = 8'hC1;
      8'b11001011 : sbox_out = 8'h5E;
      8'b11001100 : sbox_out = 8'h90;
      8'b11001101 : sbox_out = 8'h20;
      8'b11001110 : sbox_out = 8'h3D;
      8'b11001111 : sbox_out = 8'h82;

      8'b11010000 : sbox_out = 8'hF7;
      8'b11010001 : sbox_out = 8'hEA;
      8'b11010010 : sbox_out = 8'h0A;
      8'b11010011 : sbox_out = 8'h0D;
      8'b11010100 : sbox_out = 8'h7E;
      8'b11010101 : sbox_out = 8'hF8;
      8'b11010110 : sbox_out = 8'h50;
      8'b11010111 : sbox_out = 8'h1A;
      8'b11011000 : sbox_out = 8'hC4;
      8'b11011001 : sbox_out = 8'h07;
      8'b11011010 : sbox_out = 8'h57;
      8'b11011011 : sbox_out = 8'hB8;
      8'b11011100 : sbox_out = 8'h3C;
      8'b11011101 : sbox_out = 8'h62;
      8'b11011110 : sbox_out = 8'hE3;
      8'b11011111 : sbox_out = 8'hC8;

      8'b11100000 : sbox_out = 8'hAC;
      8'b11100001 : sbox_out = 8'h52;
      8'b11100010 : sbox_out = 8'h64;
      8'b11100011 : sbox_out = 8'h10;
      8'b11100100 : sbox_out = 8'hD0;
      8'b11100101 : sbox_out = 8'hD9;
      8'b11100110 : sbox_out = 8'h13;
      8'b11100111 : sbox_out = 8'h0C;
      8'b11101000 : sbox_out = 8'h12;
      8'b11101001 : sbox_out = 8'h29;
      8'b11101010 : sbox_out = 8'h51;
      8'b11101011 : sbox_out = 8'hB9;
      8'b11101100 : sbox_out = 8'hCF;
      8'b11101101 : sbox_out = 8'hD6;
      8'b11101110 : sbox_out = 8'h73;
      8'b11101111 : sbox_out = 8'h8D;

      8'b11110000 : sbox_out = 8'h81;
      8'b11110001 : sbox_out = 8'h54;
      8'b11110010 : sbox_out = 8'hC0;
      8'b11110011 : sbox_out = 8'hED;
      8'b11110100 : sbox_out = 8'h4E;
      8'b11110101 : sbox_out = 8'h44;
      8'b11110110 : sbox_out = 8'hA7;
      8'b11110111 : sbox_out = 8'h2A;
      8'b11111000 : sbox_out = 8'h85;
      8'b11111001 : sbox_out = 8'h25;
      8'b11111010 : sbox_out = 8'hE6;
      8'b11111011 : sbox_out = 8'hCA;
      8'b11111100 : sbox_out = 8'h7C;
      8'b11111101 : sbox_out = 8'h8B;
      8'b11111110 : sbox_out = 8'h56;
      8'b11111111 : sbox_out = 8'h80;

      default : sbox_out = 8'd0;
    endcase
  end

  if (sbox_ind[1:0] == 2'b01) begin
    case (sbox_in)
      8'b00000000 : sbox_out = 8'hCE;
      8'b00000001 : sbox_out = 8'hBB;
      8'b00000010 : sbox_out = 8'hEB;
      8'b00000011 : sbox_out = 8'h92;
      8'b00000100 : sbox_out = 8'hEA;
      8'b00000101 : sbox_out = 8'hCB;
      8'b00000110 : sbox_out = 8'h13;
      8'b00000111 : sbox_out = 8'hC1;
      8'b00001000 : sbox_out = 8'hE9;
      8'b00001001 : sbox_out = 8'h3A;
      8'b00001010 : sbox_out = 8'hD6;
      8'b00001011 : sbox_out = 8'hB2;
      8'b00001100 : sbox_out = 8'hD2;
      8'b00001101 : sbox_out = 8'h90;
      8'b00001110 : sbox_out = 8'h17;
      8'b00001111 : sbox_out = 8'hF8;

      8'b00010000 : sbox_out = 8'h42;
      8'b00010001 : sbox_out = 8'h15;
      8'b00010010 : sbox_out = 8'h56;
      8'b00010011 : sbox_out = 8'hB4;
      8'b00010100 : sbox_out = 8'h65;
      8'b00010101 : sbox_out = 8'h1C;
      8'b00010110 : sbox_out = 8'h88;
      8'b00010111 : sbox_out = 8'h43;
      8'b00011000 : sbox_out = 8'hC5;
      8'b00011001 : sbox_out = 8'h5C;
      8'b00011010 : sbox_out = 8'h36;
      8'b00011011 : sbox_out = 8'hBA;
      8'b00011100 : sbox_out = 8'hF5;
      8'b00011101 : sbox_out = 8'h57;
      8'b00011110 : sbox_out = 8'h67;
      8'b00011111 : sbox_out = 8'h8D;

      8'b00100000 : sbox_out = 8'h31;
      8'b00100001 : sbox_out = 8'hF6;
      8'b00100010 : sbox_out = 8'h64;
      8'b00100011 : sbox_out = 8'h58;
      8'b00100100 : sbox_out = 8'h9E;
      8'b00100101 : sbox_out = 8'hF4;
      8'b00100110 : sbox_out = 8'h22;
      8'b00100111 : sbox_out = 8'hAA;
      8'b00101000 : sbox_out = 8'h75;
      8'b00101001 : sbox_out = 8'h0F;
      8'b00101010 : sbox_out = 8'h02;
      8'b00101011 : sbox_out = 8'hB1;
      8'b00101100 : sbox_out = 8'hDF;
      8'b00101101 : sbox_out = 8'h6D;
      8'b00101110 : sbox_out = 8'h73;
      8'b00101111 : sbox_out = 8'h4D;

      8'b00110000 : sbox_out = 8'h7C;
      8'b00110001 : sbox_out = 8'h26;
      8'b00110010 : sbox_out = 8'h2E;
      8'b00110011 : sbox_out = 8'hF7;
      8'b00110100 : sbox_out = 8'h08;
      8'b00110101 : sbox_out = 8'h5D;
      8'b00110110 : sbox_out = 8'h44;
      8'b00110111 : sbox_out = 8'h3E;
      8'b00111000 : sbox_out = 8'h9F;
      8'b00111001 : sbox_out = 8'h14;
      8'b00111010 : sbox_out = 8'hC8;
      8'b00111011 : sbox_out = 8'hAE;
      8'b00111100 : sbox_out = 8'h54;
      8'b00111101 : sbox_out = 8'h10;
      8'b00111110 : sbox_out = 8'hD8;
      8'b00111111 : sbox_out = 8'hBC;

      8'b01000000 : sbox_out = 8'h1A;
      8'b01000001 : sbox_out = 8'h6B;
      8'b01000010 : sbox_out = 8'h69;
      8'b01000011 : sbox_out = 8'hF3;
      8'b01000100 : sbox_out = 8'hBD;
      8'b01000101 : sbox_out = 8'h33;
      8'b01000110 : sbox_out = 8'hAB;
      8'b01000111 : sbox_out = 8'hFA;
      8'b01001000 : sbox_out = 8'hD1;
      8'b01001001 : sbox_out = 8'h9B;
      8'b01001010 : sbox_out = 8'h68;
      8'b01001011 : sbox_out = 8'h4E;
      8'b01001100 : sbox_out = 8'h16;
      8'b01001101 : sbox_out = 8'h95;
      8'b01001110 : sbox_out = 8'h91;
      8'b01001111 : sbox_out = 8'hEE;

      8'b01010000 : sbox_out = 8'h4C;
      8'b01010001 : sbox_out = 8'h63;
      8'b01010010 : sbox_out = 8'h8E;
      8'b01010011 : sbox_out = 8'h5B;
      8'b01010100 : sbox_out = 8'hCC;
      8'b01010101 : sbox_out = 8'h3C;
      8'b01010110 : sbox_out = 8'h19;
      8'b01010111 : sbox_out = 8'hA1;
      8'b01011000 : sbox_out = 8'h81;
      8'b01011001 : sbox_out = 8'h49;
      8'b01011010 : sbox_out = 8'h7B;
      8'b01011011 : sbox_out = 8'hD9;
      8'b01011100 : sbox_out = 8'h6F;
      8'b01011101 : sbox_out = 8'h37;
      8'b01011110 : sbox_out = 8'h60;
      8'b01011111 : sbox_out = 8'hCA;

      8'b01100000 : sbox_out = 8'hE7;
      8'b01100001 : sbox_out = 8'h2B;
      8'b01100010 : sbox_out = 8'h48;
      8'b01100011 : sbox_out = 8'hFD;
      8'b01100100 : sbox_out = 8'h96;
      8'b01100101 : sbox_out = 8'h45;
      8'b01100110 : sbox_out = 8'hFC;
      8'b01100111 : sbox_out = 8'h41;
      8'b01101000 : sbox_out = 8'h12;
      8'b01101001 : sbox_out = 8'h0D;
      8'b01101010 : sbox_out = 8'h79;
      8'b01101011 : sbox_out = 8'hE5;
      8'b01101100 : sbox_out = 8'h89;
      8'b01101101 : sbox_out = 8'h8C;
      8'b01101110 : sbox_out = 8'hE3;
      8'b01101111 : sbox_out = 8'h20;

      8'b01110000 : sbox_out = 8'h30;
      8'b01110001 : sbox_out = 8'hDC;
      8'b01110010 : sbox_out = 8'hB7;
      8'b01110011 : sbox_out = 8'h6C;
      8'b01110100 : sbox_out = 8'h4A;
      8'b01110101 : sbox_out = 8'hB5;
      8'b01110110 : sbox_out = 8'h3F;
      8'b01110111 : sbox_out = 8'h97;
      8'b01111000 : sbox_out = 8'hD4;
      8'b01111001 : sbox_out = 8'h62;
      8'b01111010 : sbox_out = 8'h2D;
      8'b01111011 : sbox_out = 8'h06;
      8'b01111100 : sbox_out = 8'hA4;
      8'b01111101 : sbox_out = 8'hA5;
      8'b01111110 : sbox_out = 8'h83;
      8'b01111111 : sbox_out = 8'h5F;

      8'b10000000 : sbox_out = 8'h2A;
      8'b10000001 : sbox_out = 8'hDA;
      8'b10000010 : sbox_out = 8'hC9;
      8'b10000011 : sbox_out = 8'h00;
      8'b10000100 : sbox_out = 8'h7E;
      8'b10000101 : sbox_out = 8'hA2;
      8'b10000110 : sbox_out = 8'h55;
      8'b10000111 : sbox_out = 8'hBF;
      8'b10001000 : sbox_out = 8'h11;
      8'b10001001 : sbox_out = 8'hD5;
      8'b10001010 : sbox_out = 8'h9C;
      8'b10001011 : sbox_out = 8'hCF;
      8'b10001100 : sbox_out = 8'h0E;
      8'b10001101 : sbox_out = 8'h0A;
      8'b10001110 : sbox_out = 8'h3D;
      8'b10001111 : sbox_out = 8'h51;

      8'b10010000 : sbox_out = 8'h7D;
      8'b10010001 : sbox_out = 8'h93;
      8'b10010010 : sbox_out = 8'h1B;
      8'b10010011 : sbox_out = 8'hFE;
      8'b10010100 : sbox_out = 8'hC4;
      8'b10010101 : sbox_out = 8'h47;
      8'b10010110 : sbox_out = 8'h09;
      8'b10010111 : sbox_out = 8'h86;
      8'b10011000 : sbox_out = 8'h0B;
      8'b10011001 : sbox_out = 8'h8F;
      8'b10011010 : sbox_out = 8'h9D;
      8'b10011011 : sbox_out = 8'h6A;
      8'b10011100 : sbox_out = 8'h07;
      8'b10011101 : sbox_out = 8'hB9;
      8'b10011110 : sbox_out = 8'hB0;
      8'b10011111 : sbox_out = 8'h98;

      8'b10100000 : sbox_out = 8'h18;
      8'b10100001 : sbox_out = 8'h32;
      8'b10100010 : sbox_out = 8'h71;
      8'b10100011 : sbox_out = 8'h4B;
      8'b10100100 : sbox_out = 8'hEF;
      8'b10100101 : sbox_out = 8'h3B;
      8'b10100110 : sbox_out = 8'h70;
      8'b10100111 : sbox_out = 8'hA0;
      8'b10101000 : sbox_out = 8'hE4;
      8'b10101001 : sbox_out = 8'h40;
      8'b10101010 : sbox_out = 8'hFF;
      8'b10101011 : sbox_out = 8'hC3;
      8'b10101100 : sbox_out = 8'hA9;
      8'b10101101 : sbox_out = 8'hE6;
      8'b10101110 : sbox_out = 8'h78;
      8'b10101111 : sbox_out = 8'hF9;

      8'b10110000 : sbox_out = 8'h8B;
      8'b10110001 : sbox_out = 8'h46;
      8'b10110010 : sbox_out = 8'h80;
      8'b10110011 : sbox_out = 8'h1E;
      8'b10110100 : sbox_out = 8'h38;
      8'b10110101 : sbox_out = 8'hE1;
      8'b10110110 : sbox_out = 8'hB8;
      8'b10110111 : sbox_out = 8'hA8;
      8'b10111000 : sbox_out = 8'hE0;
      8'b10111001 : sbox_out = 8'h0C;
      8'b10111010 : sbox_out = 8'h23;
      8'b10111011 : sbox_out = 8'h76;
      8'b10111100 : sbox_out = 8'h1D;
      8'b10111101 : sbox_out = 8'h25;
      8'b10111110 : sbox_out = 8'h24;
      8'b10111111 : sbox_out = 8'h05;

      8'b11000000 : sbox_out = 8'hF1;
      8'b11000001 : sbox_out = 8'h6E;
      8'b11000010 : sbox_out = 8'h94;
      8'b11000011 : sbox_out = 8'h28;
      8'b11000100 : sbox_out = 8'h9A;
      8'b11000101 : sbox_out = 8'h84;
      8'b11000110 : sbox_out = 8'hE8;
      8'b11000111 : sbox_out = 8'hA3;
      8'b11001000 : sbox_out = 8'h4F;
      8'b11001001 : sbox_out = 8'h77;
      8'b11001010 : sbox_out = 8'hD3;
      8'b11001011 : sbox_out = 8'h85;
      8'b11001100 : sbox_out = 8'hE2;
      8'b11001101 : sbox_out = 8'h52;
      8'b11001110 : sbox_out = 8'hF2;
      8'b11001111 : sbox_out = 8'h82;

      8'b11010000 : sbox_out = 8'h50;
      8'b11010001 : sbox_out = 8'h7A;
      8'b11010010 : sbox_out = 8'h2F;
      8'b11010011 : sbox_out = 8'h74;
      8'b11010100 : sbox_out = 8'h53;
      8'b11010101 : sbox_out = 8'hB3;
      8'b11010110 : sbox_out = 8'h61;
      8'b11010111 : sbox_out = 8'hAF;
      8'b11011000 : sbox_out = 8'h39;
      8'b11011001 : sbox_out = 8'h35;
      8'b11011010 : sbox_out = 8'hDE;
      8'b11011011 : sbox_out = 8'hCD;
      8'b11011100 : sbox_out = 8'h1F;
      8'b11011101 : sbox_out = 8'h99;
      8'b11011110 : sbox_out = 8'hAC;
      8'b11011111 : sbox_out = 8'hAD;

      8'b11100000 : sbox_out = 8'h72;
      8'b11100001 : sbox_out = 8'h2C;
      8'b11100010 : sbox_out = 8'hDD;
      8'b11100011 : sbox_out = 8'hD0;
      8'b11100100 : sbox_out = 8'h87;
      8'b11100101 : sbox_out = 8'hBE;
      8'b11100110 : sbox_out = 8'h5E;
      8'b11100111 : sbox_out = 8'hA6;
      8'b11101000 : sbox_out = 8'hEC;
      8'b11101001 : sbox_out = 8'h04;
      8'b11101010 : sbox_out = 8'hC6;
      8'b11101011 : sbox_out = 8'h03;
      8'b11101100 : sbox_out = 8'h34;
      8'b11101101 : sbox_out = 8'hFB;
      8'b11101110 : sbox_out = 8'hDB;
      8'b11101111 : sbox_out = 8'h59;

      8'b11110000 : sbox_out = 8'hB6;
      8'b11110001 : sbox_out = 8'hC2;
      8'b11110010 : sbox_out = 8'h01;
      8'b11110011 : sbox_out = 8'hF0;
      8'b11110100 : sbox_out = 8'h5A;
      8'b11110101 : sbox_out = 8'hED;
      8'b11110110 : sbox_out = 8'hA7;
      8'b11110111 : sbox_out = 8'h66;
      8'b11111000 : sbox_out = 8'h21;
      8'b11111001 : sbox_out = 8'h7F;
      8'b11111010 : sbox_out = 8'h8A;
      8'b11111011 : sbox_out = 8'h27;
      8'b11111100 : sbox_out = 8'hC7;
      8'b11111101 : sbox_out = 8'hC0;
      8'b11111110 : sbox_out = 8'h29;
      8'b11111111 : sbox_out = 8'hD7;

      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_ind[1:0] == 2'b10) begin
    case (sbox_in)
      8'b00000000 : sbox_out = 8'h93;
      8'b00000001 : sbox_out = 8'hD9;
      8'b00000010 : sbox_out = 8'h9A;
      8'b00000011 : sbox_out = 8'hB5;
      8'b00000100 : sbox_out = 8'h98;
      8'b00000101 : sbox_out = 8'h22;
      8'b00000110 : sbox_out = 8'h45;
      8'b00000111 : sbox_out = 8'hFC;
      8'b00001000 : sbox_out = 8'hBA;
      8'b00001001 : sbox_out = 8'h6A;
      8'b00001010 : sbox_out = 8'hDF;
      8'b00001011 : sbox_out = 8'h02;
      8'b00001100 : sbox_out = 8'h9F;
      8'b00001101 : sbox_out = 8'hDC;
      8'b00001110 : sbox_out = 8'h51;
      8'b00001111 : sbox_out = 8'h59;

      8'b00010000 : sbox_out = 8'h4A;
      8'b00010001 : sbox_out = 8'h17;
      8'b00010010 : sbox_out = 8'h2B;
      8'b00010011 : sbox_out = 8'hC2;
      8'b00010100 : sbox_out = 8'h94;
      8'b00010101 : sbox_out = 8'hF4;
      8'b00010110 : sbox_out = 8'hBB;
      8'b00010111 : sbox_out = 8'hA3;
      8'b00011000 : sbox_out = 8'h62;
      8'b00011001 : sbox_out = 8'hE4;
      8'b00011010 : sbox_out = 8'h71;
      8'b00011011 : sbox_out = 8'hD4;
      8'b00011100 : sbox_out = 8'hCD;
      8'b00011101 : sbox_out = 8'h70;
      8'b00011110 : sbox_out = 8'h16;
      8'b00011111 : sbox_out = 8'hE1;

      8'b00100000 : sbox_out = 8'h49;
      8'b00100001 : sbox_out = 8'h3C;
      8'b00100010 : sbox_out = 8'hC0;
      8'b00100011 : sbox_out = 8'hD8;
      8'b00100100 : sbox_out = 8'h5C;
      8'b00100101 : sbox_out = 8'h9B;
      8'b00100110 : sbox_out = 8'hAD;
      8'b00100111 : sbox_out = 8'h85;
      8'b00101000 : sbox_out = 8'h53;
      8'b00101001 : sbox_out = 8'hA1;
      8'b00101010 : sbox_out = 8'h7A;
      8'b00101011 : sbox_out = 8'hC8;
      8'b00101100 : sbox_out = 8'h2D;
      8'b00101101 : sbox_out = 8'hE0;
      8'b00101110 : sbox_out = 8'hD1;
      8'b00101111 : sbox_out = 8'h72;

      8'b00110000 : sbox_out = 8'hA6;
      8'b00110001 : sbox_out = 8'h2C;
      8'b00110010 : sbox_out = 8'hC4;
      8'b00110011 : sbox_out = 8'hE3;
      8'b00110100 : sbox_out = 8'h76;
      8'b00110101 : sbox_out = 8'h78;
      8'b00110110 : sbox_out = 8'hB7;
      8'b00110111 : sbox_out = 8'hB4;
      8'b00111000 : sbox_out = 8'h09;
      8'b00111001 : sbox_out = 8'h3B;
      8'b00111010 : sbox_out = 8'h0E;
      8'b00111011 : sbox_out = 8'h41;
      8'b00111100 : sbox_out = 8'h4C;
      8'b00111101 : sbox_out = 8'hDE;
      8'b00111110 : sbox_out = 8'hB2;
      8'b00111111 : sbox_out = 8'h90;

      8'b01000000 : sbox_out = 8'h25;
      8'b01000001 : sbox_out = 8'hA5;
      8'b01000010 : sbox_out = 8'hD7;
      8'b01000011 : sbox_out = 8'h03;
      8'b01000100 : sbox_out = 8'h11;
      8'b01000101 : sbox_out = 8'h00;
      8'b01000110 : sbox_out = 8'hC3;
      8'b01000111 : sbox_out = 8'h2E;
      8'b01001000 : sbox_out = 8'h92;
      8'b01001001 : sbox_out = 8'hEF;
      8'b01001010 : sbox_out = 8'h4E;
      8'b01001011 : sbox_out = 8'h12;
      8'b01001100 : sbox_out = 8'h9D;
      8'b01001101 : sbox_out = 8'h7D;
      8'b01001110 : sbox_out = 8'hCB;
      8'b01001111 : sbox_out = 8'h35;

      8'b01010000 : sbox_out = 8'h10;
      8'b01010001 : sbox_out = 8'hD5;
      8'b01010010 : sbox_out = 8'h4F;
      8'b01010011 : sbox_out = 8'h9E;
      8'b01010100 : sbox_out = 8'h4D;
      8'b01010101 : sbox_out = 8'hA9;
      8'b01010110 : sbox_out = 8'h55;
      8'b01010111 : sbox_out = 8'hC6;
      8'b01011000 : sbox_out = 8'hD0;
      8'b01011001 : sbox_out = 8'h7B;
      8'b01011010 : sbox_out = 8'h18;
      8'b01011011 : sbox_out = 8'h97;
      8'b01011100 : sbox_out = 8'hD3;
      8'b01011101 : sbox_out = 8'h36;
      8'b01011110 : sbox_out = 8'hE6;
      8'b01011111 : sbox_out = 8'h48;

      8'b01100000 : sbox_out = 8'h56;
      8'b01100001 : sbox_out = 8'h81;
      8'b01100010 : sbox_out = 8'h8F;
      8'b01100011 : sbox_out = 8'h77;
      8'b01100100 : sbox_out = 8'hCC;
      8'b01100101 : sbox_out = 8'h9C;
      8'b01100110 : sbox_out = 8'hB9;
      8'b01100111 : sbox_out = 8'hE2;
      8'b01101000 : sbox_out = 8'hAC;
      8'b01101001 : sbox_out = 8'hB8;
      8'b01101010 : sbox_out = 8'h2F;
      8'b01101011 : sbox_out = 8'h15;
      8'b01101100 : sbox_out = 8'hA4;
      8'b01101101 : sbox_out = 8'h7C;
      8'b01101110 : sbox_out = 8'hDA;
      8'b01101111 : sbox_out = 8'h38;

      8'b01110000 : sbox_out = 8'h1E;
      8'b01110001 : sbox_out = 8'h0B;
      8'b01110010 : sbox_out = 8'h05;
      8'b01110011 : sbox_out = 8'hD6;
      8'b01110100 : sbox_out = 8'h14;
      8'b01110101 : sbox_out = 8'h6E;
      8'b01110110 : sbox_out = 8'h6C;
      8'b01110111 : sbox_out = 8'h7E;
      8'b01111000 : sbox_out = 8'h66;
      8'b01111001 : sbox_out = 8'hFD;
      8'b01111010 : sbox_out = 8'hB1;
      8'b01111011 : sbox_out = 8'hE5;
      8'b01111100 : sbox_out = 8'h60;
      8'b01111101 : sbox_out = 8'hAF;
      8'b01111110 : sbox_out = 8'h5E;
      8'b01111111 : sbox_out = 8'h33;

      8'b10000000 : sbox_out = 8'h87;
      8'b10000001 : sbox_out = 8'hC9;
      8'b10000010 : sbox_out = 8'hF0;
      8'b10000011 : sbox_out = 8'h5D;
      8'b10000100 : sbox_out = 8'h6D;
      8'b10000101 : sbox_out = 8'h3F;
      8'b10000110 : sbox_out = 8'h88;
      8'b10000111 : sbox_out = 8'h8D;
      8'b10001000 : sbox_out = 8'hC7;
      8'b10001001 : sbox_out = 8'hF7;
      8'b10001010 : sbox_out = 8'h1D;
      8'b10001011 : sbox_out = 8'hE9;
      8'b10001100 : sbox_out = 8'hEC;
      8'b10001101 : sbox_out = 8'hED;
      8'b10001110 : sbox_out = 8'h80;
      8'b10001111 : sbox_out = 8'h29;

      8'b10010000 : sbox_out = 8'h27;
      8'b10010001 : sbox_out = 8'hCF;
      8'b10010010 : sbox_out = 8'h99;
      8'b10010011 : sbox_out = 8'hA8;
      8'b10010100 : sbox_out = 8'h50;
      8'b10010101 : sbox_out = 8'h0F;
      8'b10010110 : sbox_out = 8'h37;
      8'b10010111 : sbox_out = 8'h24;
      8'b10011000 : sbox_out = 8'h28;
      8'b10011001 : sbox_out = 8'h30;
      8'b10011010 : sbox_out = 8'h95;
      8'b10011011 : sbox_out = 8'hD2;
      8'b10011100 : sbox_out = 8'h3E;
      8'b10011101 : sbox_out = 8'h5B;
      8'b10011110 : sbox_out = 8'h40;
      8'b10011111 : sbox_out = 8'h83;

      8'b10100000 : sbox_out = 8'hB3;
      8'b10100001 : sbox_out = 8'h69;
      8'b10100010 : sbox_out = 8'h57;
      8'b10100011 : sbox_out = 8'h1F;
      8'b10100100 : sbox_out = 8'h07;
      8'b10100101 : sbox_out = 8'h1C;
      8'b10100110 : sbox_out = 8'h8A;
      8'b10100111 : sbox_out = 8'hBC;
      8'b10101000 : sbox_out = 8'h20;
      8'b10101001 : sbox_out = 8'hEB;
      8'b10101010 : sbox_out = 8'hCE;
      8'b10101011 : sbox_out = 8'h8E;
      8'b10101100 : sbox_out = 8'hAB;
      8'b10101101 : sbox_out = 8'hEE;
      8'b10101110 : sbox_out = 8'h31;
      8'b10101111 : sbox_out = 8'hA2;

      8'b10110000 : sbox_out = 8'h73;
      8'b10110001 : sbox_out = 8'hF9;
      8'b10110010 : sbox_out = 8'hCA;
      8'b10110011 : sbox_out = 8'h3A;
      8'b10110100 : sbox_out = 8'h1A;
      8'b10110101 : sbox_out = 8'hFB;
      8'b10110110 : sbox_out = 8'h0D;
      8'b10110111 : sbox_out = 8'hC1;
      8'b10111000 : sbox_out = 8'hFE;
      8'b10111001 : sbox_out = 8'hFA;
      8'b10111010 : sbox_out = 8'hF2;
      8'b10111011 : sbox_out = 8'h6F;
      8'b10111100 : sbox_out = 8'hBD;
      8'b10111101 : sbox_out = 8'h96;
      8'b10111110 : sbox_out = 8'hDD;
      8'b10111111 : sbox_out = 8'h43;

      8'b11000000 : sbox_out = 8'h52;
      8'b11000001 : sbox_out = 8'hB6;
      8'b11000010 : sbox_out = 8'h08;
      8'b11000011 : sbox_out = 8'hF3;
      8'b11000100 : sbox_out = 8'hAE;
      8'b11000101 : sbox_out = 8'hBE;
      8'b11000110 : sbox_out = 8'h19;
      8'b11000111 : sbox_out = 8'h89;
      8'b11001000 : sbox_out = 8'h32;
      8'b11001001 : sbox_out = 8'h26;
      8'b11001010 : sbox_out = 8'hB0;
      8'b11001011 : sbox_out = 8'hEA;
      8'b11001100 : sbox_out = 8'h4B;
      8'b11001101 : sbox_out = 8'h64;
      8'b11001110 : sbox_out = 8'h84;
      8'b11001111 : sbox_out = 8'h82;

      8'b11010000 : sbox_out = 8'h6B;
      8'b11010001 : sbox_out = 8'hF5;
      8'b11010010 : sbox_out = 8'h79;
      8'b11010011 : sbox_out = 8'hBF;
      8'b11010100 : sbox_out = 8'h01;
      8'b11010101 : sbox_out = 8'h5F;
      8'b11010110 : sbox_out = 8'h75;
      8'b11010111 : sbox_out = 8'h63;
      8'b11011000 : sbox_out = 8'h1B;
      8'b11011001 : sbox_out = 8'h23;
      8'b11011010 : sbox_out = 8'h3D;
      8'b11011011 : sbox_out = 8'h68;
      8'b11011100 : sbox_out = 8'h2A;
      8'b11011101 : sbox_out = 8'h65;
      8'b11011110 : sbox_out = 8'hE8;
      8'b11011111 : sbox_out = 8'h91;

      8'b11100000 : sbox_out = 8'hF6;
      8'b11100001 : sbox_out = 8'hFF;
      8'b11100010 : sbox_out = 8'h13;
      8'b11100011 : sbox_out = 8'h58;
      8'b11100100 : sbox_out = 8'hF1;
      8'b11100101 : sbox_out = 8'h47;
      8'b11100110 : sbox_out = 8'h0A;
      8'b11100111 : sbox_out = 8'h7F;
      8'b11101000 : sbox_out = 8'hC5;
      8'b11101001 : sbox_out = 8'hA7;
      8'b11101010 : sbox_out = 8'hE7;
      8'b11101011 : sbox_out = 8'h61;
      8'b11101100 : sbox_out = 8'h5A;
      8'b11101101 : sbox_out = 8'h06;
      8'b11101110 : sbox_out = 8'h46;
      8'b11101111 : sbox_out = 8'h44;

      8'b11110000 : sbox_out = 8'h42;
      8'b11110001 : sbox_out = 8'h04;
      8'b11110010 : sbox_out = 8'hA0;
      8'b11110011 : sbox_out = 8'hDB;
      8'b11110100 : sbox_out = 8'h39;
      8'b11110101 : sbox_out = 8'h86;
      8'b11110110 : sbox_out = 8'h54;
      8'b11110111 : sbox_out = 8'hAA;
      8'b11111000 : sbox_out = 8'h8C;
      8'b11111001 : sbox_out = 8'h34;
      8'b11111010 : sbox_out = 8'h21;
      8'b11111011 : sbox_out = 8'h8B;
      8'b11111100 : sbox_out = 8'hF8;
      8'b11111101 : sbox_out = 8'h0C;
      8'b11111110 : sbox_out = 8'h74;
      8'b11111111 : sbox_out = 8'h67;

      default : sbox_out = 8'd0;
    endcase
  end
  else if (sbox_ind[1:0] == 2'b11) begin
    case (sbox_in)
      8'b00000000 : sbox_out = 8'h68;
      8'b00000001 : sbox_out = 8'h8D;
      8'b00000010 : sbox_out = 8'hCA;
      8'b00000011 : sbox_out = 8'h4D;
      8'b00000100 : sbox_out = 8'h73;
      8'b00000101 : sbox_out = 8'h4B;
      8'b00000110 : sbox_out = 8'h4E;
      8'b00000111 : sbox_out = 8'h2A;
      8'b00001000 : sbox_out = 8'hD4;
      8'b00001001 : sbox_out = 8'h52;
      8'b00001010 : sbox_out = 8'h26;
      8'b00001011 : sbox_out = 8'hB3;
      8'b00001100 : sbox_out = 8'h54;
      8'b00001101 : sbox_out = 8'h1E;
      8'b00001110 : sbox_out = 8'h19;
      8'b00001111 : sbox_out = 8'h1F;

      8'b00010000 : sbox_out = 8'h22;
      8'b00010001 : sbox_out = 8'h03;
      8'b00010010 : sbox_out = 8'h46;
      8'b00010011 : sbox_out = 8'h3D;
      8'b00010100 : sbox_out = 8'h2D;
      8'b00010101 : sbox_out = 8'h4A;
      8'b00010110 : sbox_out = 8'h53;
      8'b00010111 : sbox_out = 8'h83;
      8'b00011000 : sbox_out = 8'h13;
      8'b00011001 : sbox_out = 8'h8A;
      8'b00011010 : sbox_out = 8'hB7;
      8'b00011011 : sbox_out = 8'hD5;
      8'b00011100 : sbox_out = 8'h25;
      8'b00011101 : sbox_out = 8'h79;
      8'b00011110 : sbox_out = 8'hF5;
      8'b00011111 : sbox_out = 8'hBD;

      8'b00100000 : sbox_out = 8'h58;
      8'b00100001 : sbox_out = 8'h2F;
      8'b00100010 : sbox_out = 8'h0D;
      8'b00100011 : sbox_out = 8'h02;
      8'b00100100 : sbox_out = 8'hED;
      8'b00100101 : sbox_out = 8'h51;
      8'b00100110 : sbox_out = 8'h9E;
      8'b00100111 : sbox_out = 8'h11;
      8'b00101000 : sbox_out = 8'hF2;
      8'b00101001 : sbox_out = 8'h3E;
      8'b00101010 : sbox_out = 8'h55;
      8'b00101011 : sbox_out = 8'h5E;
      8'b00101100 : sbox_out = 8'hD1;
      8'b00101101 : sbox_out = 8'h16;
      8'b00101110 : sbox_out = 8'h3C;
      8'b00101111 : sbox_out = 8'h66;

      8'b00110000 : sbox_out = 8'h70;
      8'b00110001 : sbox_out = 8'h5D;
      8'b00110010 : sbox_out = 8'hF3;
      8'b00110011 : sbox_out = 8'h45;
      8'b00110100 : sbox_out = 8'h40;
      8'b00110101 : sbox_out = 8'hCC;
      8'b00110110 : sbox_out = 8'hE8;
      8'b00110111 : sbox_out = 8'h94;
      8'b00111000 : sbox_out = 8'h56;
      8'b00111001 : sbox_out = 8'h08;
      8'b00111010 : sbox_out = 8'hCE;
      8'b00111011 : sbox_out = 8'h1A;
      8'b00111100 : sbox_out = 8'h3A;
      8'b00111101 : sbox_out = 8'hD2;
      8'b00111110 : sbox_out = 8'hE1;
      8'b00111111 : sbox_out = 8'hDF;

      8'b01000000 : sbox_out = 8'hB5;
      8'b01000001 : sbox_out = 8'h38;
      8'b01000010 : sbox_out = 8'h6E;
      8'b01000011 : sbox_out = 8'h0E;
      8'b01000100 : sbox_out = 8'hE5;
      8'b01000101 : sbox_out = 8'hF4;
      8'b01000110 : sbox_out = 8'hF9;
      8'b01000111 : sbox_out = 8'h86;
      8'b01001000 : sbox_out = 8'hE9;
      8'b01001001 : sbox_out = 8'h4F;
      8'b01001010 : sbox_out = 8'hD6;
      8'b01001011 : sbox_out = 8'h85;
      8'b01001100 : sbox_out = 8'h23;
      8'b01001101 : sbox_out = 8'hCF;
      8'b01001110 : sbox_out = 8'h32;
      8'b01001111 : sbox_out = 8'h99;

      8'b01010000 : sbox_out = 8'h31;
      8'b01010001 : sbox_out = 8'h14;
      8'b01010010 : sbox_out = 8'hAE;
      8'b01010011 : sbox_out = 8'hEE;
      8'b01010100 : sbox_out = 8'hC8;
      8'b01010101 : sbox_out = 8'h48;
      8'b01010110 : sbox_out = 8'hD3;
      8'b01010111 : sbox_out = 8'h30;
      8'b01011000 : sbox_out = 8'hA1;
      8'b01011001 : sbox_out = 8'h92;
      8'b01011010 : sbox_out = 8'h41;
      8'b01011011 : sbox_out = 8'hB1;
      8'b01011100 : sbox_out = 8'h18;
      8'b01011101 : sbox_out = 8'hC4;
      8'b01011110 : sbox_out = 8'h2C;
      8'b01011111 : sbox_out = 8'h71;

      8'b01100000 : sbox_out = 8'h72;
      8'b01100001 : sbox_out = 8'h44;
      8'b01100010 : sbox_out = 8'h15;
      8'b01100011 : sbox_out = 8'hFD;
      8'b01100100 : sbox_out = 8'h37;
      8'b01100101 : sbox_out = 8'hBE;
      8'b01100110 : sbox_out = 8'h5F;
      8'b01100111 : sbox_out = 8'hAA;
      8'b01101000 : sbox_out = 8'h9B;
      8'b01101001 : sbox_out = 8'h88;
      8'b01101010 : sbox_out = 8'hD8;
      8'b01101011 : sbox_out = 8'hAB;
      8'b01101100 : sbox_out = 8'h89;
      8'b01101101 : sbox_out = 8'h9C;
      8'b01101110 : sbox_out = 8'hFA;
      8'b01101111 : sbox_out = 8'h60;

      8'b01110000 : sbox_out = 8'hEA;
      8'b01110001 : sbox_out = 8'hBC;
      8'b01110010 : sbox_out = 8'h62;
      8'b01110011 : sbox_out = 8'h0C;
      8'b01110100 : sbox_out = 8'h24;
      8'b01110101 : sbox_out = 8'hA6;
      8'b01110110 : sbox_out = 8'hA8;
      8'b01110111 : sbox_out = 8'hEC;
      8'b01111000 : sbox_out = 8'h67;
      8'b01111001 : sbox_out = 8'h20;
      8'b01111010 : sbox_out = 8'hDB;
      8'b01111011 : sbox_out = 8'h7C;
      8'b01111100 : sbox_out = 8'h28;
      8'b01111101 : sbox_out = 8'hDD;
      8'b01111110 : sbox_out = 8'hAC;
      8'b01111111 : sbox_out = 8'h5B;

      8'b10000000 : sbox_out = 8'h34;
      8'b10000001 : sbox_out = 8'h7E;
      8'b10000010 : sbox_out = 8'h10;
      8'b10000011 : sbox_out = 8'hF1;
      8'b10000100 : sbox_out = 8'h7B;
      8'b10000101 : sbox_out = 8'h8F;
      8'b10000110 : sbox_out = 8'h63;
      8'b10000111 : sbox_out = 8'hA0;
      8'b10001000 : sbox_out = 8'h05;
      8'b10001001 : sbox_out = 8'h9A;
      8'b10001010 : sbox_out = 8'h43;
      8'b10001011 : sbox_out = 8'h77;
      8'b10001100 : sbox_out = 8'h21;
      8'b10001101 : sbox_out = 8'hBF;
      8'b10001110 : sbox_out = 8'h27;
      8'b10001111 : sbox_out = 8'h09;

      8'b10010000 : sbox_out = 8'hC3;
      8'b10010001 : sbox_out = 8'h9F;
      8'b10010010 : sbox_out = 8'hB6;
      8'b10010011 : sbox_out = 8'hD7;
      8'b10010100 : sbox_out = 8'h29;
      8'b10010101 : sbox_out = 8'hC2;
      8'b10010110 : sbox_out = 8'hEB;
      8'b10010111 : sbox_out = 8'hC0;
      8'b10011000 : sbox_out = 8'hA4;
      8'b10011001 : sbox_out = 8'h8B;
      8'b10011010 : sbox_out = 8'h8C;
      8'b10011011 : sbox_out = 8'h1D;
      8'b10011100 : sbox_out = 8'hFB;
      8'b10011101 : sbox_out = 8'hFF;
      8'b10011110 : sbox_out = 8'hC1;
      8'b10011111 : sbox_out = 8'hB2;

      8'b10100000 : sbox_out = 8'h97;
      8'b10100001 : sbox_out = 8'h2E;
      8'b10100010 : sbox_out = 8'hF8;
      8'b10100011 : sbox_out = 8'h65;
      8'b10100100 : sbox_out = 8'hF6;
      8'b10100101 : sbox_out = 8'h75;
      8'b10100110 : sbox_out = 8'h07;
      8'b10100111 : sbox_out = 8'h04;
      8'b10101000 : sbox_out = 8'h49;
      8'b10101001 : sbox_out = 8'h33;
      8'b10101010 : sbox_out = 8'hE4;
      8'b10101011 : sbox_out = 8'hD9;
      8'b10101100 : sbox_out = 8'hB9;
      8'b10101101 : sbox_out = 8'hD0;
      8'b10101110 : sbox_out = 8'h42;
      8'b10101111 : sbox_out = 8'hC7;

      8'b10110000 : sbox_out = 8'h6C;
      8'b10110001 : sbox_out = 8'h90;
      8'b10110010 : sbox_out = 8'h00;
      8'b10110011 : sbox_out = 8'h8E;
      8'b10110100 : sbox_out = 8'h6F;
      8'b10110101 : sbox_out = 8'h50;
      8'b10110110 : sbox_out = 8'h01;
      8'b10110111 : sbox_out = 8'hC5;
      8'b10111000 : sbox_out = 8'hDA;
      8'b10111001 : sbox_out = 8'h47;
      8'b10111010 : sbox_out = 8'h3F;
      8'b10111011 : sbox_out = 8'hCD;
      8'b10111100 : sbox_out = 8'h69;
      8'b10111101 : sbox_out = 8'hA2;
      8'b10111110 : sbox_out = 8'hE2;
      8'b10111111 : sbox_out = 8'h7A;

      8'b11000000 : sbox_out = 8'hA7;
      8'b11000001 : sbox_out = 8'hC6;
      8'b11000010 : sbox_out = 8'h93;
      8'b11000011 : sbox_out = 8'h0F;
      8'b11000100 : sbox_out = 8'h0A;
      8'b11000101 : sbox_out = 8'h06;
      8'b11000110 : sbox_out = 8'hE6;
      8'b11000111 : sbox_out = 8'h2B;
      8'b11001000 : sbox_out = 8'h96;
      8'b11001001 : sbox_out = 8'hA3;
      8'b11001010 : sbox_out = 8'h1C;
      8'b11001011 : sbox_out = 8'hAF;
      8'b11001100 : sbox_out = 8'h6A;
      8'b11001101 : sbox_out = 8'h12;
      8'b11001110 : sbox_out = 8'h84;
      8'b11001111 : sbox_out = 8'h39;

      8'b11010000 : sbox_out = 8'hE7;
      8'b11010001 : sbox_out = 8'hB0;
      8'b11010010 : sbox_out = 8'h82;
      8'b11010011 : sbox_out = 8'hF7;
      8'b11010100 : sbox_out = 8'hFE;
      8'b11010101 : sbox_out = 8'h9D;
      8'b11010110 : sbox_out = 8'h87;
      8'b11010111 : sbox_out = 8'h5C;
      8'b11011000 : sbox_out = 8'h81;
      8'b11011001 : sbox_out = 8'h35;
      8'b11011010 : sbox_out = 8'hDE;
      8'b11011011 : sbox_out = 8'hB4;
      8'b11011100 : sbox_out = 8'hA5;
      8'b11011101 : sbox_out = 8'hFC;
      8'b11011110 : sbox_out = 8'h80;
      8'b11011111 : sbox_out = 8'hEF;

      8'b11100000 : sbox_out = 8'hCB;
      8'b11100001 : sbox_out = 8'hBB;
      8'b11100010 : sbox_out = 8'h6B;
      8'b11100011 : sbox_out = 8'h76;
      8'b11100100 : sbox_out = 8'hBA;
      8'b11100101 : sbox_out = 8'h5A;
      8'b11100110 : sbox_out = 8'h7D;
      8'b11100111 : sbox_out = 8'h78;
      8'b11101000 : sbox_out = 8'h0B;
      8'b11101001 : sbox_out = 8'h95;
      8'b11101010 : sbox_out = 8'hE3;
      8'b11101011 : sbox_out = 8'hAD;
      8'b11101100 : sbox_out = 8'h74;
      8'b11101101 : sbox_out = 8'h98;
      8'b11101110 : sbox_out = 8'h3B;
      8'b11101111 : sbox_out = 8'h36;

      8'b11110000 : sbox_out = 8'h64;
      8'b11110001 : sbox_out = 8'h6D;
      8'b11110010 : sbox_out = 8'hDC;
      8'b11110011 : sbox_out = 8'hF0;
      8'b11110100 : sbox_out = 8'h59;
      8'b11110101 : sbox_out = 8'hA9;
      8'b11110110 : sbox_out = 8'h4C;
      8'b11110111 : sbox_out = 8'h17;
      8'b11111000 : sbox_out = 8'h7F;
      8'b11111001 : sbox_out = 8'h91;
      8'b11111010 : sbox_out = 8'hB8;
      8'b11111011 : sbox_out = 8'hC9;
      8'b11111100 : sbox_out = 8'h57;
      8'b11111101 : sbox_out = 8'h1B;
      8'b11111110 : sbox_out = 8'hE0;
      8'b11111111 : sbox_out = 8'h61;

      default : sbox_out = 8'd0;
    endcase
  end
end

endmodule

//64-bit Addition - Behavioral
module add64 (oper_one, oper_two, oper_out);

input [63:0] oper_one, oper_two;
output [63:0] oper_out;

assign oper_out = oper_one + oper_two;

endmodule

// TODO: Commented-out because the implementation of the same module in kalyna_misc.sv
// has the needed BLOCK_SIZE options for both Kalyna and Kupyna and this block overwrites the
// Kalyna definition with more parameters
//Modulo 2^64 Addition
// module mod2p64_add #(parameter BLOCK_SIZE = 512) (m2p64add_in_one, m2p64add_in_two, m2p64add_out);

// input [BLOCK_SIZE-1:0] m2p64add_in_one, m2p64add_in_two;
// output [BLOCK_SIZE-1:0] m2p64add_out;

// localparam col_m1 = (BLOCK_SIZE == 512) ? 3'd7 : 4'd15;
// localparam col_cnt = (BLOCK_SIZE == 512) ? 4'd8 : 5'd16;

// wire [63:0] oper_one [0:col_m1];
// wire [63:0] oper_two [0:col_m1];
// wire [63:0] oper_out [0:col_m1];

// genvar i;
// generate
//   for (i=0; i<col_cnt; i=i+1) begin
//     assign oper_one[i] = { m2p64add_in_one[i*64+7 : i*64], m2p64add_in_one[i*64+15 : i*64+8], m2p64add_in_one[i*64+23 : i*64+16], m2p64add_in_one[i*64+31 : i*64+24], m2p64add_in_one[i*64+39 : i*64+32], m2p64add_in_one[i*64+47 : i*64+40], m2p64add_in_one[i*64+55 : i*64+48], m2p64add_in_one[i*64+63 : i*64+56] };
//     assign oper_two[i] = { m2p64add_in_two[i*64+7 : i*64], m2p64add_in_two[i*64+15 : i*64+8], m2p64add_in_two[i*64+23 : i*64+16], m2p64add_in_two[i*64+31 : i*64+24], m2p64add_in_two[i*64+39 : i*64+32], m2p64add_in_two[i*64+47 : i*64+40], m2p64add_in_two[i*64+55 : i*64+48], m2p64add_in_two[i*64+63 : i*64+56] };

//     `ifdef KSA
//       Kogge_Stone_Adder ksa64_ins (.A(oper_one[i]), .B(oper_two[i]), .S(oper_out[i]));
//     `elsif BHA
//       add64 add64_ins (.oper_one(oper_one[i]), .oper_two(oper_two[i]), .oper_out(oper_out[i]));
//     `endif

//     assign m2p64add_out[i*64+63 : i*64] = { oper_out[i][7:0], oper_out[i][15:8], oper_out[i][23:16], oper_out[i][31:24], oper_out[i][39:32], oper_out[i][47:40], oper_out[i][55:48], oper_out[i][63:56] };
//   end
// endgenerate

// endmodule

//Modulo 2^64 Addition Serial 64-bit
module mod2p64_add_serial64b #(parameter BLOCK_SIZE = 512) (clk, rst, m2p64add_start, m2p64add_in_one, m2p64add_in_two, m2p64add_out, m2p64add_rdy);

input clk, rst, m2p64add_start;
input [BLOCK_SIZE-1:0] m2p64add_in_one, m2p64add_in_two;
output [BLOCK_SIZE-1:0] m2p64add_out;
output reg m2p64add_rdy;

localparam col_m1 = (BLOCK_SIZE == 512) ? 3'd7 : 4'd15;
localparam col_cnt = (BLOCK_SIZE == 512) ? 4'd8 : 5'd16;
localparam col_size = (BLOCK_SIZE == 512) ? 3'd4 : 3'd5;

//Variables
wire [63:0] oper_one;
wire [63:0] oper_two;
wire [63:0] oper_out;
reg [col_size-1:0] col_counter;
reg [BLOCK_SIZE-1:0] reg_add_out;

//Counter
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    col_counter <= {col_size{1'b0}};
  end
  else if (m2p64add_start == 1'b0) begin
    col_counter <= {col_size{1'b0}};
  end
  else begin
    if (col_counter < col_cnt) begin
      col_counter <= col_counter + 1'b1;
    end
    else begin
      col_counter <= {col_size{1'b0}};
    end
  end
end

//Assignment to the Output
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    m2p64add_rdy <= 1'b0;
    reg_add_out <= {BLOCK_SIZE{1'b0}};
  end
  else if (m2p64add_start == 1'b0) begin
    m2p64add_rdy <= 1'b0;
    reg_add_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    reg_add_out[col_counter*64 +: 64] <= { oper_out[7:0], oper_out[15:8], oper_out[23:16], oper_out[31:24], oper_out[39:32], oper_out[47:40], oper_out[55:48], oper_out[63:56] };
    if (col_counter == col_m1) begin
      m2p64add_rdy <= 1'b1;
    end
    else begin
      m2p64add_rdy <= 1'b0;
    end
  end
end

//64-bit Addition Inputs
assign oper_one = {m2p64add_in_one[col_counter*64    +: 8],
                   m2p64add_in_one[col_counter*64+8  +: 8],
                   m2p64add_in_one[col_counter*64+16 +: 8],
                   m2p64add_in_one[col_counter*64+24 +: 8],
                   m2p64add_in_one[col_counter*64+32 +: 8],
                   m2p64add_in_one[col_counter*64+40 +: 8],
                   m2p64add_in_one[col_counter*64+48 +: 8],
                   m2p64add_in_one[col_counter*64+56 +: 8]};

assign oper_two = {m2p64add_in_two[col_counter*64    +: 8],
                   m2p64add_in_two[col_counter*64+8  +: 8],
                   m2p64add_in_two[col_counter*64+16 +: 8],
                   m2p64add_in_two[col_counter*64+24 +: 8],
                   m2p64add_in_two[col_counter*64+32 +: 8],
                   m2p64add_in_two[col_counter*64+40 +: 8],
                   m2p64add_in_two[col_counter*64+48 +: 8],
                   m2p64add_in_two[col_counter*64+56 +: 8]};

//64-bit Addition
`ifdef KSA
  Kogge_Stone_Adder ksa64_ins (.A(oper_one), .B(oper_two), .S(oper_out));
`elsif BHA
  add64 add64_ins (.oper_one(oper_one), .oper_two(oper_two), .oper_out(oper_out));
`endif

//Addition Output
assign m2p64add_out = reg_add_out;

endmodule

//Modulo 2 Addition
module mod2_add #(parameter BLOCK_SIZE = 512) (m2add_in_one, m2add_in_two, m2add_out);

input [BLOCK_SIZE-1:0] m2add_in_one, m2add_in_two;
output [BLOCK_SIZE-1:0] m2add_out;

assign m2add_out = m2add_in_one ^ m2add_in_two;

endmodule

//Modulo 2 Addition Serial 64-bit
module mod2_add_serial64b #(parameter BLOCK_SIZE = 512) (clk, rst, m2add_start, m2add_in_one, m2add_in_two, m2add_out, m2add_rdy);

input clk, rst, m2add_start;
input [BLOCK_SIZE-1:0] m2add_in_one, m2add_in_two;
output [BLOCK_SIZE-1:0] m2add_out;
output reg m2add_rdy;

localparam col_m1 = (BLOCK_SIZE == 512) ? 3'd7 : 4'd15;
localparam col_cnt = (BLOCK_SIZE == 512) ? 4'd8 : 5'd16;
localparam col_size = (BLOCK_SIZE == 512) ? 3'd4 : 3'd5;

wire [63:0] xor_out;
reg [col_size-1:0] col_counter;
reg [BLOCK_SIZE-1:0] reg_xor_out;

//Counter
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    col_counter <= {col_size{1'b0}};
  end
  else if (m2add_start == 1'b0) begin
    col_counter <= {col_size{1'b0}};
  end
  else begin
    if (col_counter < col_cnt) begin
      col_counter <= col_counter + 1'b1;
    end
    else begin
      col_counter <= {col_size{1'b0}};
    end
  end
end

//Assignment to the Output
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    m2add_rdy <= 1'b0;
    reg_xor_out <= {BLOCK_SIZE{1'b0}};
  end
  else if (m2add_start == 1'b0) begin
    m2add_rdy <= 1'b0;
    reg_xor_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    reg_xor_out[col_counter*64 +: 64] <= xor_out;
    if (col_counter == col_m1) begin
      m2add_rdy <= 1'b1;
    end
    else begin
      m2add_rdy <= 1'b0;
    end
  end
end

//XOR operation
assign xor_out = m2add_in_one[col_counter*64 +: 64] ^ m2add_in_two[col_counter*64 +: 64];

//Addition Output
assign m2add_out = reg_xor_out;

endmodule

//Addition Input Generation
module gen_add_in #(parameter BLOCK_SIZE = 512) (gai_in, gai_out);

input [3:0] gai_in;
output reg [BLOCK_SIZE-1:0] gai_out;

localparam col_m1 = (BLOCK_SIZE == 512) ? 4'd7 : 4'd15;
localparam col_cnt = (BLOCK_SIZE == 512) ? 4'd8 : 5'd16;
localparam col_size = (BLOCK_SIZE == 512) ? 3'd4 : 4'd8;

reg [3:0] i;
reg [col_size-1:0] j;

always @ (*) begin
  for (j=0; j<col_cnt; j=j+1) begin
    for (i=0; i<8; i=i+1) begin
      if (i == 0) begin
        gai_out[(7-i)*8+(col_m1-j)*64 +: 8] = 8'hF3;
      end
      else if (i == 3'd7) begin
        gai_out[(7-i)*8+(col_m1-j)*64 +: 8] = {col_m1-j, gai_in};
      end
      else begin
        gai_out[(7-i)*8+(col_m1-j)*64 +: 8] = 8'hF0;
      end
    end
  end
end

endmodule

//XOR Input Generation
module gen_xor_in #(parameter BLOCK_SIZE = 512) (gxi_in, gxi_out);

input [3:0] gxi_in;
output reg [BLOCK_SIZE-1:0] gxi_out;

localparam col_m1 = (BLOCK_SIZE == 512) ? 4'd7 : 4'd15;
localparam col_cnt = (BLOCK_SIZE == 512) ? 4'd8 : 5'd16;
localparam col_size = (BLOCK_SIZE == 512) ? 3'd4 : 4'd8;

reg [3:0] i;
reg [col_size-1:0] j;

always @ (*) begin
  for (j=0; j<col_cnt; j=j+1) begin
    for (i=0; i<8; i=i+1) begin
      if (i == 3'd0) begin
        gxi_out[(7-i)*8+(col_m1-j)*64 +: 8] = {j, gxi_in};
      end
      else begin
        gxi_out[(7-i)*8+(col_m1-j)*64 +: 8] = 8'h00;
      end
    end
  end
end

endmodule

//SUBSTITUTE BYTE using a Single S-Box
module substitute_byte_onesbox #(parameter BLOCK_SIZE = 512) (sb_in, sb_out);

input [BLOCK_SIZE-1:0] sb_in;
output [BLOCK_SIZE-1:0] sb_out;

localparam byte_cnt = (BLOCK_SIZE == 512) ? 8'd64 : 9'd128;
localparam bc_size = (BLOCK_SIZE == 512) ? 4'd7 : 4'd8;

genvar i;
generate
  for (i=0; i<byte_cnt; i=i+1) begin
    parameter [bc_size-1:0] BC = i;
    sbox #(.BC_SIZE(bc_size)) sbox_ins (.sbox_ind(BC), .sbox_in(sb_in[(byte_cnt-i)*8-1 : (byte_cnt-i-1)*8]), .sbox_out(sb_out[(byte_cnt-i)*8-1 : (byte_cnt-i-1)*8]));
  end
endgenerate

endmodule

// TODO: Commented-out because the implementation of the same module in kalyna_misc.sv
// has the needed BLOCK_SIZE options for both Kalyna and Kupyna and this block overwrites the
// Kalyna definition with more parameters
//SUBSTITUTE BYTE using 4 S-Boxes
// module substitute_byte_foursbox #(parameter BLOCK_SIZE = 512) (sb_in, sb_out);

// input [BLOCK_SIZE-1:0] sb_in;
// output [BLOCK_SIZE-1:0] sb_out;

// localparam byte_cnt = (BLOCK_SIZE == 512) ? 5'd16 : 6'd32;

// genvar i;
// generate
//   for (i=0; i<byte_cnt; i=i+1) begin
//     `ifdef OPT
//       sbox_3_alt6 sbox3_ins (.sbox_in(sb_in[(byte_cnt-i-1)*32+7  : (byte_cnt-i-1)*32]),    .sbox_out(sb_out[(byte_cnt-i-1)*32+7  : (byte_cnt-i-1)*32]));
//       sbox_2_alt6 sbox2_ins (.sbox_in(sb_in[(byte_cnt-i-1)*32+15 : (byte_cnt-i-1)*32+8]),  .sbox_out(sb_out[(byte_cnt-i-1)*32+15 : (byte_cnt-i-1)*32+8]));
//       sbox_1_alt6 sbox1_ins (.sbox_in(sb_in[(byte_cnt-i-1)*32+23 : (byte_cnt-i-1)*32+16]), .sbox_out(sb_out[(byte_cnt-i-1)*32+23 : (byte_cnt-i-1)*32+16]));
//       sbox_0_alt6 sbox0_ins (.sbox_in(sb_in[(byte_cnt-i-1)*32+31 : (byte_cnt-i-1)*32+24]), .sbox_out(sb_out[(byte_cnt-i-1)*32+31 : (byte_cnt-i-1)*32+24]));
//     `elsif NOOPT
//       sbox_3 sbox3_ins (.sbox_in(sb_in[(byte_cnt-i-1)*32+7  : (byte_cnt-i-1)*32]),    .sbox_out(sb_out[(byte_cnt-i-1)*32+7  : (byte_cnt-i-1)*32]));
//       sbox_2 sbox2_ins (.sbox_in(sb_in[(byte_cnt-i-1)*32+15 : (byte_cnt-i-1)*32+8]),  .sbox_out(sb_out[(byte_cnt-i-1)*32+15 : (byte_cnt-i-1)*32+8]));
//       sbox_1 sbox1_ins (.sbox_in(sb_in[(byte_cnt-i-1)*32+23 : (byte_cnt-i-1)*32+16]), .sbox_out(sb_out[(byte_cnt-i-1)*32+23 : (byte_cnt-i-1)*32+16]));
//       sbox_0 sbox0_ins (.sbox_in(sb_in[(byte_cnt-i-1)*32+31 : (byte_cnt-i-1)*32+24]), .sbox_out(sb_out[(byte_cnt-i-1)*32+31 : (byte_cnt-i-1)*32+24]));
//     `endif
//   end
// endgenerate

// endmodule

//SUBSTITUTE BYTE for 64-bit column
module substitute_byte_64b (sb_in, sb_out);

input [63:0] sb_in;
output [63:0] sb_out;

genvar i;
generate
  for (i=0; i<2; i=i+1) begin
    `ifdef OPT
      sbox_3_alt6 sbox3_ins (.sbox_in(sb_in[(1-i)*32+7  : (1-i)*32]),    .sbox_out(sb_out[(1-i)*32+7  : (1-i)*32]));
      sbox_2_alt6 sbox2_ins (.sbox_in(sb_in[(1-i)*32+15 : (1-i)*32+8]),  .sbox_out(sb_out[(1-i)*32+15 : (1-i)*32+8]));
      sbox_1_alt6 sbox1_ins (.sbox_in(sb_in[(1-i)*32+23 : (1-i)*32+16]), .sbox_out(sb_out[(1-i)*32+23 : (1-i)*32+16]));
      sbox_0_alt6 sbox0_ins (.sbox_in(sb_in[(1-i)*32+31 : (1-i)*32+24]), .sbox_out(sb_out[(1-i)*32+31 : (1-i)*32+24]));
    `elsif NOOPT
      sbox_3 sbox3_ins (.sbox_in(sb_in[(1-i)*32+7  : (1-i)*32]),    .sbox_out(sb_out[(1-i)*32+7  : (1-i)*32]));
      sbox_2 sbox2_ins (.sbox_in(sb_in[(1-i)*32+15 : (1-i)*32+8]),  .sbox_out(sb_out[(1-i)*32+15 : (1-i)*32+8]));
      sbox_1 sbox1_ins (.sbox_in(sb_in[(1-i)*32+23 : (1-i)*32+16]), .sbox_out(sb_out[(1-i)*32+23 : (1-i)*32+16]));
      sbox_0 sbox0_ins (.sbox_in(sb_in[(1-i)*32+31 : (1-i)*32+24]), .sbox_out(sb_out[(1-i)*32+31 : (1-i)*32+24]));
    `endif
  end
endgenerate

endmodule

//PERMUTE STATE
module permute_state #(parameter BLOCK_SIZE = 512) (ps_in, ps_out);

input [BLOCK_SIZE-1:0] ps_in;
output reg [BLOCK_SIZE-1:0] ps_out;

localparam col_m1 = (BLOCK_SIZE == 512) ? 3'd7 : 4'd15;
localparam col_cnt = (BLOCK_SIZE == 512) ? 4'd8 : 5'd16;
localparam col_size = (BLOCK_SIZE == 512) ? 3'd4 : 4'd8;
localparam lr_shift = (BLOCK_SIZE == 512) ? 4'd7 : 4'd11;

reg [3:0] i;
reg [col_size-1:0] j;

always @ (*) begin
  for (i=0; i<8; i=i+1) begin
    for (j=0; j<col_cnt; j=j+1) begin
      if (i < 4'd7) begin
        ps_out[BLOCK_SIZE-(j*64+i*8)-8 +: 8] = ps_in[BLOCK_SIZE-(((j-i) % col_cnt)*64+i*8)-8 +: 8];
      end
      else if (i == 4'd7) begin
        ps_out[BLOCK_SIZE-(j*64+i*8)-8 +: 8] = ps_in[BLOCK_SIZE-(((j-lr_shift) % col_cnt)*64+i*8)-8 +: 8];
      end
    end
  end
end

endmodule

// TODO: Commented-out because the implementation of the same module in kalyna_misc.sv
// has the needed BLOCK_SIZE options for both Kalyna and Kupyna and this block overwrites the
// Kalyna definition with more parameters
//MIX COLUMN
// module mix_column #(parameter BLOCK_SIZE = 512) (mc_in, mc_out);

// input [BLOCK_SIZE-1:0] mc_in;
// output [BLOCK_SIZE-1:0] mc_out;

// localparam col_cnt = (BLOCK_SIZE == 512) ? 4'd8 : 5'd16;

// genvar i;
// generate
//   for (i=0; i<col_cnt; i=i+1) begin
//     `ifdef OPT
//        cmvm_gf_opt cmvm_ins (.mds_in0 (mc_in [BLOCK_SIZE-i*64-1    : BLOCK_SIZE-i*64-8]),
//                              .mds_in1 (mc_in [BLOCK_SIZE-i*64-8-1  : BLOCK_SIZE-i*64-16]),
//                              .mds_in2 (mc_in [BLOCK_SIZE-i*64-16-1 : BLOCK_SIZE-i*64-24]),
//                              .mds_in3 (mc_in [BLOCK_SIZE-i*64-24-1 : BLOCK_SIZE-i*64-32]),
//                              .mds_in4 (mc_in [BLOCK_SIZE-i*64-32-1 : BLOCK_SIZE-i*64-40]),
//                              .mds_in5 (mc_in [BLOCK_SIZE-i*64-40-1 : BLOCK_SIZE-i*64-48]),
//                              .mds_in6 (mc_in [BLOCK_SIZE-i*64-48-1 : BLOCK_SIZE-i*64-56]),
//                              .mds_in7 (mc_in [BLOCK_SIZE-i*64-56-1 : BLOCK_SIZE-i*64-64]),
//                              .mds_out0(mc_out[BLOCK_SIZE-i*64-1    : BLOCK_SIZE-i*64-8]),
//                              .mds_out1(mc_out[BLOCK_SIZE-i*64-8-1  : BLOCK_SIZE-i*64-16]),
//                              .mds_out2(mc_out[BLOCK_SIZE-i*64-16-1 : BLOCK_SIZE-i*64-24]),
//                              .mds_out3(mc_out[BLOCK_SIZE-i*64-24-1 : BLOCK_SIZE-i*64-32]),
//                              .mds_out4(mc_out[BLOCK_SIZE-i*64-32-1 : BLOCK_SIZE-i*64-40]),
//                              .mds_out5(mc_out[BLOCK_SIZE-i*64-40-1 : BLOCK_SIZE-i*64-48]),
//                              .mds_out6(mc_out[BLOCK_SIZE-i*64-48-1 : BLOCK_SIZE-i*64-56]),
//                              .mds_out7(mc_out[BLOCK_SIZE-i*64-56-1 : BLOCK_SIZE-i*64-64]));
//     `elsif NOOPT
//        cmvm_gf cmvm_ins (.mds_in0 (mc_in [BLOCK_SIZE-i*64-1    : BLOCK_SIZE-i*64-8]),
//                          .mds_in1 (mc_in [BLOCK_SIZE-i*64-8-1  : BLOCK_SIZE-i*64-16]),
//                          .mds_in2 (mc_in [BLOCK_SIZE-i*64-16-1 : BLOCK_SIZE-i*64-24]),
//                          .mds_in3 (mc_in [BLOCK_SIZE-i*64-24-1 : BLOCK_SIZE-i*64-32]),
//                          .mds_in4 (mc_in [BLOCK_SIZE-i*64-32-1 : BLOCK_SIZE-i*64-40]),
//                          .mds_in5 (mc_in [BLOCK_SIZE-i*64-40-1 : BLOCK_SIZE-i*64-48]),
//                          .mds_in6 (mc_in [BLOCK_SIZE-i*64-48-1 : BLOCK_SIZE-i*64-56]),
//                          .mds_in7 (mc_in [BLOCK_SIZE-i*64-56-1 : BLOCK_SIZE-i*64-64]),
//                          .mds_out0(mc_out[BLOCK_SIZE-i*64-1    : BLOCK_SIZE-i*64-8]),
//                          .mds_out1(mc_out[BLOCK_SIZE-i*64-8-1  : BLOCK_SIZE-i*64-16]),
//                          .mds_out2(mc_out[BLOCK_SIZE-i*64-16-1 : BLOCK_SIZE-i*64-24]),
//                          .mds_out3(mc_out[BLOCK_SIZE-i*64-24-1 : BLOCK_SIZE-i*64-32]),
//                          .mds_out4(mc_out[BLOCK_SIZE-i*64-32-1 : BLOCK_SIZE-i*64-40]),
//                          .mds_out5(mc_out[BLOCK_SIZE-i*64-40-1 : BLOCK_SIZE-i*64-48]),
//                          .mds_out6(mc_out[BLOCK_SIZE-i*64-48-1 : BLOCK_SIZE-i*64-56]),
//                          .mds_out7(mc_out[BLOCK_SIZE-i*64-56-1 : BLOCK_SIZE-i*64-64]));
//     `endif
//   end
// endgenerate

// endmodule

//MIX COLUMN - 64BIT
module mix_column_64b (mc_in, mc_out);

input [63:0] mc_in;
output [63:0] mc_out;

`ifdef OPT
  cmvm_gf_opt cmvm_ins (.mds_in0 (mc_in [63 : 56]),
                        .mds_in1 (mc_in [55 : 48]),
                        .mds_in2 (mc_in [47 : 40]),
                        .mds_in3 (mc_in [39 : 32]),
                        .mds_in4 (mc_in [31 : 24]),
                        .mds_in5 (mc_in [23 : 16]),
                        .mds_in6 (mc_in [15 : 8]),
                        .mds_in7 (mc_in [7  : 0]),
                        .mds_out0(mc_out[63 : 56]),
                        .mds_out1(mc_out[55 : 48]),
                        .mds_out2(mc_out[47 : 40]),
                        .mds_out3(mc_out[39 : 32]),
                        .mds_out4(mc_out[31 : 24]),
                        .mds_out5(mc_out[23 : 16]),
                        .mds_out6(mc_out[15 : 8]),
                        .mds_out7(mc_out[7  : 0]));
`elsif NOOPT
  cmvm_gf cmvm_ins (.mds_in0 (mc_in [63 : 56]),
                    .mds_in1 (mc_in [55 : 48]),
                    .mds_in2 (mc_in [47 : 40]),
                    .mds_in3 (mc_in [39 : 32]),
                    .mds_in4 (mc_in [31 : 24]),
                    .mds_in5 (mc_in [23 : 16]),
                    .mds_in6 (mc_in [15 : 8]),
                    .mds_in7 (mc_in [7  : 0]),
                    .mds_out0(mc_out[63 : 56]),
                    .mds_out1(mc_out[55 : 48]),
                    .mds_out2(mc_out[47 : 40]),
                    .mds_out3(mc_out[39 : 32]),
                    .mds_out4(mc_out[31 : 24]),
                    .mds_out5(mc_out[23 : 16]),
                    .mds_out6(mc_out[15 : 8]),
                    .mds_out7(mc_out[7  : 0]));
`endif

endmodule

//COMBINATION OF SUBSTITUTE BYTE PERMUTE STATE AND MIX COLUMN OPERATIONS IN A 64-BIT BLOCK
module sbpsmc_serial64b #(parameter BLOCK_SIZE = 512) (clk, rst, sbpsmc_start, sbpsmc_in, sbpsmc_out, sbpsmc_rdy);

input clk, rst, sbpsmc_start;
input [BLOCK_SIZE-1:0] sbpsmc_in;
output [BLOCK_SIZE-1:0] sbpsmc_out;
output reg sbpsmc_rdy;

localparam col_m1 = (BLOCK_SIZE == 512) ? 3'd7 : 4'd15;
localparam col_cnt = (BLOCK_SIZE == 512) ? 4'd8 : 5'd16;
localparam col_size = (BLOCK_SIZE == 512) ? 3'd4 : 3'd5;

//Variables
wire [63:0] sb_out, mc_out;
reg [col_size-1:0] col_counter;
reg [BLOCK_SIZE-1:0] reg_sbpsmc_out;
reg [63:0] sb_per_in;
integer i;

//Counter to manipulate each column
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    col_counter <= {col_size{1'b0}};
  end
  else if (sbpsmc_start == 1'b0) begin
    col_counter <= {col_size{1'b0}};
  end
  else begin
    if (col_counter < col_cnt) begin
      col_counter <= col_counter + 1'b1;
    end
    else begin
      col_counter <= {col_size{1'b0}};
    end
  end
end

//Assignment to the Output
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    sbpsmc_rdy <= 1'b0;
    reg_sbpsmc_out <= {BLOCK_SIZE{1'b0}};
  end
  else if (sbpsmc_start == 1'b0) begin
    sbpsmc_rdy <= 1'b0;
    reg_sbpsmc_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    reg_sbpsmc_out[(col_m1-col_counter)*64 +: 64] <= mc_out;
    if (col_counter == col_m1) begin
      sbpsmc_rdy <= 1'b1;
    end
    else begin
      sbpsmc_rdy <= 1'b0;
    end
  end
end

//Permutation
always @ (*) begin
  if (BLOCK_SIZE == 512) begin
    if (col_counter < col_cnt) begin
      sb_per_in = {sbpsmc_in[(BLOCK_SIZE-((col_counter+0) % 8)*64)-8  +: 8],
                   sbpsmc_in[(BLOCK_SIZE-((col_counter+7) % 8)*64)-16 +: 8],
                   sbpsmc_in[(BLOCK_SIZE-((col_counter+6) % 8)*64)-24 +: 8],
                   sbpsmc_in[(BLOCK_SIZE-((col_counter+5) % 8)*64)-32 +: 8],
                   sbpsmc_in[(BLOCK_SIZE-((col_counter+4) % 8)*64)-40 +: 8],
                   sbpsmc_in[(BLOCK_SIZE-((col_counter+3) % 8)*64)-48 +: 8],
                   sbpsmc_in[(BLOCK_SIZE-((col_counter+2) % 8)*64)-56 +: 8],
                   sbpsmc_in[(BLOCK_SIZE-((col_counter+1) % 8)*64)-64 +: 8]};
    end
    else begin
      sb_per_in = 64'd0;
    end
  end
  else begin
    if (col_counter < col_cnt) begin
      sb_per_in = {sbpsmc_in[(BLOCK_SIZE-((col_counter+0)  % 16)*64)-8  +: 8],
                   sbpsmc_in[(BLOCK_SIZE-((col_counter+15) % 16)*64)-16 +: 8],
                   sbpsmc_in[(BLOCK_SIZE-((col_counter+14) % 16)*64)-24 +: 8],
                   sbpsmc_in[(BLOCK_SIZE-((col_counter+13) % 16)*64)-32 +: 8],
                   sbpsmc_in[(BLOCK_SIZE-((col_counter+12) % 16)*64)-40 +: 8],
                   sbpsmc_in[(BLOCK_SIZE-((col_counter+11) % 16)*64)-48 +: 8],
                   sbpsmc_in[(BLOCK_SIZE-((col_counter+10) % 16)*64)-56 +: 8],
                   sbpsmc_in[(BLOCK_SIZE-((col_counter+5)  % 16)*64)-64 +: 8]};
    end
    else begin
      sb_per_in = 64'd0;
    end
  end
end

//Byte Substitution and Mix Column
substitute_byte_64b sb64b_ins (.sb_in(sb_per_in), .sb_out(sb_out));
mix_column_64b mc64b_ins (.mc_in(sb_out), .mc_out(mc_out));

assign sbpsmc_out = reg_sbpsmc_out;

endmodule

//COMBINATION OF SUBSTITUTE BYTE PERMUTE STATE AND MIX COLUMN OPERATIONS IN A 64-BIT BLOCK with ADD and XOR TRANSFORMATIONS
module addxor_sbpsmc_serial64b #(parameter BLOCK_SIZE = 512) (clk, rst, sbpsmc_start, sbpsmc_in, sbpsmc_out, sbpsmc_rdy);

input clk, rst, sbpsmc_start;
input [2*BLOCK_SIZE-1:0] sbpsmc_in;
output [2*BLOCK_SIZE-1:0] sbpsmc_out;
output reg sbpsmc_rdy;

localparam col_m1 = (BLOCK_SIZE == 512) ? 4'd15 : 5'd31;
localparam col_cnt = (BLOCK_SIZE == 512) ? 5'd16 : 6'd32;
localparam col_size = (BLOCK_SIZE == 512) ? 3'd5 : 3'd6;

//Variables
wire [63:0] sb_out, mc_out;
reg [col_size-1:0] col_counter;
reg [2*BLOCK_SIZE-1:0] reg_sbpsmc_out;
reg [63:0] sb_per_in;
integer i;

//Counter to manipulate each column
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    col_counter <= {col_size{1'b0}};
  end
  else if (sbpsmc_start == 1'b0) begin
    col_counter <= {col_size{1'b0}};
  end
  else begin
    if (col_counter < col_cnt) begin
      col_counter <= col_counter + 1'b1;
    end
    else begin
      col_counter <= {col_size{1'b0}};
    end
  end
end

//Assignment to the Output
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    sbpsmc_rdy = 1'b0;
    reg_sbpsmc_out = {2*BLOCK_SIZE{1'b0}};
  end
  else if (sbpsmc_start == 1'b0) begin
    sbpsmc_rdy = 1'b0;
    reg_sbpsmc_out = {2*BLOCK_SIZE{1'b0}};
  end
  else begin
    reg_sbpsmc_out[(col_m1-col_counter)*64 +: 64] = mc_out;
    if (col_counter == col_m1) begin
      sbpsmc_rdy = 1'b1;
    end
    else begin
      sbpsmc_rdy = 1'b0;
    end
  end
end

//Permutation
always @ (*) begin
  if (BLOCK_SIZE == 512) begin
    if (col_counter < col_cnt) begin
      sb_per_in = {sbpsmc_in[(1024-512*(col_counter/8)-((col_counter+0) % 8)*64)-8  +: 8],
                   sbpsmc_in[(1024-512*(col_counter/8)-((col_counter+7) % 8)*64)-16 +: 8],
                   sbpsmc_in[(1024-512*(col_counter/8)-((col_counter+6) % 8)*64)-24 +: 8],
                   sbpsmc_in[(1024-512*(col_counter/8)-((col_counter+5) % 8)*64)-32 +: 8],
                   sbpsmc_in[(1024-512*(col_counter/8)-((col_counter+4) % 8)*64)-40 +: 8],
                   sbpsmc_in[(1024-512*(col_counter/8)-((col_counter+3) % 8)*64)-48 +: 8],
                   sbpsmc_in[(1024-512*(col_counter/8)-((col_counter+2) % 8)*64)-56 +: 8],
                   sbpsmc_in[(1024-512*(col_counter/8)-((col_counter+1) % 8)*64)-64 +: 8]};
    end
    else begin
      sb_per_in = 64'd0;
    end
  end
  else begin
    if (col_counter < col_cnt) begin
      sb_per_in = {sbpsmc_in[(2048-1024*(col_counter/16)-((col_counter+0)  % 16)*64)-8  +: 8],
                   sbpsmc_in[(2048-1024*(col_counter/16)-((col_counter+15) % 16)*64)-16 +: 8],
                   sbpsmc_in[(2048-1024*(col_counter/16)-((col_counter+14) % 16)*64)-24 +: 8],
                   sbpsmc_in[(2048-1024*(col_counter/16)-((col_counter+13) % 16)*64)-32 +: 8],
                   sbpsmc_in[(2048-1024*(col_counter/16)-((col_counter+12) % 16)*64)-40 +: 8],
                   sbpsmc_in[(2048-1024*(col_counter/16)-((col_counter+11) % 16)*64)-48 +: 8],
                   sbpsmc_in[(2048-1024*(col_counter/16)-((col_counter+10) % 16)*64)-56 +: 8],
                   sbpsmc_in[(2048-1024*(col_counter/16)-((col_counter+5)  % 16)*64)-64 +: 8]};
    end
    else begin
      sb_per_in = 64'd0;
    end
  end
end

//Byte Substitution and Mix Column
substitute_byte_64b sb64b_ins (.sb_in(sb_per_in), .sb_out(sb_out));
mix_column_64b mc64b_ins (.mc_in(sb_out), .mc_out(mc_out));

assign sbpsmc_out = reg_sbpsmc_out;

endmodule

//ADD TRANSFORMATION
module add_transform #(parameter BLOCK_SIZE = 512) (add_in, add_out);

input [BLOCK_SIZE-1:0] add_in;
output [BLOCK_SIZE-1:0] add_out;

localparam rnd_cnt = (BLOCK_SIZE == 512) ? 4'd10 : 4'd14;

//Variables
wire [BLOCK_SIZE-1:0] rnd_in_mat [0:rnd_cnt];
wire [BLOCK_SIZE-1:0] gen_in_mat [0:rnd_cnt-1];
wire [BLOCK_SIZE-1:0] mod_add_mat [0:rnd_cnt-1];
wire [BLOCK_SIZE-1:0] sub_byte_mat [0:rnd_cnt-1];
wire [BLOCK_SIZE-1:0] per_state_mat [0:rnd_cnt-1];
wire [BLOCK_SIZE-1:0] mix_column_mat [0:rnd_cnt-1];

assign rnd_in_mat[0] = add_in;

genvar i;
generate
  for (i=0; i<rnd_cnt; i=i+1) begin
    parameter [3:0] NR = i;

    gen_add_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins  (.gai_in(NR), .gai_out(gen_in_mat[i]));
    mod2p64_add #(.BLOCK_SIZE(BLOCK_SIZE)) m2p64a_ins (.m2p64add_in_one(gen_in_mat[i]), .m2p64add_in_two(rnd_in_mat[i]), .m2p64add_out(mod_add_mat[i]));
    substitute_byte_foursbox #(.BLOCK_SIZE(BLOCK_SIZE)) sb_ins (.sb_in(mod_add_mat[i]), .sb_out(sub_byte_mat[i]));
    permute_state #(.BLOCK_SIZE(BLOCK_SIZE)) ps_ins (.ps_in(sub_byte_mat[i]), .ps_out(per_state_mat[i]));
    mix_column #(.BLOCK_SIZE(BLOCK_SIZE)) mx_ins (.mc_in(per_state_mat[i]), .mc_out(mix_column_mat[i]));
    assign rnd_in_mat[i+1] = mix_column_mat[i];
  end
endgenerate

assign add_out = rnd_in_mat[rnd_cnt];

endmodule

//ADD TRANSFORMATION - SERIAL - ALL ROUNDS in TWO CLOCK CYCLES
module add_transform_serial_2clk #(parameter BLOCK_SIZE = 512) (clk, rst, add_start, add_in, add_out, add_rdy);

input clk, rst, add_start;
input [BLOCK_SIZE-1:0] add_in;
output [BLOCK_SIZE-1:0] add_out;
output add_rdy;

localparam hrnd_cnt = (BLOCK_SIZE == 512) ? 3'd5 : 3'd7;

//Variables
wire [3:0] rnd_index;
reg [1:0] rnd_counter;
reg [BLOCK_SIZE-1:0] reg_mc_out;
reg [3:0] rnd_ind_mat [0:hrnd_cnt-1];
wire [BLOCK_SIZE-1:0] rnd_in_mat [0:hrnd_cnt];
wire [BLOCK_SIZE-1:0] gen_in_mat [0:hrnd_cnt-1];
wire [BLOCK_SIZE-1:0] mod_add_mat [0:hrnd_cnt-1];
wire [BLOCK_SIZE-1:0] sub_byte_mat [0:hrnd_cnt-1];
wire [BLOCK_SIZE-1:0] per_state_mat [0:hrnd_cnt-1];
wire [BLOCK_SIZE-1:0] mix_column_mat [0:hrnd_cnt-1];

//Counter
always @(posedge clk) begin
  if (rst == 1'b1) begin
    rnd_counter <= 2'd0;
  end
  else begin
    if (add_start == 1'b0) begin
      rnd_counter <= 2'd0;
    end
    else begin
      if (rnd_counter <= 2'd2) begin
        rnd_counter <= rnd_counter + 1'b1;
      end
    end
  end
end

//Round Index Matrix
integer i;
always @ (*) begin
  for (i=0; i<hrnd_cnt; i=i+1) begin
    rnd_ind_mat[i] = i + (rnd_counter * hrnd_cnt);
  end
end

//Input In Each Clock Cycle
assign rnd_in_mat[0] = (rnd_counter == 4'd0) ? add_in : reg_mc_out;

//Computation Registers
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_mc_out = {BLOCK_SIZE{1'b0}};
  end
  else begin
    reg_mc_out = mix_column_mat[hrnd_cnt-1];
  end
end

//ADD TRANSFORMATION Operations
genvar j;
generate
  for (j=0; j<hrnd_cnt; j=j+1) begin
    gen_add_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins (.gai_in(rnd_ind_mat[j]), .gai_out(gen_in_mat[j]));
    mod2p64_add #(.BLOCK_SIZE(BLOCK_SIZE)) m2p64a_ins (.m2p64add_in_one(gen_in_mat[j]), .m2p64add_in_two(rnd_in_mat[j]), .m2p64add_out(mod_add_mat[j]));
    substitute_byte_foursbox #(.BLOCK_SIZE(BLOCK_SIZE)) sb_ins (.sb_in(mod_add_mat[j]), .sb_out(sub_byte_mat[j]));
    permute_state #(.BLOCK_SIZE(BLOCK_SIZE)) ps_ins (.ps_in(sub_byte_mat[j]), .ps_out(per_state_mat[j]));
    mix_column #(.BLOCK_SIZE(BLOCK_SIZE)) mx_ins (.mc_in(per_state_mat[j]), .mc_out(mix_column_mat[j]));
    assign rnd_in_mat[j+1] = mix_column_mat[j];
  end
endgenerate

//Outputs
assign add_out = (rnd_counter == 2'd2) ? reg_mc_out : {BLOCK_SIZE{1'b0}};
assign add_rdy = (rnd_counter == 2'd2) ? 1'b1 : 1'b0;

endmodule

//ADD TRANSFORMATION - SERIAL - TWO ROUNDS in ONE CLOCK CYCLE
module add_transform_serial_2rnd #(parameter BLOCK_SIZE = 512) (clk, rst, add_start, add_in, add_out, add_rdy);

input clk, rst, add_start;
input [BLOCK_SIZE-1:0] add_in;
output [BLOCK_SIZE-1:0] add_out;
output add_rdy;

localparam rnd_cnt = (BLOCK_SIZE == 512) ? 4'd10 : 4'd14;

//Variables
reg [3:0] rnd_counter;
wire [3:0] rnd_counter_p1;
reg [BLOCK_SIZE-1:0] reg_mc_out, rnd_in;
wire [BLOCK_SIZE-1:0] gen_in0_out, mod_add0_out, sub_byte0_out, per_state0_out, mix_column0_out;
wire [BLOCK_SIZE-1:0] gen_in1_out, mod_add1_out, sub_byte1_out, per_state1_out, mix_column1_out;

//Counter
always @(posedge clk) begin
  if (rst == 1'b1) begin
    rnd_counter <= 4'd0;
  end
  else begin
    if (add_start == 1'b0) begin
      rnd_counter <= 4'd0;
    end
    else begin
      if (rnd_counter <= rnd_cnt) begin
        rnd_counter <= rnd_counter + 4'd2;
      end
    end
  end
end
assign rnd_counter_p1 = rnd_counter + 1'b1;

//Input In Each Round
always @ (*) begin
  if (rnd_counter == 4'd0) begin
    rnd_in = add_in;
  end
  else begin
    rnd_in = reg_mc_out;
  end
end

//Computation Registers
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_mc_out = {BLOCK_SIZE{1'b0}};
  end
  else begin
    reg_mc_out = mix_column1_out;
  end
end

//ADD TRANSFORMATION Operations
//Even Rounds
gen_add_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins0 (.gai_in(rnd_counter), .gai_out(gen_in0_out));
mod2p64_add #(.BLOCK_SIZE(BLOCK_SIZE)) m2p64a_ins0 (.m2p64add_in_one(gen_in0_out), .m2p64add_in_two(rnd_in), .m2p64add_out(mod_add0_out));
substitute_byte_foursbox #(.BLOCK_SIZE(BLOCK_SIZE)) sb_ins0 (.sb_in(mod_add0_out), .sb_out(sub_byte0_out));
permute_state #(.BLOCK_SIZE(BLOCK_SIZE)) ps_ins0 (.ps_in(sub_byte0_out), .ps_out(per_state0_out));
mix_column #(.BLOCK_SIZE(BLOCK_SIZE)) mx_ins0 (.mc_in(per_state0_out), .mc_out(mix_column0_out));
//Odd Rounds
gen_add_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins1 (.gai_in(rnd_counter_p1), .gai_out(gen_in1_out));
mod2p64_add #(.BLOCK_SIZE(BLOCK_SIZE)) m2p64a_ins1 (.m2p64add_in_one(gen_in1_out), .m2p64add_in_two(mix_column0_out), .m2p64add_out(mod_add1_out));
substitute_byte_foursbox #(.BLOCK_SIZE(BLOCK_SIZE)) sb_ins1 (.sb_in(mod_add1_out), .sb_out(sub_byte1_out));
permute_state #(.BLOCK_SIZE(BLOCK_SIZE)) ps_ins1 (.ps_in(sub_byte1_out), .ps_out(per_state1_out));
mix_column #(.BLOCK_SIZE(BLOCK_SIZE)) mx_ins1 (.mc_in(per_state1_out), .mc_out(mix_column1_out));

//Outputs
assign add_out = (rnd_counter == rnd_cnt) ? reg_mc_out : {BLOCK_SIZE{1'b0}};
assign add_rdy = (rnd_counter == rnd_cnt) ? 1'b1 : 1'b0;

endmodule

//ADD TRANSFORMATION - SERIAL
module add_transform_serial #(parameter BLOCK_SIZE = 512) (clk, rst, add_start, add_in, add_out, add_rdy);

input clk, rst, add_start;
input [BLOCK_SIZE-1:0] add_in;
output [BLOCK_SIZE-1:0] add_out;
output add_rdy;

localparam rnd_cnt = (BLOCK_SIZE == 512) ? 4'd10 : 4'd14;

//Variables
reg [3:0] rnd_counter;
reg [BLOCK_SIZE-1:0] reg_mc_out, rnd_in;
wire [BLOCK_SIZE-1:0] gen_in_out, mod_add_out, sub_byte_out, per_state_out, mix_column_out;

//Counter
always @(posedge clk) begin
  if (rst == 1'b1) begin
    rnd_counter <= 4'd0;
  end
  else begin
    if (add_start == 1'b0) begin
      rnd_counter <= 4'd0;
    end
    else begin
      if (rnd_counter <= rnd_cnt) begin
        rnd_counter <= rnd_counter + 1'b1;
      end
      else begin
        rnd_counter <= rnd_counter + 1'b0;
      end
    end
  end
end

//Input In Each Round
always @ (*) begin
  if (rnd_counter == 4'd0) begin
    rnd_in = add_in;
  end
  else begin
    rnd_in = reg_mc_out;
  end
end

//Computation Registers
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_mc_out = {BLOCK_SIZE{1'b0}};
  end
  else begin
    reg_mc_out = mix_column_out;
  end
end

gen_add_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins  (.gai_in(rnd_counter), .gai_out(gen_in_out));
mod2p64_add #(.BLOCK_SIZE(BLOCK_SIZE)) m2p64a_ins (.m2p64add_in_one(gen_in_out), .m2p64add_in_two(rnd_in), .m2p64add_out(mod_add_out));
substitute_byte_foursbox #(.BLOCK_SIZE(BLOCK_SIZE)) sb_ins (.sb_in(mod_add_out), .sb_out(sub_byte_out));
permute_state #(.BLOCK_SIZE(BLOCK_SIZE)) ps_ins (.ps_in(sub_byte_out), .ps_out(per_state_out));
mix_column #(.BLOCK_SIZE(BLOCK_SIZE)) mx_ins (.mc_in(per_state_out), .mc_out(mix_column_out));

//Outputs
assign add_out = (rnd_counter == rnd_cnt) ? reg_mc_out : {BLOCK_SIZE{1'b0}};
assign add_rdy = (rnd_counter == rnd_cnt) ? 1'b1 : 1'b0;

endmodule

////ADD TRANSFORMATION - SERIAL with 64-bit blocks - BLOCK_SIZE-bit ADDITION
module add_transform_semiserial64b #(parameter BLOCK_SIZE = 512) (clk, rst, add_start, add_in, add_out, add_rdy);

input clk, rst, add_start;
input [BLOCK_SIZE-1:0] add_in;
output [BLOCK_SIZE-1:0] add_out;
output add_rdy;

localparam rnd_cnt = (BLOCK_SIZE == 512) ? 4'd10 : 4'd14;

//Variables
reg [3:0] rnd_counter;
reg [BLOCK_SIZE-1:0] reg_sbpsmc_out, rnd_in;
wire [BLOCK_SIZE-1:0] gen_in_out, mod_add_out, sbpsmc_out;
wire sbpsmc_rdy;

//Counter
always @(posedge clk) begin
  if (rst == 1'b1) begin
    rnd_counter <= 4'd0;
  end
  else begin
    if (add_start == 1'b0) begin
      rnd_counter <= 4'd0;
    end
    else begin
      if (rnd_counter < rnd_cnt && sbpsmc_rdy == 1'b1) begin
        rnd_counter <= rnd_counter + 1'b1;
      end
      else begin
        if (rnd_counter == rnd_cnt) begin
          rnd_counter <= 4'd0;
        end
      end
    end
  end
end

//Input In Each Round
always @ (*) begin
  if (rnd_counter == 4'd0) begin
    rnd_in = add_in;
  end
  else begin
    rnd_in = reg_sbpsmc_out;
  end
end

//Computation Registers
always @ (posedge sbpsmc_rdy or posedge rst or negedge add_start) begin
  if (rst == 1'b1) begin
    reg_sbpsmc_out = {BLOCK_SIZE{1'b0}};
  end
  else if (add_start == 1'b0) begin
    reg_sbpsmc_out = {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (sbpsmc_rdy == 1'b1) begin
      reg_sbpsmc_out = sbpsmc_out;
    end
  end
end

gen_add_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins  (.gai_in(rnd_counter), .gai_out(gen_in_out));
mod2p64_add #(.BLOCK_SIZE(BLOCK_SIZE)) m2p64a_ins (.m2p64add_in_one(gen_in_out), .m2p64add_in_two(rnd_in), .m2p64add_out(mod_add_out));
sbpsmc_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) sbpsmc64b_ins (.clk(clk), .rst(rst), .sbpsmc_start(add_start), .sbpsmc_in(mod_add_out), .sbpsmc_out(sbpsmc_out), .sbpsmc_rdy(sbpsmc_rdy));

//Outputs
assign add_out = (rnd_counter == rnd_cnt) ? reg_sbpsmc_out : {BLOCK_SIZE{1'b0}};
assign add_rdy = (rnd_counter == rnd_cnt) ? 1'b1 : 1'b0;

endmodule

//ADD TRANSFORMATION - SERIAL with 64-bit blocks - 64-bit ADDITION
module add_transform_fullserial64b #(parameter BLOCK_SIZE = 512) (clk, rst, add_start, add_in, add_out, add_rdy);

input clk, rst, add_start;
input [BLOCK_SIZE-1:0] add_in;
output [BLOCK_SIZE-1:0] add_out;
output add_rdy;

localparam rnd_cnt = (BLOCK_SIZE == 512) ? 4'd10 : 4'd14;

//Variables
reg sbpsmc_start;
reg [3:0] rnd_counter;
reg [BLOCK_SIZE-1:0] reg_sbpsmc_out, rnd_in;
wire [BLOCK_SIZE-1:0] gen_in_out, mod_add_out, sbpsmc_out;
wire m2p64add_rdy, sbpsmc_rdy;

//Counter
always @(posedge clk) begin
  if (rst == 1'b1) begin
    rnd_counter <= 4'd0;
  end
  else begin
    if (add_start == 1'b0) begin
      rnd_counter <= 4'd0;
    end
    else begin
      if (rnd_counter < rnd_cnt && sbpsmc_rdy == 1'b1) begin
        rnd_counter <= rnd_counter + 1'b1;
      end
      else begin
        if (rnd_counter == rnd_cnt) begin
          rnd_counter <= 4'd0;
        end
      end
    end
  end
end

//Input In Each Round
always @ (*) begin
  if (rnd_counter == 4'd0) begin
    rnd_in = add_in;
  end
  else begin
    rnd_in = reg_sbpsmc_out;
  end
end

//Computation Registers
always @ (posedge sbpsmc_rdy or posedge rst or negedge add_start) begin
  if (rst == 1'b1) begin
    reg_sbpsmc_out = {BLOCK_SIZE{1'b0}};
  end
  else if (add_start == 1'b0) begin
    reg_sbpsmc_out = {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (sbpsmc_rdy == 1'b1) begin
      reg_sbpsmc_out = sbpsmc_out;
    end
  end
end

//Start signal for the SBPSMC block
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    sbpsmc_start <= 1'b0;
  end
  else begin
    if (m2p64add_rdy == 1'b1) begin
      sbpsmc_start <= 1'b1;
    end
    if (sbpsmc_rdy == 1'b1) begin
      sbpsmc_start <= 1'b0;
    end
  end
end

gen_add_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins  (.gai_in(rnd_counter), .gai_out(gen_in_out));
mod2p64_add_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) m2p64a_ins (.clk(clk), .rst(rst), .m2p64add_start(add_start), .m2p64add_in_one(gen_in_out), .m2p64add_in_two(rnd_in), .m2p64add_out(mod_add_out), .m2p64add_rdy(m2p64add_rdy));
sbpsmc_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) sbpsmc64b_ins (.clk(clk), .rst(rst), .sbpsmc_start(sbpsmc_start), .sbpsmc_in(mod_add_out), .sbpsmc_out(sbpsmc_out), .sbpsmc_rdy(sbpsmc_rdy));

//Outputs
assign add_out = (rnd_counter == rnd_cnt) ? reg_sbpsmc_out : {BLOCK_SIZE{1'b0}};
assign add_rdy = (rnd_counter == rnd_cnt) ? 1'b1 : 1'b0;

endmodule

//XOR TRANSFORMATION - PARALLEL
module xor_transform #(parameter BLOCK_SIZE = 512) (xor_in, xor_out);

input [BLOCK_SIZE-1:0] xor_in;
output [BLOCK_SIZE-1:0] xor_out;

localparam rnd_cnt = (BLOCK_SIZE == 512) ? 4'd10 : 4'd14;

//Variables
wire [BLOCK_SIZE-1:0] rnd_in_mat [0:rnd_cnt];
wire [BLOCK_SIZE-1:0] gen_in_mat [0:rnd_cnt-1];
wire [BLOCK_SIZE-1:0] mod_add_mat [0:rnd_cnt-1];
wire [BLOCK_SIZE-1:0] sub_byte_mat [0:rnd_cnt-1];
wire [BLOCK_SIZE-1:0] per_state_mat [0:rnd_cnt-1];
wire [BLOCK_SIZE-1:0] mix_column_mat [0:rnd_cnt-1];

assign rnd_in_mat[0] = xor_in;

genvar i;
generate
  for (i=0; i<rnd_cnt; i=i+1) begin
    parameter [3:0] NR = i;

    gen_xor_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins  (.gxi_in(NR), .gxi_out(gen_in_mat[i]));
    mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) m2a_ins (.m2add_in_one(gen_in_mat[i]), .m2add_in_two(rnd_in_mat[i]), .m2add_out(mod_add_mat[i]));
    substitute_byte_foursbox #(.BLOCK_SIZE(BLOCK_SIZE)) sb_ins (.sb_in(mod_add_mat[i]), .sb_out(sub_byte_mat[i]));
    permute_state #(.BLOCK_SIZE(BLOCK_SIZE)) ps_ins (.ps_in(sub_byte_mat[i]), .ps_out(per_state_mat[i]));
    mix_column #(.BLOCK_SIZE(BLOCK_SIZE)) mx_ins (.mc_in(per_state_mat[i]), .mc_out(mix_column_mat[i]));
    assign rnd_in_mat[i+1] = mix_column_mat[i];
  end
endgenerate

assign xor_out = rnd_in_mat[rnd_cnt];

endmodule

//XOR TRANSFORMATION - SERIAL - ALL ROUNDS in TWO CLOCK CYCLES
module xor_transform_serial_2clk #(parameter BLOCK_SIZE = 512) (clk, rst, xor_start, xor_in, xor_out, xor_rdy);

input clk, rst, xor_start;
input [BLOCK_SIZE-1:0] xor_in;
output [BLOCK_SIZE-1:0] xor_out;
output xor_rdy;

localparam hrnd_cnt = (BLOCK_SIZE == 512) ? 3'd5 : 3'd7;

//Variables
reg [1:0] rnd_counter;
reg [BLOCK_SIZE-1:0] reg_mc_out;
reg [3:0] rnd_ind_mat [0:hrnd_cnt-1];
wire [BLOCK_SIZE-1:0] rnd_in_mat [0:hrnd_cnt];
wire [BLOCK_SIZE-1:0] gen_in_mat [0:hrnd_cnt-1];
wire [BLOCK_SIZE-1:0] mod_add_mat [0:hrnd_cnt-1];
wire [BLOCK_SIZE-1:0] sub_byte_mat [0:hrnd_cnt-1];
wire [BLOCK_SIZE-1:0] per_state_mat [0:hrnd_cnt-1];
wire [BLOCK_SIZE-1:0] mix_column_mat [0:hrnd_cnt-1];

//Counter
always @(posedge clk) begin
  if (rst == 1'b1) begin
    rnd_counter <= 2'd0;
  end
  else begin
    if (xor_start == 1'b0) begin
      rnd_counter <= 2'd0;
    end
    else begin
      if (rnd_counter <= 2'd2) begin
        rnd_counter <= rnd_counter + 1'b1;
      end
    end
  end
end

//Round Index Matrix
integer i;
always @ (*) begin
  for (i=0; i<hrnd_cnt; i=i+1) begin
    rnd_ind_mat[i] = i + (rnd_counter * hrnd_cnt);
  end
end

//Input In Each Clock Cycle
assign rnd_in_mat[0] = (rnd_counter == 4'd0) ? xor_in : reg_mc_out;

//Computation Registers
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_mc_out = {BLOCK_SIZE{1'b0}};
  end
  else begin
    reg_mc_out = mix_column_mat[hrnd_cnt-1];
  end
end

//XOR TRANSFORMATION Operations
genvar j;
generate
  for (j=0; j<hrnd_cnt; j=j+1) begin
    gen_xor_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins (.gxi_in(rnd_ind_mat[j]), .gxi_out(gen_in_mat[j]));
    mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) m2a_ins (.m2add_in_one(gen_in_mat[j]), .m2add_in_two(rnd_in_mat[j]), .m2add_out(mod_add_mat[j]));
    substitute_byte_foursbox #(.BLOCK_SIZE(BLOCK_SIZE)) sb_ins (.sb_in(mod_add_mat[j]), .sb_out(sub_byte_mat[j]));
    permute_state #(.BLOCK_SIZE(BLOCK_SIZE)) ps_ins (.ps_in(sub_byte_mat[j]), .ps_out(per_state_mat[j]));
    mix_column #(.BLOCK_SIZE(BLOCK_SIZE)) mx_ins (.mc_in(per_state_mat[j]), .mc_out(mix_column_mat[j]));
    assign rnd_in_mat[j+1] = mix_column_mat[j];
  end
endgenerate

//Outputs
assign xor_out = (rnd_counter == 2'd2) ? reg_mc_out : {BLOCK_SIZE{1'b0}};
assign xor_rdy = (rnd_counter == 2'd2) ? 1'b1 : 1'b0;

endmodule

//XOR TRANSFORMATION - SERIAL - TWO ROUNDS in ONE CLOCK CYCLE
module xor_transform_serial_2rnd #(parameter BLOCK_SIZE = 512) (clk, rst, xor_start, xor_in, xor_out, xor_rdy);

input clk, rst, xor_start;
input [BLOCK_SIZE-1:0] xor_in;
output [BLOCK_SIZE-1:0] xor_out;
output xor_rdy;

localparam rnd_cnt = (BLOCK_SIZE == 512) ? 4'd10 : 4'd14;

//Variables
reg [3:0] rnd_counter;
wire [3:0] rnd_counter_p1;
reg [BLOCK_SIZE-1:0] reg_mc_out, rnd_in;
wire [BLOCK_SIZE-1:0] gen_in0_out, mod_add0_out, sub_byte0_out, per_state0_out, mix_column0_out;
wire [BLOCK_SIZE-1:0] gen_in1_out, mod_add1_out, sub_byte1_out, per_state1_out, mix_column1_out;

//Counter
always @(posedge clk) begin
  if (rst == 1'b1) begin
    rnd_counter <= 4'd0;
  end
  else begin
    if (xor_start == 1'b0) begin
      rnd_counter <= 4'd0;
    end
    else begin
      if (rnd_counter <= rnd_cnt) begin
        rnd_counter <= rnd_counter + 2'd2;
      end
    end
  end
end
assign rnd_counter_p1 = rnd_counter + 1'b1;

//Input In Each Round
always @ (*) begin
  if (rnd_counter == 4'd0) begin
    rnd_in = xor_in;
  end
  else begin
    rnd_in = reg_mc_out;
  end
end

//Computation Registers
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_mc_out = {BLOCK_SIZE{1'b0}};
  end
  else begin
    reg_mc_out = mix_column1_out;
  end
end

//XOR TRANSFORMATION Operations
//Even Rounds
gen_xor_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins0 (.gxi_in(rnd_counter), .gxi_out(gen_in0_out));
mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) m2a_ins0 (.m2add_in_one(gen_in0_out), .m2add_in_two(rnd_in), .m2add_out(mod_add0_out));
substitute_byte_foursbox #(.BLOCK_SIZE(BLOCK_SIZE)) sb_ins0 (.sb_in(mod_add0_out), .sb_out(sub_byte0_out));
permute_state #(.BLOCK_SIZE(BLOCK_SIZE)) ps_ins0 (.ps_in(sub_byte0_out), .ps_out(per_state0_out));
mix_column #(.BLOCK_SIZE(BLOCK_SIZE)) mx_ins0 (.mc_in(per_state0_out), .mc_out(mix_column0_out));
//Odd Rounds
gen_xor_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins1 (.gxi_in(rnd_counter_p1), .gxi_out(gen_in1_out));
mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) m2a_ins1 (.m2add_in_one(gen_in1_out), .m2add_in_two(mix_column0_out), .m2add_out(mod_add1_out));
substitute_byte_foursbox #(.BLOCK_SIZE(BLOCK_SIZE)) sb_ins1 (.sb_in(mod_add1_out), .sb_out(sub_byte1_out));
permute_state #(.BLOCK_SIZE(BLOCK_SIZE)) ps_ins1 (.ps_in(sub_byte1_out), .ps_out(per_state1_out));
mix_column #(.BLOCK_SIZE(BLOCK_SIZE)) mx_ins1 (.mc_in(per_state1_out), .mc_out(mix_column1_out));

//Outputs
assign xor_out = (rnd_counter == rnd_cnt) ? reg_mc_out : {BLOCK_SIZE{1'b0}};
assign xor_rdy = (rnd_counter == rnd_cnt) ? 1'b1 : 1'b0;

endmodule

//XOR TRANSFORMATION - SERIAL
module xor_transform_serial #(parameter BLOCK_SIZE = 512) (clk, rst, xor_start, xor_in, xor_out, xor_rdy);

input clk, rst, xor_start;
input [BLOCK_SIZE-1:0] xor_in;
output [BLOCK_SIZE-1:0] xor_out;
output xor_rdy;

localparam rnd_cnt = (BLOCK_SIZE == 512) ? 4'd10 : 4'd14;

//Variables
reg [3:0] rnd_counter;
reg [BLOCK_SIZE-1:0] reg_mc_out, rnd_in;
wire [BLOCK_SIZE-1:0] gen_in_out, mod_add_out, sub_byte_out, per_state_out, mix_column_out;

//Counter
always @(posedge clk) begin
  if (rst == 1'b1) begin
    rnd_counter <= 4'd0;
  end
  else begin
    if (xor_start == 1'b0) begin
      rnd_counter <= 4'd0;
    end
    else begin
      if (rnd_counter <= rnd_cnt) begin
        rnd_counter <= rnd_counter + 1'b1;
      end
      else begin
        rnd_counter <= rnd_counter + 1'b0;
      end
    end
  end
end

//Input In Each Round
always @ (*) begin
  if (rnd_counter == 4'd0) begin
    rnd_in = xor_in;
  end
  else begin
    rnd_in = reg_mc_out;
  end
end

//Computation Registers
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_mc_out = {BLOCK_SIZE{1'b0}};
  end
  else begin
    reg_mc_out = mix_column_out;
  end
end

//XOR TRANSFORMATION Operations
gen_xor_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins  (.gxi_in(rnd_counter), .gxi_out(gen_in_out));
mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) m2a_ins (.m2add_in_one(gen_in_out), .m2add_in_two(rnd_in), .m2add_out(mod_add_out));
substitute_byte_foursbox #(.BLOCK_SIZE(BLOCK_SIZE)) sb_ins (.sb_in(mod_add_out), .sb_out(sub_byte_out));
permute_state #(.BLOCK_SIZE(BLOCK_SIZE)) ps_ins (.ps_in(sub_byte_out), .ps_out(per_state_out));
mix_column #(.BLOCK_SIZE(BLOCK_SIZE)) mx_ins (.mc_in(per_state_out), .mc_out(mix_column_out));

//Outputs
assign xor_out = (rnd_counter == rnd_cnt) ? reg_mc_out : {BLOCK_SIZE{1'b0}};
assign xor_rdy = (rnd_counter == rnd_cnt) ? 1'b1 : 1'b0;

endmodule

//XOR TRANSFORMATION - SERIAL with 64-bit blocks - BLOCK_SIZE-bit XOR
module xor_transform_semiserial64b #(parameter BLOCK_SIZE = 512) (clk, rst, xor_start, xor_in, xor_out, xor_rdy);

input clk, rst, xor_start;
input [BLOCK_SIZE-1:0] xor_in;
output [BLOCK_SIZE-1:0] xor_out;
output xor_rdy;

localparam rnd_cnt = (BLOCK_SIZE == 512) ? 4'd10 : 4'd14;

//Variables
wire sbpsmc_start, sbpsmc_rdy;
wire [BLOCK_SIZE-1:0] gen_in_out, mod_add_out, sbpsmc_out;
reg [BLOCK_SIZE-1:0] reg_sbpsmc_out, rnd_in;
reg [3:0] rnd_counter;

//Counter
always @(posedge clk) begin
  if (rst == 1'b1) begin
    rnd_counter <= 4'd0;
  end
  else begin
    if (xor_start == 1'b0) begin
      rnd_counter <= 4'd0;
    end
    else begin
      if (rnd_counter < rnd_cnt && sbpsmc_rdy == 1'b1) begin
        rnd_counter <= rnd_counter + 1'b1;
      end
      else begin
        if (rnd_counter == rnd_cnt) begin
          rnd_counter <= 4'd0;
        end
      end
    end
  end
end

//Input In Each Round
always @ (*) begin
  if (rnd_counter == 4'd0) begin
    rnd_in = xor_in;
  end
  else begin
    rnd_in = reg_sbpsmc_out;
  end
end

//Computation Registers
always @ (posedge sbpsmc_rdy or posedge rst or negedge xor_start) begin
  if (rst == 1'b1) begin
    reg_sbpsmc_out = {BLOCK_SIZE{1'b0}};
  end
  else if (xor_start == 1'b0) begin
    reg_sbpsmc_out = {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (sbpsmc_rdy == 1'b1) begin
      reg_sbpsmc_out = sbpsmc_out;
    end
  end
end

//XOR Transformation Operations with 64-bit blocks
gen_xor_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins  (.gxi_in(rnd_counter), .gxi_out(gen_in_out));
mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) m2a_ins (.m2add_in_one(gen_in_out), .m2add_in_two(rnd_in), .m2add_out(mod_add_out));
sbpsmc_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) sbpsmc64b_ins (.clk(clk), .rst(rst), .sbpsmc_start(xor_start), .sbpsmc_in(mod_add_out), .sbpsmc_out(sbpsmc_out), .sbpsmc_rdy(sbpsmc_rdy));

//Outputs
assign xor_out = (rnd_counter == rnd_cnt) ? reg_sbpsmc_out : {BLOCK_SIZE{1'b0}};
assign xor_rdy = (rnd_counter == rnd_cnt) ? 1'b1 : 1'b0;

endmodule

//XOR TRANSFORMATION - SERIAL with 64-bit blocks - 64-bit XOR
module xor_transform_fullserial64b #(parameter BLOCK_SIZE = 512) (clk, rst, xor_start, xor_in, xor_out, xor_rdy);

input clk, rst, xor_start;
input [BLOCK_SIZE-1:0] xor_in;
output [BLOCK_SIZE-1:0] xor_out;
output xor_rdy;

localparam rnd_cnt = (BLOCK_SIZE == 512) ? 4'd10 : 4'd14;

//Variables
wire sbpsmc_rdy, m2add_rdy;
wire [BLOCK_SIZE-1:0] gen_in_out, mod_add_out, sbpsmc_out;
reg [BLOCK_SIZE-1:0] reg_sbpsmc_out, rnd_in;
reg [3:0] rnd_counter;
reg sbpsmc_start;

//Counter
always @(posedge clk) begin
  if (rst == 1'b1) begin
    rnd_counter <= 4'd0;
  end
  else begin
    if (xor_start == 1'b0) begin
      rnd_counter <= 4'd0;
    end
    else begin
      if (rnd_counter < rnd_cnt && sbpsmc_rdy == 1'b1) begin
        rnd_counter <= rnd_counter + 1'b1;
      end
      else begin
        if (rnd_counter == rnd_cnt) begin
          rnd_counter <= 4'd0;
        end
      end
    end
  end
end

//Input In Each Round
always @ (*) begin
  if (rnd_counter == 4'd0) begin
    rnd_in = xor_in;
  end
  else begin
    rnd_in = reg_sbpsmc_out;
  end
end

//Computation Registers
always @ (posedge sbpsmc_rdy or posedge rst or negedge xor_start) begin
  if (rst == 1'b1) begin
    reg_sbpsmc_out = {BLOCK_SIZE{1'b0}};
  end
  else if (xor_start == 1'b0) begin
    reg_sbpsmc_out = {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (sbpsmc_rdy == 1'b1) begin
      reg_sbpsmc_out = sbpsmc_out;
    end
  end
end

//Start signal for the SBPSMC block
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    sbpsmc_start <= 1'b0;
  end
  else begin
    if (m2add_rdy == 1'b1) begin
      sbpsmc_start <= 1'b1;
    end
    if (sbpsmc_rdy == 1'b1) begin
      sbpsmc_start <= 1'b0;
    end
  end
end

//XOR Transformation Operations with 64-bit blocks
gen_xor_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins  (.gxi_in(rnd_counter), .gxi_out(gen_in_out));
mod2_add_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) m2a_ins (.clk(clk), .rst(rst), .m2add_start(xor_start), .m2add_in_one(gen_in_out), .m2add_in_two(rnd_in), .m2add_out(mod_add_out), .m2add_rdy(m2add_rdy));
sbpsmc_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) sbpsmc64b_ins (.clk(clk), .rst(rst), .sbpsmc_start(sbpsmc_start), .sbpsmc_in(mod_add_out), .sbpsmc_out(sbpsmc_out), .sbpsmc_rdy(sbpsmc_rdy));

//Outputs
assign xor_out = (rnd_counter == rnd_cnt) ? reg_sbpsmc_out : {BLOCK_SIZE{1'b0}};
assign xor_rdy = (rnd_counter == rnd_cnt) ? 1'b1 : 1'b0;

endmodule

//ADDXOR TRANSFORMATION - SERIAL with 64-bit blocks
module addxor_transform_serial64b #(parameter BLOCK_SIZE = 512) (clk, rst, ax_start, add_in, xor_in, add_out, xor_out, add_rdy, xor_rdy);

input clk, rst, ax_start;
input [BLOCK_SIZE-1:0] add_in, xor_in;
output [BLOCK_SIZE-1:0] add_out, xor_out;
output add_rdy, xor_rdy;

localparam rnd_cnt = (BLOCK_SIZE == 512) ? 4'd10 : 4'd14;

//Variables
wire sbpsmc_start, sbpsmc_rdy;
wire [BLOCK_SIZE-1:0] gen_add_out, gen_xor_out, mod2p64_add_out, mod2_add_out;
wire [2*BLOCK_SIZE-1:0] sbpsmc_in, sbpsmc_out;
reg [BLOCK_SIZE-1:0] rnd_add_in, rnd_xor_in;
reg [2*BLOCK_SIZE-1:0] reg_sbpsmc_out;
reg [3:0] rnd_counter;

//Counter
always @(posedge clk) begin
  if (rst == 1'b1) begin
    rnd_counter <= 4'd0;
  end
  else begin
    if (ax_start == 1'b0) begin
      rnd_counter <= 4'd0;
    end
    else begin
      if (rnd_counter < rnd_cnt && sbpsmc_rdy == 1'b1) begin
        rnd_counter <= rnd_counter + 1'b1;
      end
      else begin
        if (rnd_counter == rnd_cnt) begin
          rnd_counter <= 4'd0;
        end
      end
    end
  end
end

//Input In Each Round
always @ (*) begin
  if (rnd_counter == 4'd0) begin
    rnd_add_in = add_in;
    rnd_xor_in = xor_in;
  end
  else begin
    rnd_add_in = reg_sbpsmc_out[2*BLOCK_SIZE-1:BLOCK_SIZE];
    rnd_xor_in = reg_sbpsmc_out[BLOCK_SIZE-1:0];
  end
end

//Computation Registers
always @ (posedge sbpsmc_rdy or posedge rst or negedge ax_start) begin
  if (rst == 1'b1) begin
    reg_sbpsmc_out = {2*BLOCK_SIZE{1'b0}};
  end
  else if (ax_start == 1'b0) begin
    reg_sbpsmc_out = {2*BLOCK_SIZE{1'b0}};
  end
  else begin
    if (sbpsmc_rdy == 1'b1) begin
      reg_sbpsmc_out = sbpsmc_out;
    end
  end
end

//ADD and XOR Transformation Operations with 64-bit blocks
gen_add_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins  (.gai_in(rnd_counter), .gai_out(gen_add_out));
gen_xor_in #(.BLOCK_SIZE(BLOCK_SIZE)) gxi_ins  (.gxi_in(rnd_counter), .gxi_out(gen_xor_out));
mod2p64_add #(.BLOCK_SIZE(BLOCK_SIZE)) m2p64a_ins (.m2p64add_in_one(gen_add_out), .m2p64add_in_two(rnd_add_in), .m2p64add_out(mod2p64_add_out));
mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) m2a_ins (.m2add_in_one(gen_xor_out), .m2add_in_two(rnd_xor_in), .m2add_out(mod2_add_out));
assign sbpsmc_in = {mod2p64_add_out, mod2_add_out};
addxor_sbpsmc_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) sbpsmc64b_ins (.clk(clk), .rst(rst), .sbpsmc_start(ax_start), .sbpsmc_in(sbpsmc_in), .sbpsmc_out(sbpsmc_out), .sbpsmc_rdy(sbpsmc_rdy));

//Outputs
assign add_out = (rnd_counter == rnd_cnt) ? reg_sbpsmc_out[2*BLOCK_SIZE-1:BLOCK_SIZE] : {BLOCK_SIZE{1'b0}};
assign xor_out = (rnd_counter == rnd_cnt) ? reg_sbpsmc_out[BLOCK_SIZE-1:0] : {BLOCK_SIZE{1'b0}};
assign add_rdy = (rnd_counter == rnd_cnt) ? 1'b1 : 1'b0;
assign xor_rdy = (rnd_counter == rnd_cnt) ? 1'b1 : 1'b0;

endmodule

//KUPYNA BLOCK - PARALLEL
module kupyna_block_parallel #(parameter BLOCK_SIZE = 512) (msg_in, pre_in, kb_out);

input [BLOCK_SIZE-1:0] msg_in, pre_in;
output [BLOCK_SIZE-1:0] kb_out;

//Variables
wire [BLOCK_SIZE-1:0] xor_in;
wire [BLOCK_SIZE-1:0] add_out, xor_out;

assign xor_in = pre_in ^ msg_in;
add_transform #(.BLOCK_SIZE(BLOCK_SIZE)) at_ins (.add_in(msg_in), .add_out(add_out));
xor_transform #(.BLOCK_SIZE(BLOCK_SIZE)) xt_ins (.xor_in(xor_in), .xor_out(xor_out));

assign kb_out = xor_out ^ add_out ^ pre_in;

endmodule

//KUPYNA BLOCK - SERIAL - ALL ROUNDS in TWO CLOCK CYCLES
module kupyna_block_serial_2clk #(parameter BLOCK_SIZE = 512) (clk, rst, kb_start, msg_in, pre_in, kb_out, kb_rdy);

input clk, rst, kb_start;
input [BLOCK_SIZE-1:0] msg_in, pre_in;
output reg [BLOCK_SIZE-1:0] kb_out;
output reg kb_rdy;

//Variables
wire [BLOCK_SIZE-1:0] xor_in;
wire add_rdy, xor_rdy, next_kb_rdy;
wire [BLOCK_SIZE-1:0] add_out, xor_out, next_kb_out;

//Registers for the Outputs
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_rdy <= 1'b0;
    kb_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (kb_start == 1'b0) begin
      kb_rdy <= 1'b0;
      kb_out <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      kb_rdy <= next_kb_rdy;
      kb_out <= next_kb_out;
    end
  end
end

//Transformation
assign xor_in = pre_in ^ msg_in;
add_transform_serial_2clk #(.BLOCK_SIZE(BLOCK_SIZE)) ats_ins (.clk(clk), .rst(rst), .add_start(kb_start), .add_in(msg_in), .add_out(add_out), .add_rdy(add_rdy));
xor_transform_serial_2clk #(.BLOCK_SIZE(BLOCK_SIZE)) xts_ins (.clk(clk), .rst(rst), .xor_start(kb_start), .xor_in(xor_in), .xor_out(xor_out), .xor_rdy(xor_rdy));
assign next_kb_rdy = (add_rdy & xor_rdy);
assign next_kb_out = add_out ^ xor_out ^ pre_in;

endmodule

//KUPYNA BLOCK - SERIAL - TWO ROUNDS in ONE CLOCK CYCLE
module kupyna_block_serial_2rnd #(parameter BLOCK_SIZE = 512) (clk, rst, kb_start, msg_in, pre_in, kb_out, kb_rdy);

input clk, rst, kb_start;
input [BLOCK_SIZE-1:0] msg_in, pre_in;
output reg [BLOCK_SIZE-1:0] kb_out;
output reg kb_rdy;

//Variables
wire [BLOCK_SIZE-1:0] xor_in;
wire add_rdy, xor_rdy, next_kb_rdy;
wire [BLOCK_SIZE-1:0] add_out, xor_out, next_kb_out;

//Registers for the Outputs
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_rdy <= 1'b0;
    kb_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (kb_start == 1'b0) begin
      kb_rdy <= 1'b0;
      kb_out <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      kb_rdy <= next_kb_rdy;
      kb_out <= next_kb_out;
    end
  end
end

//Transformation
assign xor_in = pre_in ^ msg_in;
add_transform_serial_2rnd #(.BLOCK_SIZE(BLOCK_SIZE)) ats_ins (.clk(clk), .rst(rst), .add_start(kb_start), .add_in(msg_in), .add_out(add_out), .add_rdy(add_rdy));
xor_transform_serial_2rnd #(.BLOCK_SIZE(BLOCK_SIZE)) xts_ins (.clk(clk), .rst(rst), .xor_start(kb_start), .xor_in(xor_in), .xor_out(xor_out), .xor_rdy(xor_rdy));
assign next_kb_rdy = (add_rdy & xor_rdy);
assign next_kb_out = add_out ^ xor_out ^ pre_in;

endmodule

//KUPYNA BLOCK - SERIAL
module kupyna_block_serial #(parameter BLOCK_SIZE = 512) (clk, rst, kb_start, msg_in, pre_in, kb_out, kb_rdy);

input clk, rst, kb_start;
input [BLOCK_SIZE-1:0] msg_in, pre_in;
output reg [BLOCK_SIZE-1:0] kb_out;
output reg kb_rdy;

//Variables
wire [BLOCK_SIZE-1:0] xor_in;
wire add_rdy, xor_rdy, next_kb_rdy;
wire [BLOCK_SIZE-1:0] add_out, xor_out, next_kb_out;

//Registers for the Outputs
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_rdy <= 1'b0;
    kb_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (kb_start == 1'b0) begin
      kb_rdy <= 1'b0;
      kb_out <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      kb_rdy <= next_kb_rdy;
      kb_out <= next_kb_out;
    end
  end
end

//Transformation
assign xor_in = pre_in ^ msg_in;
add_transform_serial #(.BLOCK_SIZE(BLOCK_SIZE)) ats_ins (.clk(clk), .rst(rst), .add_start(kb_start), .add_in(msg_in), .add_out(add_out), .add_rdy(add_rdy));
xor_transform_serial #(.BLOCK_SIZE(BLOCK_SIZE)) xts_ins (.clk(clk), .rst(rst), .xor_start(kb_start), .xor_in(xor_in), .xor_out(xor_out), .xor_rdy(xor_rdy));
assign next_kb_rdy = (add_rdy & xor_rdy);
assign next_kb_out = add_out ^ xor_out ^ pre_in;

endmodule

//KUPYNA BLOCK - SERIAL with 64-bit blocks
module kupyna_block_serial64b #(parameter BLOCK_SIZE = 512) (clk, rst, kb_start, msg_in, pre_in, kb_out, kb_rdy);

input clk, rst, kb_start;
input [BLOCK_SIZE-1:0] msg_in, pre_in;
output reg [BLOCK_SIZE-1:0] kb_out;
output reg kb_rdy;

//Variables
wire [BLOCK_SIZE-1:0] xor_in;
wire add_rdy, xor_rdy, next_kb_rdy;
wire [BLOCK_SIZE-1:0] add_out, xor_out, next_kb_out;

//Registers for the Outputs
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_rdy <= 1'b0;
    kb_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (kb_start == 1'b0) begin
      kb_rdy <= 1'b0;
      kb_out <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      kb_rdy <= next_kb_rdy;
      kb_out <= next_kb_out;
    end
  end
end

//Transformation
assign xor_in = pre_in ^ msg_in;
`ifdef FULL
  add_transform_fullserial64b #(.BLOCK_SIZE(BLOCK_SIZE)) ats_ins (.clk(clk), .rst(rst), .add_start(kb_start), .add_in(msg_in), .add_out(add_out), .add_rdy(add_rdy));
  xor_transform_fullserial64b #(.BLOCK_SIZE(BLOCK_SIZE)) xts_ins (.clk(clk), .rst(rst), .xor_start(kb_start), .xor_in(xor_in), .xor_out(xor_out), .xor_rdy(xor_rdy));
`elsif SEMI
  add_transform_semiserial64b #(.BLOCK_SIZE(BLOCK_SIZE)) ats_ins (.clk(clk), .rst(rst), .add_start(kb_start), .add_in(msg_in), .add_out(add_out), .add_rdy(add_rdy));
  xor_transform_semiserial64b #(.BLOCK_SIZE(BLOCK_SIZE)) xts_ins (.clk(clk), .rst(rst), .xor_start(kb_start), .xor_in(xor_in), .xor_out(xor_out), .xor_rdy(xor_rdy));
`endif
assign next_kb_rdy = (add_rdy & xor_rdy);
assign next_kb_out = add_out ^ xor_out ^ pre_in;

endmodule

//KUPYNA BLOCK - SERIAL with 64-bit blocks - Merging ADD and XOR transformations
module kupyna_block_serial64b_reuse #(parameter BLOCK_SIZE = 512) (clk, rst, kb_start, msg_in, pre_in, kb_out, kb_rdy);

input clk, rst, kb_start;
input [BLOCK_SIZE-1:0] msg_in, pre_in;
output reg [BLOCK_SIZE-1:0] kb_out;
output reg kb_rdy;

//Variables
wire [BLOCK_SIZE-1:0] xor_in;
wire add_rdy, xor_rdy, next_kb_rdy;
wire [BLOCK_SIZE-1:0] add_out, xor_out, next_kb_out;

//Registers for the Outputs
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_rdy <= 1'b0;
    kb_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (kb_start == 1'b0) begin
      kb_rdy <= 1'b0;
      kb_out <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      kb_rdy <= next_kb_rdy;
      kb_out <= next_kb_out;
    end
  end
end

//Transformation
assign xor_in = pre_in ^ msg_in;
addxor_transform_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) axts_ins (.clk(clk), .rst(rst), .ax_start(kb_start), .add_in(msg_in), .xor_in(xor_in), .add_out(add_out), .xor_out(xor_out), .add_rdy(add_rdy), .xor_rdy(xor_rdy));
assign next_kb_rdy = (add_rdy & xor_rdy);
assign next_kb_out = add_out ^ xor_out ^ pre_in;

endmodule

//KUPYNA BLOCK - SERIAL with 64-bit blocks - ONE OPERATION in ONE CLOCK CYCLE
module kupyna_block_serial_oboc_cllte256 #(parameter BLOCK_SIZE = 256) (clk, rst, kb_start, msg_in, pre_in, kb_out, kb_rdy);

input clk, rst, kb_start;
input [BLOCK_SIZE-1:0] msg_in, pre_in;
output [BLOCK_SIZE-1:0] kb_out;
output kb_rdy;

//Variables
reg [4:0] curr_state;
reg [3:0] xor_rnd_counter, add_rnd_counter;
reg [BLOCK_SIZE-1:0] add_in, sbpsmc_in, xor_block_out, addxor_block_out, reg_kb_out;
reg xor_start, add_start, sbpsmc_start, reg_kb_rdy;
wire m2add_rdy, m2p64add_rdy, sbpsmc_rdy;
wire [BLOCK_SIZE-1:0] gxi_out, gai_out, m2add_out, m2p64add_out, sbpsmc_out;

//Block inputs in each state
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    add_start <= 1'b0;
    xor_start <= 1'b0;
    curr_state <= 5'd0;
    reg_kb_rdy <= 1'b0;
    sbpsmc_start <= 1'b0;
    add_rnd_counter <= 4'd0;
    xor_rnd_counter <= 4'd0;
    add_in <= {BLOCK_SIZE{1'b0}};
    sbpsmc_in <= {BLOCK_SIZE{1'b0}};
    xor_block_out <= {BLOCK_SIZE{1'b0}};
    addxor_block_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (kb_start == 1'b0) begin
      add_start <= 1'b0;
      xor_start <= 1'b0;
      curr_state <= 5'd0;
      reg_kb_rdy <= 1'b0;
      sbpsmc_start <= 1'b0;
      add_rnd_counter <= 4'd0;
      xor_rnd_counter <= 4'd0;
      add_in <= {BLOCK_SIZE{1'b0}};
      sbpsmc_in <= {BLOCK_SIZE{1'b0}};
      xor_block_out <= {BLOCK_SIZE{1'b0}};
      addxor_block_out <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      case (curr_state)
        5'd0 : begin
          if (kb_start == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            xor_rnd_counter <= 4'd0;
            add_in <= pre_in ^ msg_in;

            curr_state <= 5'd1;
          end
        end
        5'd1 : begin
          if (m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_in <= msg_in;
            add_rnd_counter <= 4'd0;

            curr_state <= 5'd2;
          end
        end
        5'd2 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd1;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd3;
          end
        end
        5'd3 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd1;
            add_in <= sbpsmc_out;

            curr_state <= 5'd4;
          end
        end
        5'd4 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd2;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd5;
          end
        end
        5'd5 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd2;
            add_in <= sbpsmc_out;

            curr_state <= 5'd6;
          end
        end
        5'd6 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd3;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd7;
          end
        end
        5'd7 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd3;
            add_in <= sbpsmc_out;

            curr_state <= 5'd8;
          end
        end
        5'd8 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd4;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd9;
          end
        end
        5'd9 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd4;
            add_in <= sbpsmc_out;

            curr_state <= 5'd10;
          end
        end
        5'd10 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd5;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd11;
          end
        end
        5'd11 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd5;
            add_in <= sbpsmc_out;

            curr_state <= 5'd12;
          end
        end
        5'd12 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd6;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd13;
          end
        end
        5'd13 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd6;
            add_in <= sbpsmc_out;

            curr_state <= 5'd14;
          end
        end
        5'd14 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd7;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd15;
          end
        end
        5'd15 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd7;
            add_in <= sbpsmc_out;

            curr_state <= 5'd16;
          end
        end
        5'd16 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd8;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd17;
          end
        end
        5'd17 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd8;
            add_in <= sbpsmc_out;

            curr_state <= 5'd18;
          end
        end
        5'd18 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd9;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd19;
          end
        end
        5'd19 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd9;
            add_in <= sbpsmc_out;

            curr_state <= 5'd20;
          end
        end
        5'd20 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;
            //XOR
            xor_block_out <= sbpsmc_out;

            curr_state <= 5'd21;
          end
        end
        5'd21 : begin
          if (sbpsmc_rdy == 1'b1) begin
            addxor_block_out <= xor_block_out ^ pre_in ^ sbpsmc_out;
            sbpsmc_start <= 1'b0;
            reg_kb_rdy <= 1'b1;

            curr_state <= 5'd22;
          end
        end
        5'd22 : begin
          //NOP
          curr_state <= 5'd0;
          reg_kb_rdy <= 1'b0;
        end
        default : begin
          add_start <= 1'b0;
          xor_start <= 1'b0;
          curr_state <= 5'd0;
          reg_kb_rdy <= 1'b0;
          sbpsmc_start <= 1'b0;
          add_rnd_counter <= 4'd0;
          xor_rnd_counter <= 4'd0;
          add_in <= {BLOCK_SIZE{1'b0}};
          sbpsmc_in <= {BLOCK_SIZE{1'b0}};
          xor_block_out <= {BLOCK_SIZE{1'b0}};
          addxor_block_out <= {BLOCK_SIZE{1'b0}};
        end
      endcase
    end
  end
end

//Adder Input Generation
gen_xor_in #(.BLOCK_SIZE(BLOCK_SIZE)) gxi_ins (.gxi_in(xor_rnd_counter), .gxi_out(gxi_out));
gen_add_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins (.gai_in(add_rnd_counter), .gai_out(gai_out));
//Additions
mod2_add_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) m2a_ins (.clk(clk), .rst(rst), .m2add_start(xor_start), .m2add_in_one(gxi_out), .m2add_in_two(add_in), .m2add_out(m2add_out), .m2add_rdy(m2add_rdy));
mod2p64_add_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) m2p64a_ins (.clk(clk), .rst(rst), .m2p64add_start(add_start), .m2p64add_in_one(gai_out), .m2p64add_in_two(add_in), .m2p64add_out(m2p64add_out), .m2p64add_rdy(m2p64add_rdy));
//Substitution, Permutation, Mix-Column
sbpsmc_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) sbpsmc64b_ins (.clk(clk), .rst(rst), .sbpsmc_start(sbpsmc_start), .sbpsmc_in(sbpsmc_in), .sbpsmc_out(sbpsmc_out), .sbpsmc_rdy(sbpsmc_rdy));

//Outputs
assign kb_out = addxor_block_out;
assign kb_rdy = reg_kb_rdy;

endmodule

//KUPYNA BLOCK - SERIAL with 64-bit blocks - ONE OPERATION in ONE CLOCK CYCLE
module kupyna_block_serial_oboc_clgt256 #(parameter BLOCK_SIZE = 1024) (clk, rst, kb_start, msg_in, pre_in, kb_out, kb_rdy);

input clk, rst, kb_start;
input [BLOCK_SIZE-1:0] msg_in, pre_in;
output [BLOCK_SIZE-1:0] kb_out;
output kb_rdy;

//Variables
reg [4:0] curr_state;
reg [3:0] xor_rnd_counter, add_rnd_counter;
reg [BLOCK_SIZE-1:0] add_in, sbpsmc_in, xor_block_out, addxor_block_out, reg_kb_out;
reg xor_start, add_start, sbpsmc_start, reg_kb_rdy;
wire m2add_rdy, m2p64add_rdy, sbpsmc_rdy;
wire [BLOCK_SIZE-1:0] gxi_out, gai_out, m2add_out, m2p64add_out, sbpsmc_out;

//Block inputs in each state
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    add_start <= 1'b0;
    xor_start <= 1'b0;
    curr_state <= 5'd0;
    reg_kb_rdy <= 1'b0;
    sbpsmc_start <= 1'b0;
    add_rnd_counter <= 4'd0;
    xor_rnd_counter <= 4'd0;
    add_in <= {BLOCK_SIZE{1'b0}};
    sbpsmc_in <= {BLOCK_SIZE{1'b0}};
    xor_block_out <= {BLOCK_SIZE{1'b0}};
    addxor_block_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (kb_start == 1'b0) begin
      add_start <= 1'b0;
      xor_start <= 1'b0;
      curr_state <= 5'd0;
      reg_kb_rdy <= 1'b0;
      sbpsmc_start <= 1'b0;
      add_rnd_counter <= 4'd0;
      xor_rnd_counter <= 4'd0;
      add_in <= {BLOCK_SIZE{1'b0}};
      sbpsmc_in <= {BLOCK_SIZE{1'b0}};
      xor_block_out <= {BLOCK_SIZE{1'b0}};
      addxor_block_out <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      case (curr_state)
        5'd0 : begin
          if (kb_start == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            xor_rnd_counter <= 4'd0;
            add_in <= pre_in ^ msg_in;

            curr_state <= 5'd1;
          end
        end
        5'd1 : begin
          if (m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_in <= msg_in;
            add_rnd_counter <= 4'd0;

            curr_state <= 5'd2;
          end
        end
        5'd2 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd1;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd3;
          end
        end
        5'd3 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd1;
            add_in <= sbpsmc_out;

            curr_state <= 5'd4;
          end
        end
        5'd4 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd2;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd5;
          end
        end
        5'd5 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd2;
            add_in <= sbpsmc_out;

            curr_state <= 5'd6;
          end
        end
        5'd6 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd3;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd7;
          end
        end
        5'd7 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd3;
            add_in <= sbpsmc_out;

            curr_state <= 5'd8;
          end
        end
        5'd8 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd4;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd9;
          end
        end
        5'd9 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd4;
            add_in <= sbpsmc_out;

            curr_state <= 5'd10;
          end
        end
        5'd10 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd5;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd11;
          end
        end
        5'd11 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd5;
            add_in <= sbpsmc_out;

            curr_state <= 5'd12;
          end
        end
        5'd12 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd6;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd13;
          end
        end
        5'd13 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd6;
            add_in <= sbpsmc_out;

            curr_state <= 5'd14;
          end
        end
        5'd14 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd7;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd15;
          end
        end
        5'd15 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd7;
            add_in <= sbpsmc_out;

            curr_state <= 5'd16;
          end
        end
        5'd16 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd8;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd17;
          end
        end
        5'd17 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd8;
            add_in <= sbpsmc_out;

            curr_state <= 5'd18;
          end
        end
        5'd18 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd9;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd19;
          end
        end
        5'd19 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd9;
            add_in <= sbpsmc_out;

            curr_state <= 5'd20;
          end
        end
        5'd20 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd10;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd21;
          end
        end
        5'd21 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd10;
            add_in <= sbpsmc_out;

            curr_state <= 5'd22;
          end
        end
        5'd22 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd11;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd23;
          end
        end
        5'd23 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd11;
            add_in <= sbpsmc_out;

            curr_state <= 5'd24;
          end
        end
        5'd24 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd12;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd25;
          end
        end
        5'd25 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd12;
            add_in <= sbpsmc_out;

            curr_state <= 5'd26;
          end
        end
        5'd26 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd13;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd27;
          end
        end
        5'd27 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd13;
            add_in <= sbpsmc_out;

            curr_state <= 5'd28;
          end
        end
        5'd28 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;
            //XOR
            xor_block_out <= sbpsmc_out;

            curr_state <= 5'd29;
          end
        end
        5'd29 : begin
          if (sbpsmc_rdy == 1'b1) begin
            //ADD
            addxor_block_out <= xor_block_out ^ pre_in ^ sbpsmc_out;
            sbpsmc_start <= 1'b0;
            reg_kb_rdy <= 1'b1;

            curr_state <= 5'd30;
          end
        end
        5'd30 : begin
          //NOP
          curr_state <= 5'd0;
          reg_kb_rdy <= 1'b0;
        end
        default : begin
          add_start <= 1'b0;
          xor_start <= 1'b0;
          curr_state <= 5'd0;
          reg_kb_rdy <= 1'b0;
          sbpsmc_start <= 1'b0;
          add_rnd_counter <= 4'd0;
          xor_rnd_counter <= 4'd0;
          add_in <= {BLOCK_SIZE{1'b0}};
          sbpsmc_in <= {BLOCK_SIZE{1'b0}};
          xor_block_out <= {BLOCK_SIZE{1'b0}};
          addxor_block_out <= {BLOCK_SIZE{1'b0}};
        end
      endcase
    end
  end
end

//Adder Input Generation
gen_xor_in #(.BLOCK_SIZE(BLOCK_SIZE)) gxi_ins (.gxi_in(xor_rnd_counter), .gxi_out(gxi_out));
gen_add_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins (.gai_in(add_rnd_counter), .gai_out(gai_out));
//Additions
mod2_add_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) m2a_ins (.clk(clk), .rst(rst), .m2add_start(xor_start), .m2add_in_one(gxi_out), .m2add_in_two(add_in), .m2add_out(m2add_out), .m2add_rdy(m2add_rdy));
mod2p64_add_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) m2p64a_ins (.clk(clk), .rst(rst), .m2p64add_start(add_start), .m2p64add_in_one(gai_out), .m2p64add_in_two(add_in), .m2p64add_out(m2p64add_out), .m2p64add_rdy(m2p64add_rdy));
//Substitution, Permutation, Mix-Column
sbpsmc_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) sbpsmc64b_ins (.clk(clk), .rst(rst), .sbpsmc_start(sbpsmc_start), .sbpsmc_in(sbpsmc_in), .sbpsmc_out(sbpsmc_out), .sbpsmc_rdy(sbpsmc_rdy));

//Outputs
assign kb_out = addxor_block_out;
assign kb_rdy = reg_kb_rdy;

endmodule

//KUPYNA HASH FUNCTION - PARALLEL - CONSECUTIVE MESSAGEs
module kupyna_hash_parallel #(parameter CODE_LENGTH = 256) (clk, rst, hash_start, hash_stop, msg_in, hash_out, hash_rdy, kb_rdy_out);

localparam BLOCK_SIZE = (CODE_LENGTH <= 256) ? 512 : 1024;

input clk, rst, hash_start, hash_stop;
input [BLOCK_SIZE-1:0] msg_in;
output [CODE_LENGTH-1:0] hash_out;
output hash_rdy, kb_rdy_out;

//Variables
wire fxor_rdy, first_msg_prc;
wire [BLOCK_SIZE-1:0] kb_out, fxor_out, fm2add_out, next_pre_in, reg_msg_in, the_iv;
reg kb_rdy, fmp, reg_hash_start, reg_hash_stop, reg_hash_rdy;
reg [BLOCK_SIZE-1:0] reg_pre_in;
reg [CODE_LENGTH-1:0] reg_hash_out;

//Initial Vector
assign the_iv = (BLOCK_SIZE == 512) ? 1'b1<<510 : 1'b1<<1023;

//kb_rdy indicates that the Kupyna Block has just returned an output
//In every clock cycle the parallel design returns an output
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_rdy <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      kb_rdy <= 1'b0;
    end
    else begin
      if (reg_hash_start == 1'b1) begin
        kb_rdy <= 1'b1;
      end
    end
  end
end

always @ (posedge clk) begin
  if (rst == 1'b1 || hash_rdy == 1'b1) begin
    fmp <= 1'b0;
  end
  else begin
    if (kb_rdy == 1'b1) begin
      fmp <= 1'b1;
    end
  end
end
assign first_msg_prc = fmp | kb_rdy;

always @ (hash_start or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_start <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_start <= 1'b0;
    end
    else begin
      if (hash_start == 1'b1) begin
        reg_hash_start <= 1'b1;
      end
      else begin
        reg_hash_start <= 1'b0;
      end
    end
  end
end
always @ (hash_stop or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_stop <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_stop <= 1'b0;
    end
    else begin
      if (hash_stop == 1'b1) begin
        reg_hash_stop <= 1'b1;
      end
      else begin
        reg_hash_stop <= 1'b0;
      end
    end
  end
end

//reg_msg_in
assign reg_msg_in = (reg_hash_start == 1'b0) ? {BLOCK_SIZE{1'b0}} : msg_in;

//Registers for inputs and outputs required for proper
//execution of the Kupyna hash function when multiple
//messages are processed
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_hash_rdy <= 1'b0;
    reg_pre_in <= {BLOCK_SIZE{1'b0}};
    reg_hash_out <= {CODE_LENGTH{1'b0}};
  end
  else begin
    //reg_pre_in
    if (reg_hash_start == 1'b0) begin
      reg_pre_in <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      if (first_msg_prc == 1'b0) begin
        reg_pre_in <= the_iv;
      end
      else begin
        reg_pre_in <= next_pre_in;
      end
    end

    //reg_kb_out and reg_hash_out
    if (reg_hash_stop == 1'b0) begin
      reg_hash_rdy <= 1'b0;
      reg_hash_out <= {CODE_LENGTH{1'b0}};
    end
    else if (reg_hash_stop == 1'b1) begin
      if (kb_rdy == 1'b1) begin
        reg_hash_rdy <= 1'b1;
        reg_hash_out <= fm2add_out[CODE_LENGTH-1:0];
      end
    end
  end
end

//Kupyna Block
kupyna_block_parallel #(.BLOCK_SIZE(BLOCK_SIZE)) kb_ins (.msg_in(reg_msg_in), .pre_in(reg_pre_in), .kb_out(kb_out));
assign next_pre_in = (kb_rdy == 1'b1) ? kb_out : reg_pre_in;

//Final Computations before the HASH Outputs
xor_transform #(.BLOCK_SIZE(BLOCK_SIZE)) fxt_ins (.xor_in(kb_out), .xor_out(fxor_out));
mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) fm2a_ins (.m2add_in_one(kb_out), .m2add_in_two(fxor_out), .m2add_out(fm2add_out));

//Outputs
assign kb_rdy_out = kb_rdy;
assign hash_out = reg_hash_out;
assign hash_rdy = reg_hash_rdy;

endmodule

//KUPYNA HASH FUNCTION - SERIAL - ALL ROUNDS in TWO CLOCK CYCLES - CONSECUTIVE MESSAGEs
module kupyna_hash_serial_2clk #(parameter CODE_LENGTH = 256) (clk, rst, hash_start, hash_stop, msg_in, hash_out, hash_rdy, kb_rdy_out);

localparam BLOCK_SIZE = (CODE_LENGTH <= 256) ? 512 : 1024;

input clk, rst, hash_start, hash_stop;
input [BLOCK_SIZE-1:0] msg_in;
output [CODE_LENGTH-1:0] hash_out;
output hash_rdy, kb_rdy_out;

//Variables
wire kb_rdy, fxor_rdy, first_msg_prc;
wire [BLOCK_SIZE-1:0] kb_out, fxor_out, fm2add_out, next_pre_in, reg_msg_in, the_iv;
reg fmp, reg_kb_start, reg_fxor_start, reg_hash_start, reg_hash_stop, reg_hash_rdy, kb_status;
reg [BLOCK_SIZE-1:0] reg_pre_in, reg_kb_out;
reg [CODE_LENGTH-1:0] reg_hash_out;

//Initial Vector
assign the_iv = (BLOCK_SIZE == 512) ? 1'b1<<510 : 1'b1<<1023;

//kb_status indicates that Kupyna Block was run when hash_stop is high
//meaning that the Kupyna Block should not be run again
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_status <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      kb_status <= 1'b0;
    end
    else begin
      if (kb_rdy == 1'b1 && reg_hash_stop == 1'b1) begin
        kb_status <= 1'b1;
      end
    end
  end
end

always @ (posedge clk) begin
  if (rst == 1'b1 || hash_rdy == 1'b1) begin
    fmp <= 1'b0;
  end
  else begin
    if (kb_rdy == 1'b1) begin
      fmp <= 1'b1;
    end
  end
end
assign first_msg_prc = fmp | kb_rdy;

always @ (hash_start or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_start <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_start <= 1'b0;
    end
    else begin
      if (hash_start == 1'b1) begin
        reg_hash_start <= 1'b1;
      end
      else begin
        reg_hash_start <= 1'b0;
      end
    end
  end
end
always @ (hash_stop or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_stop <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_stop <= 1'b0;
    end
    else begin
      if (hash_stop == 1'b1) begin
        reg_hash_stop <= 1'b1;
      end
      else begin
        reg_hash_stop <= 1'b0;
      end
    end
  end
end

//reg_msg_in
assign reg_msg_in = (reg_hash_start == 1'b0) ? {BLOCK_SIZE{1'b0}} : msg_in;

//Registers for inputs and outputs required for proper
//execution of the Kupyna hash function when multiple
//messages are processed
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_kb_start <= 1'b0;
    reg_hash_rdy <= 1'b0;
    reg_fxor_start <= 1'b0;
    reg_pre_in <= {BLOCK_SIZE{1'b0}};
    reg_kb_out <= {BLOCK_SIZE{1'b0}};
    reg_hash_out <= {CODE_LENGTH{1'b0}};
  end
  else begin
    //reg_kb_start and reg_pre_in
    if (reg_hash_start == 1'b0) begin
      reg_kb_start <= 1'b0;
      reg_pre_in <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      //reg_kb_start
      if (kb_rdy == 1'b1) begin
        reg_kb_start <= 1'b0;
      end
      else begin
        if (kb_status == 1'b0) begin
          reg_kb_start <= 1'b1;
        end
        else begin
          reg_kb_start <= 1'b0;
        end
      end
      //reg_pre_in
      if (first_msg_prc == 1'b0) begin
        reg_pre_in <= the_iv;
      end
      else begin
        reg_pre_in <= next_pre_in;
      end
    end

    //reg_kb_out and reg_hash_out
    //reg_fxor_start and reg_hash_rdy
    if (reg_hash_stop == 1'b0) begin
      reg_hash_rdy <= 1'b0;
      reg_fxor_start <= 1'b0;
      reg_kb_out <= {BLOCK_SIZE{1'b0}};
      reg_hash_out <= {CODE_LENGTH{1'b0}};
    end
    else if (reg_hash_stop == 1'b1) begin
      if (kb_rdy == 1'b1) begin
        reg_kb_out <= kb_out;
        reg_fxor_start <= 1'b1;
      end
      if (fxor_rdy == 1'b1) begin
        reg_hash_rdy <= 1'b1;
        reg_hash_out <= fm2add_out[CODE_LENGTH-1:0];
      end
    end
  end
end

//Kupyna Block
kupyna_block_serial_2clk #(.BLOCK_SIZE(BLOCK_SIZE)) kb_ins (.clk(clk), .rst(rst), .kb_start(reg_kb_start), .msg_in(reg_msg_in), .pre_in(reg_pre_in), .kb_out(kb_out), .kb_rdy(kb_rdy));
assign next_pre_in = (kb_rdy == 1'b1) ? kb_out : reg_pre_in;

//Final Computations before the HASH Outputs
xor_transform_serial_2clk #(.BLOCK_SIZE(BLOCK_SIZE)) fxt_ins (.clk(clk), .rst(rst), .xor_start(reg_fxor_start), .xor_in(reg_kb_out), .xor_out(fxor_out), .xor_rdy(fxor_rdy));
mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) fm2a_ins (.m2add_in_one(reg_kb_out), .m2add_in_two(fxor_out), .m2add_out(fm2add_out));

//Outputs
assign kb_rdy_out = kb_rdy;
assign hash_out = reg_hash_out;
assign hash_rdy = reg_hash_rdy;

endmodule

//KUPYNA HASH FUNCTION - SERIAL - ALL ROUNDS in TWO CLOCK CYCLES - CONSECUTIVE MESSAGEs - Reusing the XOR transformation
module kupyna_hash_serial_2clk_reuse #(parameter CODE_LENGTH = 256) (clk, rst, hash_start, hash_stop, msg_in, hash_out, hash_rdy, kb_rdy_out);

localparam BLOCK_SIZE = (CODE_LENGTH <= 256) ? 512 : 1024;

input clk, rst, hash_start, hash_stop;
input [BLOCK_SIZE-1:0] msg_in;
output [CODE_LENGTH-1:0] hash_out;
output hash_rdy, kb_rdy_out;

//Variables
wire fxor_rdy, first_msg_prc, kb_run;
wire [BLOCK_SIZE-1:0] fxor_out, fm2add_out, next_pre_in, reg_msg_in, the_iv;
reg fmp, reg_kb_start, reg_fxor_start, reg_hash_start, reg_hash_stop, reg_hash_rdy, kb_rdy, kb_status, kbr;
reg [BLOCK_SIZE-1:0] reg_pre_in, reg_kb_out, kb_out;
reg [CODE_LENGTH-1:0] reg_hash_out;

//Initial Vector
assign the_iv = (BLOCK_SIZE == 512) ? 1'b1<<510 : 1'b1<<1023;

always @ (posedge clk) begin
  if (rst == 1'b1 || hash_rdy == 1'b1) begin
    kbr <= 1'b1;
  end
  else begin
    if (reg_hash_stop == 1'b1 && kb_rdy == 1'b1) begin
      kbr <= 1'b0;
    end
  end
end
assign kb_run = kbr & !(reg_hash_stop & kb_rdy);

//kb_status indicates that Kupyna Block was run when hash_stop is high
//meaning that the Kupyna Block should not be run again
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_status <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      kb_status <= 1'b0;
    end
    else begin
      if (kb_rdy == 1'b1 && reg_hash_stop == 1'b1) begin
        kb_status <= 1'b1;
      end
    end
  end
end

//first_msg_prc indicates that the first message has gone through
//the Kupyna Block
always @ (posedge clk) begin
  if (rst == 1'b1 || hash_rdy == 1'b1) begin
    fmp <= 1'b0;
  end
  else begin
    if (kb_rdy == 1'b1) begin
      fmp <= 1'b1;
    end
  end
end
assign first_msg_prc = fmp | kb_rdy;

//the hash start and stop signals indicate that the hash process is
//started for the first message and stopped for the last message
always @ (hash_start or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_start <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_start <= 1'b0;
    end
    else begin
      if (hash_start == 1'b1) begin
        reg_hash_start <= 1'b1;
      end
      else begin
        reg_hash_start <= 1'b0;
      end
    end
  end
end
always @ (hash_stop or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_stop <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_stop <= 1'b0;
    end
    else begin
      if (hash_stop == 1'b1) begin
        reg_hash_stop <= 1'b1;
      end
      else begin
        reg_hash_stop <= 1'b0;
      end
    end
  end
end

//reg_msg_in
assign reg_msg_in = (reg_hash_start == 1'b0) ? {BLOCK_SIZE{1'b0}} : msg_in;

//Registers for inputs and outputs required for proper
//execution of the Kupyna hash function when multiple
//messages are processed
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_kb_start <= 1'b0;
    reg_hash_rdy <= 1'b0;
    reg_fxor_start <= 1'b0;
    reg_pre_in <= {BLOCK_SIZE{1'b0}};
    reg_kb_out <= {BLOCK_SIZE{1'b0}};
    reg_hash_out <= {CODE_LENGTH{1'b0}};
  end
  else begin
    //reg_kb_start and reg_pre_in
    if (reg_hash_start == 1'b0) begin
      reg_kb_start <= 1'b0;
      reg_pre_in <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      //reg_kb_start
      if (kb_rdy == 1'b1) begin
        reg_kb_start <= 1'b0;
      end
      else begin
        if (kb_status == 1'b0) begin
          reg_kb_start <= 1'b1;
        end
        else begin
          reg_kb_start <= 1'b0;
        end
      end
      //reg_pre_in
      if (first_msg_prc == 1'b0) begin
        reg_pre_in <= the_iv;
      end
      else begin
        reg_pre_in <= next_pre_in;
      end
    end

    //reg_kb_out and reg_hash_out
    //reg_fxor_start and reg_hash_rdy
    if (reg_hash_stop == 1'b0) begin
      reg_hash_rdy <= 1'b0;
      reg_fxor_start <= 1'b0;
      reg_kb_out <= {BLOCK_SIZE{1'b0}};
      reg_hash_out <= {CODE_LENGTH{1'b0}};
    end
    else if (reg_hash_stop == 1'b1) begin
      if (kb_rdy == 1'b1) begin
        reg_kb_out <= kb_out;
        reg_fxor_start <= 1'b1;
      end
      if (fxor_rdy == 1'b1) begin
        reg_hash_rdy <= 1'b1;
        reg_hash_out <= fm2add_out[CODE_LENGTH-1:0];
      end
    end
  end
end

//Kupyna Block
//kupyna_block_serial_2clk #(.BLOCK_SIZE(BLOCK_SIZE)) kb_ins (.clk(clk), .rst(rst), .kb_start(reg_kb_start), .msg_in(reg_msg_in), .pre_in(reg_pre_in), .kb_out(kb_out), .kb_rdy(kb_rdy));

//Variables
wire [BLOCK_SIZE-1:0] blk_xor_in;
wire blk_add_rdy, blk_xor_rdy, next_kb_rdy;
wire [BLOCK_SIZE-1:0] blk_add_out, blk_xor_out, next_kb_out;

//Registers for the Outputs
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_rdy <= 1'b0;
    kb_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (reg_kb_start == 1'b0) begin
      kb_rdy <= 1'b0;
      kb_out <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      kb_rdy <= next_kb_rdy;
      kb_out <= next_kb_out;
    end
  end
end

//Variables for REUSE
wire reuse_xor_start, reuse_xor_rdy;
wire [BLOCK_SIZE-1:0] reuse_xor_in, reuse_xor_out;

assign reuse_xor_start = (kb_run == 1'b0) ? reg_fxor_start : reg_kb_start;
assign reuse_xor_in = (kb_run == 1'b0) ? reg_kb_out : blk_xor_in;
assign fxor_out = (kb_run == 1'b0) ? reuse_xor_out : {BLOCK_SIZE{1'b0}};
assign fxor_rdy = (kb_run == 1'b0) ? reuse_xor_rdy : 1'b0;
assign blk_xor_out = (kb_run == 1'b1) ? reuse_xor_out : {BLOCK_SIZE{1'b0}};
assign blk_xor_rdy = (kb_run == 1'b1) ? reuse_xor_rdy : 1'b0;

//Transformation
assign blk_xor_in = reg_pre_in ^ reg_msg_in;
add_transform_serial_2clk #(.BLOCK_SIZE(BLOCK_SIZE)) ats_ins (.clk(clk), .rst(rst), .add_start(reg_kb_start), .add_in(reg_msg_in), .add_out(blk_add_out), .add_rdy(blk_add_rdy));
xor_transform_serial_2clk #(.BLOCK_SIZE(BLOCK_SIZE)) xts_ins (.clk(clk), .rst(rst), .xor_start(reuse_xor_start), .xor_in(reuse_xor_in), .xor_out(reuse_xor_out), .xor_rdy(reuse_xor_rdy));
//xor_transform_serial_2clk #(.BLOCK_SIZE(BLOCK_SIZE)) xts_ins (.clk(clk), .rst(rst), .xor_start(kb_start), .xor_in(xor_in), .xor_out(xor_out), .xor_rdy(xor_rdy));
assign next_kb_rdy = (blk_add_rdy & blk_xor_rdy);
assign next_kb_out = blk_add_out ^ blk_xor_out ^ reg_pre_in;

assign next_pre_in = (kb_rdy == 1'b1) ? kb_out : reg_pre_in;

//Final Computations before the HASH Outputs
//xor_transform_serial_2clk #(.BLOCK_SIZE(BLOCK_SIZE)) fxt_ins (.clk(clk), .rst(rst), .xor_start(reg_fxor_start), .xor_in(reg_kb_out), .xor_out(fxor_out), .xor_rdy(fxor_rdy));
mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) fm2a_ins (.m2add_in_one(reg_kb_out), .m2add_in_two(fxor_out), .m2add_out(fm2add_out));

//Outputs
assign kb_rdy_out = kb_rdy;
assign hash_out = reg_hash_out;
assign hash_rdy = reg_hash_rdy;

endmodule

//KUPYNA HASH FUNCTION - SERIAL - TWO ROUNDS in ONE CLOCK CYCLE - CONSECUTIVE MESSAGEs
module kupyna_hash_serial_2rnd #(parameter CODE_LENGTH = 256) (clk, rst, hash_start, hash_stop, msg_in, hash_out, hash_rdy, kb_rdy_out);

localparam BLOCK_SIZE = (CODE_LENGTH <= 256) ? 512 : 1024;

input clk, rst, hash_start, hash_stop;
input [BLOCK_SIZE-1:0] msg_in;
output [CODE_LENGTH-1:0] hash_out;
output hash_rdy, kb_rdy_out;

//Variables
wire kb_rdy, fxor_rdy, first_msg_prc;
wire [BLOCK_SIZE-1:0] kb_out, fxor_out, fm2add_out, next_pre_in, reg_msg_in, the_iv;
reg fmp, reg_kb_start, reg_fxor_start, reg_hash_start, reg_hash_stop, reg_hash_rdy, kb_status;
reg [BLOCK_SIZE-1:0] reg_pre_in, reg_kb_out;
reg [CODE_LENGTH-1:0] reg_hash_out;

//Initial Vector
assign the_iv = (BLOCK_SIZE == 512) ? 1'b1<<510 : 1'b1<<1023;

//kb_status indicates that Kupyna Block was run when hash_stop is high
//meaning that the Kupyna Block should not be run again
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_status <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      kb_status <= 1'b0;
    end
    else begin
      if (kb_rdy == 1'b1 && reg_hash_stop == 1'b1) begin
        kb_status <= 1'b1;
      end
    end
  end
end

//first_msg_prc indicates that the first message has gone through
//the Kupyna Block
always @ (posedge clk) begin
  if (rst == 1'b1 || hash_rdy == 1'b1) begin
    fmp <= 1'b0;
  end
  else begin
    if (kb_rdy == 1'b1) begin
      fmp <= 1'b1;
    end
  end
end
assign first_msg_prc = fmp | kb_rdy;

//the hash start and stop signals indicate that the hash process is
//started for the first message and stopped for the last message
always @ (hash_start or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_start <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_start <= 1'b0;
    end
    else begin
      if (hash_start == 1'b1) begin
        reg_hash_start <= 1'b1;
      end
      else begin
        reg_hash_start <= 1'b0;
      end
    end
  end
end
always @ (hash_stop or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_stop <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_stop <= 1'b0;
    end
    else begin
      if (hash_stop == 1'b1) begin
        reg_hash_stop <= 1'b1;
      end
      else begin
        reg_hash_stop <= 1'b0;
      end
    end
  end
end

//reg_msg_in
assign reg_msg_in = (reg_hash_start == 1'b0) ? {BLOCK_SIZE{1'b0}} : msg_in;

//Registers for inputs and outputs required for proper
//execution of the Kupyna hash function when multiple
//messages are processed
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_kb_start <= 1'b0;
    reg_hash_rdy <= 1'b0;
    reg_fxor_start <= 1'b0;
    reg_pre_in <= {BLOCK_SIZE{1'b0}};
    reg_kb_out <= {BLOCK_SIZE{1'b0}};
    reg_hash_out <= {CODE_LENGTH{1'b0}};
  end
  else begin
    //reg_kb_start and reg_pre_in
    if (reg_hash_start == 1'b0) begin
      reg_kb_start <= 1'b0;
      reg_pre_in <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      //reg_kb_start
      if (kb_rdy == 1'b1) begin
        reg_kb_start <= 1'b0;
      end
      else begin
        if (kb_status == 1'b0) begin
          reg_kb_start <= 1'b1;
        end
        else begin
          reg_kb_start <= 1'b0;
        end
      end
      //reg_pre_in
      if (first_msg_prc == 1'b0) begin
        reg_pre_in <= the_iv;
      end
      else begin
        reg_pre_in <= next_pre_in;
      end
    end

    //reg_kb_out and reg_hash_out
    //reg_fxor_start and reg_hash_rdy
    if (reg_hash_stop == 1'b0) begin
      reg_hash_rdy <= 1'b0;
      reg_fxor_start <= 1'b0;
      reg_kb_out <= {BLOCK_SIZE{1'b0}};
      reg_hash_out <= {CODE_LENGTH{1'b0}};
    end
    else if (reg_hash_stop == 1'b1) begin
      if (kb_rdy == 1'b1) begin
        reg_kb_out <= kb_out;
        reg_fxor_start <= 1'b1;
      end
      if (fxor_rdy == 1'b1) begin
        reg_hash_rdy <= 1'b1;
        reg_hash_out <= fm2add_out[CODE_LENGTH-1:0];
      end
    end
  end
end

//Kupyna Block
kupyna_block_serial_2rnd #(.BLOCK_SIZE(BLOCK_SIZE)) kb_ins (.clk(clk), .rst(rst), .kb_start(reg_kb_start), .msg_in(reg_msg_in), .pre_in(reg_pre_in), .kb_out(kb_out), .kb_rdy(kb_rdy));
assign next_pre_in = (kb_rdy == 1'b1) ? kb_out : reg_pre_in;

//Final Computations before the HASH Outputs
xor_transform_serial_2rnd #(.BLOCK_SIZE(BLOCK_SIZE)) fxt_ins (.clk(clk), .rst(rst), .xor_start(reg_fxor_start), .xor_in(reg_kb_out), .xor_out(fxor_out), .xor_rdy(fxor_rdy));
mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) fm2a_ins (.m2add_in_one(reg_kb_out), .m2add_in_two(fxor_out), .m2add_out(fm2add_out));

//Outputs
assign kb_rdy_out = kb_rdy;
assign hash_out = reg_hash_out;
assign hash_rdy = reg_hash_rdy;

endmodule

//KUPYNA HASH FUNCTION - SERIAL - TWO ROUNDS in ONE CLOCK CYCLE - CONSECUTIVE MESSAGEs - Reusing the XOR transformatiom
module kupyna_hash_serial_2rnd_reuse #(parameter CODE_LENGTH = 256) (clk, rst, hash_start, hash_stop, msg_in, hash_out, hash_rdy, kb_rdy_out);

localparam BLOCK_SIZE = (CODE_LENGTH <= 256) ? 512 : 1024;

input clk, rst, hash_start, hash_stop;
input [BLOCK_SIZE-1:0] msg_in;
output [CODE_LENGTH-1:0] hash_out;
output hash_rdy, kb_rdy_out;

//Variables
wire fxor_rdy, first_msg_prc, kb_run;
wire [BLOCK_SIZE-1:0] fxor_out, fm2add_out, next_pre_in, reg_msg_in, the_iv;
reg fmp, reg_kb_start, reg_fxor_start, reg_hash_start, reg_hash_stop, reg_hash_rdy, kb_rdy, kb_status, kbr;
reg [BLOCK_SIZE-1:0] reg_pre_in, kb_out, reg_kb_out;
reg [CODE_LENGTH-1:0] reg_hash_out;

//Initial Vector
assign the_iv = (BLOCK_SIZE == 512) ? 1'b1<<510 : 1'b1<<1023;

//kb_run indicates that the Kupyna Block is running
always @ (posedge clk) begin
  if (rst == 1'b1 || hash_rdy == 1'b1) begin
    kbr <= 1'b1;
  end
  else begin
    if (reg_hash_stop == 1'b1 && kb_rdy == 1'b1) begin
      kbr <= 1'b0;
    end
  end
end
assign kb_run = kbr & !(reg_hash_stop & kb_rdy);

//kb_status indicates that Kupyna Block was run when hash_stop is high
//meaning that the Kupyna Block should not be run again
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_status <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      kb_status <= 1'b0;
    end
    else begin
      if (kb_rdy == 1'b1 && reg_hash_stop == 1'b1) begin
        kb_status <= 1'b1;
      end
    end
  end
end

//first_msg_prc indicates that the first message has gone through
//the Kupyna Block
always @ (posedge clk) begin
  if (rst == 1'b1 || hash_rdy == 1'b1) begin
    fmp <= 1'b0;
  end
  else begin
    if (kb_rdy == 1'b1) begin
      fmp <= 1'b1;
    end
  end
end
assign first_msg_prc = fmp | kb_rdy;

//the hash start and stop signals indicate that the hash process is
//started for the first message and stopped for the last message
always @ (hash_start or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_start <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_start <= 1'b0;
    end
    else begin
      if (hash_start == 1'b1) begin
        reg_hash_start <= 1'b1;
      end
      else begin
        reg_hash_start <= 1'b0;
      end
    end
  end
end
always @ (hash_stop or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_stop <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_stop <= 1'b0;
    end
    else begin
      if (hash_stop == 1'b1) begin
        reg_hash_stop <= 1'b1;
      end
      else begin
        reg_hash_stop <= 1'b0;
      end
    end
  end
end

//reg_msg_in
assign reg_msg_in = (reg_hash_start == 1'b0) ? {BLOCK_SIZE{1'b0}} : msg_in;

//Registers for inputs and outputs required for proper
//execution of the Kupyna hash function when multiple
//messages are processed
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_kb_start <= 1'b0;
    reg_hash_rdy <= 1'b0;
    reg_fxor_start <= 1'b0;
    reg_pre_in <= {BLOCK_SIZE{1'b0}};
    reg_kb_out <= {BLOCK_SIZE{1'b0}};
    reg_hash_out <= {CODE_LENGTH{1'b0}};
  end
  else begin
    //reg_kb_start and reg_pre_in
    if (reg_hash_start == 1'b0) begin
      reg_kb_start <= 1'b0;
      reg_pre_in <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      //reg_kb_start
      if (kb_rdy == 1'b1) begin
        reg_kb_start <= 1'b0;
      end
      else begin
        if (kb_status == 1'b0) begin
          reg_kb_start <= 1'b1;
        end
        else begin
          reg_kb_start <= 1'b0;
        end
      end
      //reg_pre_in
      if (first_msg_prc == 1'b0) begin
        reg_pre_in <= the_iv;
      end
      else begin
        reg_pre_in <= next_pre_in;
      end
    end

    //reg_kb_out and reg_hash_out
    //reg_fxor_start and reg_hash_rdy
    if (reg_hash_stop == 1'b0) begin
      reg_hash_rdy <= 1'b0;
      reg_fxor_start <= 1'b0;
      reg_kb_out <= {BLOCK_SIZE{1'b0}};
      reg_hash_out <= {CODE_LENGTH{1'b0}};
    end
    else if (reg_hash_stop == 1'b1) begin
      if (kb_rdy == 1'b1) begin
        reg_kb_out <= kb_out;
        reg_fxor_start <= 1'b1;
      end
      if (fxor_rdy == 1'b1) begin
        reg_hash_rdy <= 1'b1;
        reg_hash_out <= fm2add_out[CODE_LENGTH-1:0];
      end
    end
  end
end

//Kupyna Block
//kupyna_block_serial_2rnd #(.BLOCK_SIZE(BLOCK_SIZE)) kb_ins (.clk(clk), .rst(rst), .kb_start(reg_kb_start), .msg_in(reg_msg_in), .pre_in(reg_pre_in), .kb_out(kb_out), .kb_rdy(kb_rdy));

//Variables
wire [BLOCK_SIZE-1:0] blk_xor_in;
wire blk_add_rdy, blk_xor_rdy, next_kb_rdy;
wire [BLOCK_SIZE-1:0] blk_add_out, blk_xor_out, next_kb_out;

//Registers for the Outputs
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_rdy <= 1'b0;
    kb_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (reg_kb_start == 1'b0) begin
      kb_rdy <= 1'b0;
      kb_out <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      kb_rdy <= next_kb_rdy;
      kb_out <= next_kb_out;
    end
  end
end

//Variables for REUSE
wire reuse_xor_start, reuse_xor_rdy;
wire [BLOCK_SIZE-1:0] reuse_xor_in, reuse_xor_out;

assign reuse_xor_start = (kb_run == 1'b0) ? reg_fxor_start : reg_kb_start;
assign reuse_xor_in = (kb_run == 1'b0) ? reg_kb_out : blk_xor_in;
assign fxor_out = (kb_run == 1'b0) ? reuse_xor_out : {BLOCK_SIZE{1'b0}};
assign fxor_rdy = (kb_run == 1'b0) ? reuse_xor_rdy : 1'b0;
assign blk_xor_out = (kb_run == 1'b1) ? reuse_xor_out : {BLOCK_SIZE{1'b0}};
assign blk_xor_rdy = (kb_run == 1'b1) ? reuse_xor_rdy : 1'b0;

//Transformation
assign blk_xor_in = reg_pre_in ^ reg_msg_in;
add_transform_serial_2rnd #(.BLOCK_SIZE(BLOCK_SIZE)) ats_ins (.clk(clk), .rst(rst), .add_start(reg_kb_start), .add_in(reg_msg_in), .add_out(blk_add_out), .add_rdy(blk_add_rdy));
xor_transform_serial_2rnd #(.BLOCK_SIZE(BLOCK_SIZE)) xts_ins (.clk(clk), .rst(rst), .xor_start(reuse_xor_start), .xor_in(reuse_xor_in), .xor_out(reuse_xor_out), .xor_rdy(reuse_xor_rdy));
//xor_transform_serial_2rnd #(.BLOCK_SIZE(BLOCK_SIZE)) xts_ins (.clk(clk), .rst(rst), .xor_start(kb_start), .xor_in(xor_in), .xor_out(xor_out), .xor_rdy(xor_rdy));
assign next_kb_rdy = (blk_add_rdy & blk_xor_rdy);
assign next_kb_out = blk_add_out ^ blk_xor_out ^ reg_pre_in;

assign next_pre_in = (kb_rdy == 1'b1) ? kb_out : reg_pre_in;

//Final Computations before the HASH Outputs
//xor_transform_serial_2rnd #(.BLOCK_SIZE(BLOCK_SIZE)) fxt_ins (.clk(clk), .rst(rst), .xor_start(reg_fxor_start), .xor_in(reg_kb_out), .xor_out(fxor_out), .xor_rdy(fxor_rdy));
mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) fm2a_ins (.m2add_in_one(reg_kb_out), .m2add_in_two(fxor_out), .m2add_out(fm2add_out));

//Outputs
assign kb_rdy_out = kb_rdy;
assign hash_out = reg_hash_out;
assign hash_rdy = reg_hash_rdy;

endmodule

//KUPYNA HASH FUNCTION - SERIAL - CONSECUTIVE MESSAGEs
module kupyna_hash_serial #(parameter CODE_LENGTH = 256) (clk, rst, hash_start, hash_stop, msg_in, hash_out, hash_rdy, kb_rdy_out);

localparam BLOCK_SIZE = (CODE_LENGTH <= 256) ? 512 : 1024;

input clk, rst, hash_start, hash_stop;
input [BLOCK_SIZE-1:0] msg_in;
output [CODE_LENGTH-1:0] hash_out;
output hash_rdy, kb_rdy_out;

//Variables
wire kb_rdy, fxor_rdy, first_msg_prc;
wire [BLOCK_SIZE-1:0] kb_out, fxor_out, fm2add_out, next_pre_in, reg_msg_in, the_iv;
reg fmp, reg_kb_start, reg_fxor_start, reg_hash_start, reg_hash_stop, reg_hash_rdy, kb_status;
reg [BLOCK_SIZE-1:0] reg_pre_in, reg_kb_out;
reg [CODE_LENGTH-1:0] reg_hash_out;

//Initial Vector
assign the_iv = (BLOCK_SIZE == 512) ? 1'b1<<510 : 1'b1<<1023;

//kb_status indicates that Kupyna Block was run when hash_stop is high
//meaning that the Kupyna Block should not be run again
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_status <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      kb_status <= 1'b0;
    end
    else begin
      if (kb_rdy == 1'b1 && reg_hash_stop == 1'b1) begin
        kb_status <= 1'b1;
      end
    end
  end
end

//first_msg_prc indicates that the first message has gone through
//the Kupyna Block
always @ (posedge clk) begin
  if (rst == 1'b1 || hash_rdy == 1'b1) begin
    fmp <= 1'b0;
  end
  else begin
    if (kb_rdy == 1'b1) begin
      fmp <= 1'b1;
    end
  end
end
assign first_msg_prc = fmp | kb_rdy;

//the hash start and stop signals indicate that the hash process is
//started for the first message and stopped for the last message
always @ (hash_start or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_start <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_start <= 1'b0;
    end
    else begin
      if (hash_start == 1'b1) begin
        reg_hash_start <= 1'b1;
      end
      else begin
        reg_hash_start <= 1'b0;
      end
    end
  end
end
always @ (hash_stop or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_stop <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_stop <= 1'b0;
    end
    else begin
      if (hash_stop == 1'b1) begin
        reg_hash_stop <= 1'b1;
      end
      else begin
        reg_hash_stop <= 1'b0;
      end
    end
  end
end

//reg_msg_in
assign reg_msg_in = (reg_hash_start == 1'b0) ? {BLOCK_SIZE{1'b0}} : msg_in;

//Registers for inputs and outputs required for proper
//execution of the Kupyna hash function when multiple
//messages are processed
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_kb_start <= 1'b0;
    reg_hash_rdy <= 1'b0;
    reg_fxor_start <= 1'b0;
    reg_pre_in <= {BLOCK_SIZE{1'b0}};
    reg_kb_out <= {BLOCK_SIZE{1'b0}};
    reg_hash_out <= {CODE_LENGTH{1'b0}};
  end
  else begin
    //reg_kb_start and reg_pre_in
    if (reg_hash_start == 1'b0) begin
      reg_kb_start <= 1'b0;
      reg_pre_in <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      //reg_kb_start
      if (kb_rdy == 1'b1) begin
        reg_kb_start <= 1'b0;
      end
      else begin
        if (kb_status == 1'b0) begin
          reg_kb_start <= 1'b1;
        end
        else begin
          reg_kb_start <= 1'b0;
        end
      end
      //reg_pre_in
      if (first_msg_prc == 1'b0) begin
        reg_pre_in <= the_iv;
      end
      else begin
        reg_pre_in <= next_pre_in;
      end
    end

    //reg_kb_out and reg_hash_out
    //reg_fxor_start and reg_hash_rdy
    if (reg_hash_stop == 1'b0) begin
      reg_hash_rdy <= 1'b0;
      reg_fxor_start <= 1'b0;
      reg_kb_out <= {BLOCK_SIZE{1'b0}};
      reg_hash_out <= {CODE_LENGTH{1'b0}};
    end
    else if (reg_hash_stop == 1'b1) begin
      if (kb_rdy == 1'b1) begin
        reg_kb_out <= kb_out;
        reg_fxor_start <= 1'b1;
      end
      if (fxor_rdy == 1'b1) begin
        reg_hash_rdy <= 1'b1;
        reg_hash_out <= fm2add_out[CODE_LENGTH-1:0];
      end
    end
  end
end

//Kupyna Block
kupyna_block_serial #(.BLOCK_SIZE(BLOCK_SIZE)) kb_ins (.clk(clk), .rst(rst), .kb_start(reg_kb_start), .msg_in(reg_msg_in), .pre_in(reg_pre_in), .kb_out(kb_out), .kb_rdy(kb_rdy));
assign next_pre_in = (kb_rdy == 1'b1) ? kb_out : reg_pre_in;

//Final Computations before the HASH Outputs
xor_transform_serial #(.BLOCK_SIZE(BLOCK_SIZE)) fxt_ins (.clk(clk), .rst(rst), .xor_start(reg_fxor_start), .xor_in(reg_kb_out), .xor_out(fxor_out), .xor_rdy(fxor_rdy));
mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) fm2a_ins (.m2add_in_one(reg_kb_out), .m2add_in_two(fxor_out), .m2add_out(fm2add_out));

//Outputs
assign kb_rdy_out = kb_rdy;
assign hash_out = reg_hash_out;
assign hash_rdy = reg_hash_rdy;

endmodule

//KUPYNA HASH FUNCTION - SERIAL - CONSECUTIVE MESSAGEs - Reusing the XOR transformation
module kupyna_hash_serial_reuse #(parameter CODE_LENGTH = 256) (clk, rst, hash_start, hash_stop, msg_in, hash_out, hash_rdy, kb_rdy_out);

localparam BLOCK_SIZE = (CODE_LENGTH <= 256) ? 512 : 1024;

input clk, rst, hash_start, hash_stop;
input [BLOCK_SIZE-1:0] msg_in;
output [CODE_LENGTH-1:0] hash_out;
output hash_rdy, kb_rdy_out;

//Variables
wire fxor_rdy, first_msg_prc, kb_run;
wire [BLOCK_SIZE-1:0] fxor_out, fm2add_out, next_pre_in, reg_msg_in, the_iv;
reg fmp, reg_kb_start, reg_fxor_start, reg_hash_start, reg_hash_stop, reg_hash_rdy, kb_rdy, kb_status, kbr;
reg [BLOCK_SIZE-1:0] reg_pre_in, kb_out, reg_kb_out;
reg [CODE_LENGTH-1:0] reg_hash_out;

//Initial Vector
assign the_iv = (BLOCK_SIZE == 512) ? 1'b1<<510 : 1'b1<<1023;

always @ (posedge clk) begin
  if (rst == 1'b1 || hash_rdy == 1'b1) begin
    kbr <= 1'b1;
  end
  else begin
    if (reg_hash_stop == 1'b1 && kb_rdy == 1'b1) begin
      kbr <= 1'b0;
    end
  end
end
assign kb_run = kbr & !(reg_hash_stop & kb_rdy);

//kb_status indicates that Kupyna Block was run when hash_stop is high
//meaning that the Kupyna Block should not be run again
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_status <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      kb_status <= 1'b0;
    end
    else begin
      if (kb_rdy == 1'b1 && reg_hash_stop == 1'b1) begin
        kb_status <= 1'b1;
      end
    end
  end
end

always @ (posedge clk) begin
  if (rst == 1'b1 || hash_rdy == 1'b1) begin
    fmp <= 1'b0;
  end
  else begin
    if (kb_rdy == 1'b1) begin
      fmp <= 1'b1;
    end
  end
end
assign first_msg_prc = fmp | kb_rdy;

always @ (hash_start or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_start <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_start <= 1'b0;
    end
    else begin
      if (hash_start == 1'b1) begin
        reg_hash_start <= 1'b1;
      end
      else begin
        reg_hash_start <= 1'b0;
      end
    end
  end
end
always @ (hash_stop or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_stop <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_stop <= 1'b0;
    end
    else begin
      if (hash_stop == 1'b1) begin
        reg_hash_stop <= 1'b1;
      end
      else begin
        reg_hash_stop <= 1'b0;
      end
    end
  end
end

//reg_msg_in
assign reg_msg_in = (reg_hash_start == 1'b0) ? {BLOCK_SIZE{1'b0}} : msg_in;

//Registers for inputs and outputs required for proper
//execution of the Kupyna hash function when multiple
//messages are processed
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_kb_start <= 1'b0;
    reg_hash_rdy <= 1'b0;
    reg_fxor_start <= 1'b0;
    reg_pre_in <= {BLOCK_SIZE{1'b0}};
    reg_kb_out <= {BLOCK_SIZE{1'b0}};
    reg_hash_out <= {CODE_LENGTH{1'b0}};
  end
  else begin
    //reg_kb_start and reg_pre_in
    if (reg_hash_start == 1'b0) begin
      reg_kb_start <= 1'b0;
      reg_pre_in <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      //reg_kb_start
      if (kb_rdy == 1'b1) begin
        reg_kb_start <= 1'b0;
      end
      else begin
        if (kb_status == 1'b0) begin
          reg_kb_start <= 1'b1;
        end
        else begin
          reg_kb_start <= 1'b0;
        end
      end
      //reg_pre_in
      if (first_msg_prc == 1'b0) begin
        reg_pre_in <= the_iv;
      end
      else begin
        reg_pre_in <= next_pre_in;
      end
    end

    //reg_kb_out and reg_hash_out
    //reg_fxor_start and reg_hash_rdy
    if (reg_hash_stop == 1'b0) begin
      reg_hash_rdy <= 1'b0;
      reg_fxor_start <= 1'b0;
      reg_kb_out <= {BLOCK_SIZE{1'b0}};
      reg_hash_out <= {CODE_LENGTH{1'b0}};
    end
    else if (reg_hash_stop == 1'b1) begin
      if (kb_rdy == 1'b1) begin
        reg_kb_out <= kb_out;
        reg_fxor_start <= 1'b1;
      end
      if (fxor_rdy == 1'b1) begin
        reg_hash_rdy <= 1'b1;
        reg_hash_out <= fm2add_out[CODE_LENGTH-1:0];
      end
    end
  end
end

//Kupyna Block
//kupyna_block_serial #(.BLOCK_SIZE(BLOCK_SIZE)) kb_ins (.clk(clk), .rst(rst), .kb_start(reg_kb_start), .msg_in(reg_msg_in), .pre_in(reg_pre_in), .kb_out(kb_out), .kb_rdy(kb_rdy));

//Variables
wire [BLOCK_SIZE-1:0] blk_xor_in;
wire blk_add_rdy, blk_xor_rdy, next_kb_rdy;
wire [BLOCK_SIZE-1:0] blk_add_out, blk_xor_out, next_kb_out;

//Registers for the Outputs
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_rdy <= 1'b0;
    kb_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (reg_kb_start == 1'b0) begin
      kb_rdy <= 1'b0;
      kb_out <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      kb_rdy <= next_kb_rdy;
      kb_out <= next_kb_out;
    end
  end
end

//Variables for REUSE
wire reuse_xor_start, reuse_xor_rdy;
wire [BLOCK_SIZE-1:0] reuse_xor_in, reuse_xor_out;

assign reuse_xor_start = (kb_run == 1'b0) ? reg_fxor_start : reg_kb_start;
assign reuse_xor_in = (kb_run == 1'b0) ? reg_kb_out : blk_xor_in;
assign fxor_out = (kb_run == 1'b0) ? reuse_xor_out : {BLOCK_SIZE{1'b0}};
assign fxor_rdy = (kb_run == 1'b0) ? reuse_xor_rdy : 1'b0;
assign blk_xor_out = (kb_run == 1'b1) ? reuse_xor_out : {BLOCK_SIZE{1'b0}};
assign blk_xor_rdy = (kb_run == 1'b1) ? reuse_xor_rdy : 1'b0;

//Transformation
assign blk_xor_in = reg_pre_in ^ reg_msg_in;
add_transform_serial #(.BLOCK_SIZE(BLOCK_SIZE)) ats_ins (.clk(clk), .rst(rst), .add_start(reg_kb_start), .add_in(reg_msg_in), .add_out(blk_add_out), .add_rdy(blk_add_rdy));
xor_transform_serial #(.BLOCK_SIZE(BLOCK_SIZE)) xts_ins (.clk(clk), .rst(rst), .xor_start(reuse_xor_start), .xor_in(reuse_xor_in), .xor_out(reuse_xor_out), .xor_rdy(reuse_xor_rdy));
//xor_transform_serial #(.BLOCK_SIZE(BLOCK_SIZE)) xts_ins (.clk(clk), .rst(rst), .xor_start(kb_start), .xor_in(xor_in), .xor_out(xor_out), .xor_rdy(xor_rdy));
assign next_kb_rdy = (blk_add_rdy & blk_xor_rdy);
assign next_kb_out = blk_add_out ^ blk_xor_out ^ reg_pre_in;

assign next_pre_in = (kb_rdy == 1'b1) ? kb_out : reg_pre_in;

//Final Computations before the HASH Outputs
//xor_transform_serial #(.BLOCK_SIZE(BLOCK_SIZE)) fxt_ins (.clk(clk), .rst(rst), .xor_start(reg_fxor_start), .xor_in(reg_kb_out), .xor_out(fxor_out), .xor_rdy(fxor_rdy));
mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) fm2a_ins (.m2add_in_one(reg_kb_out), .m2add_in_two(fxor_out), .m2add_out(fm2add_out));

//Outputs
assign kb_rdy_out = kb_rdy;
assign hash_out = reg_hash_out;
assign hash_rdy = reg_hash_rdy;

endmodule

//KUPYNA HASH FUNCTION - SERIAL64b - CONSECUTIVE MESSAGEs
module kupyna_hash_serial64b #(parameter CODE_LENGTH = 256) (clk, rst, hash_start, hash_stop, msg_in, hash_out, hash_rdy, kb_rdy_out);

localparam BLOCK_SIZE = (CODE_LENGTH <= 256) ? 512 : 1024;

input clk, rst, hash_start, hash_stop;
input [BLOCK_SIZE-1:0] msg_in;
output [CODE_LENGTH-1:0] hash_out;
output hash_rdy, kb_rdy_out;

//Variables
wire kb_rdy, fxor_rdy, first_msg_prc;
wire [BLOCK_SIZE-1:0] kb_out, fxor_out, fm2add_out, next_pre_in, reg_msg_in, the_iv;
reg fmp, reg_kb_start, reg_fxor_start, reg_hash_start, reg_hash_stop, reg_hash_rdy, kb_status;
reg [BLOCK_SIZE-1:0] reg_pre_in, reg_kb_out;
reg [CODE_LENGTH-1:0] reg_hash_out;

//Initial Vector
assign the_iv = (BLOCK_SIZE == 512) ? 1'b1<<510 : 1'b1<<1023;

//kb_status indicates that Kupyna Block was run when hash_stop is high
//meaning that the Kupyna Block should not be run again
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_status <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      kb_status <= 1'b0;
    end
    else begin
      if (kb_rdy == 1'b1 && reg_hash_stop == 1'b1) begin
        kb_status <= 1'b1;
      end
    end
  end
end

//first_msg_prc indicates that the first message has gone through
//the Kupyna Block
always @ (posedge clk) begin
  if (rst == 1'b1 || hash_rdy == 1'b1) begin
    fmp <= 1'b0;
  end
  else begin
    if (kb_rdy == 1'b1) begin
      fmp <= 1'b1;
    end
  end
end
assign first_msg_prc = fmp | kb_rdy;

//the hash start and stop signals indicate that the hash process is
//started for the first message and stopped for the last message
always @ (hash_start or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_start <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_start <= 1'b0;
    end
    else begin
      if (hash_start == 1'b1) begin
        reg_hash_start <= 1'b1;
      end
      else begin
        reg_hash_start <= 1'b0;
      end
    end
  end
end
always @ (hash_stop or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_stop <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_stop <= 1'b0;
    end
    else begin
      if (hash_stop == 1'b1) begin
        reg_hash_stop <= 1'b1;
      end
      else begin
        reg_hash_stop <= 1'b0;
      end
    end
  end
end

//reg_msg_in
assign reg_msg_in = (reg_hash_start == 1'b0) ? {BLOCK_SIZE{1'b0}} : msg_in;

//Registers for inputs and outputs required for proper
//execution of the Kupyna hash function when multiple
//messages are processed
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_kb_start <= 1'b0;
    reg_hash_rdy <= 1'b0;
    reg_fxor_start <= 1'b0;
    reg_pre_in <= {BLOCK_SIZE{1'b0}};
    reg_kb_out <= {BLOCK_SIZE{1'b0}};
    reg_hash_out <= {CODE_LENGTH{1'b0}};
  end
  else begin
    //reg_kb_start and reg_pre_in
    if (reg_hash_start == 1'b0) begin
      reg_kb_start <= 1'b0;
      reg_pre_in <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      //reg_kb_start
      if (kb_rdy == 1'b1) begin
        reg_kb_start <= 1'b0;
      end
      else begin
        if (kb_status == 1'b0) begin
          reg_kb_start <= 1'b1;
        end
        else begin
          reg_kb_start <= 1'b0;
        end
      end
      //reg_pre_in
      if (first_msg_prc == 1'b0) begin
        reg_pre_in <= the_iv;
      end
      else begin
        reg_pre_in <= next_pre_in;
      end
    end

    //reg_kb_out and reg_hash_out
    //reg_fxor_start and reg_hash_rdy
    if (reg_hash_stop == 1'b0) begin
      reg_hash_rdy <= 1'b0;
      reg_fxor_start <= 1'b0;
      reg_kb_out <= {BLOCK_SIZE{1'b0}};
      reg_hash_out <= {CODE_LENGTH{1'b0}};
    end
    else if (reg_hash_stop == 1'b1) begin
      if (kb_rdy == 1'b1) begin
        reg_kb_out <= kb_out;
        reg_fxor_start <= 1'b1;
      end
      if (fxor_rdy == 1'b1) begin
        reg_hash_rdy <= 1'b1;
        reg_hash_out <= fm2add_out[CODE_LENGTH-1:0];
      end
    end
  end
end

//Kupyna Block
kupyna_block_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) kb_ins (.clk(clk), .rst(rst), .kb_start(reg_kb_start), .msg_in(reg_msg_in), .pre_in(reg_pre_in), .kb_out(kb_out), .kb_rdy(kb_rdy));
assign next_pre_in = (kb_rdy == 1'b1) ? kb_out : reg_pre_in;

//Final Computations before the HASH Outputs
`ifdef FULL
  xor_transform_fullserial64b #(.BLOCK_SIZE(BLOCK_SIZE)) fxt_ins (.clk(clk), .rst(rst), .xor_start(reg_fxor_start), .xor_in(reg_kb_out), .xor_out(fxor_out), .xor_rdy(fxor_rdy));
`elsif SEMI
  xor_transform_semiserial64b #(.BLOCK_SIZE(BLOCK_SIZE)) fxt_ins (.clk(clk), .rst(rst), .xor_start(reg_fxor_start), .xor_in(reg_kb_out), .xor_out(fxor_out), .xor_rdy(fxor_rdy));
`endif
mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) fm2a_ins (.m2add_in_one(reg_kb_out), .m2add_in_two(fxor_out), .m2add_out(fm2add_out));

//Outputs
assign kb_rdy_out = kb_rdy;
assign hash_out = reg_hash_out;
assign hash_rdy = reg_hash_rdy;

endmodule

//KUPYNA HASH FUNCTION - SERIAL64b - CONSECUTIVE MESSAGEs - Reusing the XOR transformation
module kupyna_hash_serial64b_reuse #(parameter CODE_LENGTH = 256) (clk, rst, hash_start, hash_stop, msg_in, hash_out, hash_rdy, kb_rdy_out);

localparam BLOCK_SIZE = (CODE_LENGTH <= 256) ? 512 : 1024;

input clk, rst, hash_start, hash_stop;
input [BLOCK_SIZE-1:0] msg_in;
output [CODE_LENGTH-1:0] hash_out;
output hash_rdy, kb_rdy_out;

//Variables
wire fxor_rdy, kb_run, first_msg_prc;
wire [BLOCK_SIZE-1:0] fxor_out, fm2add_out, next_pre_in, reg_msg_in, the_iv;
reg fmp, kbr, reg_kb_start, reg_fxor_start, reg_hash_start, reg_hash_stop, reg_hash_rdy, kb_rdy, kb_status;
reg [BLOCK_SIZE-1:0] reg_pre_in, reg_kb_out, kb_out;
reg [CODE_LENGTH-1:0] reg_hash_out;

//Initial Vector
assign the_iv = (BLOCK_SIZE == 512) ? 1'b1<<510 : 1'b1<<1023;

//kb_run indicates that the Kupyna Block is running
always @ (posedge clk) begin
  if (rst == 1'b1 || hash_rdy == 1'b1) begin
    kbr <= 1'b1;
  end
  else begin
    if (reg_hash_stop == 1'b1 && kb_rdy == 1'b1) begin
      kbr <= 1'b0;
    end
  end
end
assign kb_run = kbr & !(reg_hash_stop & kb_rdy);

//kb_status indicates that Kupyna Block was run when hash_stop is high
//meaning that the Kupyna Block should not be run again
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_status <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      kb_status <= 1'b0;
    end
    else begin
      if (kb_rdy == 1'b1 && reg_hash_stop == 1'b1) begin
        kb_status <= 1'b1;
      end
    end
  end
end

//first_msg_prc indicates that the first message has gone through
//the Kupyna Block
always @ (posedge clk) begin
  if (rst == 1'b1 || hash_rdy == 1'b1) begin
    fmp <= 1'b0;
  end
  else begin
    if (kb_rdy == 1'b1) begin
      fmp <= 1'b1;
    end
  end
end
assign first_msg_prc = fmp | kb_rdy;

//the hash start and stop signals indicate that the hash process is
//started for the first message and stopped for the last message
always @ (hash_start or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_start <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_start <= 1'b0;
    end
    else begin
      if (hash_start == 1'b1) begin
        reg_hash_start <= 1'b1;
      end
      else begin
        reg_hash_start <= 1'b0;
      end
    end
  end
end
always @ (hash_stop or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_stop <= 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_stop <= 1'b0;
    end
    else begin
      if (hash_stop == 1'b1) begin
        reg_hash_stop <= 1'b1;
      end
      else begin
        reg_hash_stop <= 1'b0;
      end
    end
  end
end

//reg_msg_in
assign reg_msg_in = (reg_hash_start == 1'b0) ? {BLOCK_SIZE{1'b0}} : msg_in;

//Registers for inputs and outputs required for proper
//execution of the Kupyna hash function when multiple
//messages are processed
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_kb_start <= 1'b0;
    reg_hash_rdy <= 1'b0;
    reg_fxor_start <= 1'b0;
    reg_pre_in <= {BLOCK_SIZE{1'b0}};
    reg_kb_out <= {BLOCK_SIZE{1'b0}};
    reg_hash_out <= {CODE_LENGTH{1'b0}};
  end
  else begin
    //reg_kb_start and reg_pre_in
    if (reg_hash_start == 1'b0) begin
      reg_kb_start <= 1'b0;
      reg_pre_in <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      //reg_kb_start
      if (kb_rdy == 1'b1) begin
        reg_kb_start <= 1'b0;
      end
      else begin
        if (kb_status == 1'b0) begin
          reg_kb_start <= 1'b1;
        end
        else begin
          reg_kb_start <= 1'b0;
        end
      end
      //reg_pre_in
      if (first_msg_prc == 1'b0) begin
        reg_pre_in <= the_iv;
      end
      else begin
        reg_pre_in <= next_pre_in;
      end
    end

    //reg_kb_out and reg_hash_out
    //reg_fxor_start and reg_hash_rdy
    if (reg_hash_stop == 1'b0) begin
      reg_hash_rdy <= 1'b0;
      reg_fxor_start <= 1'b0;
      reg_kb_out <= {BLOCK_SIZE{1'b0}};
      reg_hash_out <= {CODE_LENGTH{1'b0}};
    end
    else if (reg_hash_stop == 1'b1) begin
      if (kb_rdy == 1'b1) begin
        reg_kb_out <= kb_out;
        reg_fxor_start <= 1'b1;
      end
      if (fxor_rdy == 1'b1) begin
        reg_hash_rdy <= 1'b1;
        reg_hash_out <= fm2add_out[CODE_LENGTH-1:0];
      end
    end
  end
end

//Kupyna Block
//Variables
wire [BLOCK_SIZE-1:0] blk_xor_in;
wire blk_add_rdy, blk_xor_rdy, next_kb_rdy;
wire [BLOCK_SIZE-1:0] blk_add_out, blk_xor_out, next_kb_out;

//Registers for the Outputs
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    kb_rdy <= 1'b0;
    kb_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (reg_kb_start == 1'b0) begin
      kb_rdy <= 1'b0;
      kb_out <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      kb_rdy <= next_kb_rdy;
      kb_out <= next_kb_out;
    end
  end
end

//Variables for REUSE
wire reuse_xor_start, reuse_xor_rdy;
wire [BLOCK_SIZE-1:0] reuse_xor_in, reuse_xor_out;

assign reuse_xor_start = (kb_run == 1'b0) ? reg_fxor_start : reg_kb_start;
assign reuse_xor_in = (kb_run == 1'b0) ? reg_kb_out : blk_xor_in;
assign fxor_out = (kb_run == 1'b0) ? reuse_xor_out : {BLOCK_SIZE{1'b0}};
assign fxor_rdy = (kb_run == 1'b0) ? reuse_xor_rdy : 1'b0;
assign blk_xor_out = (kb_run == 1'b1) ? reuse_xor_out : {BLOCK_SIZE{1'b0}};
assign blk_xor_rdy = (kb_run == 1'b1) ? reuse_xor_rdy : 1'b0;

//Transformation
assign blk_xor_in = reg_pre_in ^ reg_msg_in;
`ifdef FULL
  add_transform_fullserial64b #(.BLOCK_SIZE(BLOCK_SIZE)) ats_ins (.clk(clk), .rst(rst), .add_start(reg_kb_start), .add_in(reg_msg_in), .add_out(blk_add_out), .add_rdy(blk_add_rdy));
  xor_transform_fullserial64b #(.BLOCK_SIZE(BLOCK_SIZE)) xts_ins (.clk(clk), .rst(rst), .xor_start(reuse_xor_start), .xor_in(reuse_xor_in), .xor_out(reuse_xor_out), .xor_rdy(reuse_xor_rdy));
`elsif SEMI
  add_transform_semiserial64b #(.BLOCK_SIZE(BLOCK_SIZE)) ats_ins (.clk(clk), .rst(rst), .add_start(reg_kb_start), .add_in(reg_msg_in), .add_out(blk_add_out), .add_rdy(blk_add_rdy));
  xor_transform_semiserial64b #(.BLOCK_SIZE(BLOCK_SIZE)) xts_ins (.clk(clk), .rst(rst), .xor_start(reuse_xor_start), .xor_in(reuse_xor_in), .xor_out(reuse_xor_out), .xor_rdy(reuse_xor_rdy));
`endif
assign next_kb_rdy = (blk_add_rdy & blk_xor_rdy);
assign next_kb_out = blk_add_out ^ blk_xor_out ^ reg_pre_in;

assign next_pre_in = (kb_rdy == 1'b1) ? kb_out : reg_pre_in;

//Final Computations before the HASH Outputs
mod2_add #(.BLOCK_SIZE(BLOCK_SIZE)) fm2a_ins (.m2add_in_one(reg_kb_out), .m2add_in_two(fxor_out), .m2add_out(fm2add_out));

//Outputs
assign kb_rdy_out = kb_rdy;
assign hash_out = reg_hash_out;
assign hash_rdy = reg_hash_rdy;

endmodule

//KUPYNA HASH FUNCTION - serial_oboc - ONE OPERATION ONE CLOCK CYCLE
module kupyna_hash_serial_oboc_reuse_cllte256 #(parameter CODE_LENGTH = 256) (clk, rst, hash_start, hash_stop, msg_in, hash_out, hash_rdy, kb_rdy_out);

localparam BLOCK_SIZE = (CODE_LENGTH <= 256) ? 512 : 1024;

input clk, rst, hash_start, hash_stop;
input [BLOCK_SIZE-1:0] msg_in;
output [CODE_LENGTH-1:0] hash_out;
output hash_rdy, kb_rdy_out;

//Variables
reg [4:0] curr_state;
reg [CODE_LENGTH-1:0] reg_hash_out;
reg [3:0] xor_rnd_counter, add_rnd_counter;
reg [BLOCK_SIZE-1:0] add_in, sbpsmc_in, xor_block_out, addxor_block_out, reg_block_out;
reg is_fb, is_lb, xor_start, add_start, sbpsmc_start, reg_hash_start, reg_hash_stop, reg_kb_rdy, reg_hash_rdy;
wire m2add_rdy, m2p64add_rdy, sbpsmc_rdy;
wire [BLOCK_SIZE-1:0] gxi_out, gai_out, the_iv, block_iv, the_msg_in, m2add_out, m2p64add_out, sbpsmc_out, fm2add_out;

//Initial Vector
assign the_iv = (BLOCK_SIZE == 512) ? 1'b1<<510 : 1'b1<<1023;

//The hash start and stop signals indicate that the hash process is
//started for the first message and stopped for the last message
always @ (hash_start or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_start = 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_start = 1'b0;
    end
    else begin
      if (hash_start == 1'b1) begin
        reg_hash_start = 1'b1;
      end
      else begin
        reg_hash_start = 1'b0;
      end
    end
  end
end
always @ (hash_stop or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_stop = 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_stop = 1'b0;
    end
    else begin
      if (hash_stop == 1'b1) begin
        reg_hash_stop = 1'b1;
      end
      else begin
        reg_hash_stop = 1'b0;
      end
    end
  end
end

//The is_fb signal indicates that the first transformation block has already been executed
//The is_lb signal indicates that the last transformation block has already been executed
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    is_fb <= 1'b1;
    is_lb <= 1'b0;
  end
  else begin
    if (reg_hash_start == 1'b0) begin
      is_fb <= 1'b1;
      is_lb <= 1'b0;
    end
    else begin
      if (reg_kb_rdy == 1'b1) begin
        is_fb <= 1'b0;
        if (reg_hash_stop == 1'b1) begin
          is_lb <= 1'b1;
        end
      end
    end
  end
end

//Transformation outoput
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_block_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (reg_kb_rdy == 1'b1) begin
      reg_block_out <= addxor_block_out;
    end
  end
end

//Input to the transformation block
assign block_iv = (is_fb == 1'b1) ? the_iv : addxor_block_out;
assign the_msg_in = (is_lb == 1'b1) ? {BLOCK_SIZE{1'b0}} : msg_in;

//Block inputs in each state
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    add_start <= 1'b0;
    xor_start <= 1'b0;
    curr_state <= 5'd0;
    reg_kb_rdy <= 1'b0;
    sbpsmc_start <= 1'b0;
    add_rnd_counter <= 4'd0;
    xor_rnd_counter <= 4'd0;
    add_in <= {BLOCK_SIZE{1'b0}};
    sbpsmc_in <= {BLOCK_SIZE{1'b0}};
    xor_block_out <= {BLOCK_SIZE{1'b0}};
    addxor_block_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (reg_hash_start == 1'b0) begin
      add_start <= 1'b0;
      xor_start <= 1'b0;
      curr_state <= 5'd0;
      reg_kb_rdy <= 1'b0;
      sbpsmc_start <= 1'b0;
      add_rnd_counter <= 4'd0;
      xor_rnd_counter <= 4'd0;
      add_in <= {BLOCK_SIZE{1'b0}};
      sbpsmc_in <= {BLOCK_SIZE{1'b0}};
      xor_block_out <= {BLOCK_SIZE{1'b0}};
      addxor_block_out <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      case (curr_state)
        5'd0 : begin
          if (reg_hash_start == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            xor_rnd_counter <= 4'd0;
            add_in <= block_iv ^ the_msg_in;

            curr_state <= 5'd1;
          end
        end
        5'd1 : begin
          if (m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_in <= the_msg_in;
            add_rnd_counter <= 4'd0;

            curr_state <= 5'd2;
          end
        end
        5'd2 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd1;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd3;
          end
        end
        5'd3 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd1;
            add_in <= sbpsmc_out;

            curr_state <= 5'd4;
          end
        end
        5'd4 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd2;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd5;
          end
        end
        5'd5 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd2;
            add_in <= sbpsmc_out;

            curr_state <= 5'd6;
          end
        end
        5'd6 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd3;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd7;
          end
        end
        5'd7 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd3;
            add_in <= sbpsmc_out;

            curr_state <= 5'd8;
          end
        end
        5'd8 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd4;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd9;
          end
        end
        5'd9 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd4;
            add_in <= sbpsmc_out;

            curr_state <= 5'd10;
          end
        end
        5'd10 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd5;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd11;
          end
        end
        5'd11 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd5;
            add_in <= sbpsmc_out;

            curr_state <= 5'd12;
          end
        end
        5'd12 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd6;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd13;
          end
        end
        5'd13 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd6;
            add_in <= sbpsmc_out;

            curr_state <= 5'd14;
          end
        end
        5'd14 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd7;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd15;
          end
        end
        5'd15 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd7;
            add_in <= sbpsmc_out;

            curr_state <= 5'd16;
          end
        end
        5'd16 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd8;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd17;
          end
        end
        5'd17 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd8;
            add_in <= sbpsmc_out;

            curr_state <= 5'd18;
          end
        end
        5'd18 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd9;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd19;
          end
        end
        5'd19 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd9;
            add_in <= sbpsmc_out;

            curr_state <= 5'd20;
          end
        end
        5'd20 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;
            //XOR
            xor_block_out <= sbpsmc_out;

            curr_state <= 5'd21;
          end
        end
        5'd21 : begin
          if (sbpsmc_rdy == 1'b1) begin
            addxor_block_out <= xor_block_out ^ block_iv ^ sbpsmc_out;
            sbpsmc_start <= 1'b0;
            reg_kb_rdy <= 1'b1;

            curr_state <= 5'd22;
          end
        end
        5'd22 : begin
          //NOP
          curr_state <= 5'd0;
          reg_kb_rdy <= 1'b0;
        end
        default : begin
          add_start <= 1'b0;
          xor_start <= 1'b0;
          curr_state <= 5'd0;
          reg_kb_rdy <= 1'b0;
          sbpsmc_start <= 1'b0;
          add_rnd_counter <= 4'd0;
          xor_rnd_counter <= 4'd0;
          add_in <= {BLOCK_SIZE{1'b0}};
          sbpsmc_in <= {BLOCK_SIZE{1'b0}};
          xor_block_out <= {BLOCK_SIZE{1'b0}};
          addxor_block_out <= {BLOCK_SIZE{1'b0}};
        end
      endcase
    end
  end
end

//Hash Outputs
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_hash_rdy <= 1'b0;
    reg_hash_out <= {CODE_LENGTH{1'b0}};
  end
  else begin
    if (reg_hash_start == 1'b0) begin
      reg_hash_rdy <= 1'b0;
      reg_hash_out <= {CODE_LENGTH{1'b0}};
    end
    else begin
      if (reg_kb_rdy == 1'b1 && is_lb == 1'b1) begin
        reg_hash_rdy <= 1'b1;
        reg_hash_out <= fm2add_out[CODE_LENGTH-1:0];
      end
    end
  end
end

//Adder Input Generation
gen_xor_in #(.BLOCK_SIZE(BLOCK_SIZE)) gxi_ins (.gxi_in(xor_rnd_counter), .gxi_out(gxi_out));
gen_add_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins (.gai_in(add_rnd_counter), .gai_out(gai_out));
//Additions
mod2_add_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) m2a_ins (.clk(clk), .rst(rst), .m2add_start(xor_start), .m2add_in_one(gxi_out), .m2add_in_two(add_in), .m2add_out(m2add_out), .m2add_rdy(m2add_rdy));
mod2p64_add_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) m2p64a_ins (.clk(clk), .rst(rst), .m2p64add_start(add_start), .m2p64add_in_one(gai_out), .m2p64add_in_two(add_in), .m2p64add_out(m2p64add_out), .m2p64add_rdy(m2p64add_rdy));
//Substitution, Permutation, Mix-Column
sbpsmc_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) sbpsmc64b_ins (.clk(clk), .rst(rst), .sbpsmc_start(sbpsmc_start), .sbpsmc_in(sbpsmc_in), .sbpsmc_out(sbpsmc_out), .sbpsmc_rdy(sbpsmc_rdy));
//Final Computations before the HASH Outputs
assign fm2add_out = xor_block_out ^ reg_block_out;

//Outputs
assign kb_rdy_out = reg_kb_rdy;
assign hash_out = reg_hash_out;
assign hash_rdy = reg_hash_rdy;

endmodule

//KUPYNA HASH FUNCTION - serial_oboc - ONE OPERATION ONE CLOCK CYCLE
module kupyna_hash_serial_oboc_reuse_clgt256 #(parameter CODE_LENGTH = 512) (clk, rst, hash_start, hash_stop, msg_in, hash_out, hash_rdy, kb_rdy_out);

localparam BLOCK_SIZE = (CODE_LENGTH <= 256) ? 512 : 1024;

input clk, rst, hash_start, hash_stop;
input [BLOCK_SIZE-1:0] msg_in;
output [CODE_LENGTH-1:0] hash_out;
output hash_rdy, kb_rdy_out;

//Variables
reg [4:0] curr_state;
reg [CODE_LENGTH-1:0] reg_hash_out;
reg [3:0] xor_rnd_counter, add_rnd_counter;
reg [BLOCK_SIZE-1:0] add_in, sbpsmc_in, xor_block_out, addxor_block_out, reg_block_out;
reg is_fb, is_lb, xor_start, add_start, sbpsmc_start, reg_hash_start, reg_hash_stop, reg_kb_rdy, reg_hash_rdy;
wire m2add_rdy, m2p64add_rdy, sbpsmc_rdy;
wire [BLOCK_SIZE-1:0] gxi_out, gai_out, the_iv, block_iv, the_msg_in, m2add_out, m2p64add_out, sbpsmc_out, fm2add_out;

//Initial Vector
assign the_iv = (BLOCK_SIZE == 512) ? 1'b1<<510 : 1'b1<<1023;

//The hash start and stop signals indicate that the hash process is
//started for the first message and stopped for the last message
always @ (hash_start or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_start = 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_start = 1'b0;
    end
    else begin
      if (hash_start == 1'b1) begin
        reg_hash_start = 1'b1;
      end
      else begin
        reg_hash_start = 1'b0;
      end
    end
  end
end
always @ (hash_stop or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_stop = 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_stop = 1'b0;
    end
    else begin
      if (hash_stop == 1'b1) begin
        reg_hash_stop = 1'b1;
      end
      else begin
        reg_hash_stop = 1'b0;
      end
    end
  end
end

//The is_fb signal indicates that the first transformation block has already been executed
//The is_lb signal indicates that the last transformation block has already been executed
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    is_fb <= 1'b1;
    is_lb <= 1'b0;
  end
  else begin
    if (reg_hash_start == 1'b0) begin
      is_fb <= 1'b1;
      is_lb <= 1'b0;
    end
    else begin
      if (reg_kb_rdy == 1'b1) begin
        is_fb <= 1'b0;
        if (reg_hash_stop == 1'b1) begin
          is_lb <= 1'b1;
        end
      end
    end
  end
end

//Transformation outoput
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_block_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (reg_kb_rdy == 1'b1) begin
      reg_block_out <= addxor_block_out;
    end
  end
end

//Input to the transformation block
assign block_iv = (is_fb == 1'b1) ? the_iv : addxor_block_out;
assign the_msg_in = (is_lb == 1'b1) ? {BLOCK_SIZE{1'b0}} : msg_in;

//Block inputs in each state
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    add_start <= 1'b0;
    xor_start <= 1'b0;
    curr_state <= 5'd0;
    reg_kb_rdy <= 1'b0;
    sbpsmc_start <= 1'b0;
    add_rnd_counter <= 4'd0;
    xor_rnd_counter <= 4'd0;
    add_in <= {BLOCK_SIZE{1'b0}};
    sbpsmc_in <= {BLOCK_SIZE{1'b0}};
    xor_block_out <= {BLOCK_SIZE{1'b0}};
    addxor_block_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (reg_hash_start == 1'b0) begin
      add_start <= 1'b0;
      xor_start <= 1'b0;
      curr_state <= 5'd0;
      reg_kb_rdy <= 1'b0;
      sbpsmc_start <= 1'b0;
      add_rnd_counter <= 4'd0;
      xor_rnd_counter <= 4'd0;
      add_in <= {BLOCK_SIZE{1'b0}};
      sbpsmc_in <= {BLOCK_SIZE{1'b0}};
      xor_block_out <= {BLOCK_SIZE{1'b0}};
      addxor_block_out <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      case (curr_state)
        5'd0 : begin
          if (reg_hash_start == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            xor_rnd_counter <= 4'd0;
            add_in <= block_iv ^ the_msg_in;

            curr_state <= 5'd1;
          end
        end
        5'd1 : begin
          if (m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_in <= the_msg_in;
            add_rnd_counter <= 4'd0;

            curr_state <= 5'd2;
          end
        end
        5'd2 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd1;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd3;
          end
        end
        5'd3 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd1;
            add_in <= sbpsmc_out;

            curr_state <= 5'd4;
          end
        end
        5'd4 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd2;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd5;
          end
        end
        5'd5 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd2;
            add_in <= sbpsmc_out;

            curr_state <= 5'd6;
          end
        end
        5'd6 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd3;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd7;
          end
        end
        5'd7 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd3;
            add_in <= sbpsmc_out;

            curr_state <= 5'd8;
          end
        end
        5'd8 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd4;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd9;
          end
        end
        5'd9 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd4;
            add_in <= sbpsmc_out;

            curr_state <= 5'd10;
          end
        end
        5'd10 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd5;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd11;
          end
        end
        5'd11 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd5;
            add_in <= sbpsmc_out;

            curr_state <= 5'd12;
          end
        end
        5'd12 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd6;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd13;
          end
        end
        5'd13 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd6;
            add_in <= sbpsmc_out;

            curr_state <= 5'd14;
          end
        end
        5'd14 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd7;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd15;
          end
        end
        5'd15 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd7;
            add_in <= sbpsmc_out;

            curr_state <= 5'd16;
          end
        end
        5'd16 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd8;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd17;
          end
        end
        5'd17 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd8;
            add_in <= sbpsmc_out;

            curr_state <= 5'd18;
          end
        end
        5'd18 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd9;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd19;
          end
        end
        5'd19 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd9;
            add_in <= sbpsmc_out;

            curr_state <= 5'd20;
          end
        end
        5'd20 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd10;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd21;
          end
        end
        5'd21 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd10;
            add_in <= sbpsmc_out;

            curr_state <= 5'd22;
          end
        end
        5'd22 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd11;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd23;
          end
        end
        5'd23 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd11;
            add_in <= sbpsmc_out;

            curr_state <= 5'd24;
          end
        end
        5'd24 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd12;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd25;
          end
        end
        5'd25 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd12;
            add_in <= sbpsmc_out;

            curr_state <= 5'd26;
          end
        end
        5'd26 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= 4'd13;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd27;
          end
        end
        5'd27 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= 4'd13;
            add_in <= sbpsmc_out;

            curr_state <= 5'd28;
          end
        end
        5'd28 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;
            //XOR
            xor_block_out <= sbpsmc_out;

            curr_state <= 5'd29;
          end
        end
        5'd29 : begin
          if (sbpsmc_rdy == 1'b1) begin
            //ADD
            addxor_block_out <= xor_block_out ^ block_iv ^ sbpsmc_out;
            sbpsmc_start <= 1'b0;
            reg_kb_rdy <= 1'b1;

            curr_state <= 5'd30;
          end
        end
        5'd30 : begin
          //NOP
          curr_state <= 5'd0;
          reg_kb_rdy <= 1'b0;
        end
        default : begin
          add_start <= 1'b0;
          xor_start <= 1'b0;
          curr_state <= 5'd0;
          reg_kb_rdy <= 1'b0;
          sbpsmc_start <= 1'b0;
          add_rnd_counter <= 4'd0;
          xor_rnd_counter <= 4'd0;
          add_in <= {BLOCK_SIZE{1'b0}};
          sbpsmc_in <= {BLOCK_SIZE{1'b0}};
          xor_block_out <= {BLOCK_SIZE{1'b0}};
          addxor_block_out <= {BLOCK_SIZE{1'b0}};
        end
      endcase
    end
  end
end

//Hash Outputs
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_hash_rdy <= 1'b0;
    reg_hash_out <= {CODE_LENGTH{1'b0}};
  end
  else begin
    if (reg_hash_start == 1'b0) begin
      reg_hash_rdy <= 1'b0;
      reg_hash_out <= {CODE_LENGTH{1'b0}};
    end
    else begin
      if (reg_kb_rdy == 1'b1 && is_lb == 1'b1) begin
        reg_hash_rdy <= 1'b1;
        reg_hash_out <= fm2add_out[CODE_LENGTH-1:0];
      end
    end
  end
end

//Adder Input Generation
gen_xor_in #(.BLOCK_SIZE(BLOCK_SIZE)) gxi_ins (.gxi_in(xor_rnd_counter), .gxi_out(gxi_out));
gen_add_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins (.gai_in(add_rnd_counter), .gai_out(gai_out));
//Additions
mod2_add_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) m2a_ins (.clk(clk), .rst(rst), .m2add_start(xor_start), .m2add_in_one(gxi_out), .m2add_in_two(add_in), .m2add_out(m2add_out), .m2add_rdy(m2add_rdy));
mod2p64_add_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) m2p64a_ins (.clk(clk), .rst(rst), .m2p64add_start(add_start), .m2p64add_in_one(gai_out), .m2p64add_in_two(add_in), .m2p64add_out(m2p64add_out), .m2p64add_rdy(m2p64add_rdy));
//Substitution, Permutation, Mix-Column
sbpsmc_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) sbpsmc64b_ins (.clk(clk), .rst(rst), .sbpsmc_start(sbpsmc_start), .sbpsmc_in(sbpsmc_in), .sbpsmc_out(sbpsmc_out), .sbpsmc_rdy(sbpsmc_rdy));
//Final Computations before the HASH Outputs
assign fm2add_out = xor_block_out ^ reg_block_out;

//Outputs
assign kb_rdy_out = reg_kb_rdy;
assign hash_out = reg_hash_out;
assign hash_rdy = reg_hash_rdy;

endmodule

//KUPYNA HASH FUNCTION - serial_oboc - ONE OPERATION ONE CLOCK CYCLE
module kupyna_hash_serial_oboc_reuse #(parameter CODE_LENGTH = 256) (clk, rst, hash_start, hash_stop, msg_in, hash_out, hash_rdy, kb_rdy_out);

localparam BLOCK_SIZE = (CODE_LENGTH <= 256) ? 512 : 1024;
localparam rnd_num = (CODE_LENGTH <= 256) ? 4'd10 : 4'd14;

input clk, rst, hash_start, hash_stop;
input [BLOCK_SIZE-1:0] msg_in;
output [CODE_LENGTH-1:0] hash_out;
output hash_rdy, kb_rdy_out;

//Variables
reg [4:0] curr_state;
reg [CODE_LENGTH-1:0] reg_hash_out;
reg [3:0] xor_rnd_counter, add_rnd_counter;
reg [BLOCK_SIZE-1:0] add_in, sbpsmc_in, xor_block_out, addxor_block_out, reg_block_out;
reg is_fb, is_lb, xor_start, add_start, sbpsmc_start, reg_hash_start, reg_hash_stop, reg_kb_rdy, reg_hash_rdy;
wire m2add_rdy, m2p64add_rdy, sbpsmc_rdy;
wire [BLOCK_SIZE-1:0] gxi_out, gai_out, the_iv, block_iv, the_msg_in, m2add_out, m2p64add_out, sbpsmc_out, fm2add_out;

//Initial Vector
assign the_iv = (BLOCK_SIZE == 512) ? 1'b1<<510 : 1'b1<<1023;

//The hash start and stop signals indicate that the hash process is
//started for the first message and stopped for the last message
always @ (hash_start or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_start = 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_start = 1'b0;
    end
    else begin
      if (hash_start == 1'b1) begin
        reg_hash_start = 1'b1;
      end
      else begin
        reg_hash_start = 1'b0;
      end
    end
  end
end
always @ (hash_stop or hash_rdy or rst) begin
  if (rst == 1'b1) begin
    reg_hash_stop = 1'b0;
  end
  else begin
    if (hash_rdy == 1'b1) begin
      reg_hash_stop = 1'b0;
    end
    else begin
      if (hash_stop == 1'b1) begin
        reg_hash_stop = 1'b1;
      end
      else begin
        reg_hash_stop = 1'b0;
      end
    end
  end
end

//The is_fb signal indicates that the first transformation block has already been executed
//The is_lb signal indicates that the last transformation block has already been executed
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    is_fb <= 1'b1;
    is_lb <= 1'b0;
  end
  else begin
    if (reg_hash_start == 1'b0) begin
      is_fb <= 1'b1;
      is_lb <= 1'b0;
    end
    else begin
      if (reg_kb_rdy == 1'b1) begin
        is_fb <= 1'b0;
        if (reg_hash_stop == 1'b1) begin
          is_lb <= 1'b1;
        end
      end
    end
  end
end

//Transformation output
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_block_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (reg_kb_rdy == 1'b1) begin
      reg_block_out <= addxor_block_out;
    end
  end
end

//Input to the transformation block
assign block_iv = (is_fb == 1'b1) ? the_iv : addxor_block_out;
assign the_msg_in = (is_lb == 1'b1) ? {BLOCK_SIZE{1'b0}} : msg_in;

//Block inputs in each state
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    add_start <= 1'b0;
    xor_start <= 1'b0;
    curr_state <= 5'd0;
    reg_kb_rdy <= 1'b0;
    sbpsmc_start <= 1'b0;
    add_rnd_counter <= 4'd0;
    xor_rnd_counter <= 4'd0;
    add_in <= {BLOCK_SIZE{1'b0}};
    sbpsmc_in <= {BLOCK_SIZE{1'b0}};
    xor_block_out <= {BLOCK_SIZE{1'b0}};
    addxor_block_out <= {BLOCK_SIZE{1'b0}};
  end
  else begin
    if (reg_hash_start == 1'b0) begin
      add_start <= 1'b0;
      xor_start <= 1'b0;
      curr_state <= 5'd0;
      reg_kb_rdy <= 1'b0;
      sbpsmc_start <= 1'b0;
      add_rnd_counter <= 4'd0;
      xor_rnd_counter <= 4'd0;
      add_in <= {BLOCK_SIZE{1'b0}};
      sbpsmc_in <= {BLOCK_SIZE{1'b0}};
      xor_block_out <= {BLOCK_SIZE{1'b0}};
      addxor_block_out <= {BLOCK_SIZE{1'b0}};
    end
    else begin
      case (curr_state)
        5'd0 : begin
          if (reg_hash_start == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            xor_rnd_counter <= 4'd0;
            add_in <= block_iv ^ the_msg_in;

            curr_state <= 5'd1;
          end
        end
        5'd1 : begin
          if (m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_in <= the_msg_in;
            add_rnd_counter <= 4'd0;

            curr_state <= 5'd2;
          end
        end
        5'd2 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= xor_rnd_counter + 4'd1;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd3;
          end
        end
        5'd3 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= add_rnd_counter + 4'd1;
            add_in <= sbpsmc_out;

            curr_state <= 5'd4;
          end
        end
        5'd4 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= xor_rnd_counter + 4'd1;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd5;
          end
        end
        5'd5 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= add_rnd_counter + 4'd1;
            add_in <= sbpsmc_out;

            curr_state <= 5'd6;
          end
        end
        5'd6 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= xor_rnd_counter + 4'd1;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd7;
          end
        end
        5'd7 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= add_rnd_counter + 4'd1;
            add_in <= sbpsmc_out;

            curr_state <= 5'd8;
          end
        end
        5'd8 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= xor_rnd_counter + 4'd1;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd9;
          end
        end
        5'd9 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= add_rnd_counter + 4'd1;
            add_in <= sbpsmc_out;

            curr_state <= 5'd10;
          end
        end
        5'd10 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= xor_rnd_counter + 4'd1;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd11;
          end
        end
        5'd11 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= add_rnd_counter + 4'd1;
            add_in <= sbpsmc_out;

            curr_state <= 5'd12;
          end
        end
        5'd12 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= xor_rnd_counter + 4'd1;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd13;
          end
        end
        5'd13 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= add_rnd_counter + 4'd1;
            add_in <= sbpsmc_out;

            curr_state <= 5'd14;
          end
        end
        5'd14 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= xor_rnd_counter + 4'd1;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd15;
          end
        end
        5'd15 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= add_rnd_counter + 4'd1;
            add_in <= sbpsmc_out;

            curr_state <= 5'd16;
          end
        end
        5'd16 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= xor_rnd_counter + 4'd1;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd17;
          end
        end
        5'd17 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= add_rnd_counter + 4'd1;
            add_in <= sbpsmc_out;

            curr_state <= 5'd18;
          end
        end
        5'd18 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;

            //XOR
            xor_start <= 1'b1;
            add_in <= sbpsmc_out;
            xor_rnd_counter <= xor_rnd_counter + 4'd1;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            curr_state <= 5'd19;
          end
        end
        5'd19 : begin
          if (sbpsmc_rdy == 1'b1 && m2add_rdy == 1'b1) begin
            xor_start <= 1'b0;

            //XOR
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2add_out;
            //ADD
            add_start <= 1'b1;
            add_rnd_counter <= add_rnd_counter + 4'd1;
            add_in <= sbpsmc_out;

            curr_state <= 5'd20;
          end
        end
        5'd20 : begin
          if (sbpsmc_rdy == 1'b1 && m2p64add_rdy == 1'b1) begin
            add_start <= 1'b0;
            //ADD
            sbpsmc_start <= 1'b1;
            sbpsmc_in <= m2p64add_out;

            if (rnd_num == 4'd10) begin
              //XOR
              xor_block_out <= sbpsmc_out;

              curr_state <= 5'd21;
            end
            else begin
              if (xor_rnd_counter == 4'd13) begin
                //XOR
                xor_block_out <= sbpsmc_out;

                curr_state <= 5'd21;
              end
              else begin
                //XOR
                xor_start <= 1'b1;
                add_in <= sbpsmc_out;
                xor_rnd_counter <= xor_rnd_counter + 4'd1;

                curr_state <= 5'd13;
              end
            end
          end
        end
        5'd21 : begin
          if (sbpsmc_rdy == 1'b1) begin
            addxor_block_out <= xor_block_out ^ block_iv ^ sbpsmc_out;
            sbpsmc_start <= 1'b0;
            reg_kb_rdy <= 1'b1;

            curr_state <= 5'd22;
          end
        end
        5'd22 : begin
          //NOP
          curr_state <= 5'd0;
          reg_kb_rdy <= 1'b0;
        end
        default : begin
          add_start <= 1'b0;
          xor_start <= 1'b0;
          curr_state <= 5'd0;
          reg_kb_rdy <= 1'b0;
          sbpsmc_start <= 1'b0;
          add_rnd_counter <= 4'd0;
          xor_rnd_counter <= 4'd0;
          add_in <= {BLOCK_SIZE{1'b0}};
          sbpsmc_in <= {BLOCK_SIZE{1'b0}};
          xor_block_out <= {BLOCK_SIZE{1'b0}};
          addxor_block_out <= {BLOCK_SIZE{1'b0}};
        end
      endcase
    end
  end
end

//Hash Outputs
always @ (posedge clk) begin
  if (rst == 1'b1) begin
    reg_hash_rdy <= 1'b0;
    reg_hash_out <= {CODE_LENGTH{1'b0}};
  end
  else begin
    if (reg_hash_start == 1'b0) begin
      reg_hash_rdy <= 1'b0;
      reg_hash_out <= {CODE_LENGTH{1'b0}};
    end
    else begin
      if (reg_kb_rdy == 1'b1 && is_lb == 1'b1) begin
        reg_hash_rdy <= 1'b1;
        reg_hash_out <= fm2add_out[CODE_LENGTH-1:0];
      end
    end
  end
end

//Adder Input Generation
gen_xor_in #(.BLOCK_SIZE(BLOCK_SIZE)) gxi_ins (.gxi_in(xor_rnd_counter), .gxi_out(gxi_out));
gen_add_in #(.BLOCK_SIZE(BLOCK_SIZE)) gai_ins (.gai_in(add_rnd_counter), .gai_out(gai_out));
//Additions
mod2_add_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) m2a_ins (.clk(clk), .rst(rst), .m2add_start(xor_start), .m2add_in_one(gxi_out), .m2add_in_two(add_in), .m2add_out(m2add_out), .m2add_rdy(m2add_rdy));
mod2p64_add_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) m2p64a_ins (.clk(clk), .rst(rst), .m2p64add_start(add_start), .m2p64add_in_one(gai_out), .m2p64add_in_two(add_in), .m2p64add_out(m2p64add_out), .m2p64add_rdy(m2p64add_rdy));
//Substitution, Permutation, Mix-Column
sbpsmc_serial64b #(.BLOCK_SIZE(BLOCK_SIZE)) sbpsmc64b_ins (.clk(clk), .rst(rst), .sbpsmc_start(sbpsmc_start), .sbpsmc_in(sbpsmc_in), .sbpsmc_out(sbpsmc_out), .sbpsmc_rdy(sbpsmc_rdy));
//Final Computations before the HASH Outputs
assign fm2add_out = xor_block_out ^ reg_block_out;

//Outputs
assign kb_rdy_out = reg_kb_rdy;
assign hash_out = reg_hash_out;
assign hash_rdy = reg_hash_rdy;

endmodule
