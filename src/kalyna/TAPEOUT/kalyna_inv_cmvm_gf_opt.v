//INVERSE CMVM GF - OPTIMIZED for the NUMBER of XOR GATES
module kalyna_inv_cmvm_gf_opt (mds_in0, mds_in1, mds_in2, mds_in3, mds_in4, mds_in5, mds_in6, mds_in7, mds_out0, mds_out1, mds_out2, mds_out3, mds_out4, mds_out5, mds_out6, mds_out7); 

input [7:0] mds_in0, mds_in1, mds_in2, mds_in3, mds_in4, mds_in5, mds_in6, mds_in7; 
output [7:0] mds_out0, mds_out1, mds_out2, mds_out3, mds_out4, mds_out5, mds_out6, mds_out7; 

// S1: (+1*X9+1*X19) = +X9<<0 +X19<<0 
wire sub_exp1; 
assign sub_exp1 = mds_in1[0] ^ mds_in2[2]; 

// S2: (+1*X49+1*X59) = +X49<<0 +X59<<0 
wire sub_exp2; 
assign sub_exp2 = mds_in6[0] ^ mds_in7[2]; 

// S3: (+1*X25+1*X35) = +X25<<0 +X35<<0 
wire sub_exp3; 
assign sub_exp3 = mds_in3[0] ^ mds_in4[2]; 

// S4: (+1*X1+1*X11) = +X1<<0 +X11<<0 
wire sub_exp4; 
assign sub_exp4 = mds_in0[0] ^ mds_in1[2]; 

// S5: (+1*X41+1*X51) = +X41<<0 +X51<<0 
wire sub_exp5; 
assign sub_exp5 = mds_in5[0] ^ mds_in6[2]; 

// S6: (+1*X17+1*X27) = +X17<<0 +X27<<0 
wire sub_exp6; 
assign sub_exp6 = mds_in2[0] ^ mds_in3[2]; 

// S7: (+1*X3+1*X57) = +X3<<0 +X57<<0 
wire sub_exp7; 
assign sub_exp7 = mds_in0[2] ^ mds_in7[0]; 

// S8: (+1*X33+1*X43) = +X33<<0 +X43<<0 
wire sub_exp8; 
assign sub_exp8 = mds_in4[0] ^ mds_in5[2]; 

// S9: (+1*X2+1*X46) = +X2<<0 +X46<<0 
wire sub_exp9; 
assign sub_exp9 = mds_in0[1] ^ mds_in5[5]; 

// S10: (+1*X10+1*X54) = +X10<<0 +X54<<0 
wire sub_exp10; 
assign sub_exp10 = mds_in1[1] ^ mds_in6[5]; 

// S11: (+1*X38+1*X58) = +X38<<0 +X58<<0 
wire sub_exp11; 
assign sub_exp11 = mds_in4[5] ^ mds_in7[1]; 

// S12: (+1*X14+1*X34) = +X14<<0 +X34<<0 
wire sub_exp12; 
assign sub_exp12 = mds_in1[5] ^ mds_in4[1]; 

// S13: (+1*X22+1*X42) = +X22<<0 +X42<<0 
wire sub_exp13; 
assign sub_exp13 = mds_in2[5] ^ mds_in5[1]; 

// S14: (+1*X6+1*X26) = +X6<<0 +X26<<0 
wire sub_exp14; 
assign sub_exp14 = mds_in0[5] ^ mds_in3[1]; 

// S15: (+1*X18+1*X62) = +X18<<0 +X62<<0 
wire sub_exp15; 
assign sub_exp15 = mds_in2[1] ^ mds_in7[5]; 

// S16: (+1*X30+1*X50) = +X30<<0 +X50<<0 
wire sub_exp16; 
assign sub_exp16 = mds_in3[5] ^ mds_in6[1]; 

// S17: (+1*X20+1*X31) = +X20<<0 +X31<<0 
wire sub_exp17; 
assign sub_exp17 = mds_in2[3] ^ mds_in3[6]; 

// S18: (+1*X28+1*X39) = +X28<<0 +X39<<0 
wire sub_exp18; 
assign sub_exp18 = mds_in3[3] ^ mds_in4[6]; 

// S19: (+1*X36+1*X47) = +X36<<0 +X47<<0 
wire sub_exp19; 
assign sub_exp19 = mds_in4[3] ^ mds_in5[6]; 

// S20: (+1*X44+1*X55) = +X44<<0 +X55<<0 
wire sub_exp20; 
assign sub_exp20 = mds_in5[3] ^ mds_in6[6]; 

// S21: (+1*X12+1*X23) = +X12<<0 +X23<<0 
wire sub_exp21; 
assign sub_exp21 = mds_in1[3] ^ mds_in2[6]; 

// S22: (+1*X7+1*X60) = +X7<<0 +X60<<0 
wire sub_exp22; 
assign sub_exp22 = mds_in0[6] ^ mds_in7[3]; 

// S23: (+1*X52+1*X63) = +X52<<0 +X63<<0 
wire sub_exp23; 
assign sub_exp23 = mds_in6[3] ^ mds_in7[6]; 

// S24: (+1*X4+1*X15) = +X4<<0 +X15<<0 
wire sub_exp24; 
assign sub_exp24 = mds_in0[3] ^ mds_in1[6]; 

// S25: (+1*X13+1*X24) = +X13<<0 +X24<<0 
wire sub_exp25; 
assign sub_exp25 = mds_in1[4] ^ mds_in2[7]; 

// S26: (+1*X53+1*X64) = +X53<<0 +X64<<0 
wire sub_exp26; 
assign sub_exp26 = mds_in6[4] ^ mds_in7[7]; 

// S27: (+1*X21+1*X32) = +X21<<0 +X32<<0 
wire sub_exp27; 
assign sub_exp27 = mds_in2[4] ^ mds_in3[7]; 

// S28: (+1*X29+1*X40) = +X29<<0 +X40<<0 
wire sub_exp28; 
assign sub_exp28 = mds_in3[4] ^ mds_in4[7]; 

// S29: (+1*X37+1*X48) = +X37<<0 +X48<<0 
wire sub_exp29; 
assign sub_exp29 = mds_in4[4] ^ mds_in5[7]; 

// S30: (+1*X8+1*X61) = +X8<<0 +X61<<0 
wire sub_exp30; 
assign sub_exp30 = mds_in0[7] ^ mds_in7[4]; 

// S31: (+1*X45+1*X56) = +X45<<0 +X56<<0 
wire sub_exp31; 
assign sub_exp31 = mds_in5[4] ^ mds_in6[7]; 

// S32: (+1*X5+1*X16) = +X5<<0 +X16<<0 
wire sub_exp32; 
assign sub_exp32 = mds_in0[4] ^ mds_in1[7]; 

// S33: (+1*X10+1*X49+1*X54+1*X59) = +S2<<0 +S10<<0 
wire sub_exp33; 
assign sub_exp33 = sub_exp2 ^ sub_exp10; 

// S34: (+1*X2+1*X41+1*X46+1*X51) = +S5<<0 +S9<<0 
wire sub_exp34; 
assign sub_exp34 = sub_exp5 ^ sub_exp9; 

// S35: (+1*X33+1*X38+1*X43+1*X58) = +S8<<0 +S11<<0 
wire sub_exp35; 
assign sub_exp35 = sub_exp8 ^ sub_exp11; 

// S36: (+1*X17+1*X22+1*X27+1*X42) = +S6<<0 +S13<<0 
wire sub_exp36; 
assign sub_exp36 = sub_exp6 ^ sub_exp13; 

// S37: (+1*X9+1*X14+1*X19+1*X34) = +S1<<0 +S12<<0 
wire sub_exp37; 
assign sub_exp37 = sub_exp1 ^ sub_exp12; 

// S38: (+1*X1+1*X6+1*X11+1*X26) = +S4<<0 +S14<<0 
wire sub_exp38; 
assign sub_exp38 = sub_exp4 ^ sub_exp14; 

// S39: (+1*X3+1*X18+1*X57+1*X62) = +S7<<0 +S15<<0 
wire sub_exp39; 
assign sub_exp39 = sub_exp7 ^ sub_exp15; 

// S40: (+1*X25+1*X30+1*X35+1*X50) = +S3<<0 +S16<<0 
wire sub_exp40; 
assign sub_exp40 = sub_exp3 ^ sub_exp16; 

// S41: (+1*X13+1*X24+1*X36+1*X47) = +S19<<0 +S25<<0 
wire sub_exp41; 
assign sub_exp41 = sub_exp19 ^ sub_exp25; 

// S42: (+1*X59+1*X64) = +X59<<0 +X64<<0 
wire sub_exp42; 
assign sub_exp42 = mds_in7[2] ^ mds_in7[7]; 

// S43: (+1*X21+1*X32+1*X44+1*X55) = +S20<<0 +S27<<0 
wire sub_exp43; 
assign sub_exp43 = sub_exp20 ^ sub_exp27; 

// S44: (+1*X3+1*X8) = +X3<<0 +X8<<0 
wire sub_exp44; 
assign sub_exp44 = mds_in0[2] ^ mds_in0[7]; 

// S45: (+1*X8+1*X20+1*X31+1*X61) = +S17<<0 +S30<<0 
wire sub_exp45; 
assign sub_exp45 = sub_exp17 ^ sub_exp30; 

// S46: (+1*X43+1*X48) = +X43<<0 +X48<<0 
wire sub_exp46; 
assign sub_exp46 = mds_in5[2] ^ mds_in5[7]; 

// S47: (+1*X29+1*X40+1*X52+1*X63) = +S23<<0 +S28<<0 
wire sub_exp47; 
assign sub_exp47 = sub_exp23 ^ sub_exp28; 

// S48: (+1*X11+1*X16) = +X11<<0 +X16<<0 
wire sub_exp48; 
assign sub_exp48 = mds_in1[2] ^ mds_in1[7]; 

// S49: (+1*X12+1*X23+1*X53+1*X64) = +S21<<0 +S26<<0 
wire sub_exp49; 
assign sub_exp49 = sub_exp21 ^ sub_exp26; 

// S50: (+1*X35+1*X40) = +X35<<0 +X40<<0 
wire sub_exp50; 
assign sub_exp50 = mds_in4[2] ^ mds_in4[7]; 

// S51: (+1*X5+1*X16+1*X28+1*X39) = +S18<<0 +S32<<0 
wire sub_exp51; 
assign sub_exp51 = sub_exp18 ^ sub_exp32; 

// S52: (+1*X51+1*X56) = +X51<<0 +X56<<0 
wire sub_exp52; 
assign sub_exp52 = mds_in6[2] ^ mds_in6[7]; 

// S53: (+1*X7+1*X37+1*X48+1*X60) = +S22<<0 +S29<<0 
wire sub_exp53; 
assign sub_exp53 = sub_exp22 ^ sub_exp29; 

// S54: (+1*X19+1*X24) = +X19<<0 +X24<<0 
wire sub_exp54; 
assign sub_exp54 = mds_in2[2] ^ mds_in2[7]; 

// S55: (+1*X4+1*X15+1*X45+1*X56) = +S24<<0 +S31<<0 
wire sub_exp55; 
assign sub_exp55 = sub_exp24 ^ sub_exp31; 

// S56: (+1*X27+1*X32) = +X27<<0 +X32<<0 
wire sub_exp56; 
assign sub_exp56 = mds_in3[2] ^ mds_in3[7]; 

// S57: (+1*X4+1*X55) = +X4<<0 +X55<<0 
wire sub_exp57; 
assign sub_exp57 = mds_in0[3] ^ mds_in6[6]; 

// S58: (+1*X39+1*X52) = +X39<<0 +X52<<0 
wire sub_exp58; 
assign sub_exp58 = mds_in4[6] ^ mds_in6[3]; 

// S59: (+1*X47+1*X60) = +X47<<0 +X60<<0 
wire sub_exp59; 
assign sub_exp59 = mds_in5[6] ^ mds_in7[3]; 

// S60: (+1*X15+1*X28) = +X15<<0 +X28<<0 
wire sub_exp60; 
assign sub_exp60 = mds_in1[6] ^ mds_in3[3]; 

// S61: (+1*X12+1*X63) = +X12<<0 +X63<<0 
wire sub_exp61; 
assign sub_exp61 = mds_in1[3] ^ mds_in7[6]; 

// S62: (+1*X23+1*X36) = +X23<<0 +X36<<0 
wire sub_exp62; 
assign sub_exp62 = mds_in2[6] ^ mds_in4[3]; 

// S63: (+1*X7+1*X20) = +X7<<0 +X20<<0 
wire sub_exp63; 
assign sub_exp63 = mds_in0[6] ^ mds_in2[3]; 

// S64: (+1*X31+1*X44) = +X31<<0 +X44<<0 
wire sub_exp64; 
assign sub_exp64 = mds_in3[6] ^ mds_in5[3]; 

// S65: (+1*X13+1*X14+1*X24+1*X36+1*X47) = +X14<<0 +S41<<0 
wire sub_exp65; 
assign sub_exp65 = mds_in1[5] ^ sub_exp41; 

// S66: (+1*X9+1*X19+1*X21) = +X21<<0 +S1<<0 
wire sub_exp66; 
assign sub_exp66 = mds_in2[4] ^ sub_exp1; 

// S67: (+1*X3+1*X5+1*X57) = +X5<<0 +S7<<0 
wire sub_exp67; 
assign sub_exp67 = mds_in0[4] ^ sub_exp7; 

// S68: (+1*X17+1*X22) = +X17<<0 +X22<<0 
wire sub_exp68; 
assign sub_exp68 = mds_in2[0] ^ mds_in2[5]; 

// S69: (+1*X9+1*X14+1*X19+1*X34+1*X61) = +X61<<0 +S37<<0 
wire sub_exp69; 
assign sub_exp69 = mds_in7[4] ^ sub_exp37; 

// S70: (+1*X25+1*X35+1*X37) = +X37<<0 +S3<<0 
wire sub_exp70; 
assign sub_exp70 = mds_in4[4] ^ sub_exp3; 

// S71: (+1*X8+1*X20+1*X31+1*X61+1*X62) = +X62<<0 +S45<<0 
wire sub_exp71; 
assign sub_exp71 = mds_in7[5] ^ sub_exp45; 

// S72: (+1*X1+1*X11+1*X13) = +X13<<0 +S4<<0 
wire sub_exp72; 
assign sub_exp72 = mds_in1[4] ^ sub_exp4; 

// S73: (+1*X33+1*X43+1*X45) = +X45<<0 +S8<<0 
wire sub_exp73; 
assign sub_exp73 = mds_in5[4] ^ sub_exp8; 

// S74: (+1*X2+1*X29+1*X41+1*X46+1*X51) = +X29<<0 +S34<<0 
wire sub_exp74; 
assign sub_exp74 = mds_in3[4] ^ sub_exp34; 

// S75: (+1*X49+1*X54) = +X49<<0 +X54<<0 
wire sub_exp75; 
assign sub_exp75 = mds_in6[0] ^ mds_in6[5]; 

// S76: (+1*X25+1*X30) = +X25<<0 +X30<<0 
wire sub_exp76; 
assign sub_exp76 = mds_in3[0] ^ mds_in3[5]; 

// S77: (+1*X5+1*X6+1*X16+1*X28+1*X39) = +X6<<0 +S51<<0 
wire sub_exp77; 
assign sub_exp77 = mds_in0[5] ^ sub_exp51; 

// S78: (+1*X41+1*X51+1*X53) = +X53<<0 +S5<<0 
wire sub_exp78; 
assign sub_exp78 = mds_in6[4] ^ sub_exp5; 

// S79: (+1*X33+1*X38) = +X33<<0 +X38<<0 
wire sub_exp79; 
assign sub_exp79 = mds_in4[0] ^ mds_in4[5]; 

// S80: (+1*X41+1*X46) = +X41<<0 +X46<<0 
wire sub_exp80; 
assign sub_exp80 = mds_in5[0] ^ mds_in5[5]; 

// S81: (+1*X12+1*X23+1*X40) = +X40<<0 +S21<<0 
wire sub_exp81; 
assign sub_exp81 = mds_in4[7] ^ sub_exp21; 

// S82: (+1*X12+1*X29+1*X40+1*X52+1*X63) = +X12<<0 +S47<<0 
wire sub_exp82; 
assign sub_exp82 = mds_in1[3] ^ sub_exp47; 

// S83: (+1*X12+1*X23+1*X36+1*X53+1*X64) = +X36<<0 +S49<<0 
wire sub_exp83; 
assign sub_exp83 = mds_in4[3] ^ sub_exp49; 

// S84: (+1*X4+1*X21+1*X32+1*X44+1*X55) = +X4<<0 +S43<<0 
wire sub_exp84; 
assign sub_exp84 = mds_in0[3] ^ sub_exp43; 

// S85: (+1*X7+1*X20+1*X37+1*X48+1*X60) = +X20<<0 +S53<<0 
wire sub_exp85; 
assign sub_exp85 = mds_in2[3] ^ sub_exp53; 

// S86: (+1*X8+1*X44+1*X55) = +X8<<0 +S20<<0 
wire sub_exp86; 
assign sub_exp86 = mds_in0[7] ^ sub_exp20; 

// S87: (+1*X4+1*X15+1*X28+1*X45+1*X56) = +X28<<0 +S55<<0 
wire sub_exp87; 
assign sub_exp87 = mds_in3[3] ^ sub_exp55; 

// S88: (+1*X10+1*X11+1*X16) = +X10<<0 +S48<<0 
wire sub_exp88; 
assign sub_exp88 = mds_in1[1] ^ sub_exp48; 

// S89: (+1*X20+1*X31+1*X48) = +X48<<0 +S17<<0 
wire sub_exp89; 
assign sub_exp89 = mds_in5[7] ^ sub_exp17; 

// S90: (+1*X28+1*X39+1*X56) = +X56<<0 +S18<<0 
wire sub_exp90; 
assign sub_exp90 = mds_in6[7] ^ sub_exp18; 

// S91: (+1*X42+1*X43+1*X48) = +X42<<0 +S46<<0 
wire sub_exp91; 
assign sub_exp91 = mds_in5[1] ^ sub_exp46; 

// S92: (+1*X36+1*X47+1*X64) = +X64<<0 +S19<<0 
wire sub_exp92; 
assign sub_exp92 = mds_in7[7] ^ sub_exp19; 

// S93: (+1*X16+1*X52+1*X63) = +X16<<0 +S23<<0 
wire sub_exp93; 
assign sub_exp93 = mds_in1[7] ^ sub_exp23; 

// S94: (+1*X7+1*X24+1*X60) = +X24<<0 +S22<<0 
wire sub_exp94; 
assign sub_exp94 = mds_in2[7] ^ sub_exp22; 

// S95: (+1*X4+1*X15+1*X32) = +X32<<0 +S24<<0 
wire sub_exp95; 
assign sub_exp95 = mds_in3[7] ^ sub_exp24; 

// S96: (+1*X50+1*X51+1*X56) = +X50<<0 +S52<<0 
wire sub_exp96; 
assign sub_exp96 = mds_in6[1] ^ sub_exp52; 

// S97: (+1*X25+1*X30+1*X35+1*X50+1*X52+1*X63) = +S23<<0 +S40<<0 
wire sub_exp97; 
assign sub_exp97 = sub_exp23 ^ sub_exp40; 

// S98: (+1*X58+1*X59+1*X64) = +X58<<0 +S42<<0 
wire sub_exp98; 
assign sub_exp98 = mds_in7[1] ^ sub_exp42; 

// S99: (+1*X39+1*X57) = +X39<<0 +X57<<0 
wire sub_exp99; 
assign sub_exp99 = mds_in4[6] ^ mds_in7[0]; 

// S100: (+1*X26+1*X27+1*X32) = +X26<<0 +S56<<0 
wire sub_exp100; 
assign sub_exp100 = mds_in3[1] ^ sub_exp56; 

// S101: (+1*X2+1*X3+1*X8) = +X2<<0 +S44<<0 
wire sub_exp101; 
assign sub_exp101 = mds_in0[1] ^ sub_exp44; 

// S102: (+1*X33+1*X38+1*X43+1*X50+1*X58) = +X50<<0 +S35<<0 
wire sub_exp102; 
assign sub_exp102 = mds_in6[1] ^ sub_exp35; 

// S103: (+1*X18+1*X19+1*X24) = +X18<<0 +S54<<0 
wire sub_exp103; 
assign sub_exp103 = mds_in2[1] ^ sub_exp54; 

// S104: (+1*X1+1*X6+1*X11+1*X18+1*X26) = +X18<<0 +S38<<0 
wire sub_exp104; 
assign sub_exp104 = mds_in2[1] ^ sub_exp38; 

// S105: (+1*X34+1*X35+1*X40) = +X34<<0 +S50<<0 
wire sub_exp105; 
assign sub_exp105 = mds_in4[1] ^ sub_exp50; 

// S106: (+1*X1+1*X47) = +X1<<0 +X47<<0 
wire sub_exp106; 
assign sub_exp106 = mds_in0[0] ^ mds_in5[6]; 

// S107: (+1*X17+1*X22+1*X27+1*X28+1*X39+1*X42) = +S18<<0 +S36<<0 
wire sub_exp107; 
assign sub_exp107 = sub_exp18 ^ sub_exp36; 

// S108: (+1*X17+1*X22+1*X27+1*X42+1*X49+1*X59) = +S2<<0 +S36<<0 
wire sub_exp108; 
assign sub_exp108 = sub_exp2 ^ sub_exp36; 

// S109: (+1*X9+1*X10+1*X54) = +X9<<0 +S10<<0 
wire sub_exp109; 
assign sub_exp109 = mds_in1[0] ^ sub_exp10; 

// S110: (+1*X3+1*X10+1*X18+1*X57+1*X62) = +X10<<0 +S39<<0 
wire sub_exp110; 
assign sub_exp110 = mds_in1[1] ^ sub_exp39; 

// S111: (+1*X7+1*X10+1*X49+1*X54+1*X59+1*X60) = +S22<<0 +S33<<0 
wire sub_exp111; 
assign sub_exp111 = sub_exp22 ^ sub_exp33; 

// S112: (+1*X10+1*X17+1*X27+1*X49+1*X54+1*X59) = +S6<<0 +S33<<0 
wire sub_exp112; 
assign sub_exp112 = sub_exp6 ^ sub_exp33; 

// S113: (+1*X4+1*X9+1*X19+1*X21+1*X55) = +S57<<0 +S66<<0 
wire sub_exp113; 
assign sub_exp113 = sub_exp57 ^ sub_exp66; 

// S114: (+1*X3+1*X5+1*X39+1*X52+1*X57) = +S58<<0 +S67<<0 
wire sub_exp114; 
assign sub_exp114 = sub_exp58 ^ sub_exp67; 

// S115: (+1*X15+1*X28+1*X33+1*X43+1*X45) = +S60<<0 +S73<<0 
wire sub_exp115; 
assign sub_exp115 = sub_exp60 ^ sub_exp73; 

// S116: (+1*X1+1*X11+1*X13+1*X47+1*X60) = +S59<<0 +S72<<0 
wire sub_exp116; 
assign sub_exp116 = sub_exp59 ^ sub_exp72; 

// S117: (+1*X23+1*X36+1*X41+1*X51+1*X53) = +S62<<0 +S78<<0 
wire sub_exp117; 
assign sub_exp117 = sub_exp62 ^ sub_exp78; 

// S118: (+1*X7+1*X20+1*X25+1*X35+1*X37) = +S63<<0 +S70<<0 
wire sub_exp118; 
assign sub_exp118 = sub_exp63 ^ sub_exp70; 

// S119: (+1*X15+1*X59+1*X64) = +X15<<0 +S42<<0 
wire sub_exp119; 
assign sub_exp119 = mds_in1[6] ^ sub_exp42; 

// S120: (+1*X1+1*X6+1*X8+1*X11+1*X26+1*X44+1*X55) = +S38<<0 +S86<<0 
wire sub_exp120; 
assign sub_exp120 = sub_exp38 ^ sub_exp86; 

// S121: (+1*X9+1*X14+1*X16+1*X19+1*X34+1*X52+1*X63) = +S37<<0 +S93<<0 
wire sub_exp121; 
assign sub_exp121 = sub_exp37 ^ sub_exp93; 

// S122: (+1*X9+1*X14+1*X19+1*X26+1*X34) = +X26<<0 +S37<<0 
wire sub_exp122; 
assign sub_exp122 = mds_in3[1] ^ sub_exp37; 

// S123: (+1*X2+1*X20+1*X31+1*X41+1*X46+1*X48+1*X51) = +S34<<0 +S89<<0 
wire sub_exp123; 
assign sub_exp123 = sub_exp34 ^ sub_exp89; 

// S124: (+1*X11+1*X16+1*X31) = +X31<<0 +S48<<0 
wire sub_exp124; 
assign sub_exp124 = mds_in3[6] ^ sub_exp48; 

// S125: (+1*X3+1*X18+1*X36+1*X47+1*X57+1*X62+1*X64) = +S39<<0 +S92<<0 
wire sub_exp125; 
assign sub_exp125 = sub_exp39 ^ sub_exp92; 

// S126: (+1*X3+1*X8+1*X23) = +X23<<0 +S44<<0 
wire sub_exp126; 
assign sub_exp126 = mds_in2[6] ^ sub_exp44; 

// S127: (+1*X43+1*X48+1*X63) = +X63<<0 +S46<<0 
wire sub_exp127; 
assign sub_exp127 = mds_in7[6] ^ sub_exp46; 

// S128: (+1*X7+1*X51+1*X56) = +X7<<0 +S52<<0 
wire sub_exp128; 
assign sub_exp128 = mds_in0[6] ^ sub_exp52; 

// S129: (+1*X2+1*X7+1*X41+1*X46+1*X51) = +X7<<0 +S34<<0 
wire sub_exp129; 
assign sub_exp129 = mds_in0[6] ^ sub_exp34; 

// S130: (+1*X2+1*X29+1*X40) = +X2<<0 +S28<<0 
wire sub_exp130; 
assign sub_exp130 = mds_in0[1] ^ sub_exp28; 

// S131: (+1*X12+1*X23+1*X33+1*X38+1*X40+1*X43+1*X58) = +S35<<0 +S81<<0 
wire sub_exp131; 
assign sub_exp131 = sub_exp35 ^ sub_exp81; 

