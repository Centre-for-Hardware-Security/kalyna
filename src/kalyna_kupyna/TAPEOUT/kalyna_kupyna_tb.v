module kalyna_kupyna_tb ();

parameter BLOCK_SIZE = 128;
parameter KEY_LENGTH = 128;
parameter CODE_LENGTH = 256;

localparam DATA_SIZE = (CODE_LENGTH <= 256) ? 512 : 1024;

//KALYNA
reg block_start, block_mode;
reg [KEY_LENGTH-1:0] key_in;
reg [BLOCK_SIZE-1:0] block_in;
wire [BLOCK_SIZE-1:0] block_out; 

//KUPYNA
reg hash_start, hash_stop;
reg [DATA_SIZE-1:0] hash_in;
wire [CODE_LENGTH-1:0] hash_out;
wire hash_kb_rdy_out;

integer delay;

//KALYNA+KUPYNA
reg clk, rst, kk_sel;
wire kk_rdy;

//DUT
kalyna_kupyna_serial64b_oboc #(.BLOCK_SIZE(BLOCK_SIZE), .KEY_LENGTH(KEY_LENGTH), .CODE_LENGTH(CODE_LENGTH)) dut (
                           .clk(clk), 
                           .rst(rst), 
                           .kk_sel(kk_sel), 
                           .block_start(block_start), 
                           .block_mode(block_mode), 
                           .block_in(block_in), 
                           .key_in(key_in), 
                           .block_out(block_out), 
                           .hash_start(hash_start), 
                           .hash_stop(hash_stop), 
                           .hash_in(hash_in), 
                           .hash_out(hash_out), 
                           .hash_kb_rdy_out(hash_kb_rdy_out), 
                           .kk_rdy(kk_rdy));

//CLK
always begin
  #10 clk = !clk;
end

initial begin
  clk = 1'b0;
  rst = 1'b0;
  hash_stop = 1'b0;
  hash_start = 1'b0;
  hash_in = 512'd0;

  //Encryption
  kk_sel = 1'b0;
  block_mode = 1'b0;
  block_start = 1'b0;
  key_in = 128'h000102030405060708090A0B0C0D0E0F;
  block_in = 128'h101112131415161718191A1B1C1D1E1F;
  #100;

  rst = 1'b1;
  block_start = 1'b1;
  wait (kk_rdy);
  block_start = 1'b0;
  #1;
  if (block_out != 128'h81BF1C7D779BAC20E1C9EA39B4D2AD06) begin
    $display("[ERROR] KALYNA encryption operation has been computed wrong!");
    #10;
    $stop;
  end
  #100;

  //Decryption
  block_mode = 1'b1;
  block_start = 1'b1;
  key_in = 128'h0F0E0D0C0B0A09080706050403020100;
  block_in = 128'h1F1E1D1C1B1A19181716151413121110;
  wait (kk_rdy);
  #1;
  if (block_out != 128'h7291EF2B470CC7846f09C2303973DAD7) begin
    $display("[ERROR] KALYNA decryption operation has been computed wrong!");
    #10;
    $stop;
  end
  #100;

  //KUPYNA
  kk_sel = 1'b1;
  hash_start = 1'b0;
  hash_stop = 1'b0;
  #100;

  hash_in = 512'h000102030405060708090A0B0C0D0E0F101112131415161718191a1B1C1D1E1F202122232425262728292A2B2C2D2E2F303132333435363738393A3B3C3D3E3F;
  hash_start = 1'b1;
  @(negedge hash_kb_rdy_out);
  hash_in = 512'h80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000000;
  hash_stop = 1'b1;
  wait (kk_rdy == 1'b1);
  #1;
  if (hash_out != 256'h08F4EE6F1BE6903B324C4E27990CB24EF69DD58DBE84813EE0A52F6631239875) begin
    $display("[ERROR] KUPYNA hash operation has been computed wrong!");
    #10;
    $stop;
  end

  hash_start = 1'b0;
  hash_stop = 1'b0;
  #100;
  
  hash_in = 512'hFFFFFFFFFFFF80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000000000000000000000;
  hash_start = 1'b1;
  hash_stop = 1'b1;
  wait (kk_rdy == 1'b1);
  #1;
  if (hash_out != 256'hF61C61F8BF3F6A4512FC27FC500A1D92A81BD8CDAB1CE4785216F21756F3BE27) begin
    $display("[ERROR] KUPYNA hash operation has been computed wrong!");
    #10;
    $stop;
  end
  #100;

  hash_start = 1'b0; 
  hash_stop = 1'b0; 
  delay = $urandom_range(1,100); 
  #delay; 

  hash_in = 512'h9C6921E50C270196FD3E801992AF91781414ED5B04EC9FCD96F39D3F0295DEB6394CE0F4A56EC73F8192BA9E455532113EBC2D2EE464CDF2EB6009EE77DB3E1E; 
  hash_start = 1'b1; 
  @(negedge hash_kb_rdy_out); 
  hash_in = 512'hBE995FB1A0ACADC4EB26AD8000000000000000000000000000000000000000000000000000000000000000000000000000000000580200000000000000000000; 
  hash_stop = 1'b1; 
  wait (kk_rdy == 1'b1); 
  #1; 
  if (hash_out != 256'h9615ECB98A8D4D7D8363286214DAB5809FD6CF5D6A18147FDB0B3A765C5B9A70) begin 
    $display("[ERROR] KUPYNA hash operation has been computed wrong!"); 
    #10; 
    $stop; 
  end 
  @(negedge kk_rdy); 
  hash_start = 1'b0; 
  hash_stop = 1'b0; 
  delay = $urandom_range(1,100); 
  #delay; 

  $display("[INFO] KALYNA block cipher and KUPYNA hash functions have been verified!");

  $finish;
end

endmodule