// S132: (+1*X25+1*X30+1*X35+1*X42+1*X50) = +X42<<0 +S40<<0 
wire sub_exp132; 
assign sub_exp132 = mds_in5[1] ^ sub_exp40; 

// S133: (+1*X37+1*X55) = +X37<<0 +X55<<0 
wire sub_exp133; 
assign sub_exp133 = mds_in4[4] ^ mds_in6[6]; 

// S134: (+1*X55+1*X60) = +X55<<0 +X60<<0 
wire sub_exp134; 
assign sub_exp134 = mds_in6[6] ^ mds_in7[3]; 

// S135: (+1*X25+1*X30+1*X35+1*X41+1*X50) = +X41<<0 +S40<<0 
wire sub_exp135; 
assign sub_exp135 = mds_in5[0] ^ sub_exp40; 

// S136: (+1*X7+1*X10+1*X22+1*X42+1*X49+1*X54+1*X59+1*X60) = +S13<<0 +S111<<0 
wire sub_exp136; 
assign sub_exp136 = sub_exp13 ^ sub_exp111; 

// S137: (+1*X13+1*X33+1*X38) = +X13<<0 +S79<<0 
wire sub_exp137; 
assign sub_exp137 = mds_in1[4] ^ sub_exp79; 

// S138: (+1*X21+1*X32+1*X58) = +X58<<0 +S27<<0 
wire sub_exp138; 
assign sub_exp138 = mds_in7[1] ^ sub_exp27; 

// S139: (+1*X3+1*X49+1*X59) = +X3<<0 +S2<<0 
wire sub_exp139; 
assign sub_exp139 = mds_in0[2] ^ sub_exp2; 

// S140: (+1*X2+1*X21+1*X32+1*X46) = +S9<<0 +S27<<0 
wire sub_exp140; 
assign sub_exp140 = sub_exp9 ^ sub_exp27; 

// S141: (+1*X18+1*X61+1*X62) = +X61<<0 +S15<<0 
wire sub_exp141; 
assign sub_exp141 = mds_in7[4] ^ sub_exp15; 

// S142: (+1*X19+1*X37+1*X48) = +X19<<0 +S29<<0 
wire sub_exp142; 
assign sub_exp142 = mds_in2[2] ^ sub_exp29; 

// S143: (+1*X18+1*X57+1*X62) = +X57<<0 +S15<<0 
wire sub_exp143; 
assign sub_exp143 = mds_in7[0] ^ sub_exp15; 

// S144: (+1*X5+1*X25+1*X30) = +X5<<0 +S76<<0 
wire sub_exp144; 
assign sub_exp144 = mds_in0[4] ^ sub_exp76; 

// S145: (+1*X1+1*X6+1*X26) = +X1<<0 +S14<<0 
wire sub_exp145; 
assign sub_exp145 = mds_in0[0] ^ sub_exp14; 

// S146: (+1*X27+1*X45+1*X56) = +X27<<0 +S31<<0 
wire sub_exp146; 
assign sub_exp146 = mds_in3[2] ^ sub_exp31; 

// S147: (+1*X6+1*X9) = +X6<<0 +X9<<0 
wire sub_exp147; 
assign sub_exp147 = mds_in0[5] ^ mds_in1[0]; 

// S148: (+1*X21+1*X49) = +X21<<0 +X49<<0 
wire sub_exp148; 
assign sub_exp148 = mds_in2[4] ^ mds_in6[0]; 

// S149: (+1*X33+1*X36+1*X38+1*X43+1*X47+1*X58) = +S19<<0 +S35<<0 
wire sub_exp149; 
assign sub_exp149 = sub_exp19 ^ sub_exp35; 

// S150: (+1*X6+1*X26+1*X44+1*X55) = +S14<<0 +S20<<0 
wire sub_exp150; 
assign sub_exp150 = sub_exp14 ^ sub_exp20; 

// S151: (+1*X17+1*X27+1*X35) = +X35<<0 +S6<<0 
wire sub_exp151; 
assign sub_exp151 = mds_in4[2] ^ sub_exp6; 

// S152: (+1*X14+1*X34+1*X53+1*X64) = +S12<<0 +S26<<0 
wire sub_exp152; 
assign sub_exp152 = sub_exp12 ^ sub_exp26; 

// S153: (+1*X2+1*X9+1*X14+1*X19+1*X34+1*X46+1*X61) = +S9<<0 +S69<<0 
wire sub_exp153; 
assign sub_exp153 = sub_exp9 ^ sub_exp69; 

// S154: (+1*X2+1*X9+1*X14+1*X19+1*X20+1*X31+1*X34+1*X46+1*X61) = +S17<<0 +S153<<0 
wire sub_exp154; 
assign sub_exp154 = sub_exp17 ^ sub_exp153; 

// S155: (+1*X14+1*X34+1*X52+1*X63) = +S12<<0 +S23<<0 
wire sub_exp155; 
assign sub_exp155 = sub_exp12 ^ sub_exp23; 

// S156: (+1*X2+1*X14+1*X29+1*X34+1*X41+1*X46+1*X51+1*X52+1*X63) = +S74<<0 +S155<<0 
wire sub_exp156; 
assign sub_exp156 = sub_exp74 ^ sub_exp155; 

// S157: (+1*X8+1*X34+1*X61) = +X34<<0 +S30<<0 
wire sub_exp157; 
assign sub_exp157 = mds_in4[1] ^ sub_exp30; 

// S158: (+1*X8+1*X22+1*X42+1*X61) = +S13<<0 +S30<<0 
wire sub_exp158; 
assign sub_exp158 = sub_exp13 ^ sub_exp30; 

// S159: (+1*X17+1*X53) = +X17<<0 +X53<<0 
wire sub_exp159; 
assign sub_exp159 = mds_in2[0] ^ mds_in6[4]; 

// S160: (+1*X4+1*X9+1*X15) = +X9<<0 +S24<<0 
wire sub_exp160; 
assign sub_exp160 = mds_in1[0] ^ sub_exp24; 

// S161: (+1*X3+1*X18+1*X30+1*X50+1*X57+1*X62) = +S16<<0 +S39<<0 
wire sub_exp161; 
assign sub_exp161 = sub_exp16 ^ sub_exp39; 

// S162: (+1*X25+1*X30+1*X50) = +X25<<0 +S16<<0 
wire sub_exp162; 
assign sub_exp162 = mds_in3[0] ^ sub_exp16; 

// S163: (+1*X5+1*X16+1*X51) = +X51<<0 +S32<<0 
wire sub_exp163; 
assign sub_exp163 = mds_in6[2] ^ sub_exp32; 

// S164: (+1*X33+1*X38+1*X58) = +X33<<0 +S11<<0 
wire sub_exp164; 
assign sub_exp164 = mds_in4[0] ^ sub_exp11; 

// S165: (+1*X13+1*X24+1*X59) = +X59<<0 +S25<<0 
wire sub_exp165; 
assign sub_exp165 = mds_in7[2] ^ sub_exp25; 

// S166: (+1*X12+1*X23+1*X38+1*X58) = +S11<<0 +S21<<0 
wire sub_exp166; 
assign sub_exp166 = sub_exp11 ^ sub_exp21; 

// S167: (+1*X1+1*X6+1*X11+1*X12+1*X23+1*X26+1*X38+1*X58) = +S38<<0 +S166<<0 
wire sub_exp167; 
assign sub_exp167 = sub_exp38 ^ sub_exp166; 

// S168: (+1*X15+1*X41+1*X51+1*X59+1*X64) = +S5<<0 +S119<<0 
wire sub_exp168; 
assign sub_exp168 = sub_exp5 ^ sub_exp119; 

// S169: (+1*X9+1*X10+1*X21+1*X49+1*X54) = +S109<<0 +S148<<0 
wire sub_exp169; 
assign sub_exp169 = sub_exp109 ^ sub_exp148; 

// S170: (+1*X48+1*X51) = +X48<<0 +X51<<0 
wire sub_exp170; 
assign sub_exp170 = mds_in5[7] ^ mds_in6[2]; 

// S171: (+1*X3+1*X8+1*X23+1*X49+1*X59) = +S2<<0 +S126<<0 
wire sub_exp171; 
assign sub_exp171 = sub_exp2 ^ sub_exp126; 

// S172: (+1*X18+1*X23+1*X36+1*X41+1*X51+1*X53+1*X62) = +S15<<0 +S117<<0 
wire sub_exp172; 
assign sub_exp172 = sub_exp15 ^ sub_exp117; 

// S173: (+1*X16+1*X19) = +X16<<0 +X19<<0 
wire sub_exp173; 
assign sub_exp173 = mds_in1[7] ^ mds_in2[2]; 

// S174: (+1*X47+1*X50+1*X51+1*X56+1*X60) = +S59<<0 +S96<<0 
wire sub_exp174; 
assign sub_exp174 = sub_exp59 ^ sub_exp96; 

// S175: (+1*X18+1*X36+1*X47+1*X61+1*X62) = +S19<<0 +S141<<0 
wire sub_exp175; 
assign sub_exp175 = sub_exp19 ^ sub_exp141; 

// S176: (+1*X18+1*X19+1*X37+1*X48+1*X57+1*X62) = +S142<<0 +S143<<0 
wire sub_exp176; 
assign sub_exp176 = sub_exp142 ^ sub_exp143; 

// S177: (+1*X1+1*X11+1*X13+1*X22+1*X42+1*X47+1*X60) = +S13<<0 +S116<<0 
wire sub_exp177; 
assign sub_exp177 = sub_exp13 ^ sub_exp116; 

// S178: (+1*X4+1*X55+1*X58+1*X59+1*X64) = +S57<<0 +S98<<0 
wire sub_exp178; 
assign sub_exp178 = sub_exp57 ^ sub_exp98; 

// S179: (+1*X7+1*X20+1*X37+1*X48+1*X54+1*X60) = +X54<<0 +S85<<0 
wire sub_exp179; 
assign sub_exp179 = mds_in6[5] ^ sub_exp85; 

// S180: (+1*X56+1*X59) = +X56<<0 +X59<<0 
wire sub_exp180; 
assign sub_exp180 = mds_in6[7] ^ mds_in7[2]; 

// S181: (+1*X7+1*X8+1*X60+1*X61) = +S22<<0 +S30<<0 
wire sub_exp181; 
assign sub_exp181 = sub_exp22 ^ sub_exp30; 

// S182: (+1*X4+1*X9+1*X19+1*X21+1*X30+1*X50+1*X55) = +S16<<0 +S113<<0 
wire sub_exp182; 
assign sub_exp182 = sub_exp16 ^ sub_exp113; 

// S183: (+1*X2+1*X3+1*X8+1*X12+1*X63) = +S61<<0 +S101<<0 
wire sub_exp183; 
assign sub_exp183 = sub_exp61 ^ sub_exp101; 

// S184: (+1*X3+1*X11+1*X16+1*X31+1*X57) = +S7<<0 +S124<<0 
wire sub_exp184; 
assign sub_exp184 = sub_exp7 ^ sub_exp124; 

// S185: (+1*X10+1*X17+1*X27+1*X28+1*X39+1*X49+1*X54+1*X56+1*X59) = +S90<<0 +S112<<0 
wire sub_exp185; 
assign sub_exp185 = sub_exp90 ^ sub_exp112; 

// S186: (+1*X4+1*X15+1*X28+1*X45+1*X56+1*X62) = +X62<<0 +S87<<0 
wire sub_exp186; 
assign sub_exp186 = mds_in7[5] ^ sub_exp87; 

// S187: (+1*X5+1*X16+1*X25+1*X30+1*X50+1*X51) = +S162<<0 +S163<<0 
wire sub_exp187; 
assign sub_exp187 = sub_exp162 ^ sub_exp163; 

// S188: (+1*X24+1*X27) = +X24<<0 +X27<<0 
wire sub_exp188; 
assign sub_exp188 = mds_in2[7] ^ mds_in3[2]; 

// S189: (+1*X10+1*X11+1*X16+1*X45) = +X45<<0 +S88<<0 
wire sub_exp189; 
assign sub_exp189 = mds_in5[4] ^ sub_exp88; 

// S190: (+1*X2+1*X3+1*X8+1*X41+1*X51) = +S5<<0 +S101<<0 
wire sub_exp190; 
assign sub_exp190 = sub_exp5 ^ sub_exp101; 

// S191: (+1*X6+1*X9+1*X12+1*X23+1*X36+1*X53+1*X64) = +S83<<0 +S147<<0 
wire sub_exp191; 
assign sub_exp191 = sub_exp83 ^ sub_exp147; 

// S192: (+1*X13+1*X24+1*X33+1*X38+1*X58+1*X59) = +S164<<0 +S165<<0 
wire sub_exp192; 
assign sub_exp192 = sub_exp164 ^ sub_exp165; 

// S193: (+1*X4+1*X15+1*X26+1*X32) = +X26<<0 +S95<<0 
wire sub_exp193; 
assign sub_exp193 = mds_in3[1] ^ sub_exp95; 

// S194: (+1*X12+1*X29+1*X40+1*X46+1*X52+1*X63) = +X46<<0 +S82<<0 
wire sub_exp194; 
assign sub_exp194 = mds_in5[5] ^ sub_exp82; 

// S195: (+1*X18+1*X45+1*X56) = +X18<<0 +S31<<0 
wire sub_exp195; 
assign sub_exp195 = mds_in2[1] ^ sub_exp31; 

// S196: (+1*X25+1*X30+1*X35+1*X37+1*X50+1*X52+1*X55+1*X63) = +S97<<0 +S133<<0 
wire sub_exp196; 
assign sub_exp196 = sub_exp97 ^ sub_exp133; 

// S197: (+1*X3+1*X46+1*X57) = +X46<<0 +S7<<0 
wire sub_exp197; 
assign sub_exp197 = mds_in5[5] ^ sub_exp7; 

// S198: (+1*X23+1*X28) = +X23<<0 +X28<<0 
wire sub_exp198; 
assign sub_exp198 = mds_in2[6] ^ mds_in3[3]; 

// S199: (+1*X1+1*X6+1*X26+1*X37) = +X37<<0 +S145<<0 
wire sub_exp199; 
assign sub_exp199 = mds_in4[4] ^ sub_exp145; 

// S200: (+1*X8+1*X20+1*X31+1*X57+1*X61+1*X62) = +X57<<0 +S71<<0 
wire sub_exp200; 
assign sub_exp200 = mds_in7[0] ^ sub_exp71; 

// S201: (+1*X1+1*X6+1*X11+1*X12+1*X23+1*X26+1*X37+1*X38+1*X58) = +X37<<0 +S167<<0 
wire sub_exp201; 
assign sub_exp201 = mds_in4[4] ^ sub_exp167; 

// S202: (+1*X27+1*X45+1*X53+1*X56+1*X64) = +S26<<0 +S146<<0 
wire sub_exp202; 
assign sub_exp202 = sub_exp26 ^ sub_exp146; 

// S203: (+1*X17+1*X27+1*X35+1*X40) = +S6<<0 +S50<<0 
wire sub_exp203; 
assign sub_exp203 = sub_exp6 ^ sub_exp50; 

// S204: (+1*X31+1*X36) = +X31<<0 +X36<<0 
wire sub_exp204; 
assign sub_exp204 = mds_in3[6] ^ mds_in4[3]; 

// S205: (+1*X1+1*X6+1*X11+1*X18+1*X21+1*X26+1*X32+1*X58) = +S104<<0 +S138<<0 
wire sub_exp205; 
assign sub_exp205 = sub_exp104 ^ sub_exp138; 

// S206: (+1*X13+1*X42+1*X43+1*X48) = +X13<<0 +S91<<0 
wire sub_exp206; 
assign sub_exp206 = mds_in1[4] ^ sub_exp91; 

// S207: (+1*X13+1*X15+1*X24+1*X28+1*X33+1*X43+1*X45) = +S25<<0 +S115<<0 
wire sub_exp207; 
assign sub_exp207 = sub_exp25 ^ sub_exp115; 

// S208: (+1*X7+1*X10+1*X21+1*X22+1*X42+1*X49+1*X54+1*X59+1*X60) = +X21<<0 +S136<<0 
wire sub_exp208; 
assign sub_exp208 = mds_in2[4] ^ sub_exp136; 

// S209: (+1*X3+1*X18+1*X36+1*X47+1*X57+1*X58+1*X62+1*X64) = +X58<<0 +S125<<0 
wire sub_exp209; 
assign sub_exp209 = mds_in7[1] ^ sub_exp125; 

// S210: (+1*X43+1*X48+1*X58+1*X63) = +X58<<0 +S127<<0 
wire sub_exp210; 
assign sub_exp210 = mds_in7[1] ^ sub_exp127; 

// S211: (+1*X57+1*X62) = +X57<<0 +X62<<0 
wire sub_exp211; 
assign sub_exp211 = mds_in7[0] ^ mds_in7[5]; 

// S212: (+1*X15+1*X18+1*X19+1*X24+1*X28) = +S60<<0 +S103<<0 
wire sub_exp212; 
assign sub_exp212 = sub_exp60 ^ sub_exp103; 

// S213: (+1*X4+1*X10+1*X15+1*X32) = +X10<<0 +S95<<0 
wire sub_exp213; 
assign sub_exp213 = mds_in1[1] ^ sub_exp95; 

// S214: (+1*X28+1*X29+1*X39+1*X40) = +S18<<0 +S28<<0 
wire sub_exp214; 
assign sub_exp214 = sub_exp18 ^ sub_exp28; 

// S215: (+1*X4+1*X63) = +X4<<0 +X63<<0 
wire sub_exp215; 
assign sub_exp215 = mds_in0[3] ^ mds_in7[6]; 

// S216: (+1*X13+1*X24+1*X36+1*X39+1*X47+1*X52) = +S41<<0 +S58<<0 
wire sub_exp216; 
assign sub_exp216 = sub_exp41 ^ sub_exp58; 

// S217: (+1*X30+1*X60) = +X30<<0 +X60<<0 
wire sub_exp217; 
assign sub_exp217 = mds_in3[5] ^ mds_in7[3]; 

// S218: (+1*X3+1*X18+1*X26+1*X27+1*X32+1*X57+1*X62) = +S39<<0 +S100<<0 
wire sub_exp218; 
assign sub_exp218 = sub_exp39 ^ sub_exp100; 

// S219: (+1*X8+1*X20+1*X23+1*X31+1*X36+1*X61) = +S45<<0 +S62<<0 
wire sub_exp219; 
assign sub_exp219 = sub_exp45 ^ sub_exp62; 

// S220: (+1*X44+1*X45+1*X55+1*X56) = +S20<<0 +S31<<0 
wire sub_exp220; 
assign sub_exp220 = sub_exp20 ^ sub_exp31; 

// S221: (+1*X2+1*X14+1*X29+1*X34+1*X41+1*X46+1*X49+1*X51+1*X52+1*X54+1*X63) = +S75<<0 +S156<<0 
wire sub_exp221; 
assign sub_exp221 = sub_exp75 ^ sub_exp156; 

// S222: (+1*X12+1*X23+1*X49+1*X53+1*X54+1*X64) = +S49<<0 +S75<<0 
wire sub_exp222; 
assign sub_exp222 = sub_exp49 ^ sub_exp75; 

// S223: (+1*X17+1*X21+1*X22+1*X32+1*X44+1*X55) = +S43<<0 +S68<<0 
wire sub_exp223; 
assign sub_exp223 = sub_exp43 ^ sub_exp68; 

// S224: (+1*X12+1*X13+1*X23+1*X24) = +S21<<0 +S25<<0 
wire sub_exp224; 
assign sub_exp224 = sub_exp21 ^ sub_exp25; 

// S225: (+1*X2+1*X9+1*X14+1*X17+1*X19+1*X20+1*X22+1*X31+1*X34+1*X46+1*X61) = +S68<<0 +S154<<0 
wire sub_exp225; 
assign sub_exp225 = sub_exp68 ^ sub_exp154; 

// S226: (+1*X2+1*X12+1*X29+1*X41+1*X46+1*X51+1*X63) = +S61<<0 +S74<<0 
wire sub_exp226; 
assign sub_exp226 = sub_exp61 ^ sub_exp74; 

// S227: (+1*X17+1*X27+1*X35+1*X38+1*X58) = +S11<<0 +S151<<0 
wire sub_exp227; 
assign sub_exp227 = sub_exp11 ^ sub_exp151; 

// S228: (+1*X10+1*X11+1*X16+1*X44) = +X44<<0 +S88<<0 
wire sub_exp228; 
assign sub_exp228 = mds_in5[3] ^ sub_exp88; 

// S229: (+1*X8+1*X20+1*X31+1*X44+1*X61+1*X62) = +X44<<0 +S71<<0 
wire sub_exp229; 
assign sub_exp229 = mds_in5[3] ^ sub_exp71; 

// S230: (+1*X3+1*X10+1*X18+1*X45+1*X56+1*X57+1*X62) = +S31<<0 +S110<<0 
wire sub_exp230; 
assign sub_exp230 = sub_exp31 ^ sub_exp110; 

// S231: (+1*X3+1*X10+1*X18+1*X25+1*X57+1*X62) = +X25<<0 +S110<<0 
wire sub_exp231; 
assign sub_exp231 = mds_in3[0] ^ sub_exp110; 

// S232: (+1*X2+1*X7+1*X29+1*X40+1*X41+1*X46+1*X51) = +S28<<0 +S129<<0 
wire sub_exp232; 
assign sub_exp232 = sub_exp28 ^ sub_exp129; 

// S233: (+1*X9+1*X14+1*X19+1*X31+1*X34+1*X44+1*X61) = +S64<<0 +S69<<0 
wire sub_exp233; 
assign sub_exp233 = sub_exp64 ^ sub_exp69; 

// S234: (+1*X3+1*X6+1*X26+1*X49+1*X59) = +S14<<0 +S139<<0 
wire sub_exp234; 
assign sub_exp234 = sub_exp14 ^ sub_exp139; 

// S235: (+1*X17+1*X22+1*X27+1*X28+1*X39+1*X42+1*X53) = +X53<<0 +S107<<0 
wire sub_exp235; 
assign sub_exp235 = mds_in6[4] ^ sub_exp107; 

// S236: (+1*X20+1*X21+1*X31+1*X32) = +S17<<0 +S27<<0 
wire sub_exp236; 
assign sub_exp236 = sub_exp17 ^ sub_exp27; 

// S237: (+1*X20+1*X23+1*X31) = +X23<<0 +S17<<0 
wire sub_exp237; 
assign sub_exp237 = mds_in2[6] ^ sub_exp17; 

// S238: (+1*X5+1*X10+1*X25+1*X30+1*X54) = +S10<<0 +S144<<0 
wire sub_exp238; 
assign sub_exp238 = sub_exp10 ^ sub_exp144; 

// S239: (+1*X5+1*X34+1*X35+1*X40) = +X5<<0 +S105<<0 
wire sub_exp239; 
assign sub_exp239 = mds_in0[4] ^ sub_exp105; 

// S240: (+1*X5+1*X16+1*X28+1*X31+1*X39+1*X44) = +S51<<0 +S64<<0 
wire sub_exp240; 
assign sub_exp240 = sub_exp51 ^ sub_exp64; 

// S241: (+1*X8+1*X22+1*X42+1*X43+1*X61) = +X43<<0 +S158<<0 
wire sub_exp241; 
assign sub_exp241 = mds_in5[2] ^ sub_exp158; 

// S242: (+1*X40+1*X43) = +X40<<0 +X43<<0 
wire sub_exp242; 
assign sub_exp242 = mds_in4[7] ^ mds_in5[2]; 

// S243: (+1*X2+1*X7+1*X20+1*X25+1*X35+1*X37+1*X46) = +S9<<0 +S118<<0 
wire sub_exp243; 
assign sub_exp243 = sub_exp9 ^ sub_exp118; 

// S244: (+1*X45+1*X63) = +X45<<0 +X63<<0 
wire sub_exp244; 
assign sub_exp244 = mds_in5[4] ^ mds_in7[6]; 

// S245: (+1*X5+1*X10+1*X16+1*X49+1*X54+1*X59) = +S32<<0 +S33<<0 
wire sub_exp245; 
assign sub_exp245 = sub_exp32 ^ sub_exp33; 

// S246: (+1*X1+1*X17+1*X22+1*X27+1*X42+1*X47) = +S36<<0 +S106<<0 
wire sub_exp246; 
assign sub_exp246 = sub_exp36 ^ sub_exp106; 

// S247: (+1*X5+1*X6+1*X16+1*X28+1*X39+1*X45) = +X45<<0 +S77<<0 
wire sub_exp247; 
assign sub_exp247 = mds_in5[4] ^ sub_exp77; 

// S248: (+1*X5+1*X6+1*X16+1*X25+1*X28+1*X35+1*X39) = +S3<<0 +S77<<0 
wire sub_exp248; 
assign sub_exp248 = sub_exp3 ^ sub_exp77; 

// S249: (+1*X1+1*X36+1*X47) = +X1<<0 +S19<<0 
wire sub_exp249; 
assign sub_exp249 = mds_in0[0] ^ sub_exp19; 

// S250: (+1*X14+1*X25+1*X35) = +X14<<0 +S3<<0 
wire sub_exp250; 
assign sub_exp250 = mds_in1[5] ^ sub_exp3; 

// S251: (+1*X7+1*X17+1*X22+1*X24+1*X27+1*X42+1*X49+1*X59+1*X60) = +S94<<0 +S108<<0 
wire sub_exp251; 
assign sub_exp251 = sub_exp94 ^ sub_exp108; 

// S252: (+1*X38+1*X44+1*X55) = +X38<<0 +S20<<0 
wire sub_exp252; 
assign sub_exp252 = mds_in4[5] ^ sub_exp20; 

// S253: (+1*X5+1*X13+1*X14+1*X16+1*X24+1*X36+1*X47) = +S32<<0 +S65<<0 
wire sub_exp253; 
assign sub_exp253 = sub_exp32 ^ sub_exp65; 

// S254: (+1*X11+1*X29+1*X40) = +X11<<0 +S28<<0 
wire sub_exp254; 
assign sub_exp254 = mds_in1[2] ^ sub_exp28; 

// S255: (+1*X8+1*X11) = +X8<<0 +X11<<0 
wire sub_exp255; 
assign sub_exp255 = mds_in0[7] ^ mds_in1[2]; 

// S256: (+1*X3+1*X5+1*X14+1*X34+1*X39+1*X52+1*X57) = +S12<<0 +S114<<0 
wire sub_exp256; 
assign sub_exp256 = sub_exp12 ^ sub_exp114; 

// S257: (+1*X17+1*X22+1*X27+1*X33+1*X42) = +X33<<0 +S36<<0 
wire sub_exp257; 
assign sub_exp257 = mds_in4[0] ^ sub_exp36; 

// S258: (+1*X15+1*X20) = +X15<<0 +X20<<0 
wire sub_exp258; 
assign sub_exp258 = mds_in1[6] ^ mds_in2[3]; 

// S259: (+1*X12+1*X15+1*X23) = +X15<<0 +S21<<0 
wire sub_exp259; 
assign sub_exp259 = mds_in1[6] ^ sub_exp21; 

// S260: (+1*X4+1*X15+1*X41+1*X45+1*X46+1*X56) = +S55<<0 +S80<<0 
wire sub_exp260; 
assign sub_exp260 = sub_exp55 ^ sub_exp80; 

// S261: (+1*X22+1*X52) = +X22<<0 +X52<<0 
wire sub_exp261; 
assign sub_exp261 = mds_in2[5] ^ mds_in6[3]; 

// S262: (+1*X4+1*X9+1*X15+1*X27+1*X32) = +S56<<0 +S160<<0 
wire sub_exp262; 
assign sub_exp262 = sub_exp56 ^ sub_exp160; 

// S263: (+1*X1+1*X42+1*X47) = +X42<<0 +S106<<0 
wire sub_exp263; 
assign sub_exp263 = mds_in5[1] ^ sub_exp106; 

// S264: (+1*X9+1*X19+1*X27+1*X32) = +S1<<0 +S56<<0 
wire sub_exp264; 
assign sub_exp264 = sub_exp1 ^ sub_exp56; 

// S265: (+1*X29+1*X37+1*X48) = +X29<<0 +S29<<0 
wire sub_exp265; 
assign sub_exp265 = mds_in3[4] ^ sub_exp29; 

// S266: (+1*X12+1*X23+1*X33+1*X34+1*X38+1*X40+1*X43+1*X58) = +X34<<0 +S131<<0 
wire sub_exp266; 
assign sub_exp266 = mds_in4[1] ^ sub_exp131; 

// S267: (+1*X25+1*X30+1*X35+1*X49+1*X50) = +X49<<0 +S40<<0 
wire sub_exp267; 
assign sub_exp267 = mds_in6[0] ^ sub_exp40; 

// S268: (+1*X26+1*X53+1*X64) = +X26<<0 +S26<<0 
wire sub_exp268; 
assign sub_exp268 = mds_in3[1] ^ sub_exp26; 

// S269: (+1*X26+1*X33+1*X38+1*X43+1*X50+1*X53+1*X58+1*X64) = +S102<<0 +S268<<0 
wire sub_exp269; 
assign sub_exp269 = sub_exp102 ^ sub_exp268; 

// S270: (+1*X7+1*X54+1*X60) = +X54<<0 +S22<<0 
wire sub_exp270; 
assign sub_exp270 = mds_in6[5] ^ sub_exp22; 

// S271: (+1*X1+1*X7+1*X11+1*X54+1*X60) = +S4<<0 +S270<<0 
wire sub_exp271; 
assign sub_exp271 = sub_exp4 ^ sub_exp270; 

// S272: (+1*X38+1*X41) = +X38<<0 +X41<<0 
wire sub_exp272; 
assign sub_exp272 = mds_in4[5] ^ mds_in5[0]; 

// S273: (+1*X4+1*X21+1*X32+1*X38+1*X41+1*X44+1*X55) = +S84<<0 +S272<<0 
wire sub_exp273; 
assign sub_exp273 = sub_exp84 ^ sub_exp272; 

// S274: (+1*X9+1*X19+1*X62) = +X62<<0 +S1<<0 
wire sub_exp274; 
assign sub_exp274 = mds_in7[5] ^ sub_exp1; 

// S275: (+1*X4+1*X9+1*X15+1*X19+1*X62) = +S24<<0 +S274<<0 
wire sub_exp275; 
assign sub_exp275 = sub_exp24 ^ sub_exp274; 

// S276: (+1*X17+1*X29) = +X17<<0 +X29<<0 
wire sub_exp276; 
assign sub_exp276 = mds_in2[0] ^ mds_in3[4]; 

// S277: (+1*X3+1*X4+1*X15+1*X18+1*X30+1*X50+1*X57+1*X62) = +S24<<0 +S161<<0 
wire sub_exp277; 
assign sub_exp277 = sub_exp24 ^ sub_exp161; 

// S278: (+1*X1+1*X2+1*X6+1*X8+1*X11+1*X26+1*X44+1*X55) = +X2<<0 +S120<<0 
wire sub_exp278; 
assign sub_exp278 = mds_in0[1] ^ sub_exp120; 

// S279: (+1*X2+1*X44) = +X2<<0 +X44<<0 
wire sub_exp279; 
assign sub_exp279 = mds_in0[1] ^ mds_in5[3]; 

// S280: (+1*X33+1*X43+1*X58+1*X59+1*X64) = +S8<<0 +S98<<0 
wire sub_exp280; 
assign sub_exp280 = sub_exp8 ^ sub_exp98; 

// S281: (+1*X22+1*X28+1*X39) = +X22<<0 +S18<<0 
wire sub_exp281; 
assign sub_exp281 = mds_in2[5] ^ sub_exp18; 

// S282: (+1*X34+1*X39+1*X57) = +X34<<0 +S99<<0 
wire sub_exp282; 
assign sub_exp282 = mds_in4[1] ^ sub_exp99; 

// S283: (+1*X19+1*X24+1*X34+1*X39+1*X57) = +S54<<0 +S282<<0 
wire sub_exp283; 
assign sub_exp283 = sub_exp54 ^ sub_exp282; 

// S284: (+1*X1+1*X11+1*X17+1*X22+1*X27+1*X42+1*X49+1*X59) = +S4<<0 +S108<<0 
wire sub_exp284; 
assign sub_exp284 = sub_exp4 ^ sub_exp108; 

// S285: (+1*X33+1*X36+1*X38+1*X41+1*X43+1*X46+1*X47+1*X58) = +S80<<0 +S149<<0 
wire sub_exp285; 
assign sub_exp285 = sub_exp80 ^ sub_exp149; 

// S286: (+1*X6+1*X26+1*X33+1*X36+1*X38+1*X41+1*X43+1*X44+1*X46+1*X47+1*X55+1*X58) = +S150<<0 +S285<<0 
wire sub_exp286; 
assign sub_exp286 = sub_exp150 ^ sub_exp285; 

// S287: (+1*X10+1*X17+1*X27+1*X33+1*X43+1*X49+1*X54+1*X59) = +S8<<0 +S112<<0 
wire sub_exp287; 
assign sub_exp287 = sub_exp8 ^ sub_exp112; 

// S288: (+1*X7+1*X10+1*X17+1*X27+1*X33+1*X43+1*X49+1*X51+1*X54+1*X56+1*X59) = +S128<<0 +S287<<0 
wire sub_exp288; 
assign sub_exp288 = sub_exp128 ^ sub_exp287; 

// S289: (+1*X1+1*X16) = +X1<<0 +X16<<0 
wire sub_exp289; 
assign sub_exp289 = mds_in0[0] ^ mds_in1[7]; 

// S290: (+1*X1+1*X10+1*X16+1*X49+1*X54+1*X59) = +S289<<0 +S33<<0 
wire sub_exp290; 
assign sub_exp290 = sub_exp289 ^ sub_exp33; 

// S291: (+1*X1+1*X10+1*X16+1*X28+1*X39+1*X49+1*X54+1*X56+1*X59) = +S290<<0 +S90<<0 
wire sub_exp291; 
assign sub_exp291 = sub_exp290 ^ sub_exp90; 

// S292: (+1*X4+1*X9+1*X13+1*X14+1*X19+1*X21+1*X24+1*X36+1*X47+1*X55) = +S113<<0 +S65<<0 
wire sub_exp292; 
assign sub_exp292 = sub_exp113 ^ sub_exp65; 

// S293: (+1*X2+1*X20+1*X26+1*X31+1*X33+1*X38+1*X41+1*X43+1*X46+1*X48+1*X50+1*X51+1*X53+1*X58+1*X64) = +S269<<0 +S123<<0 
wire sub_exp293; 
assign sub_exp293 = sub_exp269 ^ sub_exp123; 

// S294: (+1*X1+1*X4+1*X9+1*X10+1*X13+1*X14+1*X16+1*X19+1*X21+1*X24+1*X28+1*X36+1*X39+1*X47+1*X49+1*X54+1*X55+1*X56+1*X59) = +S291<<0 +S292<<0 
wire sub_exp294; 
assign sub_exp294 = sub_exp291 ^ sub_exp292; 

// O1: (+1*X1+1*X2+1*X4+1*X9+1*X10+1*X13+1*X14+1*X16+1*X19+1*X20+1*X21+1*X24+1*X26+1*X28+1*X31+1*X33+1*X36+1*X38+1*X39+1*X41+1*X43+1*X46+1*X47+1*X48+1*X49+1*X50+1*X51+1*X53+1*X54+1*X55+1*X56+1*X58+1*X59+1*X64) = +S294<<0 +S293<<0 
assign mds_out0[0] = sub_exp294 ^ sub_exp293; 

// S295: (+1*X11+1*X37+1*X48) = +X11<<0 +S29<<0 
wire sub_exp295; 
assign sub_exp295 = mds_in1[2] ^ sub_exp29; 

// S296: (+1*X11+1*X15+1*X20+1*X37+1*X48) = +S295<<0 +S258<<0 
wire sub_exp296; 
assign sub_exp296 = sub_exp295 ^ sub_exp258; 

// S297: (+1*X10+1*X21+1*X32+1*X44+1*X49+1*X54+1*X55+1*X59) = +S43<<0 +S33<<0 
wire sub_exp297; 
assign sub_exp297 = sub_exp43 ^ sub_exp33; 

// S298: (+1*X2+1*X11+1*X15+1*X20+1*X29+1*X37+1*X40+1*X48) = +S296<<0 +S130<<0 
wire sub_exp298; 
assign sub_exp298 = sub_exp296 ^ sub_exp130; 

// S299: (+1*X2+1*X10+1*X11+1*X15+1*X20+1*X21+1*X29+1*X32+1*X37+1*X40+1*X44+1*X48+1*X49+1*X54+1*X55+1*X59) = +S298<<0 +S297<<0 
wire sub_exp299; 
assign sub_exp299 = sub_exp298 ^ sub_exp297; 

// S300: (+1*X3+1*X5+1*X14+1*X34+1*X39+1*X47+1*X50+1*X51+1*X52+1*X56+1*X57+1*X60) = +S256<<0 +S174<<0 
wire sub_exp300; 
assign sub_exp300 = sub_exp256 ^ sub_exp174; 

// S301: (+1*X2+1*X10+1*X11+1*X15+1*X17+1*X20+1*X21+1*X22+1*X27+1*X29+1*X32+1*X33+1*X37+1*X40+1*X42+1*X44+1*X48+1*X49+1*X54+1*X55+1*X59) = +S299<<0 +S257<<0 
wire sub_exp301; 
assign sub_exp301 = sub_exp299 ^ sub_exp257; 

// O2: (+1*X2+1*X3+1*X5+1*X10+1*X11+1*X14+1*X15+1*X17+1*X20+1*X21+1*X22+1*X27+1*X29+1*X32+1*X33+1*X34+1*X37+1*X39+1*X40+1*X42+1*X44+1*X47+1*X48+1*X49+1*X50+1*X51+1*X52+1*X54+1*X55+1*X56+1*X57+1*X59+1*X60) = +S301<<0 +S300<<0 
assign mds_out0[1] = sub_exp301 ^ sub_exp300; 

// S302: (+1*X3+1*X33) = +X3<<0 +X33<<0 
wire sub_exp302; 
assign sub_exp302 = mds_in0[2] ^ mds_in4[0]; 

// S303: (+1*X45+1*X64) = +X64<<0 +X45<<0 
wire sub_exp303; 
assign sub_exp303 = mds_in7[7] ^ mds_in5[4]; 

// S304: (+1*X3+1*X33+1*X45+1*X64) = +S302<<0 +S303<<0 
wire sub_exp304; 
assign sub_exp304 = sub_exp302 ^ sub_exp303; 

// S305: (+1*X30+1*X35+1*X40+1*X60) = +S217<<0 +S50<<0 
wire sub_exp305; 
assign sub_exp305 = sub_exp217 ^ sub_exp50; 

// S306: (+1*X3+1*X10+1*X33+1*X45+1*X49+1*X54+1*X59+1*X64) = +S304<<0 +S33<<0 
wire sub_exp306; 
assign sub_exp306 = sub_exp304 ^ sub_exp33; 

// S307: (+1*X12+1*X15+1*X23+1*X30+1*X35+1*X40+1*X60) = +S259<<0 +S305<<0 
wire sub_exp307; 
assign sub_exp307 = sub_exp259 ^ sub_exp305; 

// S308: (+1*X3+1*X10+1*X12+1*X15+1*X23+1*X30+1*X33+1*X35+1*X40+1*X45+1*X49+1*X54+1*X59+1*X60+1*X64) = +S306<<0 +S307<<0 
wire sub_exp308; 
assign sub_exp308 = sub_exp306 ^ sub_exp307; 

// S309: (+1*X1+1*X6+1*X11+1*X13+1*X18+1*X24+1*X26+1*X36+1*X39+1*X47+1*X52) = +S216<<0 +S104<<0 
wire sub_exp309; 
assign sub_exp309 = sub_exp216 ^ sub_exp104; 

// S310: (+1*X1+1*X3+1*X6+1*X10+1*X11+1*X12+1*X13+1*X15+1*X18+1*X23+1*X24+1*X26+1*X30+1*X33+1*X35+1*X36+1*X39+1*X40+1*X45+1*X47+1*X49+1*X52+1*X54+1*X59+1*X60+1*X64) = +S308<<0 +S309<<0 
wire sub_exp310; 
assign sub_exp310 = sub_exp308 ^ sub_exp309; 

// O3: (+1*X1+1*X2+1*X3+1*X6+1*X9+1*X10+1*X11+1*X12+1*X13+1*X14+1*X15+1*X17+1*X18+1*X19+1*X20+1*X22+1*X23+1*X24+1*X26+1*X30+1*X31+1*X33+1*X34+1*X35+1*X36+1*X39+1*X40+1*X45+1*X46+1*X47+1*X49+1*X52+1*X54+1*X59+1*X60+1*X61+1*X64) = +S310<<0 +S225<<0 
assign mds_out0[2] = sub_exp310 ^ sub_exp225; 

// S311: (+1*X25+1*X35+1*X37+1*X61) = +X61<<0 +S70<<0 
wire sub_exp311; 
assign sub_exp311 = mds_in7[4] ^ sub_exp70; 

// S312: (+1*X25+1*X28+1*X35+1*X37+1*X39+1*X56+1*X61) = +S311<<0 +S90<<0 
wire sub_exp312; 
assign sub_exp312 = sub_exp311 ^ sub_exp90; 

// S313: (+1*X15+1*X25+1*X28+1*X35+1*X37+1*X39+1*X41+1*X51+1*X56+1*X59+1*X61+1*X64) = +S312<<0 +S168<<0 
wire sub_exp313; 
assign sub_exp313 = sub_exp312 ^ sub_exp168; 

// S314: (+1*X3+1*X12+1*X18+1*X23+1*X26+1*X27+1*X32+1*X33+1*X34+1*X38+1*X40+1*X43+1*X57+1*X58+1*X62) = +S266<<0 +S218<<0 
wire sub_exp314; 
assign sub_exp314 = sub_exp266 ^ sub_exp218; 

// S315: (+1*X1+1*X7+1*X11+1*X15+1*X25+1*X28+1*X35+1*X37+1*X39+1*X41+1*X51+1*X54+1*X56+1*X59+1*X60+1*X61+1*X64) = +S313<<0 +S271<<0 
wire sub_exp315; 
assign sub_exp315 = sub_exp313 ^ sub_exp271; 

// O4: (+1*X1+1*X3+1*X7+1*X11+1*X12+1*X15+1*X18+1*X23+1*X25+1*X26+1*X27+1*X28+1*X32+1*X33+1*X34+1*X35+1*X37+1*X38+1*X39+1*X40+1*X41+1*X43+1*X51+1*X54+1*X56+1*X57+1*X58+1*X59+1*X60+1*X61+1*X62+1*X64) = +S315<<0 +S314<<0 
assign mds_out0[3] = sub_exp315 ^ sub_exp314; 

// S316: (+1*X17+1*X27+1*X35+1*X42+1*X43+1*X48) = +S91<<0 +S151<<0 
wire sub_exp316; 
assign sub_exp316 = sub_exp91 ^ sub_exp151; 

// S317: (+1*X14+1*X17+1*X27+1*X34+1*X35+1*X42+1*X43+1*X48+1*X53+1*X64) = +S316<<0 +S152<<0 
wire sub_exp317; 
assign sub_exp317 = sub_exp316 ^ sub_exp152; 

// S318: (+1*X9+1*X10+1*X21+1*X47+1*X49+1*X50+1*X51+1*X54+1*X56+1*X60) = +S174<<0 +S169<<0 
wire sub_exp318; 
assign sub_exp318 = sub_exp174 ^ sub_exp169; 

// S319: (+1*X8+1*X12+1*X20+1*X29+1*X31+1*X40+1*X44+1*X46+1*X52+1*X61+1*X62+1*X63) = +S229<<0 +S194<<0 
wire sub_exp319; 
assign sub_exp319 = sub_exp229 ^ sub_exp194; 

// S320: (+1*X9+1*X10+1*X14+1*X17+1*X21+1*X27+1*X34+1*X35+1*X42+1*X43+1*X47+1*X48+1*X49+1*X50+1*X51+1*X53+1*X54+1*X56+1*X60+1*X64) = +S317<<0 +S318<<0 
wire sub_exp320; 
assign sub_exp320 = sub_exp317 ^ sub_exp318; 

// O5: (+1*X8+1*X9+1*X10+1*X12+1*X14+1*X17+1*X20+1*X21+1*X27+1*X29+1*X31+1*X34+1*X35+1*X40+1*X42+1*X43+1*X44+1*X46+1*X47+1*X48+1*X49+1*X50+1*X51+1*X52+1*X53+1*X54+1*X56+1*X60+1*X61+1*X62+1*X63+1*X64) = +S320<<0 +S319<<0 
assign mds_out0[4] = sub_exp320 ^ sub_exp319; 

// S321: (+1*X10+1*X53+1*X54+1*X64) = +S10<<0 +S26<<0 
wire sub_exp321; 
assign sub_exp321 = sub_exp10 ^ sub_exp26; 

// S322: (+1*X10+1*X48+1*X51+1*X53+1*X54+1*X64) = +S321<<0 +S170<<0 
wire sub_exp322; 
assign sub_exp322 = sub_exp321 ^ sub_exp170; 

// S323: (+1*X1+1*X10+1*X11+1*X13+1*X48+1*X51+1*X53+1*X54+1*X64) = +S322<<0 +S72<<0 
wire sub_exp323; 
assign sub_exp323 = sub_exp322 ^ sub_exp72; 

// S324: (+1*X15+1*X25+1*X28+1*X30+1*X33+1*X35+1*X43+1*X45+1*X50+1*X52+1*X63) = +S115<<0 +S97<<0 
wire sub_exp324; 
assign sub_exp324 = sub_exp115 ^ sub_exp97; 

// S325: (+1*X17+1*X18+1*X21+1*X22+1*X32+1*X36+1*X44+1*X47+1*X55+1*X61+1*X62) = +S223<<0 +S175<<0 
wire sub_exp325; 
assign sub_exp325 = sub_exp223 ^ sub_exp175; 

// S326: (+1*X1+1*X10+1*X11+1*X13+1*X15+1*X25+1*X28+1*X30+1*X33+1*X35+1*X43+1*X45+1*X48+1*X50+1*X51+1*X52+1*X53+1*X54+1*X63+1*X64) = +S323<<0 +S324<<0 
wire sub_exp326; 
assign sub_exp326 = sub_exp323 ^ sub_exp324; 

// O6: (+1*X1+1*X10+1*X11+1*X13+1*X15+1*X17+1*X18+1*X21+1*X22+1*X25+1*X28+1*X30+1*X32+1*X33+1*X35+1*X36+1*X43+1*X44+1*X45+1*X47+1*X48+1*X50+1*X51+1*X52+1*X53+1*X54+1*X55+1*X61+1*X62+1*X63+1*X64) = +S326<<0 +S325<<0 
assign mds_out0[5] = sub_exp326 ^ sub_exp325; 

// S327: (+1*X17+1*X22+1*X26) = +X26<<0 +S68<<0 
wire sub_exp327; 
assign sub_exp327 = mds_in3[1] ^ sub_exp68; 

// S328: (+1*X11+1*X16+1*X17+1*X22+1*X26+1*X31) = +S327<<0 +S124<<0 
wire sub_exp328; 
assign sub_exp328 = sub_exp327 ^ sub_exp124; 

// S329: (+1*X11+1*X16+1*X17+1*X22+1*X26+1*X31+1*X44+1*X45+1*X55+1*X56) = +S328<<0 +S220<<0 
wire sub_exp329; 
assign sub_exp329 = sub_exp328 ^ sub_exp220; 

// S330: (+1*X12+1*X18+1*X19+1*X23+1*X36+1*X37+1*X48+1*X53+1*X57+1*X62+1*X64) = +S176<<0 +S83<<0 
wire sub_exp330; 
assign sub_exp330 = sub_exp176 ^ sub_exp83; 

// S331: (+1*X11+1*X12+1*X16+1*X17+1*X18+1*X19+1*X22+1*X23+1*X26+1*X31+1*X36+1*X37+1*X44+1*X45+1*X48+1*X53+1*X55+1*X56+1*X57+1*X62+1*X64) = +S329<<0 +S330<<0 
wire sub_exp331; 
assign sub_exp331 = sub_exp329 ^ sub_exp330; 

// O7: (+1*X2+1*X11+1*X12+1*X14+1*X16+1*X17+1*X18+1*X19+1*X22+1*X23+1*X26+1*X29+1*X31+1*X34+1*X36+1*X37+1*X41+1*X44+1*X45+1*X46+1*X48+1*X49+1*X51+1*X52+1*X53+1*X54+1*X55+1*X56+1*X57+1*X62+1*X63+1*X64) = +S331<<0 +S221<<0 
assign mds_out0[6] = sub_exp331 ^ sub_exp221; 

// S332: (+1*X13+1*X24+1*X38+1*X58) = +S11<<0 +S25<<0 
wire sub_exp332; 
assign sub_exp332 = sub_exp11 ^ sub_exp25; 

// S333: (+1*X13+1*X15+1*X20+1*X24+1*X38+1*X58) = +S332<<0 +S258<<0 
wire sub_exp333; 
assign sub_exp333 = sub_exp332 ^ sub_exp258; 

// S334: (+1*X3+1*X18+1*X45+1*X46+1*X56+1*X57) = +S197<<0 +S195<<0 
wire sub_exp334; 
assign sub_exp334 = sub_exp197 ^ sub_exp195; 

// S335: (+1*X1+1*X9+1*X19+1*X27+1*X32+1*X42+1*X47) = +S264<<0 +S263<<0 
wire sub_exp335; 
assign sub_exp335 = sub_exp264 ^ sub_exp263; 

// S336: (+1*X3+1*X13+1*X15+1*X18+1*X20+1*X24+1*X38+1*X45+1*X46+1*X56+1*X57+1*X58) = +S333<<0 +S334<<0 
wire sub_exp336; 
assign sub_exp336 = sub_exp333 ^ sub_exp334; 

// S337: (+1*X12+1*X23+1*X25+1*X30+1*X35+1*X37+1*X49+1*X50+1*X52+1*X53+1*X54+1*X55+1*X63+1*X64) = +S222<<0 +S196<<0 
wire sub_exp337; 
assign sub_exp337 = sub_exp222 ^ sub_exp196; 

// S338: (+1*X1+1*X3+1*X9+1*X13+1*X15+1*X18+1*X19+1*X20+1*X24+1*X27+1*X32+1*X38+1*X42+1*X45+1*X46+1*X47+1*X56+1*X57+1*X58) = +S336<<0 +S335<<0 
wire sub_exp338; 
assign sub_exp338 = sub_exp336 ^ sub_exp335; 

// O8: (+1*X1+1*X3+1*X9+1*X12+1*X13+1*X15+1*X18+1*X19+1*X20+1*X23+1*X24+1*X25+1*X27+1*X30+1*X32+1*X35+1*X37+1*X38+1*X42+1*X45+1*X46+1*X47+1*X49+1*X50+1*X52+1*X53+1*X54+1*X55+1*X56+1*X57+1*X58+1*X63+1*X64) = +S338<<0 +S337<<0 
assign mds_out0[7] = sub_exp338 ^ sub_exp337; 

// S339: (+1*X9+1*X22) = +X9<<0 +X22<<0 
wire sub_exp339; 
assign sub_exp339 = mds_in1[0] ^ mds_in2[5]; 

// S340: (+1*X9+1*X22+1*X24) = +S339<<0 +X24<<0 
wire sub_exp340; 
assign sub_exp340 = sub_exp339 ^ mds_in2[7]; 

// S341: (+1*X9+1*X21+1*X22+1*X24+1*X32+1*X44+1*X55) = +S340<<0 +S43<<0 
wire sub_exp341; 
assign sub_exp341 = sub_exp340 ^ sub_exp43; 

// S342: (+1*X8+1*X9+1*X21+1*X22+1*X24+1*X32+1*X34+1*X44+1*X55+1*X61) = +S341<<0 +S157<<0 
wire sub_exp342; 
assign sub_exp342 = sub_exp341 ^ sub_exp157; 

// S343: (+1*X2+1*X3+1*X12+1*X18+1*X29+1*X36+1*X41+1*X46+1*X47+1*X51+1*X57+1*X58+1*X62+1*X63+1*X64) = +S226<<0 +S209<<0 
wire sub_exp343; 
assign sub_exp343 = sub_exp226 ^ sub_exp209; 

// S344: (+1*X8+1*X9+1*X10+1*X17+1*X21+1*X22+1*X24+1*X27+1*X28+1*X32+1*X34+1*X39+1*X44+1*X49+1*X54+1*X55+1*X56+1*X59+1*X61) = +S342<<0 +S185<<0 
wire sub_exp344; 
assign sub_exp344 = sub_exp342 ^ sub_exp185; 

// O9: (+1*X2+1*X3+1*X8+1*X9+1*X10+1*X12+1*X17+1*X18+1*X21+1*X22+1*X24+1*X27+1*X28+1*X29+1*X32+1*X34+1*X36+1*X39+1*X41+1*X44+1*X46+1*X47+1*X49+1*X51+1*X54+1*X55+1*X56+1*X57+1*X58+1*X59+1*X61+1*X62+1*X63+1*X64) = +S344<<0 +S343<<0 
assign mds_out1[0] = sub_exp344 ^ sub_exp343; 

// S345: (+1*X23+1*X28+1*X29+1*X40+1*X52+1*X63) = +S47<<0 +S198<<0 
wire sub_exp345; 
assign sub_exp345 = sub_exp47 ^ sub_exp198; 

// S346: (+1*X19+1*X23+1*X28+1*X29+1*X37+1*X40+1*X48+1*X52+1*X63) = +S345<<0 +S142<<0 
wire sub_exp346; 
assign sub_exp346 = sub_exp345 ^ sub_exp142; 

// S347: (+1*X1+1*X11+1*X13+1*X22+1*X25+1*X30+1*X35+1*X41+1*X42+1*X47+1*X50+1*X60) = +S177<<0 +S135<<0 
wire sub_exp347; 
assign sub_exp347 = sub_exp177 ^ sub_exp135; 

// S348: (+1*X3+1*X4+1*X10+1*X18+1*X45+1*X55+1*X56+1*X57+1*X58+1*X59+1*X62+1*X64) = +S230<<0 +S178<<0 
wire sub_exp348; 
assign sub_exp348 = sub_exp230 ^ sub_exp178; 

// S349: (+1*X1+1*X11+1*X13+1*X19+1*X22+1*X23+1*X25+1*X28+1*X29+1*X30+1*X35+1*X37+1*X40+1*X41+1*X42+1*X47+1*X48+1*X50+1*X52+1*X60+1*X63) = +S346<<0 +S347<<0 
wire sub_exp349; 
assign sub_exp349 = sub_exp346 ^ sub_exp347; 

// O10: (+1*X1+1*X3+1*X4+1*X10+1*X11+1*X13+1*X18+1*X19+1*X22+1*X23+1*X25+1*X28+1*X29+1*X30+1*X35+1*X37+1*X40+1*X41+1*X42+1*X45+1*X47+1*X48+1*X50+1*X52+1*X55+1*X56+1*X57+1*X58+1*X59+1*X60+1*X62+1*X63+1*X64) = +S349<<0 +S348<<0 
assign mds_out1[1] = sub_exp349 ^ sub_exp348; 

// S350: (+1*X43+1*X47+1*X48+1*X60) = +S59<<0 +S46<<0 
wire sub_exp350; 
assign sub_exp350 = sub_exp59 ^ sub_exp46; 

// S351: (+1*X3+1*X8+1*X11+1*X18+1*X57+1*X62) = +S39<<0 +S255<<0 
wire sub_exp351; 
assign sub_exp351 = sub_exp39 ^ sub_exp255; 

// S352: (+1*X20+1*X23+1*X31+1*X43+1*X47+1*X48+1*X60) = +S237<<0 +S350<<0 
wire sub_exp352; 
assign sub_exp352 = sub_exp237 ^ sub_exp350; 

// S353: (+1*X3+1*X8+1*X11+1*X18+1*X20+1*X23+1*X31+1*X43+1*X47+1*X48+1*X57+1*X60+1*X62) = +S351<<0 +S352<<0 
wire sub_exp353; 
assign sub_exp353 = sub_exp351 ^ sub_exp352; 

// S354: (+1*X9+1*X14+1*X17+1*X19+1*X22+1*X26+1*X27+1*X28+1*X34+1*X39+1*X42+1*X53) = +S235<<0 +S122<<0 
wire sub_exp354; 
assign sub_exp354 = sub_exp235 ^ sub_exp122; 

// S355: (+1*X4+1*X5+1*X10+1*X21+1*X25+1*X30+1*X32+1*X38+1*X41+1*X44+1*X54+1*X55) = +S273<<0 +S238<<0 
wire sub_exp355; 
assign sub_exp355 = sub_exp273 ^ sub_exp238; 

// S356: (+1*X3+1*X8+1*X9+1*X11+1*X14+1*X17+1*X18+1*X19+1*X20+1*X22+1*X23+1*X26+1*X27+1*X28+1*X31+1*X34+1*X39+1*X42+1*X43+1*X47+1*X48+1*X53+1*X57+1*X60+1*X62) = +S353<<0 +S354<<0 
wire sub_exp356; 
assign sub_exp356 = sub_exp353 ^ sub_exp354; 

// O11: (+1*X3+1*X4+1*X5+1*X8+1*X9+1*X10+1*X11+1*X14+1*X17+1*X18+1*X19+1*X20+1*X21+1*X22+1*X23+1*X25+1*X26+1*X27+1*X28+1*X30+1*X31+1*X32+1*X34+1*X38+1*X39+1*X41+1*X42+1*X43+1*X44+1*X47+1*X48+1*X53+1*X54+1*X55+1*X57+1*X60+1*X62) = +S356<<0 +S355<<0 
assign mds_out1[2] = sub_exp356 ^ sub_exp355; 

// S357: (+1*X1+1*X6+1*X11+1*X26+1*X42) = +X42<<0 +S38<<0 
wire sub_exp357; 
assign sub_exp357 = mds_in5[1] ^ sub_exp38; 

// S358: (+1*X33+1*X36+1*X43+1*X45+1*X47+1*X64) = +S92<<0 +S73<<0 
wire sub_exp358; 
assign sub_exp358 = sub_exp92 ^ sub_exp73; 

// S359: (+1*X1+1*X5+1*X6+1*X11+1*X26+1*X34+1*X35+1*X40+1*X42) = +S357<<0 +S239<<0 
wire sub_exp359; 
assign sub_exp359 = sub_exp357 ^ sub_exp239; 

// S360: (+1*X2+1*X20+1*X31+1*X33+1*X36+1*X41+1*X43+1*X45+1*X46+1*X47+1*X48+1*X51+1*X64) = +S123<<0 +S358<<0 
wire sub_exp360; 
assign sub_exp360 = sub_exp123 ^ sub_exp358; 

// S361: (+1*X3+1*X4+1*X8+1*X9+1*X15+1*X19+1*X23+1*X49+1*X59+1*X62) = +S275<<0 +S171<<0 
wire sub_exp361; 
assign sub_exp361 = sub_exp275 ^ sub_exp171; 

// S362: (+1*X1+1*X2+1*X5+1*X6+1*X11+1*X20+1*X26+1*X31+1*X33+1*X34+1*X35+1*X36+1*X40+1*X41+1*X42+1*X43+1*X45+1*X46+1*X47+1*X48+1*X51+1*X64) = +S359<<0 +S360<<0 
wire sub_exp362; 
assign sub_exp362 = sub_exp359 ^ sub_exp360; 

// O12: (+1*X1+1*X2+1*X3+1*X4+1*X5+1*X6+1*X8+1*X9+1*X11+1*X15+1*X19+1*X20+1*X23+1*X26+1*X31+1*X33+1*X34+1*X35+1*X36+1*X40+1*X41+1*X42+1*X43+1*X45+1*X46+1*X47+1*X48+1*X49+1*X51+1*X59+1*X62+1*X64) = +S362<<0 +S361<<0 
assign mds_out1[3] = sub_exp362 ^ sub_exp361; 

// S363: (+1*X17+1*X29+1*X52) = +X52<<0 +S276<<0 
wire sub_exp363; 
assign sub_exp363 = mds_in6[3] ^ sub_exp276; 

// S364: (+1*X17+1*X29+1*X50+1*X51+1*X52+1*X56) = +S363<<0 +S96<<0 
wire sub_exp364; 
assign sub_exp364 = sub_exp363 ^ sub_exp96; 

// S365: (+1*X17+1*X18+1*X29+1*X50+1*X51+1*X52+1*X56+1*X57+1*X62) = +S364<<0 +S143<<0 
wire sub_exp365; 
assign sub_exp365 = sub_exp364 ^ sub_exp143; 

// S366: (+1*X4+1*X7+1*X20+1*X37+1*X48+1*X54+1*X55+1*X58+1*X59+1*X60+1*X64) = +S179<<0 +S178<<0 
wire sub_exp366; 
assign sub_exp366 = sub_exp179 ^ sub_exp178; 

// S367: (+1*X5+1*X6+1*X8+1*X16+1*X22+1*X25+1*X28+1*X35+1*X39+1*X42+1*X43+1*X61) = +S248<<0 +S241<<0 
wire sub_exp367; 
assign sub_exp367 = sub_exp248 ^ sub_exp241; 

// S368: (+1*X4+1*X7+1*X17+1*X18+1*X20+1*X29+1*X37+1*X48+1*X50+1*X51+1*X52+1*X54+1*X55+1*X56+1*X57+1*X58+1*X59+1*X60+1*X62+1*X64) = +S365<<0 +S366<<0 
wire sub_exp368; 
assign sub_exp368 = sub_exp365 ^ sub_exp366; 

// O13: (+1*X4+1*X5+1*X6+1*X7+1*X8+1*X16+1*X17+1*X18+1*X20+1*X22+1*X25+1*X28+1*X29+1*X35+1*X37+1*X39+1*X42+1*X43+1*X48+1*X50+1*X51+1*X52+1*X54+1*X55+1*X56+1*X57+1*X58+1*X59+1*X60+1*X61+1*X62+1*X64) = +S368<<0 +S367<<0 
assign mds_out1[4] = sub_exp368 ^ sub_exp367; 

// S369: (+1*X33+1*X38+1*X43+1*X56+1*X58+1*X59) = +S35<<0 +S180<<0 
wire sub_exp369; 
assign sub_exp369 = sub_exp35 ^ sub_exp180; 

// S370: (+1*X9+1*X19+1*X21+1*X29+1*X40+1*X52+1*X63) = +S66<<0 +S47<<0 
wire sub_exp370; 
assign sub_exp370 = sub_exp66 ^ sub_exp47; 

// S371: (+1*X5+1*X6+1*X25+1*X26+1*X30+1*X44+1*X55) = +S150<<0 +S144<<0 
wire sub_exp371; 
assign sub_exp371 = sub_exp150 ^ sub_exp144; 

// S372: (+1*X7+1*X8+1*X33+1*X38+1*X43+1*X56+1*X58+1*X59+1*X60+1*X61) = +S369<<0 +S181<<0 
wire sub_exp372; 
assign sub_exp372 = sub_exp369 ^ sub_exp181; 

// S373: (+1*X5+1*X6+1*X9+1*X19+1*X21+1*X25+1*X26+1*X29+1*X30+1*X40+1*X44+1*X52+1*X55+1*X63) = +S371<<0 +S370<<0 
wire sub_exp373; 
assign sub_exp373 = sub_exp371 ^ sub_exp370; 

// S374: (+1*X7+1*X8+1*X18+1*X23+1*X33+1*X36+1*X38+1*X41+1*X43+1*X51+1*X53+1*X56+1*X58+1*X59+1*X60+1*X61+1*X62) = +S372<<0 +S172<<0 
wire sub_exp374; 
assign sub_exp374 = sub_exp372 ^ sub_exp172; 

// O14: (+1*X5+1*X6+1*X7+1*X8+1*X9+1*X18+1*X19+1*X21+1*X23+1*X25+1*X26+1*X29+1*X30+1*X33+1*X36+1*X38+1*X40+1*X41+1*X43+1*X44+1*X51+1*X52+1*X53+1*X55+1*X56+1*X58+1*X59+1*X60+1*X61+1*X62+1*X63) = +S374<<0 +S373<<0 
assign mds_out1[5] = sub_exp374 ^ sub_exp373; 

// S375: (+1*X25+1*X30+1*X52+1*X63) = +S23<<0 +S76<<0 
wire sub_exp375; 
assign sub_exp375 = sub_exp23 ^ sub_exp76; 

// S376: (+1*X1+1*X6+1*X25+1*X26+1*X30+1*X37+1*X52+1*X63) = +S375<<0 +S199<<0 
wire sub_exp376; 
assign sub_exp376 = sub_exp375 ^ sub_exp199; 

// S377: (+1*X1+1*X6+1*X7+1*X10+1*X22+1*X25+1*X26+1*X30+1*X37+1*X42+1*X49+1*X52+1*X54+1*X59+1*X60+1*X63) = +S376<<0 +S136<<0 
wire sub_exp377; 
assign sub_exp377 = sub_exp376 ^ sub_exp136; 

// S378: (+1*X8+1*X20+1*X27+1*X31+1*X44+1*X45+1*X53+1*X56+1*X61+1*X62+1*X64) = +S229<<0 +S202<<0 
wire sub_exp378; 
assign sub_exp378 = sub_exp229 ^ sub_exp202; 

// S379: (+1*X1+1*X6+1*X7+1*X10+1*X19+1*X22+1*X24+1*X25+1*X26+1*X30+1*X34+1*X37+1*X39+1*X42+1*X49+1*X52+1*X54+1*X57+1*X59+1*X60+1*X63) = +S377<<0 +S283<<0 
wire sub_exp379; 
assign sub_exp379 = sub_exp377 ^ sub_exp283; 

// O15: (+1*X1+1*X6+1*X7+1*X8+1*X10+1*X19+1*X20+1*X22+1*X24+1*X25+1*X26+1*X27+1*X30+1*X31+1*X34+1*X37+1*X39+1*X42+1*X44+1*X45+1*X49+1*X52+1*X53+1*X54+1*X56+1*X57+1*X59+1*X60+1*X61+1*X62+1*X63+1*X64) = +S379<<0 +S378<<0 
assign mds_out1[6] = sub_exp379 ^ sub_exp378; 

// S380: (+1*X9+1*X55) = +X9<<0 +X55<<0 
wire sub_exp380; 
assign sub_exp380 = mds_in1[0] ^ mds_in6[6]; 

// S381: (+1*X9+1*X23+1*X28+1*X55) = +S380<<0 +S198<<0 
wire sub_exp381; 
assign sub_exp381 = sub_exp380 ^ sub_exp198; 

// S382: (+1*X9+1*X23+1*X28+1*X45+1*X55+1*X63) = +S381<<0 +S244<<0 
wire sub_exp382; 
assign sub_exp382 = sub_exp381 ^ sub_exp244; 

// S383: (+1*X2+1*X17+1*X21+1*X27+1*X32+1*X35+1*X40+1*X46) = +S203<<0 +S140<<0 
wire sub_exp383; 
assign sub_exp383 = sub_exp203 ^ sub_exp140; 

// S384: (+1*X2+1*X9+1*X17+1*X21+1*X23+1*X27+1*X28+1*X32+1*X35+1*X40+1*X45+1*X46+1*X55+1*X63) = +S382<<0 +S383<<0 
wire sub_exp384; 
assign sub_exp384 = sub_exp382 ^ sub_exp383; 

// S385: (+1*X8+1*X20+1*X26+1*X31+1*X33+1*X38+1*X43+1*X50+1*X53+1*X57+1*X58+1*X61+1*X62+1*X64) = +S269<<0 +S200<<0 
wire sub_exp385; 
assign sub_exp385 = sub_exp269 ^ sub_exp200; 

// S386: (+1*X1+1*X2+1*X7+1*X9+1*X11+1*X17+1*X21+1*X23+1*X27+1*X28+1*X32+1*X35+1*X40+1*X45+1*X46+1*X54+1*X55+1*X60+1*X63) = +S384<<0 +S271<<0 
wire sub_exp386; 
assign sub_exp386 = sub_exp384 ^ sub_exp271; 

// O16: (+1*X1+1*X2+1*X7+1*X8+1*X9+1*X11+1*X17+1*X20+1*X21+1*X23+1*X26+1*X27+1*X28+1*X31+1*X32+1*X33+1*X35+1*X38+1*X40+1*X43+1*X45+1*X46+1*X50+1*X53+1*X54+1*X55+1*X57+1*X58+1*X60+1*X61+1*X62+1*X63+1*X64) = +S386<<0 +S385<<0 
assign mds_out1[7] = sub_exp386 ^ sub_exp385; 

// S387: (+1*X17+1*X30) = +X17<<0 +X30<<0 
wire sub_exp387; 
assign sub_exp387 = mds_in2[0] ^ mds_in3[5]; 

// S388: (+1*X32+1*X42) = +X42<<0 +X32<<0 
wire sub_exp388; 
assign sub_exp388 = mds_in5[1] ^ mds_in3[7]; 

// S389: (+1*X17+1*X30+1*X32+1*X42) = +S387<<0 +S388<<0 
wire sub_exp389; 
assign sub_exp389 = sub_exp387 ^ sub_exp388; 

// S390: (+1*X17+1*X29+1*X30+1*X32+1*X40+1*X42+1*X52+1*X63) = +S389<<0 +S47<<0 
wire sub_exp390; 
assign sub_exp390 = sub_exp389 ^ sub_exp47; 

// S391: (+1*X7+1*X17+1*X20+1*X25+1*X29+1*X30+1*X32+1*X35+1*X37+1*X40+1*X42+1*X52+1*X63) = +S390<<0 +S118<<0 
wire sub_exp391; 
assign sub_exp391 = sub_exp390 ^ sub_exp118; 

// S392: (+1*X3+1*X5+1*X10+1*X16+1*X18+1*X36+1*X47+1*X49+1*X54+1*X57+1*X59+1*X62+1*X64) = +S245<<0 +S125<<0 
wire sub_exp392; 
assign sub_exp392 = sub_exp245 ^ sub_exp125; 

// S393: (+1*X1+1*X2+1*X6+1*X7+1*X8+1*X11+1*X17+1*X20+1*X25+1*X26+1*X29+1*X30+1*X32+1*X35+1*X37+1*X40+1*X42+1*X44+1*X52+1*X55+1*X63) = +S391<<0 +S278<<0 
wire sub_exp393; 
assign sub_exp393 = sub_exp391 ^ sub_exp278; 

// O17: (+1*X1+1*X2+1*X3+1*X5+1*X6+1*X7+1*X8+1*X10+1*X11+1*X16+1*X17+1*X18+1*X20+1*X25+1*X26+1*X29+1*X30+1*X32+1*X35+1*X36+1*X37+1*X40+1*X42+1*X44+1*X47+1*X49+1*X52+1*X54+1*X55+1*X57+1*X59+1*X62+1*X63+1*X64) = +S393<<0 +S392<<0 
assign mds_out2[0] = sub_exp393 ^ sub_exp392; 

// S394: (+1*X31+1*X36+1*X49) = +X49<<0 +S204<<0 
wire sub_exp394; 
assign sub_exp394 = mds_in6[0] ^ sub_exp204; 

// S395: (+1*X31+1*X33+1*X36+1*X38+1*X43+1*X49+1*X58) = +S394<<0 +S35<<0 
wire sub_exp395; 
assign sub_exp395 = sub_exp394 ^ sub_exp35; 

// S396: (+1*X7+1*X31+1*X33+1*X36+1*X37+1*X38+1*X43+1*X48+1*X49+1*X58+1*X60) = +S395<<0 +S53<<0 
wire sub_exp396; 
assign sub_exp396 = sub_exp395 ^ sub_exp53; 

// S397: (+1*X1+1*X4+1*X6+1*X9+1*X11+1*X18+1*X19+1*X21+1*X26+1*X30+1*X50+1*X55) = +S182<<0 +S104<<0 
wire sub_exp397; 
assign sub_exp397 = sub_exp182 ^ sub_exp104; 

// S398: (+1*X2+1*X3+1*X8+1*X12+1*X27+1*X45+1*X53+1*X56+1*X63+1*X64) = +S202<<0 +S183<<0 
wire sub_exp398; 
assign sub_exp398 = sub_exp202 ^ sub_exp183; 

// S399: (+1*X1+1*X4+1*X6+1*X7+1*X9+1*X11+1*X18+1*X19+1*X21+1*X26+1*X30+1*X31+1*X33+1*X36+1*X37+1*X38+1*X43+1*X48+1*X49+1*X50+1*X55+1*X58+1*X60) = +S396<<0 +S397<<0 
wire sub_exp399; 
assign sub_exp399 = sub_exp396 ^ sub_exp397; 

// O18: (+1*X1+1*X2+1*X3+1*X4+1*X6+1*X7+1*X8+1*X9+1*X11+1*X12+1*X18+1*X19+1*X21+1*X26+1*X27+1*X30+1*X31+1*X33+1*X36+1*X37+1*X38+1*X43+1*X45+1*X48+1*X49+1*X50+1*X53+1*X55+1*X56+1*X58+1*X60+1*X63+1*X64) = +S399<<0 +S398<<0 
assign mds_out2[1] = sub_exp399 ^ sub_exp398; 

// S400: (+1*X31+1*X34) = +X31<<0 +X34<<0 
wire sub_exp400; 
assign sub_exp400 = mds_in3[6] ^ mds_in4[1]; 

// S401: (+1*X31+1*X34+1*X51+1*X56) = +S400<<0 +S52<<0 
wire sub_exp401; 
assign sub_exp401 = sub_exp400 ^ sub_exp52; 

// S402: (+1*X4+1*X16+1*X19+1*X55) = +S173<<0 +S57<<0 
wire sub_exp402; 
assign sub_exp402 = sub_exp173 ^ sub_exp57; 

// S403: (+1*X1+1*X6+1*X11+1*X26+1*X31+1*X34+1*X51+1*X56) = +S401<<0 +S38<<0 
wire sub_exp403; 
assign sub_exp403 = sub_exp401 ^ sub_exp38; 

// S404: (+1*X4+1*X13+1*X16+1*X19+1*X33+1*X38+1*X55) = +S137<<0 +S402<<0 
wire sub_exp404; 
assign sub_exp404 = sub_exp137 ^ sub_exp402; 

// S405: (+1*X1+1*X4+1*X6+1*X11+1*X13+1*X16+1*X19+1*X26+1*X31+1*X33+1*X34+1*X38+1*X51+1*X55+1*X56) = +S403<<0 +S404<<0 
wire sub_exp405; 
assign sub_exp405 = sub_exp403 ^ sub_exp404; 

// S406: (+1*X17+1*X18+1*X22+1*X27+1*X28+1*X36+1*X39+1*X42+1*X47+1*X61+1*X62) = +S175<<0 +S107<<0 
wire sub_exp406; 
assign sub_exp406 = sub_exp175 ^ sub_exp107; 

// S407: (+1*X12+1*X25+1*X29+1*X30+1*X35+1*X40+1*X46+1*X49+1*X50+1*X52+1*X63) = +S267<<0 +S194<<0 
wire sub_exp407; 
assign sub_exp407 = sub_exp267 ^ sub_exp194; 

// S408: (+1*X1+1*X4+1*X6+1*X11+1*X13+1*X16+1*X17+1*X18+1*X19+1*X22+1*X26+1*X27+1*X28+1*X31+1*X33+1*X34+1*X36+1*X38+1*X39+1*X42+1*X47+1*X51+1*X55+1*X56+1*X61+1*X62) = +S405<<0 +S406<<0 
wire sub_exp408; 
assign sub_exp408 = sub_exp405 ^ sub_exp406; 

// O19: (+1*X1+1*X4+1*X6+1*X11+1*X12+1*X13+1*X16+1*X17+1*X18+1*X19+1*X22+1*X25+1*X26+1*X27+1*X28+1*X29+1*X30+1*X31+1*X33+1*X34+1*X35+1*X36+1*X38+1*X39+1*X40+1*X42+1*X46+1*X47+1*X49+1*X50+1*X51+1*X52+1*X55+1*X56+1*X61+1*X62+1*X63) = +S408<<0 +S407<<0 
assign mds_out2[2] = sub_exp408 ^ sub_exp407; 

// S409: (+1*X6+1*X50) = +X6<<0 +X50<<0 
wire sub_exp409; 
assign sub_exp409 = mds_in0[5] ^ mds_in6[1]; 

// S410: (+1*X6+1*X12+1*X23+1*X50) = +S409<<0 +S21<<0 
wire sub_exp410; 
assign sub_exp410 = sub_exp409 ^ sub_exp21; 

// S411: (+1*X6+1*X9+1*X12+1*X14+1*X19+1*X23+1*X34+1*X50) = +S410<<0 +S37<<0 
wire sub_exp411; 
assign sub_exp411 = sub_exp410 ^ sub_exp37; 

// S412: (+1*X8+1*X41+1*X44+1*X51+1*X53+1*X55) = +S86<<0 +S78<<0 
wire sub_exp412; 
assign sub_exp412 = sub_exp86 ^ sub_exp78; 

// S413: (+1*X6+1*X9+1*X12+1*X13+1*X14+1*X19+1*X23+1*X34+1*X42+1*X43+1*X48+1*X50) = +S411<<0 +S206<<0 
wire sub_exp413; 
assign sub_exp413 = sub_exp411 ^ sub_exp206; 

// S414: (+1*X3+1*X8+1*X11+1*X16+1*X31+1*X41+1*X44+1*X51+1*X53+1*X55+1*X57) = +S184<<0 +S412<<0 
wire sub_exp414; 
assign sub_exp414 = sub_exp184 ^ sub_exp412; 

// S415: (+1*X3+1*X6+1*X8+1*X9+1*X11+1*X12+1*X13+1*X14+1*X16+1*X19+1*X23+1*X31+1*X34+1*X41+1*X42+1*X43+1*X44+1*X48+1*X50+1*X51+1*X53+1*X55+1*X57) = +S413<<0 +S414<<0 
wire sub_exp415; 
assign sub_exp415 = sub_exp413 ^ sub_exp414; 

// O20: (+1*X3+1*X6+1*X8+1*X9+1*X10+1*X11+1*X12+1*X13+1*X14+1*X16+1*X17+1*X19+1*X23+1*X27+1*X28+1*X31+1*X34+1*X39+1*X41+1*X42+1*X43+1*X44+1*X48+1*X49+1*X50+1*X51+1*X53+1*X54+1*X55+1*X56+1*X57+1*X59) = +S415<<0 +S185<<0 
assign mds_out2[3] = sub_exp415 ^ sub_exp185; 

// S416: (+1*X1+1*X6+1*X26+1*X37+1*X60) = +X60<<0 +S199<<0 
wire sub_exp416; 
assign sub_exp416 = mds_in7[3] ^ sub_exp199; 

// S417: (+1*X1+1*X6+1*X13+1*X14+1*X24+1*X26+1*X36+1*X37+1*X47+1*X60) = +S416<<0 +S65<<0 
wire sub_exp417; 
assign sub_exp417 = sub_exp416 ^ sub_exp65; 

// S418: (+1*X2+1*X3+1*X4+1*X8+1*X12+1*X15+1*X28+1*X45+1*X56+1*X62+1*X63) = +S186<<0 +S183<<0 
wire sub_exp418; 
assign sub_exp418 = sub_exp186 ^ sub_exp183; 

// S419: (+1*X5+1*X16+1*X25+1*X30+1*X33+1*X43+1*X50+1*X51+1*X58+1*X59+1*X64) = +S280<<0 +S187<<0 
wire sub_exp419; 
assign sub_exp419 = sub_exp280 ^ sub_exp187; 

// S420: (+1*X1+1*X2+1*X3+1*X4+1*X6+1*X8+1*X12+1*X13+1*X14+1*X15+1*X24+1*X26+1*X28+1*X36+1*X37+1*X45+1*X47+1*X56+1*X60+1*X62+1*X63) = +S417<<0 +S418<<0 
wire sub_exp420; 
assign sub_exp420 = sub_exp417 ^ sub_exp418; 

// O21: (+1*X1+1*X2+1*X3+1*X4+1*X5+1*X6+1*X8+1*X12+1*X13+1*X14+1*X15+1*X16+1*X24+1*X25+1*X26+1*X28+1*X30+1*X33+1*X36+1*X37+1*X43+1*X45+1*X47+1*X50+1*X51+1*X56+1*X58+1*X59+1*X60+1*X62+1*X63+1*X64) = +S420<<0 +S419<<0 
assign mds_out2[4] = sub_exp420 ^ sub_exp419; 

// S421: (+1*X61+1*X64) = +X61<<0 +X64<<0 
wire sub_exp421; 
assign sub_exp421 = mds_in7[4] ^ mds_in7[7]; 

// S422: (+1*X17+1*X27+1*X61+1*X64) = +S421<<0 +S6<<0 
wire sub_exp422; 
assign sub_exp422 = sub_exp421 ^ sub_exp6; 

// S423: (+1*X4+1*X5+1*X15+1*X16) = +S32<<0 +S24<<0 
wire sub_exp423; 
assign sub_exp423 = sub_exp32 ^ sub_exp24; 

// S424: (+1*X17+1*X27+1*X31+1*X44+1*X61+1*X64) = +S422<<0 +S64<<0 
wire sub_exp424; 
assign sub_exp424 = sub_exp422 ^ sub_exp64; 

// S425: (+1*X4+1*X5+1*X7+1*X15+1*X16+1*X37+1*X48+1*X60) = +S53<<0 +S423<<0 
wire sub_exp425; 
assign sub_exp425 = sub_exp53 ^ sub_exp423; 

// S426: (+1*X13+1*X17+1*X27+1*X31+1*X33+1*X38+1*X44+1*X61+1*X64) = +S424<<0 +S137<<0 
wire sub_exp426; 
assign sub_exp426 = sub_exp424 ^ sub_exp137; 

// S427: (+1*X3+1*X4+1*X5+1*X6+1*X7+1*X15+1*X16+1*X26+1*X37+1*X48+1*X49+1*X59+1*X60) = +S234<<0 +S425<<0 
wire sub_exp427; 
assign sub_exp427 = sub_exp234 ^ sub_exp425; 

// S428: (+1*X3+1*X4+1*X5+1*X6+1*X7+1*X13+1*X15+1*X16+1*X17+1*X26+1*X27+1*X31+1*X33+1*X37+1*X38+1*X44+1*X48+1*X49+1*X59+1*X60+1*X61+1*X64) = +S426<<0 +S427<<0 
wire sub_exp428; 
assign sub_exp428 = sub_exp426 ^ sub_exp427; 

// O22: (+1*X2+1*X3+1*X4+1*X5+1*X6+1*X7+1*X13+1*X14+1*X15+1*X16+1*X17+1*X26+1*X27+1*X29+1*X31+1*X33+1*X34+1*X37+1*X38+1*X41+1*X44+1*X46+1*X48+1*X49+1*X51+1*X52+1*X59+1*X60+1*X61+1*X63+1*X64) = +S428<<0 +S156<<0 
assign mds_out2[5] = sub_exp428 ^ sub_exp156; 

// S429: (+1*X35+1*X52) = +X35<<0 +X52<<0 
wire sub_exp429; 
assign sub_exp429 = mds_in4[2] ^ mds_in6[3]; 

// S430: (+1*X33+1*X35+1*X38+1*X52) = +S429<<0 +S79<<0 
wire sub_exp430; 
assign sub_exp430 = sub_exp429 ^ sub_exp79; 

// S431: (+1*X14+1*X33+1*X34+1*X35+1*X38+1*X52+1*X53+1*X64) = +S430<<0 +S152<<0 
wire sub_exp431; 
assign sub_exp431 = sub_exp430 ^ sub_exp152; 

// S432: (+1*X1+1*X7+1*X8+1*X42+1*X47+1*X60+1*X61) = +S263<<0 +S181<<0 
wire sub_exp432; 
assign sub_exp432 = sub_exp263 ^ sub_exp181; 

// S433: (+1*X3+1*X14+1*X18+1*X30+1*X33+1*X34+1*X35+1*X38+1*X50+1*X52+1*X53+1*X57+1*X62+1*X64) = +S431<<0 +S161<<0 
wire sub_exp433; 
assign sub_exp433 = sub_exp431 ^ sub_exp161; 

// S434: (+1*X1+1*X5+1*X6+1*X7+1*X8+1*X16+1*X28+1*X39+1*X42+1*X45+1*X47+1*X60+1*X61) = +S247<<0 +S432<<0 
wire sub_exp434; 
assign sub_exp434 = sub_exp247 ^ sub_exp432; 

// S435: (+1*X3+1*X4+1*X9+1*X14+1*X15+1*X18+1*X27+1*X30+1*X32+1*X33+1*X34+1*X35+1*X38+1*X50+1*X52+1*X53+1*X57+1*X62+1*X64) = +S433<<0 +S262<<0 
wire sub_exp435; 
assign sub_exp435 = sub_exp433 ^ sub_exp262; 

// O23: (+1*X1+1*X3+1*X4+1*X5+1*X6+1*X7+1*X8+1*X9+1*X14+1*X15+1*X16+1*X18+1*X27+1*X28+1*X30+1*X32+1*X33+1*X34+1*X35+1*X38+1*X39+1*X42+1*X45+1*X47+1*X50+1*X52+1*X53+1*X57+1*X60+1*X61+1*X62+1*X64) = +S435<<0 +S434<<0 
assign mds_out2[6] = sub_exp435 ^ sub_exp434; 

// S436: (+1*X1+1*X10+1*X54) = +X1<<0 +S10<<0 
wire sub_exp436; 
assign sub_exp436 = mds_in0[0] ^ sub_exp10; 

// S437: (+1*X17+1*X31+1*X36+1*X53) = +S204<<0 +S159<<0 
wire sub_exp437; 
assign sub_exp437 = sub_exp204 ^ sub_exp159; 

// S438: (+1*X1+1*X8+1*X10+1*X34+1*X54+1*X61) = +S436<<0 +S157<<0 
wire sub_exp438; 
assign sub_exp438 = sub_exp436 ^ sub_exp157; 

// S439: (+1*X17+1*X31+1*X36+1*X43+1*X48+1*X53+1*X58+1*X63) = +S210<<0 +S437<<0 
wire sub_exp439; 
assign sub_exp439 = sub_exp210 ^ sub_exp437; 

// S440: (+1*X1+1*X8+1*X10+1*X17+1*X31+1*X34+1*X36+1*X43+1*X48+1*X53+1*X54+1*X58+1*X61+1*X63) = +S438<<0 +S439<<0 
wire sub_exp440; 
assign sub_exp440 = sub_exp438 ^ sub_exp439; 

// S441: (+1*X2+1*X5+1*X6+1*X7+1*X16+1*X25+1*X28+1*X29+1*X35+1*X39+1*X40+1*X41+1*X46+1*X51) = +S248<<0 +S232<<0 
wire sub_exp441; 
assign sub_exp441 = sub_exp248 ^ sub_exp232; 

// S442: (+1*X1+1*X4+1*X8+1*X9+1*X10+1*X15+1*X17+1*X19+1*X31+1*X34+1*X36+1*X43+1*X48+1*X53+1*X54+1*X58+1*X61+1*X62+1*X63) = +S440<<0 +S275<<0 
wire sub_exp442; 
assign sub_exp442 = sub_exp440 ^ sub_exp275; 

// O24: (+1*X1+1*X2+1*X4+1*X5+1*X6+1*X7+1*X8+1*X9+1*X10+1*X15+1*X16+1*X17+1*X19+1*X25+1*X28+1*X29+1*X31+1*X34+1*X35+1*X36+1*X39+1*X40+1*X41+1*X43+1*X46+1*X48+1*X51+1*X53+1*X54+1*X58+1*X61+1*X62+1*X63) = +S442<<0 +S441<<0 
assign mds_out2[7] = sub_exp442 ^ sub_exp441; 

// S443: (+1*X38+1*X40) = +X38<<0 +X40<<0 
wire sub_exp443; 
assign sub_exp443 = mds_in4[5] ^ mds_in4[7]; 

// S444: (+1*X38+1*X40+1*X50) = +S443<<0 +X50<<0 
wire sub_exp444; 
assign sub_exp444 = sub_exp443 ^ mds_in6[1]; 

// S445: (+1*X7+1*X37+1*X38+1*X40+1*X48+1*X50+1*X60) = +S444<<0 +S53<<0 
wire sub_exp445; 
assign sub_exp445 = sub_exp444 ^ sub_exp53; 

// S446: (+1*X1+1*X6+1*X7+1*X8+1*X11+1*X26+1*X37+1*X38+1*X40+1*X44+1*X48+1*X50+1*X55+1*X60) = +S445<<0 +S120<<0 
wire sub_exp446; 
assign sub_exp446 = sub_exp445 ^ sub_exp120; 

// S447: (+1*X9+1*X13+1*X14+1*X15+1*X16+1*X19+1*X24+1*X28+1*X33+1*X34+1*X43+1*X45+1*X52+1*X63) = +S207<<0 +S121<<0 
wire sub_exp447; 
assign sub_exp447 = sub_exp207 ^ sub_exp121; 

// S448: (+1*X1+1*X3+1*X6+1*X7+1*X8+1*X10+1*X11+1*X18+1*X25+1*X26+1*X37+1*X38+1*X40+1*X44+1*X48+1*X50+1*X55+1*X57+1*X60+1*X62) = +S446<<0 +S231<<0 
wire sub_exp448; 
assign sub_exp448 = sub_exp446 ^ sub_exp231; 

// O25: (+1*X1+1*X3+1*X6+1*X7+1*X8+1*X9+1*X10+1*X11+1*X13+1*X14+1*X15+1*X16+1*X18+1*X19+1*X24+1*X25+1*X26+1*X28+1*X33+1*X34+1*X37+1*X38+1*X40+1*X43+1*X44+1*X45+1*X48+1*X50+1*X52+1*X55+1*X57+1*X60+1*X62+1*X63) = +S448<<0 +S447<<0 
assign mds_out3[0] = sub_exp448 ^ sub_exp447; 

// S449: (+1*X8+1*X53+1*X61+1*X64) = +S26<<0 +S30<<0 
wire sub_exp449; 
assign sub_exp449 = sub_exp26 ^ sub_exp30; 

// S450: (+1*X7+1*X20+1*X39+1*X57) = +S99<<0 +S63<<0 
wire sub_exp450; 
assign sub_exp450 = sub_exp99 ^ sub_exp63; 

// S451: (+1*X4+1*X8+1*X15+1*X45+1*X53+1*X56+1*X61+1*X64) = +S449<<0 +S55<<0 
wire sub_exp451; 
assign sub_exp451 = sub_exp449 ^ sub_exp55; 

// S452: (+1*X7+1*X10+1*X11+1*X16+1*X20+1*X39+1*X44+1*X57) = +S228<<0 +S450<<0 
wire sub_exp452; 
assign sub_exp452 = sub_exp228 ^ sub_exp450; 

// S453: (+1*X4+1*X7+1*X8+1*X10+1*X11+1*X15+1*X16+1*X20+1*X39+1*X44+1*X45+1*X53+1*X56+1*X57+1*X61+1*X64) = +S451<<0 +S452<<0 
wire sub_exp453; 
assign sub_exp453 = sub_exp451 ^ sub_exp452; 

// S454: (+1*X2+1*X9+1*X12+1*X14+1*X19+1*X26+1*X29+1*X34+1*X41+1*X46+1*X51+1*X63) = +S226<<0 +S122<<0 
wire sub_exp454; 
assign sub_exp454 = sub_exp226 ^ sub_exp122; 

// S455: (+1*X4+1*X7+1*X8+1*X10+1*X11+1*X15+1*X16+1*X17+1*X20+1*X27+1*X35+1*X38+1*X39+1*X44+1*X45+1*X53+1*X56+1*X57+1*X58+1*X61+1*X64) = +S453<<0 +S227<<0 
wire sub_exp455; 
assign sub_exp455 = sub_exp453 ^ sub_exp227; 

// O26: (+1*X2+1*X4+1*X7+1*X8+1*X9+1*X10+1*X11+1*X12+1*X14+1*X15+1*X16+1*X17+1*X19+1*X20+1*X26+1*X27+1*X29+1*X34+1*X35+1*X38+1*X39+1*X41+1*X44+1*X45+1*X46+1*X51+1*X53+1*X56+1*X57+1*X58+1*X61+1*X63+1*X64) = +S455<<0 +S454<<0 
assign mds_out3[1] = sub_exp455 ^ sub_exp454; 

// S456: (+1*X5+1*X21) = +X5<<0 +X21<<0 
wire sub_exp456; 
assign sub_exp456 = mds_in0[4] ^ mds_in2[4]; 

// S457: (+1*X5+1*X21+1*X59+1*X64) = +S456<<0 +S42<<0 
wire sub_exp457; 
assign sub_exp457 = sub_exp456 ^ sub_exp42; 

// S458: (+1*X12+1*X39+1*X57+1*X63) = +S99<<0 +S61<<0 
wire sub_exp458; 
assign sub_exp458 = sub_exp99 ^ sub_exp61; 

// S459: (+1*X5+1*X21+1*X24+1*X27+1*X59+1*X64) = +S457<<0 +S188<<0 
wire sub_exp459; 
assign sub_exp459 = sub_exp457 ^ sub_exp188; 

// S460: (+1*X9+1*X12+1*X14+1*X19+1*X34+1*X39+1*X57+1*X63) = +S458<<0 +S37<<0 
wire sub_exp460; 
assign sub_exp460 = sub_exp458 ^ sub_exp37; 

// S461: (+1*X5+1*X9+1*X12+1*X14+1*X19+1*X21+1*X24+1*X27+1*X34+1*X39+1*X57+1*X59+1*X63+1*X64) = +S459<<0 +S460<<0 
wire sub_exp461; 
assign sub_exp461 = sub_exp459 ^ sub_exp460; 

// S462: (+1*X7+1*X20+1*X25+1*X30+1*X35+1*X37+1*X42+1*X48+1*X50+1*X54+1*X60) = +S179<<0 +S132<<0 
wire sub_exp462; 
assign sub_exp462 = sub_exp179 ^ sub_exp132; 

// S463: (+1*X5+1*X7+1*X9+1*X12+1*X14+1*X19+1*X20+1*X21+1*X24+1*X25+1*X27+1*X30+1*X34+1*X35+1*X37+1*X39+1*X42+1*X48+1*X50+1*X54+1*X57+1*X59+1*X60+1*X63+1*X64) = +S461<<0 +S462<<0 
wire sub_exp463; 
assign sub_exp463 = sub_exp461 ^ sub_exp462; 

// O27: (+1*X5+1*X6+1*X7+1*X9+1*X12+1*X14+1*X19+1*X20+1*X21+1*X24+1*X25+1*X26+1*X27+1*X30+1*X33+1*X34+1*X35+1*X36+1*X37+1*X38+1*X39+1*X41+1*X42+1*X43+1*X44+1*X46+1*X47+1*X48+1*X50+1*X54+1*X55+1*X57+1*X58+1*X59+1*X60+1*X63+1*X64) = +S463<<0 +S286<<0 
assign mds_out3[2] = sub_exp463 ^ sub_exp286; 

// S464: (+1*X21+1*X39) = +X21<<0 +X39<<0 
wire sub_exp464; 
assign sub_exp464 = mds_in2[4] ^ mds_in4[6]; 

// S465: (+1*X21+1*X39+1*X61) = +S464<<0 +X61<<0 
wire sub_exp465; 
assign sub_exp465 = sub_exp464 ^ mds_in7[4]; 

// S466: (+1*X19+1*X20+1*X24+1*X31) = +S54<<0 +S17<<0 
wire sub_exp466; 
assign sub_exp466 = sub_exp54 ^ sub_exp17; 

// S467: (+1*X19+1*X20+1*X21+1*X24+1*X31+1*X39+1*X61) = +S465<<0 +S466<<0 
wire sub_exp467; 
assign sub_exp467 = sub_exp465 ^ sub_exp466; 

// S468: (+1*X16+1*X50+1*X51+1*X52+1*X56+1*X63) = +S96<<0 +S93<<0 
wire sub_exp468; 
assign sub_exp468 = sub_exp96 ^ sub_exp93; 

// S469: (+1*X14+1*X19+1*X20+1*X21+1*X24+1*X25+1*X31+1*X35+1*X39+1*X61) = +S467<<0 +S250<<0 
wire sub_exp469; 
assign sub_exp469 = sub_exp467 ^ sub_exp250; 

// S470: (+1*X3+1*X16+1*X18+1*X36+1*X47+1*X50+1*X51+1*X52+1*X56+1*X57+1*X58+1*X62+1*X63+1*X64) = +S209<<0 +S468<<0 
wire sub_exp470; 
assign sub_exp470 = sub_exp209 ^ sub_exp468; 

// S471: (+1*X1+1*X11+1*X14+1*X17+1*X19+1*X20+1*X21+1*X22+1*X24+1*X25+1*X27+1*X31+1*X35+1*X39+1*X42+1*X49+1*X59+1*X61) = +S469<<0 +S284<<0 
wire sub_exp471; 
assign sub_exp471 = sub_exp469 ^ sub_exp284; 

// O28: (+1*X1+1*X3+1*X11+1*X14+1*X16+1*X17+1*X18+1*X19+1*X20+1*X21+1*X22+1*X24+1*X25+1*X27+1*X31+1*X35+1*X36+1*X39+1*X42+1*X47+1*X49+1*X50+1*X51+1*X52+1*X56+1*X57+1*X58+1*X59+1*X61+1*X62+1*X63+1*X64) = +S471<<0 +S470<<0 
assign mds_out3[3] = sub_exp471 ^ sub_exp470; 

// S472: (+1*X14+1*X22+1*X34) = +X22<<0 +S12<<0 
wire sub_exp472; 
assign sub_exp472 = mds_in2[5] ^ sub_exp12; 

// S473: (+1*X7+1*X14+1*X20+1*X22+1*X34) = +S472<<0 +S63<<0 
wire sub_exp473; 
assign sub_exp473 = sub_exp472 ^ sub_exp63; 

// S474: (+1*X7+1*X10+1*X11+1*X14+1*X16+1*X20+1*X22+1*X34+1*X45) = +S473<<0 +S189<<0 
wire sub_exp474; 
assign sub_exp474 = sub_exp473 ^ sub_exp189; 

// S475: (+1*X2+1*X3+1*X4+1*X8+1*X21+1*X32+1*X41+1*X44+1*X51+1*X55) = +S190<<0 +S84<<0 
wire sub_exp475; 
assign sub_exp475 = sub_exp190 ^ sub_exp84; 

// S476: (+1*X6+1*X9+1*X12+1*X13+1*X23+1*X24+1*X33+1*X36+1*X38+1*X53+1*X58+1*X59+1*X64) = +S192<<0 +S191<<0 
wire sub_exp476; 
assign sub_exp476 = sub_exp192 ^ sub_exp191; 

// S477: (+1*X2+1*X3+1*X4+1*X7+1*X8+1*X10+1*X11+1*X14+1*X16+1*X20+1*X21+1*X22+1*X32+1*X34+1*X41+1*X44+1*X45+1*X51+1*X55) = +S474<<0 +S475<<0 
wire sub_exp477; 
assign sub_exp477 = sub_exp474 ^ sub_exp475; 

// O29: (+1*X2+1*X3+1*X4+1*X6+1*X7+1*X8+1*X9+1*X10+1*X11+1*X12+1*X13+1*X14+1*X16+1*X20+1*X21+1*X22+1*X23+1*X24+1*X32+1*X33+1*X34+1*X36+1*X38+1*X41+1*X44+1*X45+1*X51+1*X53+1*X55+1*X58+1*X59+1*X64) = +S477<<0 +S476<<0 
assign mds_out3[4] = sub_exp477 ^ sub_exp476; 

// S478: (+1*X8+1*X11+1*X25+1*X35+1*X37) = +S70<<0 +S255<<0 
wire sub_exp478; 
assign sub_exp478 = sub_exp70 ^ sub_exp255; 

// S479: (+1*X8+1*X11+1*X12+1*X13+1*X23+1*X24+1*X25+1*X35+1*X37) = +S478<<0 +S224<<0 
wire sub_exp479; 
assign sub_exp479 = sub_exp478 ^ sub_exp224; 

// S480: (+1*X3+1*X4+1*X5+1*X14+1*X15+1*X34+1*X39+1*X41+1*X45+1*X46+1*X52+1*X56+1*X57) = +S260<<0 +S256<<0 
wire sub_exp480; 
assign sub_exp480 = sub_exp260 ^ sub_exp256; 

// S481: (+1*X7+1*X8+1*X10+1*X11+1*X12+1*X13+1*X21+1*X22+1*X23+1*X24+1*X25+1*X35+1*X37+1*X42+1*X49+1*X54+1*X59+1*X60) = +S479<<0 +S208<<0 
wire sub_exp481; 
assign sub_exp481 = sub_exp479 ^ sub_exp208; 

// O30: (+1*X3+1*X4+1*X5+1*X7+1*X8+1*X10+1*X11+1*X12+1*X13+1*X14+1*X15+1*X21+1*X22+1*X23+1*X24+1*X25+1*X34+1*X35+1*X37+1*X39+1*X41+1*X42+1*X45+1*X46+1*X49+1*X52+1*X54+1*X56+1*X57+1*X59+1*X60) = +S481<<0 +S480<<0 
assign mds_out3[5] = sub_exp481 ^ sub_exp480; 

// S482: (+1*X35+1*X40+1*X50) = +X50<<0 +S50<<0 
wire sub_exp482; 
assign sub_exp482 = mds_in6[1] ^ sub_exp50; 

// S483: (+1*X41+1*X46+1*X55+1*X60) = +S134<<0 +S80<<0 
wire sub_exp483; 
assign sub_exp483 = sub_exp134 ^ sub_exp80; 

// S484: (+1*X17+1*X35+1*X40+1*X50+1*X53) = +S482<<0 +S159<<0 
wire sub_exp484; 
assign sub_exp484 = sub_exp482 ^ sub_exp159; 

// S485: (+1*X4+1*X9+1*X15+1*X41+1*X46+1*X55+1*X60) = +S160<<0 +S483<<0 
wire sub_exp485; 
assign sub_exp485 = sub_exp160 ^ sub_exp483; 

// S486: (+1*X4+1*X9+1*X15+1*X17+1*X35+1*X40+1*X41+1*X46+1*X50+1*X53+1*X55+1*X60) = +S484<<0 +S485<<0 
wire sub_exp486; 
assign sub_exp486 = sub_exp484 ^ sub_exp485; 

// S487: (+1*X1+1*X6+1*X8+1*X11+1*X12+1*X22+1*X23+1*X26+1*X38+1*X42+1*X43+1*X58+1*X61) = +S241<<0 +S167<<0 
wire sub_exp487; 
assign sub_exp487 = sub_exp241 ^ sub_exp167; 

// S488: (+1*X4+1*X5+1*X9+1*X13+1*X14+1*X15+1*X16+1*X17+1*X24+1*X35+1*X36+1*X40+1*X41+1*X46+1*X47+1*X50+1*X53+1*X55+1*X60) = +S486<<0 +S253<<0 
wire sub_exp488; 
assign sub_exp488 = sub_exp486 ^ sub_exp253; 

// O31: (+1*X1+1*X4+1*X5+1*X6+1*X8+1*X9+1*X11+1*X12+1*X13+1*X14+1*X15+1*X16+1*X17+1*X22+1*X23+1*X24+1*X26+1*X35+1*X36+1*X38+1*X40+1*X41+1*X42+1*X43+1*X46+1*X47+1*X50+1*X53+1*X55+1*X58+1*X60+1*X61) = +S488<<0 +S487<<0 
assign mds_out3[6] = sub_exp488 ^ sub_exp487; 

// S489: (+1*X25+1*X39) = +X25<<0 +X39<<0 
wire sub_exp489; 
assign sub_exp489 = mds_in3[0] ^ mds_in4[6]; 

// S490: (+1*X25+1*X39+1*X42) = +S489<<0 +X42<<0 
wire sub_exp490; 
assign sub_exp490 = sub_exp489 ^ mds_in5[1]; 

// S491: (+1*X6+1*X9+1*X37+1*X48) = +S147<<0 +S29<<0 
wire sub_exp491; 
assign sub_exp491 = sub_exp147 ^ sub_exp29; 

// S492: (+1*X2+1*X25+1*X39+1*X42+1*X44) = +S490<<0 +S279<<0 
wire sub_exp492; 
assign sub_exp492 = sub_exp490 ^ sub_exp279; 

// S493: (+1*X6+1*X9+1*X18+1*X37+1*X48+1*X61+1*X62) = +S141<<0 +S491<<0 
wire sub_exp493; 
assign sub_exp493 = sub_exp141 ^ sub_exp491; 

// S494: (+1*X2+1*X12+1*X15+1*X23+1*X25+1*X39+1*X42+1*X44) = +S492<<0 +S259<<0 
wire sub_exp494; 
assign sub_exp494 = sub_exp492 ^ sub_exp259; 

// S495: (+1*X2+1*X6+1*X9+1*X12+1*X15+1*X18+1*X23+1*X25+1*X37+1*X39+1*X42+1*X44+1*X48+1*X61+1*X62) = +S494<<0 +S493<<0 
wire sub_exp495; 
assign sub_exp495 = sub_exp494 ^ sub_exp493; 

// S496: (+1*X2+1*X5+1*X6+1*X9+1*X12+1*X13+1*X14+1*X15+1*X16+1*X18+1*X23+1*X24+1*X25+1*X36+1*X37+1*X39+1*X42+1*X44+1*X47+1*X48+1*X61+1*X62) = +S495<<0 +S253<<0 
wire sub_exp496; 
assign sub_exp496 = sub_exp495 ^ sub_exp253; 

// O32: (+1*X2+1*X5+1*X6+1*X7+1*X9+1*X10+1*X12+1*X13+1*X14+1*X15+1*X16+1*X17+1*X18+1*X23+1*X24+1*X25+1*X27+1*X33+1*X36+1*X37+1*X39+1*X42+1*X43+1*X44+1*X47+1*X48+1*X49+1*X51+1*X54+1*X56+1*X59+1*X61+1*X62) = +S496<<0 +S288<<0 
assign mds_out3[7] = sub_exp496 ^ sub_exp288; 

// S497: (+1*X46+1*X48) = +X46<<0 +X48<<0 
wire sub_exp497; 
assign sub_exp497 = mds_in5[5] ^ mds_in5[7]; 

// S498: (+1*X4+1*X15+1*X45+1*X46+1*X48+1*X56) = +S497<<0 +S55<<0 
wire sub_exp498; 
assign sub_exp498 = sub_exp497 ^ sub_exp55; 

// S499: (+1*X4+1*X7+1*X15+1*X24+1*X45+1*X46+1*X48+1*X56+1*X60) = +S498<<0 +S94<<0 
wire sub_exp499; 
assign sub_exp499 = sub_exp498 ^ sub_exp94; 

// S500: (+1*X9+1*X14+1*X16+1*X19+1*X23+1*X34+1*X36+1*X41+1*X51+1*X52+1*X53+1*X63) = +S121<<0 +S117<<0 
wire sub_exp500; 
assign sub_exp500 = sub_exp121 ^ sub_exp117; 

// S501: (+1*X1+1*X6+1*X11+1*X17+1*X18+1*X21+1*X22+1*X26+1*X27+1*X32+1*X33+1*X42+1*X58) = +S257<<0 +S205<<0 
wire sub_exp501; 
assign sub_exp501 = sub_exp257 ^ sub_exp205; 

// S502: (+1*X4+1*X7+1*X9+1*X14+1*X15+1*X16+1*X19+1*X23+1*X24+1*X34+1*X36+1*X41+1*X45+1*X46+1*X48+1*X51+1*X52+1*X53+1*X56+1*X60+1*X63) = +S499<<0 +S500<<0 
wire sub_exp502; 
assign sub_exp502 = sub_exp499 ^ sub_exp500; 

// O33: (+1*X1+1*X4+1*X6+1*X7+1*X9+1*X11+1*X14+1*X15+1*X16+1*X17+1*X18+1*X19+1*X21+1*X22+1*X23+1*X24+1*X26+1*X27+1*X32+1*X33+1*X34+1*X36+1*X41+1*X42+1*X45+1*X46+1*X48+1*X51+1*X52+1*X53+1*X56+1*X58+1*X60+1*X63) = +S502<<0 +S501<<0 
assign mds_out4[0] = sub_exp502 ^ sub_exp501; 

// S503: (+1*X43+1*X52) = +X43<<0 +X52<<0 
wire sub_exp503; 
assign sub_exp503 = mds_in5[2] ^ mds_in6[3]; 

// S504: (+1*X12+1*X23+1*X43+1*X52+1*X53+1*X64) = +S503<<0 +S49<<0 
wire sub_exp504; 
assign sub_exp504 = sub_exp503 ^ sub_exp49; 

// S505: (+1*X8+1*X12+1*X23+1*X34+1*X43+1*X52+1*X53+1*X61+1*X64) = +S504<<0 +S157<<0 
wire sub_exp505; 
assign sub_exp505 = sub_exp504 ^ sub_exp157; 

// S506: (+1*X2+1*X7+1*X15+1*X18+1*X19+1*X20+1*X24+1*X25+1*X28+1*X35+1*X37+1*X46) = +S243<<0 +S212<<0 
wire sub_exp506; 
assign sub_exp506 = sub_exp243 ^ sub_exp212; 

// S507: (+1*X1+1*X5+1*X10+1*X16+1*X17+1*X22+1*X27+1*X42+1*X47+1*X49+1*X54+1*X59) = +S246<<0 +S245<<0 
wire sub_exp507; 
assign sub_exp507 = sub_exp246 ^ sub_exp245; 

// S508: (+1*X2+1*X7+1*X8+1*X12+1*X15+1*X18+1*X19+1*X20+1*X23+1*X24+1*X25+1*X28+1*X34+1*X35+1*X37+1*X43+1*X46+1*X52+1*X53+1*X61+1*X64) = +S505<<0 +S506<<0 
wire sub_exp508; 
assign sub_exp508 = sub_exp505 ^ sub_exp506; 

// O34: (+1*X1+1*X2+1*X5+1*X7+1*X8+1*X10+1*X12+1*X15+1*X16+1*X17+1*X18+1*X19+1*X20+1*X22+1*X23+1*X24+1*X25+1*X27+1*X28+1*X34+1*X35+1*X37+1*X42+1*X43+1*X46+1*X47+1*X49+1*X52+1*X53+1*X54+1*X59+1*X61+1*X64) = +S508<<0 +S507<<0 
assign mds_out4[1] = sub_exp508 ^ sub_exp507; 

// S509: (+1*X13+1*X32) = +X13<<0 +X32<<0 
wire sub_exp509; 
assign sub_exp509 = mds_in1[4] ^ mds_in3[7]; 

// S510: (+1*X13+1*X32+1*X35) = +S509<<0 +X35<<0 
wire sub_exp510; 
assign sub_exp510 = sub_exp509 ^ mds_in4[2]; 

// S511: (+1*X3+1*X8+1*X44+1*X55) = +S44<<0 +S20<<0 
wire sub_exp511; 
assign sub_exp511 = sub_exp44 ^ sub_exp20; 

// S512: (+1*X7+1*X13+1*X20+1*X32+1*X35) = +S510<<0 +S63<<0 
wire sub_exp512; 
assign sub_exp512 = sub_exp510 ^ sub_exp63; 

// S513: (+1*X3+1*X7+1*X8+1*X13+1*X20+1*X32+1*X35+1*X44+1*X55) = +S512<<0 +S511<<0 
wire sub_exp513; 
assign sub_exp513 = sub_exp512 ^ sub_exp511; 

// S514: (+1*X4+1*X15+1*X28+1*X33+1*X38+1*X43+1*X45+1*X50+1*X56+1*X58+1*X62) = +S186<<0 +S102<<0 
wire sub_exp514; 
assign sub_exp514 = sub_exp186 ^ sub_exp102; 

// S515: (+1*X1+1*X3+1*X7+1*X8+1*X13+1*X17+1*X20+1*X22+1*X27+1*X32+1*X35+1*X42+1*X44+1*X47+1*X55) = +S513<<0 +S246<<0 
wire sub_exp515; 
assign sub_exp515 = sub_exp513 ^ sub_exp246; 

// S516: (+1*X1+1*X3+1*X4+1*X7+1*X8+1*X13+1*X15+1*X17+1*X20+1*X22+1*X27+1*X28+1*X32+1*X33+1*X35+1*X38+1*X42+1*X43+1*X44+1*X45+1*X47+1*X50+1*X55+1*X56+1*X58+1*X62) = +S515<<0 +S514<<0 
wire sub_exp516; 
assign sub_exp516 = sub_exp515 ^ sub_exp514; 

// O35: (+1*X1+1*X2+1*X3+1*X4+1*X7+1*X8+1*X13+1*X14+1*X15+1*X17+1*X20+1*X22+1*X27+1*X28+1*X29+1*X32+1*X33+1*X34+1*X35+1*X38+1*X41+1*X42+1*X43+1*X44+1*X45+1*X46+1*X47+1*X49+1*X50+1*X51+1*X52+1*X54+1*X55+1*X56+1*X58+1*X62+1*X63) = +S516<<0 +S221<<0 
assign mds_out4[2] = sub_exp516 ^ sub_exp221; 

// S517: (+1*X29+1*X47) = +X29<<0 +X47<<0 
wire sub_exp517; 
assign sub_exp517 = mds_in3[4] ^ mds_in5[6]; 

// S518: (+1*X25+1*X29+1*X30+1*X35+1*X47+1*X50) = +S517<<0 +S40<<0 
wire sub_exp518; 
assign sub_exp518 = sub_exp517 ^ sub_exp40; 

// S519: (+1*X3+1*X5+1*X7+1*X24+1*X57+1*X60) = +S94<<0 +S67<<0 
wire sub_exp519; 
assign sub_exp519 = sub_exp94 ^ sub_exp67; 

// S520: (+1*X9+1*X19+1*X22+1*X27+1*X28+1*X32+1*X39) = +S281<<0 +S264<<0 
wire sub_exp520; 
assign sub_exp520 = sub_exp281 ^ sub_exp264; 

// S521: (+1*X3+1*X5+1*X7+1*X24+1*X25+1*X29+1*X30+1*X35+1*X47+1*X50+1*X57+1*X60) = +S518<<0 +S519<<0 
wire sub_exp521; 
assign sub_exp521 = sub_exp518 ^ sub_exp519; 

// S522: (+1*X1+1*X2+1*X6+1*X8+1*X9+1*X11+1*X19+1*X22+1*X26+1*X27+1*X28+1*X32+1*X39+1*X44+1*X55) = +S278<<0 +S520<<0 
wire sub_exp522; 
assign sub_exp522 = sub_exp278 ^ sub_exp520; 

// S523: (+1*X3+1*X5+1*X7+1*X24+1*X25+1*X29+1*X30+1*X33+1*X35+1*X43+1*X47+1*X50+1*X57+1*X58+1*X59+1*X60+1*X64) = +S521<<0 +S280<<0 
wire sub_exp523; 
assign sub_exp523 = sub_exp521 ^ sub_exp280; 

// O36: (+1*X1+1*X2+1*X3+1*X5+1*X6+1*X7+1*X8+1*X9+1*X11+1*X19+1*X22+1*X24+1*X25+1*X26+1*X27+1*X28+1*X29+1*X30+1*X32+1*X33+1*X35+1*X39+1*X43+1*X44+1*X47+1*X50+1*X55+1*X57+1*X58+1*X59+1*X60+1*X64) = +S523<<0 +S522<<0 
assign mds_out4[3] = sub_exp523 ^ sub_exp522; 

// S524: (+1*X14+1*X30) = +X14<<0 +X30<<0 
wire sub_exp524; 
assign sub_exp524 = mds_in1[5] ^ mds_in3[5]; 

// S525: (+1*X14+1*X30+1*X41) = +S524<<0 +X41<<0 
wire sub_exp525; 
assign sub_exp525 = sub_exp524 ^ mds_in5[0]; 

// S526: (+1*X17+1*X22+1*X42+1*X53) = +S159<<0 +S13<<0 
wire sub_exp526; 
assign sub_exp526 = sub_exp159 ^ sub_exp13; 

// S527: (+1*X14+1*X17+1*X22+1*X30+1*X41+1*X42+1*X53) = +S525<<0 +S526<<0 
wire sub_exp527; 
assign sub_exp527 = sub_exp525 ^ sub_exp526; 

// S528: (+1*X3+1*X8+1*X20+1*X31+1*X49+1*X59+1*X61) = +S139<<0 +S45<<0 
wire sub_exp528; 
assign sub_exp528 = sub_exp139 ^ sub_exp45; 

// S529: (+1*X2+1*X10+1*X11+1*X16+1*X21+1*X32+1*X44+1*X46) = +S228<<0 +S140<<0 
wire sub_exp529; 
assign sub_exp529 = sub_exp228 ^ sub_exp140; 

// S530: (+1*X3+1*X8+1*X14+1*X17+1*X20+1*X22+1*X30+1*X31+1*X41+1*X42+1*X49+1*X53+1*X59+1*X61) = +S527<<0 +S528<<0 
wire sub_exp530; 
assign sub_exp530 = sub_exp527 ^ sub_exp528; 

// S531: (+1*X2+1*X10+1*X11+1*X12+1*X16+1*X21+1*X29+1*X32+1*X40+1*X44+1*X46+1*X52+1*X63) = +S529<<0 +S82<<0 
wire sub_exp531; 
assign sub_exp531 = sub_exp529 ^ sub_exp82; 

// S532: (+1*X3+1*X8+1*X14+1*X15+1*X17+1*X18+1*X19+1*X20+1*X22+1*X24+1*X28+1*X30+1*X31+1*X41+1*X42+1*X49+1*X53+1*X59+1*X61) = +S530<<0 +S212<<0 
wire sub_exp532; 
assign sub_exp532 = sub_exp530 ^ sub_exp212; 

// O37: (+1*X2+1*X3+1*X8+1*X10+1*X11+1*X12+1*X14+1*X15+1*X16+1*X17+1*X18+1*X19+1*X20+1*X21+1*X22+1*X24+1*X28+1*X29+1*X30+1*X31+1*X32+1*X40+1*X41+1*X42+1*X44+1*X46+1*X49+1*X52+1*X53+1*X59+1*X61+1*X63) = +S532<<0 +S531<<0 
assign mds_out4[4] = sub_exp532 ^ sub_exp531; 

// S533: (+1*X16+1*X19+1*X29) = +X29<<0 +S173<<0 
wire sub_exp533; 
assign sub_exp533 = mds_in3[4] ^ sub_exp173; 

// S534: (+1*X16+1*X19+1*X29+1*X33+1*X43+1*X45) = +S533<<0 +S73<<0 
wire sub_exp534; 
assign sub_exp534 = sub_exp533 ^ sub_exp73; 

// S535: (+1*X16+1*X19+1*X20+1*X21+1*X29+1*X31+1*X32+1*X33+1*X43+1*X45) = +S534<<0 +S236<<0 
wire sub_exp535; 
assign sub_exp535 = sub_exp534 ^ sub_exp236; 

// S536: (+1*X1+1*X11+1*X12+1*X13+1*X22+1*X23+1*X42+1*X47+1*X49+1*X53+1*X54+1*X60+1*X64) = +S222<<0 +S177<<0 
wire sub_exp536; 
assign sub_exp536 = sub_exp222 ^ sub_exp177; 

// S537: (+1*X3+1*X4+1*X15+1*X16+1*X18+1*X19+1*X20+1*X21+1*X29+1*X30+1*X31+1*X32+1*X33+1*X43+1*X45+1*X50+1*X57+1*X62) = +S535<<0 +S277<<0 
wire sub_exp537; 
assign sub_exp537 = sub_exp535 ^ sub_exp277; 

// O38: (+1*X1+1*X3+1*X4+1*X11+1*X12+1*X13+1*X15+1*X16+1*X18+1*X19+1*X20+1*X21+1*X22+1*X23+1*X29+1*X30+1*X31+1*X32+1*X33+1*X42+1*X43+1*X45+1*X47+1*X49+1*X50+1*X53+1*X54+1*X57+1*X60+1*X62+1*X64) = +S537<<0 +S536<<0 
assign mds_out4[5] = sub_exp537 ^ sub_exp536; 

// S538: (+1*X43+1*X48+1*X49+1*X54+1*X58+1*X63) = +S75<<0 +S210<<0 
wire sub_exp538; 
assign sub_exp538 = sub_exp75 ^ sub_exp210; 

// S539: (+1*X12+1*X13+1*X23+1*X24+1*X43+1*X48+1*X49+1*X54+1*X58+1*X63) = +S538<<0 +S224<<0 
wire sub_exp539; 
assign sub_exp539 = sub_exp538 ^ sub_exp224; 

// S540: (+1*X4+1*X5+1*X16+1*X21+1*X25+1*X30+1*X32+1*X44+1*X50+1*X51+1*X55) = +S187<<0 +S84<<0 
wire sub_exp540; 
assign sub_exp540 = sub_exp187 ^ sub_exp84; 

// S541: (+1*X4+1*X5+1*X12+1*X13+1*X16+1*X21+1*X23+1*X24+1*X25+1*X30+1*X32+1*X43+1*X44+1*X48+1*X49+1*X50+1*X51+1*X54+1*X55+1*X58+1*X63) = +S539<<0 +S540<<0 
wire sub_exp541; 
assign sub_exp541 = sub_exp539 ^ sub_exp540; 

// O39: (+1*X2+1*X4+1*X5+1*X9+1*X12+1*X13+1*X14+1*X16+1*X17+1*X19+1*X20+1*X21+1*X22+1*X23+1*X24+1*X25+1*X30+1*X31+1*X32+1*X34+1*X43+1*X44+1*X46+1*X48+1*X49+1*X50+1*X51+1*X54+1*X55+1*X58+1*X61+1*X63) = +S541<<0 +S225<<0 
assign mds_out4[6] = sub_exp541 ^ sub_exp225; 

// S542: (+1*X5+1*X33) = +X5<<0 +X33<<0 
wire sub_exp542; 
assign sub_exp542 = mds_in0[4] ^ mds_in4[0]; 

// S543: (+1*X47+1*X50) = +X50<<0 +X47<<0 
wire sub_exp543; 
assign sub_exp543 = mds_in6[1] ^ mds_in5[6]; 

// S544: (+1*X5+1*X33+1*X52) = +S542<<0 +X52<<0 
wire sub_exp544; 
assign sub_exp544 = sub_exp542 ^ mds_in6[3]; 

// S545: (+1*X6+1*X26+1*X47+1*X50) = +S14<<0 +S543<<0 
wire sub_exp545; 
assign sub_exp545 = sub_exp14 ^ sub_exp543; 

// S546: (+1*X5+1*X13+1*X24+1*X33+1*X52) = +S544<<0 +S25<<0 
wire sub_exp546; 
assign sub_exp546 = sub_exp544 ^ sub_exp25; 

// S547: (+1*X6+1*X20+1*X23+1*X26+1*X31+1*X47+1*X50) = +S237<<0 +S545<<0 
wire sub_exp547; 
assign sub_exp547 = sub_exp237 ^ sub_exp545; 

// S548: (+1*X5+1*X13+1*X14+1*X24+1*X25+1*X33+1*X35+1*X52) = +S546<<0 +S250<<0 
wire sub_exp548; 
assign sub_exp548 = sub_exp546 ^ sub_exp250; 

// S549: (+1*X5+1*X6+1*X13+1*X14+1*X20+1*X23+1*X24+1*X25+1*X26+1*X31+1*X33+1*X35+1*X47+1*X50+1*X52) = +S548<<0 +S547<<0 
wire sub_exp549; 
assign sub_exp549 = sub_exp548 ^ sub_exp547; 

// S550: (+1*X15+1*X17+1*X21+1*X22+1*X32+1*X41+1*X44+1*X51+1*X55+1*X59+1*X64) = +S223<<0 +S168<<0 
wire sub_exp550; 
assign sub_exp550 = sub_exp223 ^ sub_exp168; 

// S551: (+1*X3+1*X5+1*X6+1*X10+1*X13+1*X14+1*X18+1*X20+1*X23+1*X24+1*X25+1*X26+1*X31+1*X33+1*X35+1*X45+1*X47+1*X50+1*X52+1*X56+1*X57+1*X62) = +S549<<0 +S230<<0 
wire sub_exp551; 
assign sub_exp551 = sub_exp549 ^ sub_exp230; 

// O40: (+1*X3+1*X5+1*X6+1*X10+1*X13+1*X14+1*X15+1*X17+1*X18+1*X20+1*X21+1*X22+1*X23+1*X24+1*X25+1*X26+1*X31+1*X32+1*X33+1*X35+1*X41+1*X44+1*X45+1*X47+1*X50+1*X51+1*X52+1*X55+1*X56+1*X57+1*X59+1*X62+1*X64) = +S551<<0 +S550<<0 
assign mds_out4[7] = sub_exp551 ^ sub_exp550; 

// S552: (+1*X54+1*X56) = +X54<<0 +X56<<0 
wire sub_exp552; 
assign sub_exp552 = mds_in6[5] ^ mds_in6[7]; 

// S553: (+1*X12+1*X23+1*X53+1*X54+1*X56+1*X64) = +S552<<0 +S49<<0 
wire sub_exp553; 
assign sub_exp553 = sub_exp552 ^ sub_exp49; 

// S554: (+1*X2+1*X4+1*X15+1*X26+1*X29+1*X32+1*X40) = +S193<<0 +S130<<0 
wire sub_exp554; 
assign sub_exp554 = sub_exp193 ^ sub_exp130; 

// S555: (+1*X2+1*X4+1*X12+1*X15+1*X23+1*X26+1*X29+1*X32+1*X40+1*X53+1*X54+1*X56+1*X64) = +S553<<0 +S554<<0 
wire sub_exp555; 
assign sub_exp555 = sub_exp553 ^ sub_exp554; 

// S556: (+1*X9+1*X14+1*X19+1*X25+1*X30+1*X31+1*X34+1*X35+1*X41+1*X44+1*X50+1*X61) = +S233<<0 +S135<<0 
wire sub_exp556; 
assign sub_exp556 = sub_exp233 ^ sub_exp135; 

// S557: (+1*X2+1*X4+1*X9+1*X12+1*X14+1*X15+1*X19+1*X23+1*X25+1*X26+1*X29+1*X30+1*X31+1*X32+1*X34+1*X35+1*X40+1*X41+1*X44+1*X50+1*X53+1*X54+1*X56+1*X61+1*X64) = +S555<<0 +S556<<0 
wire sub_exp557; 
assign sub_exp557 = sub_exp555 ^ sub_exp556; 

// O41: (+1*X2+1*X4+1*X7+1*X9+1*X12+1*X14+1*X15+1*X17+1*X19+1*X22+1*X23+1*X24+1*X25+1*X26+1*X27+1*X29+1*X30+1*X31+1*X32+1*X34+1*X35+1*X40+1*X41+1*X42+1*X44+1*X49+1*X50+1*X53+1*X54+1*X56+1*X59+1*X60+1*X61+1*X64) = +S557<<0 +S251<<0 
assign mds_out5[0] = sub_exp557 ^ sub_exp251; 

// S558: (+1*X9+1*X10+1*X54+1*X55+1*X60) = +S109<<0 +S134<<0 
wire sub_exp558; 
assign sub_exp558 = sub_exp109 ^ sub_exp134; 

// S559: (+1*X5+1*X9+1*X10+1*X16+1*X51+1*X54+1*X55+1*X60) = +S558<<0 +S163<<0 
wire sub_exp559; 
assign sub_exp559 = sub_exp558 ^ sub_exp163; 

// S560: (+1*X5+1*X9+1*X10+1*X16+1*X25+1*X30+1*X35+1*X42+1*X50+1*X51+1*X54+1*X55+1*X60) = +S559<<0 +S132<<0 
wire sub_exp560; 
assign sub_exp560 = sub_exp559 ^ sub_exp132; 

// S561: (+1*X3+1*X13+1*X15+1*X18+1*X24+1*X26+1*X27+1*X28+1*X32+1*X33+1*X43+1*X45+1*X57+1*X62) = +S218<<0 +S207<<0 
wire sub_exp561; 
assign sub_exp561 = sub_exp218 ^ sub_exp207; 

// S562: (+1*X5+1*X8+1*X9+1*X10+1*X16+1*X20+1*X23+1*X25+1*X30+1*X31+1*X35+1*X36+1*X42+1*X50+1*X51+1*X54+1*X55+1*X60+1*X61) = +S560<<0 +S219<<0 
wire sub_exp562; 
assign sub_exp562 = sub_exp560 ^ sub_exp219; 

// O42: (+1*X3+1*X5+1*X8+1*X9+1*X10+1*X13+1*X15+1*X16+1*X18+1*X20+1*X23+1*X24+1*X25+1*X26+1*X27+1*X28+1*X30+1*X31+1*X32+1*X33+1*X35+1*X36+1*X42+1*X43+1*X45+1*X50+1*X51+1*X54+1*X55+1*X57+1*X60+1*X61+1*X62) = +S562<<0 +S561<<0 
assign mds_out5[1] = sub_exp562 ^ sub_exp561; 

// S563: (+1*X11+1*X16+1*X58) = +X58<<0 +S48<<0 
wire sub_exp563; 
assign sub_exp563 = mds_in7[1] ^ sub_exp48; 

// S564: (+1*X15+1*X28+1*X57+1*X62) = +S211<<0 +S60<<0 
wire sub_exp564; 
assign sub_exp564 = sub_exp211 ^ sub_exp60; 

// S565: (+1*X11+1*X16+1*X40+1*X43+1*X58) = +S563<<0 +S242<<0 
wire sub_exp565; 
assign sub_exp565 = sub_exp563 ^ sub_exp242; 

// S566: (+1*X2+1*X15+1*X28+1*X41+1*X46+1*X51+1*X57+1*X62) = +S564<<0 +S34<<0 
wire sub_exp566; 
assign sub_exp566 = sub_exp564 ^ sub_exp34; 

// S567: (+1*X2+1*X11+1*X15+1*X16+1*X28+1*X40+1*X41+1*X43+1*X46+1*X51+1*X57+1*X58+1*X62) = +S565<<0 +S566<<0 
wire sub_exp567; 
assign sub_exp567 = sub_exp565 ^ sub_exp566; 

// S568: (+1*X6+1*X9+1*X12+1*X23+1*X25+1*X30+1*X35+1*X36+1*X37+1*X50+1*X52+1*X53+1*X55+1*X63+1*X64) = +S196<<0 +S191<<0 
wire sub_exp568; 
assign sub_exp568 = sub_exp196 ^ sub_exp191; 

// S569: (+1*X2+1*X6+1*X9+1*X11+1*X12+1*X15+1*X16+1*X23+1*X25+1*X28+1*X30+1*X35+1*X36+1*X37+1*X40+1*X41+1*X43+1*X46+1*X50+1*X51+1*X52+1*X53+1*X55+1*X57+1*X58+1*X62+1*X63+1*X64) = +S567<<0 +S568<<0 
wire sub_exp569; 
assign sub_exp569 = sub_exp567 ^ sub_exp568; 

// O43: (+1*X2+1*X6+1*X7+1*X9+1*X10+1*X11+1*X12+1*X15+1*X16+1*X21+1*X22+1*X23+1*X25+1*X28+1*X30+1*X35+1*X36+1*X37+1*X40+1*X41+1*X42+1*X43+1*X46+1*X49+1*X50+1*X51+1*X52+1*X53+1*X54+1*X55+1*X57+1*X58+1*X59+1*X60+1*X62+1*X63+1*X64) = +S569<<0 +S208<<0 
assign mds_out5[2] = sub_exp569 ^ sub_exp208; 

// S570: (+1*X30+1*X37+1*X55) = +X30<<0 +S133<<0 
wire sub_exp570; 
assign sub_exp570 = mds_in3[5] ^ sub_exp133; 

// S571: (+1*X1+1*X11+1*X13+1*X30+1*X37+1*X55) = +S570<<0 +S72<<0 
wire sub_exp571; 
assign sub_exp571 = sub_exp570 ^ sub_exp72; 

// S572: (+1*X4+1*X10+1*X15+1*X17+1*X27+1*X32+1*X35+1*X40) = +S213<<0 +S203<<0 
wire sub_exp572; 
assign sub_exp572 = sub_exp213 ^ sub_exp203; 

// S573: (+1*X1+1*X9+1*X11+1*X13+1*X14+1*X16+1*X19+1*X30+1*X34+1*X37+1*X52+1*X55+1*X63) = +S571<<0 +S121<<0 
wire sub_exp573; 
assign sub_exp573 = sub_exp571 ^ sub_exp121; 

// S574: (+1*X2+1*X3+1*X8+1*X33+1*X36+1*X38+1*X41+1*X43+1*X47+1*X51+1*X58) = +S190<<0 +S149<<0 
wire sub_exp574; 
assign sub_exp574 = sub_exp190 ^ sub_exp149; 

// S575: (+1*X1+1*X4+1*X9+1*X10+1*X11+1*X13+1*X14+1*X15+1*X16+1*X17+1*X19+1*X27+1*X30+1*X32+1*X34+1*X35+1*X37+1*X40+1*X52+1*X55+1*X63) = +S573<<0 +S572<<0 
wire sub_exp575; 
assign sub_exp575 = sub_exp573 ^ sub_exp572; 

// O44: (+1*X1+1*X2+1*X3+1*X4+1*X8+1*X9+1*X10+1*X11+1*X13+1*X14+1*X15+1*X16+1*X17+1*X19+1*X27+1*X30+1*X32+1*X33+1*X34+1*X35+1*X36+1*X37+1*X38+1*X40+1*X41+1*X43+1*X47+1*X51+1*X52+1*X55+1*X58+1*X63) = +S575<<0 +S574<<0 
assign mds_out5[3] = sub_exp575 ^ sub_exp574; 

// S576: (+1*X38+1*X49) = +X38<<0 +X49<<0 
wire sub_exp576; 
assign sub_exp576 = mds_in4[5] ^ mds_in6[0]; 

// S577: (+1*X38+1*X49+1*X61) = +S576<<0 +X61<<0 
wire sub_exp577; 
assign sub_exp577 = sub_exp576 ^ mds_in7[4]; 

// S578: (+1*X3+1*X10+1*X54+1*X57) = +S10<<0 +S7<<0 
wire sub_exp578; 
assign sub_exp578 = sub_exp10 ^ sub_exp7; 

// S579: (+1*X22+1*X23+1*X36+1*X52) = +S261<<0 +S62<<0 
wire sub_exp579; 
assign sub_exp579 = sub_exp261 ^ sub_exp62; 

// S580: (+1*X3+1*X10+1*X38+1*X49+1*X54+1*X57+1*X61) = +S577<<0 +S578<<0 
wire sub_exp580; 
assign sub_exp580 = sub_exp577 ^ sub_exp578; 

// S581: (+1*X5+1*X16+1*X22+1*X23+1*X28+1*X36+1*X39+1*X52) = +S579<<0 +S51<<0 
wire sub_exp581; 
assign sub_exp581 = sub_exp579 ^ sub_exp51; 

// S582: (+1*X18+1*X19+1*X24+1*X26+1*X27+1*X32) = +S103<<0 +S100<<0 
wire sub_exp582; 
assign sub_exp582 = sub_exp103 ^ sub_exp100; 

// S583: (+1*X11+1*X25+1*X29+1*X30+1*X40+1*X50) = +S254<<0 +S162<<0 
wire sub_exp583; 
assign sub_exp583 = sub_exp254 ^ sub_exp162; 

// S584: (+1*X3+1*X5+1*X10+1*X16+1*X22+1*X23+1*X28+1*X36+1*X38+1*X39+1*X49+1*X52+1*X54+1*X57+1*X61) = +S580<<0 +S581<<0 
wire sub_exp584; 
assign sub_exp584 = sub_exp580 ^ sub_exp581; 

// S585: (+1*X7+1*X18+1*X19+1*X20+1*X24+1*X26+1*X27+1*X32+1*X37+1*X48+1*X60) = +S582<<0 +S85<<0 
wire sub_exp585; 
assign sub_exp585 = sub_exp582 ^ sub_exp85; 

// S586: (+1*X3+1*X5+1*X10+1*X11+1*X16+1*X22+1*X23+1*X25+1*X28+1*X29+1*X30+1*X36+1*X38+1*X39+1*X40+1*X49+1*X50+1*X52+1*X54+1*X57+1*X61) = +S584<<0 +S583<<0 
wire sub_exp586; 
assign sub_exp586 = sub_exp584 ^ sub_exp583; 

// O45: (+1*X3+1*X5+1*X7+1*X10+1*X11+1*X16+1*X18+1*X19+1*X20+1*X22+1*X23+1*X24+1*X25+1*X26+1*X27+1*X28+1*X29+1*X30+1*X32+1*X36+1*X37+1*X38+1*X39+1*X40+1*X48+1*X49+1*X50+1*X52+1*X54+1*X57+1*X60+1*X61) = +S586<<0 +S585<<0 
assign mds_out5[4] = sub_exp586 ^ sub_exp585; 

// S587: (+1*X24+1*X27+1*X41+1*X51+1*X53) = +S78<<0 +S188<<0 
wire sub_exp587; 
assign sub_exp587 = sub_exp78 ^ sub_exp188; 

// S588: (+1*X24+1*X27+1*X28+1*X29+1*X39+1*X40+1*X41+1*X51+1*X53) = +S587<<0 +S214<<0 
wire sub_exp588; 
assign sub_exp588 = sub_exp587 ^ sub_exp214; 

// S589: (+1*X4+1*X8+1*X9+1*X19+1*X20+1*X21+1*X30+1*X31+1*X50+1*X55+1*X57+1*X61+1*X62) = +S200<<0 +S182<<0 
wire sub_exp589; 
assign sub_exp589 = sub_exp200 ^ sub_exp182; 

// S590: (+1*X4+1*X8+1*X9+1*X19+1*X20+1*X21+1*X24+1*X27+1*X28+1*X29+1*X30+1*X31+1*X39+1*X40+1*X41+1*X50+1*X51+1*X53+1*X55+1*X57+1*X61+1*X62) = +S588<<0 +S589<<0 
wire sub_exp590; 
assign sub_exp590 = sub_exp588 ^ sub_exp589; 

// O46: (+1*X1+1*X4+1*X6+1*X8+1*X9+1*X11+1*X12+1*X19+1*X20+1*X21+1*X23+1*X24+1*X26+1*X27+1*X28+1*X29+1*X30+1*X31+1*X37+1*X38+1*X39+1*X40+1*X41+1*X50+1*X51+1*X53+1*X55+1*X57+1*X58+1*X61+1*X62) = +S590<<0 +S201<<0 
assign mds_out5[5] = sub_exp590 ^ sub_exp201; 

// S591: (+1*X2+1*X57+1*X62) = +X2<<0 +S211<<0 
wire sub_exp591; 
assign sub_exp591 = mds_in0[1] ^ sub_exp211; 

// S592: (+1*X2+1*X7+1*X51+1*X56+1*X57+1*X62) = +S591<<0 +S128<<0 
wire sub_exp592; 
assign sub_exp592 = sub_exp591 ^ sub_exp128; 

// S593: (+1*X2+1*X7+1*X20+1*X21+1*X31+1*X32+1*X51+1*X56+1*X57+1*X62) = +S592<<0 +S236<<0 
wire sub_exp593; 
assign sub_exp593 = sub_exp592 ^ sub_exp236; 

// S594: (+1*X12+1*X17+1*X22+1*X27+1*X28+1*X29+1*X39+1*X40+1*X42+1*X52+1*X63) = +S107<<0 +S82<<0 
wire sub_exp594; 
assign sub_exp594 = sub_exp107 ^ sub_exp82; 

// S595: (+1*X5+1*X10+1*X13+1*X24+1*X25+1*X30+1*X33+1*X38+1*X54+1*X58+1*X59) = +S238<<0 +S192<<0 
wire sub_exp595; 
assign sub_exp595 = sub_exp238 ^ sub_exp192; 

// S596: (+1*X2+1*X7+1*X12+1*X17+1*X20+1*X21+1*X22+1*X27+1*X28+1*X29+1*X31+1*X32+1*X39+1*X40+1*X42+1*X51+1*X52+1*X56+1*X57+1*X62+1*X63) = +S593<<0 +S594<<0 
wire sub_exp596; 
assign sub_exp596 = sub_exp593 ^ sub_exp594; 

// O47: (+1*X2+1*X5+1*X7+1*X10+1*X12+1*X13+1*X17+1*X20+1*X21+1*X22+1*X24+1*X25+1*X27+1*X28+1*X29+1*X30+1*X31+1*X32+1*X33+1*X38+1*X39+1*X40+1*X42+1*X51+1*X52+1*X54+1*X56+1*X57+1*X58+1*X59+1*X62+1*X63) = +S596<<0 +S595<<0 
assign mds_out5[6] = sub_exp596 ^ sub_exp595; 

// S597: (+1*X13+1*X31) = +X13<<0 +X31<<0 
wire sub_exp597; 
assign sub_exp597 = mds_in1[4] ^ mds_in3[6]; 

// S598: (+1*X13+1*X31+1*X41) = +S597<<0 +X41<<0 
wire sub_exp598; 
assign sub_exp598 = sub_exp597 ^ mds_in5[0]; 

// S599: (+1*X25+1*X30+1*X33+1*X43) = +S76<<0 +S8<<0 
wire sub_exp599; 
assign sub_exp599 = sub_exp76 ^ sub_exp8; 

// S600: (+1*X13+1*X31+1*X41+1*X55+1*X60) = +S598<<0 +S134<<0 
wire sub_exp600; 
assign sub_exp600 = sub_exp598 ^ sub_exp134; 

// S601: (+1*X25+1*X29+1*X30+1*X33+1*X40+1*X43+1*X52+1*X63) = +S47<<0 +S599<<0 
wire sub_exp601; 
assign sub_exp601 = sub_exp47 ^ sub_exp599; 

// S602: (+1*X14+1*X22+1*X28+1*X34+1*X39+1*X53+1*X64) = +S281<<0 +S152<<0 
wire sub_exp602; 
assign sub_exp602 = sub_exp281 ^ sub_exp152; 

// S603: (+1*X13+1*X25+1*X29+1*X30+1*X31+1*X33+1*X40+1*X41+1*X43+1*X52+1*X55+1*X60+1*X63) = +S600<<0 +S601<<0 
wire sub_exp603; 
assign sub_exp603 = sub_exp600 ^ sub_exp601; 

// S604: (+1*X3+1*X8+1*X14+1*X22+1*X23+1*X28+1*X34+1*X39+1*X49+1*X53+1*X59+1*X64) = +S171<<0 +S602<<0 
wire sub_exp604; 
assign sub_exp604 = sub_exp171 ^ sub_exp602; 

// S605: (+1*X1+1*X6+1*X11+1*X13+1*X18+1*X21+1*X25+1*X26+1*X29+1*X30+1*X31+1*X32+1*X33+1*X40+1*X41+1*X43+1*X52+1*X55+1*X58+1*X60+1*X63) = +S603<<0 +S205<<0 
wire sub_exp605; 
assign sub_exp605 = sub_exp603 ^ sub_exp205; 

// O48: (+1*X1+1*X3+1*X6+1*X8+1*X11+1*X13+1*X14+1*X18+1*X21+1*X22+1*X23+1*X25+1*X26+1*X28+1*X29+1*X30+1*X31+1*X32+1*X33+1*X34+1*X39+1*X40+1*X41+1*X43+1*X49+1*X52+1*X53+1*X55+1*X58+1*X59+1*X60+1*X63+1*X64) = +S605<<0 +S604<<0 
assign mds_out5[7] = sub_exp605 ^ sub_exp604; 

// S606: (+1*X37+1*X48+1*X64) = +X64<<0 +S29<<0 
wire sub_exp606; 
assign sub_exp606 = mds_in7[7] ^ sub_exp29; 

// S607: (+1*X17+1*X22+1*X27+1*X37+1*X42+1*X48+1*X64) = +S606<<0 +S36<<0 
wire sub_exp607; 
assign sub_exp607 = sub_exp606 ^ sub_exp36; 

// S608: (+1*X4+1*X10+1*X15+1*X17+1*X22+1*X27+1*X32+1*X37+1*X42+1*X48+1*X64) = +S607<<0 +S213<<0 
wire sub_exp608; 
assign sub_exp608 = sub_exp607 ^ sub_exp213; 

// S609: (+1*X3+1*X5+1*X8+1*X20+1*X31+1*X39+1*X52+1*X57+1*X61+1*X62) = +S114<<0 +S71<<0 
wire sub_exp609; 
assign sub_exp609 = sub_exp114 ^ sub_exp71; 

// S610: (+1*X12+1*X23+1*X25+1*X30+1*X33+1*X34+1*X35+1*X38+1*X40+1*X43+1*X49+1*X50+1*X58) = +S267<<0 +S266<<0 
wire sub_exp610; 
assign sub_exp610 = sub_exp267 ^ sub_exp266; 

// S611: (+1*X3+1*X4+1*X5+1*X8+1*X10+1*X15+1*X17+1*X20+1*X22+1*X27+1*X31+1*X32+1*X37+1*X39+1*X42+1*X48+1*X52+1*X57+1*X61+1*X62+1*X64) = +S608<<0 +S609<<0 
wire sub_exp611; 
assign sub_exp611 = sub_exp608 ^ sub_exp609; 

// O49: (+1*X3+1*X4+1*X5+1*X8+1*X10+1*X12+1*X15+1*X17+1*X20+1*X22+1*X23+1*X25+1*X27+1*X30+1*X31+1*X32+1*X33+1*X34+1*X35+1*X37+1*X38+1*X39+1*X40+1*X42+1*X43+1*X48+1*X49+1*X50+1*X52+1*X57+1*X58+1*X61+1*X62+1*X64) = +S611<<0 +S610<<0 
assign mds_out6[0] = sub_exp611 ^ sub_exp610; 

// S612: (+1*X17+1*X21+1*X32) = +X17<<0 +S27<<0 
wire sub_exp612; 
assign sub_exp612 = mds_in2[0] ^ sub_exp27; 

// S613: (+1*X4+1*X17+1*X21+1*X32+1*X63) = +S612<<0 +S215<<0 
wire sub_exp613; 
assign sub_exp613 = sub_exp612 ^ sub_exp215; 

// S614: (+1*X1+1*X6+1*X11+1*X26+1*X34+1*X35+1*X40) = +S105<<0 +S38<<0 
wire sub_exp614; 
assign sub_exp614 = sub_exp105 ^ sub_exp38; 

// S615: (+1*X4+1*X13+1*X17+1*X21+1*X24+1*X32+1*X59+1*X63) = +S613<<0 +S165<<0 
wire sub_exp615; 
assign sub_exp615 = sub_exp613 ^ sub_exp165; 

// S616: (+1*X1+1*X4+1*X6+1*X11+1*X13+1*X17+1*X21+1*X24+1*X26+1*X32+1*X34+1*X35+1*X40+1*X59+1*X63) = +S615<<0 +S614<<0 
wire sub_exp616; 
assign sub_exp616 = sub_exp615 ^ sub_exp614; 

// S617: (+1*X18+1*X23+1*X33+1*X36+1*X38+1*X41+1*X43+1*X50+1*X51+1*X53+1*X58+1*X62) = +S172<<0 +S102<<0 
wire sub_exp617; 
assign sub_exp617 = sub_exp172 ^ sub_exp102; 

// S618: (+1*X1+1*X4+1*X5+1*X6+1*X11+1*X13+1*X16+1*X17+1*X21+1*X24+1*X26+1*X28+1*X31+1*X32+1*X34+1*X35+1*X39+1*X40+1*X44+1*X59+1*X63) = +S616<<0 +S240<<0 
wire sub_exp618; 
assign sub_exp618 = sub_exp616 ^ sub_exp240; 

// O50: (+1*X1+1*X4+1*X5+1*X6+1*X11+1*X13+1*X16+1*X17+1*X18+1*X21+1*X23+1*X24+1*X26+1*X28+1*X31+1*X32+1*X33+1*X34+1*X35+1*X36+1*X38+1*X39+1*X40+1*X41+1*X43+1*X44+1*X50+1*X51+1*X53+1*X58+1*X59+1*X62+1*X63) = +S618<<0 +S617<<0 
assign mds_out6[1] = sub_exp618 ^ sub_exp617; 

// S619: (+1*X1+1*X6) = +X1<<0 +X6<<0 
wire sub_exp619; 
assign sub_exp619 = mds_in0[0] ^ mds_in0[5]; 

// S620: (+1*X1+1*X6+1*X14) = +S619<<0 +X14<<0 
wire sub_exp620; 
assign sub_exp620 = sub_exp619 ^ mds_in1[5]; 

// S621: (+1*X19+1*X24+1*X48+1*X51) = +S170<<0 +S54<<0 
wire sub_exp621; 
assign sub_exp621 = sub_exp170 ^ sub_exp54; 

// S622: (+1*X17+1*X29+1*X45+1*X63) = +S276<<0 +S244<<0 
wire sub_exp622; 
assign sub_exp622 = sub_exp276 ^ sub_exp244; 

// S623: (+1*X1+1*X2+1*X6+1*X14+1*X44) = +S620<<0 +S279<<0 
wire sub_exp623; 
assign sub_exp623 = sub_exp620 ^ sub_exp279; 

// S624: (+1*X19+1*X24+1*X33+1*X38+1*X43+1*X48+1*X51+1*X58) = +S621<<0 +S35<<0 
wire sub_exp624; 
assign sub_exp624 = sub_exp621 ^ sub_exp35; 

// S625: (+1*X1+1*X2+1*X6+1*X14+1*X17+1*X29+1*X44+1*X45+1*X63) = +S623<<0 +S622<<0 
wire sub_exp625; 
assign sub_exp625 = sub_exp623 ^ sub_exp622; 

// S626: (+1*X7+1*X10+1*X19+1*X24+1*X33+1*X38+1*X43+1*X48+1*X49+1*X51+1*X54+1*X58+1*X59+1*X60) = +S111<<0 +S624<<0 
wire sub_exp626; 
assign sub_exp626 = sub_exp111 ^ sub_exp624; 

// S627: (+1*X3+1*X4+1*X8+1*X15+1*X18+1*X20+1*X23+1*X30+1*X31+1*X36+1*X50+1*X57+1*X61+1*X62) = +S277<<0 +S219<<0 
wire sub_exp627; 
assign sub_exp627 = sub_exp277 ^ sub_exp219; 

// S628: (+1*X1+1*X2+1*X6+1*X7+1*X10+1*X14+1*X17+1*X19+1*X24+1*X29+1*X33+1*X38+1*X43+1*X44+1*X45+1*X48+1*X49+1*X51+1*X54+1*X58+1*X59+1*X60+1*X63) = +S625<<0 +S626<<0 
wire sub_exp628; 
assign sub_exp628 = sub_exp625 ^ sub_exp626; 

// O51: (+1*X1+1*X2+1*X3+1*X4+1*X6+1*X7+1*X8+1*X10+1*X14+1*X15+1*X17+1*X18+1*X19+1*X20+1*X23+1*X24+1*X29+1*X30+1*X31+1*X33+1*X36+1*X38+1*X43+1*X44+1*X45+1*X48+1*X49+1*X50+1*X51+1*X54+1*X57+1*X58+1*X59+1*X60+1*X61+1*X62+1*X63) = +S628<<0 +S627<<0 
assign mds_out6[2] = sub_exp628 ^ sub_exp627; 

// S629: (+1*X18+1*X25+1*X35) = +X18<<0 +S3<<0 
wire sub_exp629; 
assign sub_exp629 = mds_in2[1] ^ sub_exp3; 

// S630: (+1*X2+1*X18+1*X25+1*X35+1*X41+1*X46+1*X51) = +S629<<0 +S34<<0 
wire sub_exp630; 
assign sub_exp630 = sub_exp629 ^ sub_exp34; 

// S631: (+1*X9+1*X12+1*X19+1*X21+1*X23+1*X40) = +S81<<0 +S66<<0 
wire sub_exp631; 
assign sub_exp631 = sub_exp81 ^ sub_exp66; 

// S632: (+1*X10+1*X11+1*X16+1*X43+1*X45+1*X48+1*X63) = +S189<<0 +S127<<0 
wire sub_exp632; 
assign sub_exp632 = sub_exp189 ^ sub_exp127; 

// S633: (+1*X2+1*X18+1*X25+1*X35+1*X38+1*X41+1*X44+1*X46+1*X51+1*X55) = +S630<<0 +S252<<0 
wire sub_exp633; 
assign sub_exp633 = sub_exp630 ^ sub_exp252; 

// S634: (+1*X9+1*X10+1*X11+1*X12+1*X16+1*X19+1*X21+1*X23+1*X40+1*X43+1*X45+1*X48+1*X63) = +S632<<0 +S631<<0 
wire sub_exp634; 
assign sub_exp634 = sub_exp632 ^ sub_exp631; 

// S635: (+1*X2+1*X9+1*X10+1*X11+1*X12+1*X16+1*X18+1*X19+1*X21+1*X23+1*X25+1*X35+1*X38+1*X40+1*X41+1*X43+1*X44+1*X45+1*X46+1*X48+1*X51+1*X55+1*X63) = +S633<<0 +S634<<0 
wire sub_exp635; 
assign sub_exp635 = sub_exp633 ^ sub_exp634; 

// O52: (+1*X2+1*X7+1*X9+1*X10+1*X11+1*X12+1*X16+1*X17+1*X18+1*X19+1*X21+1*X22+1*X23+1*X24+1*X25+1*X27+1*X35+1*X38+1*X40+1*X41+1*X42+1*X43+1*X44+1*X45+1*X46+1*X48+1*X49+1*X51+1*X55+1*X59+1*X60+1*X63) = +S635<<0 +S251<<0 
assign mds_out6[3] = sub_exp635 ^ sub_exp251; 

// S636: (+1*X1+1*X11+1*X46) = +X46<<0 +S4<<0 
wire sub_exp636; 
assign sub_exp636 = mds_in5[5] ^ sub_exp4; 

// S637: (+1*X30+1*X31+1*X44+1*X60) = +S217<<0 +S64<<0 
wire sub_exp637; 
assign sub_exp637 = sub_exp217 ^ sub_exp64; 

// S638: (+1*X1+1*X11+1*X13+1*X24+1*X36+1*X46+1*X47) = +S636<<0 +S41<<0 
wire sub_exp638; 
assign sub_exp638 = sub_exp636 ^ sub_exp41; 

// S639: (+1*X26+1*X27+1*X30+1*X31+1*X32+1*X44+1*X60) = +S100<<0 +S637<<0 
wire sub_exp639; 
assign sub_exp639 = sub_exp100 ^ sub_exp637; 

// S640: (+1*X5+1*X33+1*X34+1*X35+1*X38+1*X40+1*X58) = +S239<<0 +S164<<0 
wire sub_exp640; 
assign sub_exp640 = sub_exp239 ^ sub_exp164; 

// S641: (+1*X1+1*X11+1*X13+1*X24+1*X26+1*X27+1*X30+1*X31+1*X32+1*X36+1*X44+1*X46+1*X47+1*X60) = +S638<<0 +S639<<0 
wire sub_exp641; 
assign sub_exp641 = sub_exp638 ^ sub_exp639; 

// S642: (+1*X4+1*X5+1*X15+1*X28+1*X33+1*X34+1*X35+1*X38+1*X40+1*X45+1*X56+1*X58) = +S640<<0 +S87<<0 
wire sub_exp642; 
assign sub_exp642 = sub_exp640 ^ sub_exp87; 

// S643: (+1*X1+1*X11+1*X13+1*X18+1*X19+1*X24+1*X26+1*X27+1*X30+1*X31+1*X32+1*X36+1*X37+1*X44+1*X46+1*X47+1*X48+1*X57+1*X60+1*X62) = +S641<<0 +S176<<0 
wire sub_exp643; 
assign sub_exp643 = sub_exp641 ^ sub_exp176; 

// O53: (+1*X1+1*X4+1*X5+1*X11+1*X13+1*X15+1*X18+1*X19+1*X24+1*X26+1*X27+1*X28+1*X30+1*X31+1*X32+1*X33+1*X34+1*X35+1*X36+1*X37+1*X38+1*X40+1*X44+1*X45+1*X46+1*X47+1*X48+1*X56+1*X57+1*X58+1*X60+1*X62) = +S643<<0 +S642<<0 
assign mds_out6[4] = sub_exp643 ^ sub_exp642; 

// S644: (+1*X32+1*X49+1*X59) = +X32<<0 +S2<<0 
wire sub_exp644; 
assign sub_exp644 = mds_in3[7] ^ sub_exp2; 

// S645: (+1*X12+1*X32+1*X49+1*X59+1*X63) = +S644<<0 +S61<<0 
wire sub_exp645; 
assign sub_exp645 = sub_exp644 ^ sub_exp61; 

// S646: (+1*X1+1*X29+1*X36+1*X37+1*X47+1*X48) = +S265<<0 +S249<<0 
wire sub_exp646; 
assign sub_exp646 = sub_exp265 ^ sub_exp249; 

// S647: (+1*X12+1*X17+1*X27+1*X32+1*X35+1*X38+1*X49+1*X58+1*X59+1*X63) = +S645<<0 +S227<<0 
wire sub_exp647; 
assign sub_exp647 = sub_exp645 ^ sub_exp227; 

// S648: (+1*X1+1*X5+1*X6+1*X16+1*X28+1*X29+1*X36+1*X37+1*X39+1*X45+1*X47+1*X48) = +S646<<0 +S247<<0 
wire sub_exp648; 
assign sub_exp648 = sub_exp646 ^ sub_exp247; 

// S649: (+1*X2+1*X9+1*X12+1*X14+1*X17+1*X19+1*X20+1*X27+1*X31+1*X32+1*X34+1*X35+1*X38+1*X46+1*X49+1*X58+1*X59+1*X61+1*X63) = +S647<<0 +S154<<0 
wire sub_exp649; 
assign sub_exp649 = sub_exp647 ^ sub_exp154; 

// O54: (+1*X1+1*X2+1*X5+1*X6+1*X9+1*X12+1*X14+1*X16+1*X17+1*X19+1*X20+1*X27+1*X28+1*X29+1*X31+1*X32+1*X34+1*X35+1*X36+1*X37+1*X38+1*X39+1*X45+1*X46+1*X47+1*X48+1*X49+1*X58+1*X59+1*X61+1*X63) = +S649<<0 +S648<<0 
assign mds_out6[5] = sub_exp649 ^ sub_exp648; 

// S650: (+1*X3+1*X6) = +X3<<0 +X6<<0 
wire sub_exp650; 
assign sub_exp650 = mds_in0[2] ^ mds_in0[5]; 

// S651: (+1*X3+1*X6+1*X10) = +S650<<0 +X10<<0 
wire sub_exp651; 
assign sub_exp651 = sub_exp650 ^ mds_in1[1]; 

// S652: (+1*X3+1*X6+1*X10+1*X18+1*X62) = +S651<<0 +S15<<0 
wire sub_exp652; 
assign sub_exp652 = sub_exp651 ^ sub_exp15; 

// S653: (+1*X13+1*X15+1*X33+1*X38+1*X59+1*X64) = +S137<<0 +S119<<0 
wire sub_exp653; 
assign sub_exp653 = sub_exp137 ^ sub_exp119; 

// S654: (+1*X2+1*X21+1*X28+1*X29+1*X32+1*X39+1*X40+1*X46) = +S214<<0 +S140<<0 
wire sub_exp654; 
assign sub_exp654 = sub_exp214 ^ sub_exp140; 

// S655: (+1*X1+1*X3+1*X6+1*X10+1*X18+1*X36+1*X47+1*X62) = +S652<<0 +S249<<0 
wire sub_exp655; 
assign sub_exp655 = sub_exp652 ^ sub_exp249; 

// S656: (+1*X1+1*X3+1*X6+1*X7+1*X10+1*X18+1*X20+1*X36+1*X37+1*X47+1*X48+1*X60+1*X62) = +S655<<0 +S85<<0 
wire sub_exp656; 
assign sub_exp656 = sub_exp655 ^ sub_exp85; 

// S657: (+1*X13+1*X15+1*X25+1*X30+1*X33+1*X35+1*X38+1*X41+1*X50+1*X59+1*X64) = +S135<<0 +S653<<0 
wire sub_exp657; 
assign sub_exp657 = sub_exp135 ^ sub_exp653; 

// S658: (+1*X1+1*X2+1*X3+1*X6+1*X7+1*X10+1*X18+1*X20+1*X21+1*X28+1*X29+1*X32+1*X36+1*X37+1*X39+1*X40+1*X46+1*X47+1*X48+1*X60+1*X62) = +S656<<0 +S654<<0 
wire sub_exp658; 
assign sub_exp658 = sub_exp656 ^ sub_exp654; 

// O55: (+1*X1+1*X2+1*X3+1*X6+1*X7+1*X10+1*X13+1*X15+1*X18+1*X20+1*X21+1*X25+1*X28+1*X29+1*X30+1*X32+1*X33+1*X35+1*X36+1*X37+1*X38+1*X39+1*X40+1*X41+1*X46+1*X47+1*X48+1*X50+1*X59+1*X60+1*X62+1*X64) = +S658<<0 +S657<<0 
assign mds_out6[6] = sub_exp658 ^ sub_exp657; 

// S659: (+1*X30+1*X39) = +X30<<0 +X39<<0 
wire sub_exp659; 
assign sub_exp659 = mds_in3[5] ^ mds_in4[6]; 

// S660: (+1*X30+1*X39+1*X41+1*X51) = +S659<<0 +S5<<0 
wire sub_exp660; 
assign sub_exp660 = sub_exp659 ^ sub_exp5; 

// S661: (+1*X33+1*X36+1*X38+1*X47) = +S79<<0 +S19<<0 
wire sub_exp661; 
assign sub_exp661 = sub_exp79 ^ sub_exp19; 

// S662: (+1*X4+1*X21+1*X49+1*X63) = +S215<<0 +S148<<0 
wire sub_exp662; 
assign sub_exp662 = sub_exp215 ^ sub_exp148; 

// S663: (+1*X30+1*X33+1*X36+1*X38+1*X39+1*X41+1*X47+1*X51) = +S660<<0 +S661<<0 
wire sub_exp663; 
assign sub_exp663 = sub_exp660 ^ sub_exp661; 

// S664: (+1*X2+1*X7+1*X29+1*X37+1*X40+1*X48+1*X60) = +S130<<0 +S53<<0 
wire sub_exp664; 
assign sub_exp664 = sub_exp130 ^ sub_exp53; 

// S665: (+1*X4+1*X8+1*X21+1*X22+1*X42+1*X49+1*X61+1*X63) = +S158<<0 +S662<<0 
wire sub_exp665; 
assign sub_exp665 = sub_exp158 ^ sub_exp662; 

// S666: (+1*X2+1*X7+1*X29+1*X30+1*X33+1*X36+1*X37+1*X38+1*X39+1*X40+1*X41+1*X47+1*X48+1*X51+1*X60) = +S663<<0 +S664<<0 
wire sub_exp666; 
assign sub_exp666 = sub_exp663 ^ sub_exp664; 

// S667: (+1*X4+1*X8+1*X9+1*X14+1*X19+1*X21+1*X22+1*X26+1*X34+1*X42+1*X49+1*X61+1*X63) = +S665<<0 +S122<<0 
wire sub_exp667; 
assign sub_exp667 = sub_exp665 ^ sub_exp122; 

// S668: (+1*X2+1*X3+1*X7+1*X11+1*X16+1*X29+1*X30+1*X31+1*X33+1*X36+1*X37+1*X38+1*X39+1*X40+1*X41+1*X47+1*X48+1*X51+1*X57+1*X60) = +S666<<0 +S184<<0 
wire sub_exp668; 
assign sub_exp668 = sub_exp666 ^ sub_exp184; 

// O56: (+1*X2+1*X3+1*X4+1*X7+1*X8+1*X9+1*X11+1*X14+1*X16+1*X19+1*X21+1*X22+1*X26+1*X29+1*X30+1*X31+1*X33+1*X34+1*X36+1*X37+1*X38+1*X39+1*X40+1*X41+1*X42+1*X47+1*X48+1*X49+1*X51+1*X57+1*X60+1*X61+1*X63) = +S668<<0 +S667<<0 
assign mds_out6[7] = sub_exp668 ^ sub_exp667; 

// S669: (+1*X8+1*X57) = +X8<<0 +X57<<0 
wire sub_exp669; 
assign sub_exp669 = mds_in0[7] ^ mds_in7[0]; 

// S670: (+1*X8+1*X18+1*X45+1*X56+1*X57) = +S669<<0 +S195<<0 
wire sub_exp670; 
assign sub_exp670 = sub_exp669 ^ sub_exp195; 

// S671: (+1*X5+1*X6+1*X8+1*X16+1*X18+1*X28+1*X39+1*X45+1*X56+1*X57) = +S670<<0 +S77<<0 
wire sub_exp671; 
assign sub_exp671 = sub_exp670 ^ sub_exp77; 

// S672: (+1*X1+1*X2+1*X11+1*X13+1*X20+1*X31+1*X41+1*X46+1*X47+1*X48+1*X51+1*X60) = +S123<<0 +S116<<0 
wire sub_exp672; 
assign sub_exp672 = sub_exp123 ^ sub_exp116; 

// S673: (+1*X12+1*X23+1*X25+1*X30+1*X33+1*X35+1*X38+1*X40+1*X42+1*X43+1*X50+1*X58) = +S132<<0 +S131<<0 
wire sub_exp673; 
assign sub_exp673 = sub_exp132 ^ sub_exp131; 

// S674: (+1*X1+1*X2+1*X5+1*X6+1*X8+1*X11+1*X13+1*X16+1*X18+1*X20+1*X28+1*X31+1*X39+1*X41+1*X45+1*X46+1*X47+1*X48+1*X51+1*X56+1*X57+1*X60) = +S671<<0 +S672<<0 
wire sub_exp674; 
assign sub_exp674 = sub_exp671 ^ sub_exp672; 

// O57: (+1*X1+1*X2+1*X5+1*X6+1*X8+1*X11+1*X12+1*X13+1*X16+1*X18+1*X20+1*X23+1*X25+1*X28+1*X30+1*X31+1*X33+1*X35+1*X38+1*X39+1*X40+1*X41+1*X42+1*X43+1*X45+1*X46+1*X47+1*X48+1*X50+1*X51+1*X56+1*X57+1*X58+1*X60) = +S674<<0 +S673<<0 
assign mds_out7[0] = sub_exp674 ^ sub_exp673; 

// S675: (+1*X12+1*X25) = +X12<<0 +X25<<0 
wire sub_exp675; 
assign sub_exp675 = mds_in1[3] ^ mds_in3[0]; 

// S676: (+1*X12+1*X25+1*X42+1*X43+1*X48) = +S675<<0 +S91<<0 
wire sub_exp676; 
assign sub_exp676 = sub_exp675 ^ sub_exp91; 

// S677: (+1*X12+1*X21+1*X25+1*X32+1*X42+1*X43+1*X48+1*X58) = +S676<<0 +S138<<0 
wire sub_exp677; 
assign sub_exp677 = sub_exp676 ^ sub_exp138; 

// S678: (+1*X12+1*X13+1*X21+1*X24+1*X25+1*X32+1*X36+1*X39+1*X42+1*X43+1*X47+1*X48+1*X52+1*X58) = +S677<<0 +S216<<0 
wire sub_exp678; 
assign sub_exp678 = sub_exp677 ^ sub_exp216; 

// S679: (+1*X2+1*X7+1*X9+1*X14+1*X19+1*X29+1*X31+1*X34+1*X40+1*X41+1*X44+1*X46+1*X51+1*X61) = +S233<<0 +S232<<0 
wire sub_exp679; 
assign sub_exp679 = sub_exp233 ^ sub_exp232; 

// S680: (+1*X3+1*X6+1*X12+1*X13+1*X21+1*X24+1*X25+1*X26+1*X32+1*X36+1*X39+1*X42+1*X43+1*X47+1*X48+1*X49+1*X52+1*X58+1*X59) = +S678<<0 +S234<<0 
wire sub_exp680; 
assign sub_exp680 = sub_exp678 ^ sub_exp234; 

// O58: (+1*X2+1*X3+1*X6+1*X7+1*X9+1*X12+1*X13+1*X14+1*X19+1*X21+1*X24+1*X25+1*X26+1*X29+1*X31+1*X32+1*X34+1*X36+1*X39+1*X40+1*X41+1*X42+1*X43+1*X44+1*X46+1*X47+1*X48+1*X49+1*X51+1*X52+1*X58+1*X59+1*X61) = +S680<<0 +S679<<0 
assign mds_out7[1] = sub_exp680 ^ sub_exp679; 

// S681: (+1*X14+1*X53) = +X14<<0 +X53<<0 
wire sub_exp681; 
assign sub_exp681 = mds_in1[5] ^ mds_in6[4]; 

// S682: (+1*X14+1*X53+1*X56+1*X59) = +S681<<0 +S180<<0 
wire sub_exp682; 
assign sub_exp682 = sub_exp681 ^ sub_exp180; 

// S683: (+1*X14+1*X22+1*X52+1*X53+1*X56+1*X59) = +S682<<0 +S261<<0 
wire sub_exp683; 
assign sub_exp683 = sub_exp682 ^ sub_exp261; 

// S684: (+1*X2+1*X7+1*X14+1*X22+1*X41+1*X46+1*X51+1*X52+1*X53+1*X56+1*X59) = +S683<<0 +S129<<0 
wire sub_exp684; 
assign sub_exp684 = sub_exp683 ^ sub_exp129; 

// S685: (+1*X3+1*X5+1*X10+1*X16+1*X18+1*X25+1*X28+1*X31+1*X39+1*X44+1*X57+1*X62) = +S240<<0 +S231<<0 
wire sub_exp685; 
assign sub_exp685 = sub_exp240 ^ sub_exp231; 

// S686: (+1*X2+1*X4+1*X7+1*X9+1*X14+1*X15+1*X22+1*X27+1*X32+1*X41+1*X46+1*X51+1*X52+1*X53+1*X56+1*X59) = +S684<<0 +S262<<0 
wire sub_exp686; 
assign sub_exp686 = sub_exp684 ^ sub_exp262; 

// S687: (+1*X1+1*X2+1*X4+1*X6+1*X7+1*X9+1*X11+1*X12+1*X14+1*X15+1*X22+1*X23+1*X26+1*X27+1*X32+1*X37+1*X38+1*X41+1*X46+1*X51+1*X52+1*X53+1*X56+1*X58+1*X59) = +S686<<0 +S201<<0 
wire sub_exp687; 
assign sub_exp687 = sub_exp686 ^ sub_exp201; 

// O59: (+1*X1+1*X2+1*X3+1*X4+1*X5+1*X6+1*X7+1*X9+1*X10+1*X11+1*X12+1*X14+1*X15+1*X16+1*X18+1*X22+1*X23+1*X25+1*X26+1*X27+1*X28+1*X31+1*X32+1*X37+1*X38+1*X39+1*X41+1*X44+1*X46+1*X51+1*X52+1*X53+1*X56+1*X57+1*X58+1*X59+1*X62) = +S687<<0 +S685<<0 
assign mds_out7[2] = sub_exp687 ^ sub_exp685; 

// S688: (+1*X29+1*X53) = +X29<<0 +X53<<0 
wire sub_exp688; 
assign sub_exp688 = mds_in3[4] ^ mds_in6[4]; 

// S689: (+1*X20+1*X29+1*X31+1*X48+1*X53) = +S688<<0 +S89<<0 
wire sub_exp689; 
assign sub_exp689 = sub_exp688 ^ sub_exp89; 

// S690: (+1*X4+1*X15+1*X18+1*X19+1*X24+1*X26+1*X32) = +S193<<0 +S103<<0 
wire sub_exp690; 
assign sub_exp690 = sub_exp193 ^ sub_exp103; 

// S691: (+1*X3+1*X20+1*X29+1*X31+1*X46+1*X48+1*X53+1*X57) = +S689<<0 +S197<<0 
wire sub_exp691; 
assign sub_exp691 = sub_exp689 ^ sub_exp197; 

// S692: (+1*X3+1*X20+1*X25+1*X29+1*X30+1*X31+1*X35+1*X46+1*X48+1*X50+1*X52+1*X53+1*X57+1*X63) = +S691<<0 +S97<<0 
wire sub_exp692; 
assign sub_exp692 = sub_exp691 ^ sub_exp97; 

// S693: (+1*X3+1*X4+1*X15+1*X18+1*X19+1*X20+1*X24+1*X25+1*X26+1*X29+1*X30+1*X31+1*X32+1*X35+1*X46+1*X48+1*X50+1*X52+1*X53+1*X57+1*X63) = +S692<<0 +S690<<0 
wire sub_exp693; 
assign sub_exp693 = sub_exp692 ^ sub_exp690; 

// O60: (+1*X3+1*X4+1*X7+1*X10+1*X15+1*X17+1*X18+1*X19+1*X20+1*X24+1*X25+1*X26+1*X27+1*X29+1*X30+1*X31+1*X32+1*X33+1*X35+1*X43+1*X46+1*X48+1*X49+1*X50+1*X51+1*X52+1*X53+1*X54+1*X56+1*X57+1*X59+1*X63) = +S693<<0 +S288<<0 
assign mds_out7[3] = sub_exp693 ^ sub_exp288; 

// S694: (+1*X9+1*X19+1*X54) = +X54<<0 +S1<<0 
wire sub_exp694; 
assign sub_exp694 = mds_in6[5] ^ sub_exp1; 

// S695: (+1*X2+1*X39+1*X46+1*X52) = +S58<<0 +S9<<0 
wire sub_exp695; 
assign sub_exp695 = sub_exp58 ^ sub_exp9; 

// S696: (+1*X2+1*X9+1*X19+1*X39+1*X46+1*X52+1*X54) = +S694<<0 +S695<<0 
wire sub_exp696; 
assign sub_exp696 = sub_exp694 ^ sub_exp695; 

// S697: (+1*X1+1*X6+1*X26+1*X34+1*X35+1*X40) = +S145<<0 +S105<<0 
wire sub_exp697; 
assign sub_exp697 = sub_exp145 ^ sub_exp105; 

// S698: (+1*X13+1*X27+1*X42+1*X43+1*X45+1*X48+1*X56) = +S206<<0 +S146<<0 
wire sub_exp698; 
assign sub_exp698 = sub_exp206 ^ sub_exp146; 

// S699: (+1*X2+1*X9+1*X12+1*X19+1*X23+1*X36+1*X39+1*X46+1*X52+1*X53+1*X54+1*X64) = +S696<<0 +S83<<0 
wire sub_exp699; 
assign sub_exp699 = sub_exp696 ^ sub_exp83; 

// S700: (+1*X1+1*X6+1*X13+1*X26+1*X27+1*X34+1*X35+1*X40+1*X42+1*X43+1*X45+1*X48+1*X56) = +S698<<0 +S697<<0 
wire sub_exp700; 
assign sub_exp700 = sub_exp698 ^ sub_exp697; 

// S701: (+1*X2+1*X4+1*X9+1*X12+1*X19+1*X21+1*X23+1*X32+1*X36+1*X38+1*X39+1*X41+1*X44+1*X46+1*X52+1*X53+1*X54+1*X55+1*X64) = +S699<<0 +S273<<0 
wire sub_exp701; 
assign sub_exp701 = sub_exp699 ^ sub_exp273; 

// O61: (+1*X1+1*X2+1*X4+1*X6+1*X9+1*X12+1*X13+1*X19+1*X21+1*X23+1*X26+1*X27+1*X32+1*X34+1*X35+1*X36+1*X38+1*X39+1*X40+1*X41+1*X42+1*X43+1*X44+1*X45+1*X46+1*X48+1*X52+1*X53+1*X54+1*X55+1*X56+1*X64) = +S701<<0 +S700<<0 
assign mds_out7[4] = sub_exp701 ^ sub_exp700; 

// S702: (+1*X9+1*X10+1*X40+1*X43+1*X54) = +S109<<0 +S242<<0 
wire sub_exp702; 
assign sub_exp702 = sub_exp109 ^ sub_exp242; 

// S703: (+1*X3+1*X5+1*X44+1*X45+1*X55+1*X56+1*X57) = +S220<<0 +S67<<0 
wire sub_exp703; 
assign sub_exp703 = sub_exp220 ^ sub_exp67; 

// S704: (+1*X3+1*X5+1*X13+1*X14+1*X24+1*X36+1*X44+1*X45+1*X47+1*X55+1*X56+1*X57) = +S65<<0 +S703<<0 
wire sub_exp704; 
assign sub_exp704 = sub_exp65 ^ sub_exp703; 

// S705: (+1*X9+1*X10+1*X17+1*X22+1*X27+1*X28+1*X39+1*X40+1*X42+1*X43+1*X53+1*X54) = +S235<<0 +S702<<0 
wire sub_exp705; 
assign sub_exp705 = sub_exp235 ^ sub_exp702; 

// S706: (+1*X2+1*X3+1*X5+1*X7+1*X13+1*X14+1*X20+1*X24+1*X25+1*X35+1*X36+1*X37+1*X44+1*X45+1*X46+1*X47+1*X55+1*X56+1*X57) = +S704<<0 +S243<<0 
wire sub_exp706; 
assign sub_exp706 = sub_exp704 ^ sub_exp243; 

// O62: (+1*X2+1*X3+1*X5+1*X7+1*X9+1*X10+1*X13+1*X14+1*X17+1*X20+1*X22+1*X24+1*X25+1*X27+1*X28+1*X35+1*X36+1*X37+1*X39+1*X40+1*X42+1*X43+1*X44+1*X45+1*X46+1*X47+1*X53+1*X54+1*X55+1*X56+1*X57) = +S706<<0 +S705<<0 
assign mds_out7[5] = sub_exp706 ^ sub_exp705; 

// S707: (+1*X14+1*X18) = +X14<<0 +X18<<0 
wire sub_exp707; 
assign sub_exp707 = mds_in1[5] ^ mds_in2[1]; 

// S708: (+1*X14+1*X18+1*X37+1*X48) = +S707<<0 +S29<<0 
wire sub_exp708; 
assign sub_exp708 = sub_exp707 ^ sub_exp29; 

// S709: (+1*X3+1*X8+1*X14+1*X18+1*X23+1*X37+1*X48) = +S708<<0 +S126<<0 
wire sub_exp709; 
assign sub_exp709 = sub_exp708 ^ sub_exp126; 

// S710: (+1*X3+1*X8+1*X11+1*X14+1*X18+1*X23+1*X29+1*X37+1*X40+1*X48) = +S709<<0 +S254<<0 
wire sub_exp710; 
assign sub_exp710 = sub_exp709 ^ sub_exp254; 

// S711: (+1*X4+1*X9+1*X10+1*X15+1*X21+1*X28+1*X45+1*X49+1*X54+1*X56) = +S169<<0 +S87<<0 
wire sub_exp711; 
assign sub_exp711 = sub_exp169 ^ sub_exp87; 

// S712: (+1*X3+1*X4+1*X8+1*X9+1*X10+1*X11+1*X14+1*X15+1*X18+1*X21+1*X23+1*X28+1*X29+1*X37+1*X40+1*X45+1*X48+1*X49+1*X54+1*X56) = +S710<<0 +S711<<0 
wire sub_exp712; 
assign sub_exp712 = sub_exp710 ^ sub_exp711; 

// O63: (+1*X3+1*X4+1*X6+1*X8+1*X9+1*X10+1*X11+1*X14+1*X15+1*X18+1*X21+1*X23+1*X26+1*X28+1*X29+1*X33+1*X36+1*X37+1*X38+1*X40+1*X41+1*X43+1*X44+1*X45+1*X46+1*X47+1*X48+1*X49+1*X54+1*X55+1*X56+1*X58) = +S712<<0 +S286<<0 
assign mds_out7[6] = sub_exp712 ^ sub_exp286; 

// S713: (+1*X7+1*X10) = +X7<<0 +X10<<0 
wire sub_exp713; 
assign sub_exp713 = mds_in0[6] ^ mds_in1[1]; 

// S714: (+1*X12+1*X47) = +X47<<0 +X12<<0 
wire sub_exp714; 
assign sub_exp714 = mds_in5[6] ^ mds_in1[3]; 

// S715: (+1*X7+1*X10+1*X12+1*X47) = +S713<<0 +S714<<0 
wire sub_exp715; 
assign sub_exp715 = sub_exp713 ^ sub_exp714; 

// S716: (+1*X5+1*X16+1*X30+1*X50) = +S32<<0 +S16<<0 
wire sub_exp716; 
assign sub_exp716 = sub_exp32 ^ sub_exp16; 

// S717: (+1*X5+1*X7+1*X10+1*X12+1*X16+1*X30+1*X47+1*X50) = +S715<<0 +S716<<0 
wire sub_exp717; 
assign sub_exp717 = sub_exp715 ^ sub_exp716; 

// S718: (+1*X29+1*X37+1*X38+1*X44+1*X48+1*X55) = +S265<<0 +S252<<0 
wire sub_exp718; 
assign sub_exp718 = sub_exp265 ^ sub_exp252; 

// S719: (+1*X5+1*X7+1*X10+1*X12+1*X16+1*X29+1*X30+1*X37+1*X38+1*X44+1*X47+1*X48+1*X50+1*X55) = +S717<<0 +S718<<0 
wire sub_exp719; 
assign sub_exp719 = sub_exp717 ^ sub_exp718; 

// S720: (+1*X4+1*X15+1*X19+1*X24+1*X34+1*X39+1*X41+1*X45+1*X46+1*X56+1*X57) = +S283<<0 +S260<<0 
wire sub_exp720; 
assign sub_exp720 = sub_exp283 ^ sub_exp260; 

// S721: (+1*X1+1*X5+1*X7+1*X10+1*X11+1*X12+1*X16+1*X17+1*X22+1*X27+1*X29+1*X30+1*X37+1*X38+1*X42+1*X44+1*X47+1*X48+1*X49+1*X50+1*X55+1*X59) = +S719<<0 +S284<<0 
wire sub_exp721; 
assign sub_exp721 = sub_exp719 ^ sub_exp284; 

// O64: (+1*X1+1*X4+1*X5+1*X7+1*X10+1*X11+1*X12+1*X15+1*X16+1*X17+1*X19+1*X22+1*X24+1*X27+1*X29+1*X30+1*X34+1*X37+1*X38+1*X39+1*X41+1*X42+1*X44+1*X45+1*X46+1*X47+1*X48+1*X49+1*X50+1*X55+1*X56+1*X57+1*X59) = +S721<<0 +S720<<0 
assign mds_out7[7] = sub_exp721 ^ sub_exp720; 

endmodule 

