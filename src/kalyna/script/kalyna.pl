#!/usr/bin/perl

use strict;
use Cwd qw(cwd); 
use lib cwd;
use POSIX();
use warnings;
#use funcpack;
#use diagnostics;
#use Math::Matrix;
use Path::Tiny qw(path);
use Storable qw(dclone);
use Time::HiRes qw(time);
use Term::ANSIColor qw(:constants);

my $arg_ok = 1;
my $arg_cnt = 0;

my $is_gl = 0;
my $is_rem = 0;
my $is_sdc = 0;
my $is_par = 0;
my $the_tb = 0;
my $g0_tech = 1;
my $g1_tech = 5;
my $no_synth = 0;
my $saif_vcd = 0;
my $the_tvla = 0;
my $cad_ver = 23;
my $the_key = "";
my $the_msg = "";
my $the_proc = 0;
my $the_verb = 0;
my $the_cmvm = 0;
my $the_sbox = 0;
my $the_step = 1;
my $clk_per = 10;
my $key_len = 128;
my $msg_file = "";
my $out_file = "";
my $blk_size = 128;
my $sim_time = 1935;
my $num_test = 1000;
my $tb_mode = "enc";
my $the_rst = "high";
my $pow_tool = "innovus";
my $dut_name = "kalyna_enc_block_serial";

#Irreversible Polynomial
my $irr_poly = "11D";

while (1){
  if (defined $ARGV[$arg_cnt]){
    if ($ARGV[$arg_cnt] eq "-h" or $ARGV[$arg_cnt] eq "-help"){
      $arg_ok = 0;
    }
    else {
      if (index($ARGV[$arg_cnt], "-f=") != -1){
        $msg_file = substr($ARGV[$arg_cnt], 3, length($ARGV[$arg_cnt])-3);
      }
      elsif (index($ARGV[$arg_cnt], "-m=") != -1){
        $the_msg = substr($ARGV[$arg_cnt], 3, length($ARGV[$arg_cnt])-3);
      }
      elsif (index($ARGV[$arg_cnt], "-p=") != -1){
        $the_proc = substr($ARGV[$arg_cnt], 3, length($ARGV[$arg_cnt])-3);
        if ($the_proc < 0 or $the_proc > 1){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-c=") != -1){
        $the_cmvm = substr($ARGV[$arg_cnt], 3, length($ARGV[$arg_cnt])-3);
        if ($the_cmvm < 0 or $the_cmvm > 1){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-s=") != -1){
        $the_sbox = substr($ARGV[$arg_cnt], 3, length($ARGV[$arg_cnt])-3);
        if ($the_sbox < 0 or $the_sbox > 1){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-bs=") != -1){
        $blk_size = substr($ARGV[$arg_cnt], 4, length($ARGV[$arg_cnt])-4) + 0;
        if ($blk_size != 128 and $blk_size != 256 and $blk_size != 512){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-kl=") != -1){
        $key_len = substr($ARGV[$arg_cnt], 4, length($ARGV[$arg_cnt])-4) + 0;
        if ($key_len != 128 and $key_len != 256 and $key_len != 512 and $key_len != 1024){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-k=") != -1){
        $the_key = substr($ARGV[$arg_cnt], 3, length($ARGV[$arg_cnt])-3);
      }
      elsif (index($ARGV[$arg_cnt], "-o=") != -1){
        $out_file = substr($ARGV[$arg_cnt], 3, length($ARGV[$arg_cnt])-3);
      }
      elsif (index($ARGV[$arg_cnt], "-tvla") != -1){
        $the_tvla = 1;
      }
      elsif (index($ARGV[$arg_cnt], "-pt=") != -1){
        $pow_tool = substr($ARGV[$arg_cnt], 4, length($ARGV[$arg_cnt])-4);
        if ($pow_tool ne "innovus" and $pow_tool ne "primetime"){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-g0t=") != -1){
        $g0_tech = substr($ARGV[$arg_cnt], 5, length($ARGV[$arg_cnt])-5) + 0;
        if ($g0_tech < 0 or $g0_tech > 1){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-g1t=") != -1){
        $g1_tech = substr($ARGV[$arg_cnt], 5, length($ARGV[$arg_cnt])-5) + 0;
        if ($g1_tech < 0 or $g1_tech > 5){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-step=") != -1){
        $the_step = substr($ARGV[$arg_cnt], 6, length($ARGV[$arg_cnt])-6) + 0;
        if ($the_step <= 0){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-st=") != -1){
        $sim_time = substr($ARGV[$arg_cnt], 4, length($ARGV[$arg_cnt])-4) + 0;
        if ($sim_time <= 0){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-no_synth") != -1){
        $no_synth = 1;
      }
      elsif (index($ARGV[$arg_cnt], "-tb") != -1){
        $the_tb = 1;
      }
      elsif (index($ARGV[$arg_cnt], "-not=") != -1){
        $num_test = substr($ARGV[$arg_cnt], 5, length($ARGV[$arg_cnt])-5) + 0;
        if ($num_test <= 0){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-dut=") != -1){
        $dut_name = substr($ARGV[$arg_cnt], 5, length($ARGV[$arg_cnt])-5) ;
      }
      elsif (index($ARGV[$arg_cnt], "-clk=") != -1){
        $clk_per = substr($ARGV[$arg_cnt], 5, length($ARGV[$arg_cnt])-5) + 0;
        if ($clk_per <= 0){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-rst=") != -1){
        $the_rst = substr($ARGV[$arg_cnt], 5, length($ARGV[$arg_cnt])-5) ;
        if ($the_rst ne "low" and $the_rst ne "high"){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-par") != -1){
        $is_par = 1;
      }
      elsif (index($ARGV[$arg_cnt], "-gl") != -1){
        $is_gl = 1;
      }
      elsif (index($ARGV[$arg_cnt], "-sdc") != -1){
        $is_sdc = 1;
      }
      elsif (index($ARGV[$arg_cnt], "-sf=") != -1){
        $saif_vcd = substr($ARGV[$arg_cnt], 4, length($ARGV[$arg_cnt])-4);
        if ($saif_vcd ne "SAIF" and $saif_vcd ne "VCD"){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-tm") != -1){
        $tb_mode = substr($ARGV[$arg_cnt], 4, length($ARGV[$arg_cnt])-4);
        if ($tb_mode ne "enc" and $tb_mode ne "dec" and $tb_mode ne "encdec"){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-gv=") != -1){
        $cad_ver = substr($ARGV[$arg_cnt], 4, length($ARGV[$arg_cnt])-4) + 0;
        if ($cad_ver != 19 and $cad_ver != 23){
          $arg_ok = 0;
        }
      }
      elsif (index($ARGV[$arg_cnt], "-rm") != -1){
        $is_rem = 1;
      }
      elsif (index($ARGV[$arg_cnt], "-v") != -1){
        $the_verb = 1;
      }
      else{
        $arg_ok = 0;
      }
    }
  }
  else{
    last;
  }

  $arg_cnt++;
}

if ($arg_ok == 0){
  help_part();
}
else{
  if ( ($blk_size == 128 or $blk_size == 256 or $blk_size == 512) and ($key_len == 128 or $key_len == 256 or $key_len == 512) and ($key_len == $blk_size or $key_len == 2*$blk_size) ){
    if ($the_tb){
      tb_part();
    }
    elsif ($the_tvla){
      tvla_part();
    }
    else{
      if ($msg_file ne "" or $the_msg ne ""){
        main_part($msg_file, $the_msg, $the_key, 0);
      }
      else{
        print "[ERROR] No plaintext was provided! \n";
        help_part();
      }
    }
  }
  else{
    print "[ERROR] Block size and key length are not appropriate! \n";
    help_part();
  }
}

sub help_part{
  printf "############################################################################################################################################################################################################################# \n";
  printf "# Usage:       perl kalyna.pl -f=<FileName> -m=<String> -k=<String> -bs=128/256/512 -kl=128/256/512 -p=0/1 -s=0/1 -c=0/1 -o=<FileName>                                                                                      # \n";
  printf "#                             -tb -not=<Integer> -dut=<String> -clk=<Integer> -tm=enc/dec/encdec -rst=low/high -par -gl -sf=SAIF/VCD -sdc                                                                                   # \n";
  printf "#                             -tvla -pt=innovus/primetime -g0t=0-1 g1t=0-5 -step=<Integer> -st=<Integer> -no_synth                                                                                                          # \n";
  printf "#                             -gv=19/23 -rm -v -h                                                                                                                                                                           # \n";
  printf "# f:           File including the message in hexadecimal format                                                                                                                                                             # \n";
  printf "# m:           Message in hexadecimal format                                                                                                                                                                                # \n";
  printf "# k:           Secret key in hexadecimal format                                                                                                                                                                             # \n";
  printf "# bs:          Block size by default it is 128                                                                                                                                                                              # \n";
  printf "# kl:          Key length by default it is 128                                                                                                                                                                              # \n";
  printf "# p:           Process by default it is encryption                                                                                                                                                                          # \n";
  printf "#                0: Encryption                                                                                                                                                                                              # \n";
  printf "#                1: Decryption                                                                                                                                                                                              # \n";
  printf "# c:           MixColumn implementation by default it is generic                                                                                                                                                            # \n";
  printf "#                0: Generic                                                                                                                                                                                                 # \n";
  printf "#                1: Optimized                                                                                                                                                                                               # \n";
  printf "# s:           S-Box implementation by default it is original                                                                                                                                                               # \n";
  printf "#                0: Original                                                                                                                                                                                                # \n";
  printf "#                1: Alternative                                                                                                                                                                                             # \n";
  printf "# o:           Output file                                                                                                                                                                                                  # \n";
  printf "# tb:          Runs the random test vector generation by default it does not                                                                                                                                                # \n";
  printf "# not:         Number of test vectors by default it is 1000                                                                                                                                                                 # \n";
  printf "# dut:         Name of the design under test by default it is kalyna_enc_block_serial                                                                                                                                       # \n";
  printf "# clk:         Clock period in ns by default it is 10                                                                                                                                                                       # \n";
  printf "# tm:          Mode of the cipher while generating the test vectors by default it is encryption                                                                                                                             # \n";
  printf "# rst:         Reset signal by default is active high                                                                                                                                                                       # \n";
  printf "# par:         Considers the parallel design of the KALYNA block by default it does not                                                                                                                                     # \n";
  printf "# gl:          Considers the simulation at gate-level by default it does not                                                                                                                                                # \n";
  printf "# sf:          Stimuli format by default it is SAIF                                                                                                                                                                         # \n";
  printf "# sdc:         Considers the SDC data while obtaining the gate-level synthesis results by default it does not                                                                                                               # \n";
  printf "# tvla:        Generates test vectors for the leakage assessment by default it does not                                                                                                                                     # \n";
  printf "# pt:          Tool used for the generation of power traces when tvla is set by default it is innovus                                                                                                                       # \n";
  printf "# g0t:         Technique to generate group 0 \"not\" test vectors when tvla is set by default it is 1                                                                                                                         # \n";
  printf "#                0: Random plaintext with a fixed key                                                                                                                                                                       # \n";
  printf "#                1: Random plaintext with a random key                                                                                                                                                                      # \n";
  printf "# g1t:         Technique to generate group 1 test vectors when tvla is set by default it is 5                                                                                                                               # \n";
  printf "#                0: 1 specific plaintext with a fixed key                                                                                                                                                                   # \n";
  printf "#                1: 10 specific plaintext with a fixed key                                                                                                                                                                  # \n";
  printf "#                2: 100 specific plaintext with a fixed key                                                                                                                                                                 # \n";
  printf "#                3: 1 specific plaintext with a random key                                                                                                                                                                  # \n";
  printf "#                4: 10 specific plaintext with a random key                                                                                                                                                                 # \n";
  printf "#                5: 100 specific plaintext with a random key                                                                                                                                                                # \n";
  printf "# step:        The interval in ns used to obtain power traces when tvla and innovus are set by default it is 1                                                                                                              # \n";
  printf "# st:          Total simulation time used to obtain power traces when tvla and innovus are set by default it is 1935                                                                                                        # \n";
  printf "# no_synth:    Does not synthesize the block cipher when tvla is set by default it does                                                                                                                                     # \n";
  printf "# gv:          Cadence Genus version by default it is the 2023 EDA version                                                                                                                                                  # \n";
  printf "# rm:          Removes unnecessary files by default it does not                                                                                                                                                             # \n";
  printf "# v:           Prints comments during execution by default it does not                                                                                                                                                      # \n";
  printf "# h:           Prints this screen                                                                                                                                                                                           # \n";
  printf "# Description: This code implements KALYNA in software                                                                                                                                                                      # \n";
  printf "#              If the message is shorter than the block size then 0s are added                                                                                                                                              # \n";
  printf "#              The decryption process has not been implemented yet                                                                                                                                                          # \n";
  printf "# Examples:    perl kalyna.pl -f=msg128.txt -k=000102030405060708090A0B0C0D0E0F -p=0 -v                           *Encryption from the message file                                                                         # \n";
  printf "#              perl kalyna.pl -m=101112131415161718191A1B1C1D1E1F -k=000102030405060708090a0B0C0D0E0F -p=0 -v     *Encryption from the command prompt                                                                       # \n";
  printf "#              perl kalyna.pl -tb -dut=kalyna_enc_block_serial64b_oboc -tm=enc -gl                                *Generation of all the necessary files and scripts for synthesis and simulation in encryption             # \n";
  printf "#              perl kalyna.pl -tb -dut=kalyna_dec_block_serial64b_oboc -tm=dec -gl                                *Generation of all the necessary files and scripts for synthesis and simulation in decryption             # \n";
  printf "#              perl kalyna.pl -tb -dut=kalyna_encdec_block_serial64b_oboc -tm=encdec -gl                          *Generation of all the necessary files and scripts for synthesis and simulation in encryption/decryption  # \n";
  printf "#              perl kalyna.pl -tvla -dut=kalyna_encdec_block_serial64b_oboc_fomhidtemdup -tm=encdec -st=7655      *Generation of all the necessary files and scripts for TVLA in encryption/decryption                      # \n";
  printf "############################################################################################################################################################################################################################# \n";
}

sub print_array{
  my ($the_label, $the_cnt, $the_arr_ref) = @_;

  print "$the_label: ";
  for (my $i = 0; $i < $the_cnt; $i++){
    print "$the_arr_ref->[$i] ";
  }
  print "\n";
}

sub print_array_nos{
  my ($the_label, $the_cnt, $the_arr_ref) = @_;

  print "$the_label: ";
  for (my $i = 0; $i < $the_cnt; $i++){
    print "$the_arr_ref->[$i]";
  }
  print "\n";
}

sub print_matrix{
  my ($the_label, $the_row, $the_col, $the_mat_ref) = @_;

  print "$the_label: \n";
  for (my $i = 0; $i < $the_row; $i++){
    for (my $j=0; $j<$the_col; $j++){
      print "$the_mat_ref->[$i][$j] ";
    }
    print "\n";
  }
}

sub read_file{
  my ($the_file) = @_;

  my $the_cnt = 0;
  my @the_arr = ();

  my $hex_lim = $blk_size/4;

  if (open (my $file_header, '<:encoding(UTF-8)', $the_file)){
    while (my $the_hex = <$file_header>){
      chomp $the_hex;

      my $hex_cnt = 0;
      my $the_char = "";
      my $str_chunk = "";
      my $lhex = length($the_hex);
      for (my $i=0; $i<$lhex; $i++){
        $the_char = substr($the_hex, $i, 1);
        if ($the_char =~ /^[[:xdigit:]]+\z/){
          $str_chunk .= $the_char;
          $hex_cnt++;
          if ($hex_cnt == $hex_lim){
            $the_arr[$the_cnt] = $str_chunk;
            $str_chunk = "";
            $hex_cnt = 0;
            $the_cnt++;
          }
        }
        else{
          print "[ERROR] The message contains a non-hexadecimal character! \n";
          exit (1);
        }
      }

      if ($hex_cnt){
        while ($hex_cnt != $hex_lim){
          $str_chunk .= "0";
          $hex_cnt++;
        }
        $the_arr[$the_cnt] = $str_chunk;
        $the_cnt++;
      }
    }
    close ($file_header);
  }
  else{
    print "[ERROR] Could not open the $the_file file! \n";
  }

  return ($the_cnt, \@the_arr);
}

sub read_message{
  my ($the_hex) = @_;

  my $the_cnt = 0;
  my @the_arr = ();

  my $hex_lim = $blk_size/4;

  my $hex_cnt = 0;
  my $the_char = "";
  my $str_chunk = "";
  my $lhex = length($the_hex);
  for (my $i=0; $i<$lhex; $i++){
    $the_char = substr($the_hex, $i, 1);
    if ($the_char =~ /^[[:xdigit:]]+\z/){
      $str_chunk .= $the_char;
      $hex_cnt++;
      if ($hex_cnt == $hex_lim){
        $the_arr[$the_cnt] = $str_chunk;
        $str_chunk = "";
        $hex_cnt = 0;
        $the_cnt++;
      }
    }
    else{
      print "[ERROR] The message contains a non-hexadecimal character! \n";
      exit (1);
    }
  }

  if ($hex_cnt){
    while ($hex_cnt != $hex_lim){
      $str_chunk .= "0";
      $hex_cnt++;
    }
    $the_arr[$the_cnt] = $str_chunk;
    $the_cnt++;
  }

  return ($the_cnt, \@the_arr);
}

sub onebyte_zero_sat{
  my ($data_cnt, $data_arr) = @_;

  for (my $i=0; $i<$data_cnt-1; $i++){
    if ($data_arr->[$i] eq "0" and $data_arr->[$i+1] eq "0"){
      #print_array_nos("data_arr", $data_cnt, $data_arr);
      return (1);
    }
  }

  return (0);
}

sub twobyte_zero_sat{
  my ($data_cnt, $data_arr) = @_;

  for (my $i=0; $i<$data_cnt-4; $i++){
    if ($data_arr->[$i] eq "0" and $data_arr->[$i+1] eq "0" and $data_arr->[$i+2] eq "0" and $data_arr->[$i+3] eq "0"){
      #print_array_nos("data_arr", $data_cnt, $data_arr);
      return (1);
    }
  }

  return (0);
}

sub data2hex{
  my ($the_data) = @_;
  #print "the_data: $the_data \n";

  my $the_cnt = 0;
  my @the_arr = ();

  my $ldata = length($the_data);
  for (my $i=0; $i<$ldata; $i++){
    $the_arr[$the_cnt] = substr($the_data, $i, 1);
    $the_cnt++;
  }

  return ($the_cnt, \@the_arr);
}

sub word2hex{
  my ($the_dec) = @_;

  my $the_hex = "";

  if ($the_dec == 0){
    $the_hex = "0";
  }
  elsif ($the_dec == 1){
    $the_hex = "1";
  }
  elsif ($the_dec == 2){
    $the_hex = "2";
  }
  elsif ($the_dec == 3){
    $the_hex = "3";
  }
  elsif ($the_dec == 4){
    $the_hex = "4";
  }
  elsif ($the_dec == 5){
    $the_hex = "5";
  }
  elsif ($the_dec == 6){
    $the_hex = "6";
  }
  elsif ($the_dec == 7){
    $the_hex = "7";
  }
  elsif ($the_dec == 8){
    $the_hex = "8";
  }
  elsif ($the_dec == 9){
    $the_hex = "9";
  }
  elsif ($the_dec == 10){
    $the_hex = "A";
  }
  elsif ($the_dec == 11){
    $the_hex = "B";
  }
  elsif ($the_dec == 12){
    $the_hex = "C";
  }
  elsif ($the_dec == 13){
    $the_hex = "D";
  }
  elsif ($the_dec == 14){
    $the_hex = "E";
  }
  elsif ($the_dec == 15){
    $the_hex = "F";
  }

  return ($the_hex);
}

sub dec2bin{
  my ($the_int, $the_len) = @_;

  my @the_rep = ();

  for (my $i=0; $i<$the_len; $i++){
    $the_rep[$i] = 0;
  }

  my $the_index = 0;
  while ($the_int > 1){
    my $the_val = $the_int % 2;
    $the_rep[$the_index] = $the_val;
    $the_int = ($the_int - $the_val) / 2;
    $the_index++;
  }
  $the_rep[$the_index] = $the_int;
  $the_index++;

  return (\@the_rep);
}

sub dec2hex{
  my ($the_int, $the_len) = @_;

  my @the_rep = ();

  for (my $i=0; $i<$the_len; $i++){
    $the_rep[$i] = 0;
  }

  my $the_index = 0;
  while ($the_int > 1){
    my $the_val = $the_int % 16;
    $the_rep[$the_index] = word2hex($the_val);
    $the_int = ($the_int - $the_val) / 16;
    $the_index++;
  }
  $the_rep[$the_index] = word2hex($the_int);
  $the_index++;

  return (\@the_rep);
}

sub add_binary_array{
  my ($bit_cnt, $bin_one_arr, $bin_two_arr) = @_;

  my $carry = 0;
  my @add_bin_arr = ();
  for (my $i=0; $i<$bit_cnt; $i++){
    $add_bin_arr[$i] = $bin_one_arr->[$i] ^ $bin_two_arr->[$i] ^ $carry;
    $carry = ($bin_one_arr->[$i] & $bin_two_arr->[$i]) | ($bin_one_arr->[$i] & $carry) | ($carry & $bin_two_arr->[$i]);
  }

  return (\@add_bin_arr);
}

sub add_modulo_2pow64{
  my ($hex_cnt, $hex_one_arr, $hex_two_arr) = @_;

  if ($the_verb){print "[INFO] Addition Modulo 2^64 \n";}
  
  if ($the_verb){print_array_nos("hex_one_arr", $hex_cnt, $hex_one_arr);}
  if ($the_verb){print_array_nos("hex_two_arr", $hex_cnt, $hex_two_arr);}
  
  my @sum_hex_arr = ();

  my $the_ind = 0;
  my $the_pos = 0;
  my $the_dec = 0;
  my $the_sum = 0;
  my $the_hex = 0;
  my $add_bin_arr;
  my $add_hex_arr;
  my $bin_one_rep;
  my $bin_two_rep;
  my $the_scale = 0;
  my $bit_index = 0;
  my $the_carry = 0;
  my @bin_one_arr = ();
  my @bin_two_arr = ();
  my $col_num = ($hex_cnt*4)/64; 
  for (my $i=0; $i<$col_num; $i++){
    my $bin_index = 63;
    for (my $j=1; $j<16; $j=$j+2){
      ($bin_one_rep) = dec2bin(hex($hex_one_arr->[$i*16+$j]), 4);
      ($bin_two_rep) = dec2bin(hex($hex_two_arr->[$i*16+$j]), 4);
      for (my $k=0; $k<4; $k++){
        $bin_one_arr[$bin_index] = $bin_one_rep->[$k];
        $bin_two_arr[$bin_index] = $bin_two_rep->[$k];
        $bin_index--;
      }
      
      ($bin_one_rep) = dec2bin(hex($hex_one_arr->[$i*16+$j-1]), 4);
      ($bin_two_rep) = dec2bin(hex($hex_two_arr->[$i*16+$j-1]), 4);
      for (my $k=0; $k<4; $k++){
        $bin_one_arr[$bin_index] = $bin_one_rep->[$k];
        $bin_two_arr[$bin_index] = $bin_two_rep->[$k];
        $bin_index--;
      }
    }
    #print_array("bin_one_arr", 64, \@bin_one_arr);
    #print_array("bin_two_arr", 64, \@bin_two_arr);

    $the_dec = 0;
    $the_ind = 8;
    $the_carry = 0;
    $bit_index = 0; 
    for (my $j=63; $j>=0; $j--){
      $the_sum = $bin_one_arr[$j] ^ $bin_two_arr[$j] ^ $the_carry;
      $the_carry = ($bin_one_arr[$j] & $bin_two_arr[$j]) | ($bin_one_arr[$j] & $the_carry) | ($the_carry & $bin_two_arr[$j]);
      $the_dec += $the_sum*(2**$bit_index);
      $bit_index++;
      if ($bit_index == 4){
        $the_pos = ($j % 8) ? 9 - $the_ind : 7 - $the_ind;
        $sum_hex_arr[$i*16+$the_pos] = word2hex($the_dec);
        $bit_index = 0;
        $the_dec = 0;
        $the_ind--;
      }
    }
  }

  if ($the_verb){print_array_nos("sum_hex_arr", $hex_cnt, \@sum_hex_arr);}

  return (\@sum_hex_arr);
}

sub sub_byte_org{
  my ($the_index, $hex_x, $hex_y) = @_;

  my $x_hex = "";
  my $y_hex = "";

  my @sbox_0 = (['A8', '43', '5F', '06', '6B', '75', '6C', '59', '71', 'DF', '87', '95', '17', 'F0', 'D8', '09'], 
              ['6D', 'F3', '1D', 'CB', 'C9', '4D', '2C', 'AF', '79', 'E0', '97', 'FD', '6F', '4B', '45', '39'], 
              ['3E', 'DD', 'A3', '4F', 'B4', 'B6', '9A', '0E', '1F', 'BF', '15', 'E1', '49', 'D2', '93', 'C6'], 
              ['92', '72', '9E', '61', 'D1', '63', 'FA', 'EE', 'F4', '19', 'D5', 'AD', '58', 'A4', 'BB', 'A1'], 
              ['DC', 'F2', '83', '37', '42', 'E4', '7A', '32', '9C', 'CC', 'AB', '4A', '8F', '6E', '04', '27'], 
              ['2E', 'E7', 'E2', '5A', '96', '16', '23', '2B', 'C2', '65', '66', '0F', 'BC', 'A9', '47', '41'], 
              ['34', '48', 'FC', 'B7', '6A', '88', 'A5', '53', '86', 'F9', '5B', 'DB', '38', '7B', 'C3', '1E'], 
              ['22', '33', '24', '28', '36', 'C7', 'B2', '3B', '8E', '77', 'BA', 'F5', '14', '9F', '08', '55'], 
              ['9B', '4C', 'FE', '60', '5C', 'DA', '18', '46', 'CD', '7D', '21', 'B0', '3F', '1B', '89', 'FF'], 
              ['EB', '84', '69', '3A', '9D', 'D7', 'D3', '70', '67', '40', 'B5', 'DE', '5D', '30', '91', 'B1'], 
              ['78', '11', '01', 'E5', '00', '68', '98', 'A0', 'C5', '02', 'A6', '74', '2D', '0B', 'A2', '76'], 
              ['B3', 'BE', 'CE', 'BD', 'AE', 'E9', '8A', '31', '1C', 'EC', 'F1', '99', '94', 'AA', 'F6', '26'], 
              ['2F', 'EF', 'E8', '8C', '35', '03', 'D4', '7F', 'FB', '05', 'C1', '5E', '90', '20', '3D', '82'], 
              ['F7', 'EA', '0A', '0D', '7E', 'F8', '50', '1A', 'C4', '07', '57', 'B8', '3C', '62', 'E3', 'C8'], 
              ['AC', '52', '64', '10', 'D0', 'D9', '13', '0C', '12', '29', '51', 'B9', 'CF', 'D6', '73', '8D'], 
              ['81', '54', 'C0', 'ED', '4E', '44', 'A7', '2A', '85', '25', 'E6', 'CA', '7C', '8B', '56', '80']);

  my @sbox_1 = (['CE', 'BB', 'EB', '92', 'EA', 'CB', '13', 'C1', 'E9', '3A', 'D6', 'B2', 'D2', '90', '17', 'F8'], 
              ['42', '15', '56', 'B4', '65', '1C', '88', '43', 'C5', '5C', '36', 'BA', 'F5', '57', '67', '8D'], 
              ['31', 'F6', '64', '58', '9E', 'F4', '22', 'AA', '75', '0F', '02', 'B1', 'DF', '6D', '73', '4D'], 
              ['7C', '26', '2E', 'F7', '08', '5D', '44', '3E', '9F', '14', 'C8', 'AE', '54', '10', 'D8', 'BC'], 
              ['1A', '6B', '69', 'F3', 'BD', '33', 'AB', 'FA', 'D1', '9B', '68', '4E', '16', '95', '91', 'EE'], 
              ['4C', '63', '8E', '5B', 'CC', '3C', '19', 'A1', '81', '49', '7B', 'D9', '6F', '37', '60', 'CA'], 
              ['E7', '2B', '48', 'FD', '96', '45', 'FC', '41', '12', '0D', '79', 'E5', '89', '8C', 'E3', '20'], 
              ['30', 'DC', 'B7', '6C', '4A', 'B5', '3F', '97', 'D4', '62', '2D', '06', 'A4', 'A5', '83', '5F'], 
              ['2A', 'DA', 'C9', '00', '7E', 'A2', '55', 'BF', '11', 'D5', '9C', 'CF', '0E', '0A', '3D', '51'], 
              ['7D', '93', '1B', 'FE', 'C4', '47', '09', '86', '0B', '8F', '9D', '6A', '07', 'B9', 'B0', '98'], 
              ['18', '32', '71', '4B', 'EF', '3B', '70', 'A0', 'E4', '40', 'FF', 'C3', 'A9', 'E6', '78', 'F9'], 
              ['8B', '46', '80', '1E', '38', 'E1', 'B8', 'A8', 'E0', '0C', '23', '76', '1D', '25', '24', '05'], 
              ['F1', '6E', '94', '28', '9A', '84', 'E8', 'A3', '4F', '77', 'D3', '85', 'E2', '52', 'F2', '82'], 
              ['50', '7A', '2F', '74', '53', 'B3', '61', 'AF', '39', '35', 'DE', 'CD', '1F', '99', 'AC', 'AD'], 
              ['72', '2C', 'DD', 'D0', '87', 'BE', '5E', 'A6', 'EC', '04', 'C6', '03', '34', 'FB', 'DB', '59'], 
              ['B6', 'C2', '01', 'F0', '5A', 'ED', 'A7', '66', '21', '7F', '8A', '27', 'C7', 'C0', '29', 'D7']);
  
  my @sbox_2 = (['93', 'D9', '9A', 'B5', '98', '22', '45', 'FC', 'BA', '6A', 'DF', '02', '9F', 'DC', '51', '59'], 
              ['4A', '17', '2B', 'C2', '94', 'F4', 'BB', 'A3', '62', 'E4', '71', 'D4', 'CD', '70', '16', 'E1'], 
              ['49', '3C', 'C0', 'D8', '5C', '9B', 'AD', '85', '53', 'A1', '7A', 'C8', '2D', 'E0', 'D1', '72'], 
              ['A6', '2C', 'C4', 'E3', '76', '78', 'B7', 'B4', '09', '3B', '0E', '41', '4C', 'DE', 'B2', '90'], 
              ['25', 'A5', 'D7', '03', '11', '00', 'C3', '2E', '92', 'EF', '4E', '12', '9D', '7D', 'CB', '35'], 
              ['10', 'D5', '4F', '9E', '4D', 'A9', '55', 'C6', 'D0', '7B', '18', '97', 'D3', '36', 'E6', '48'], 
              ['56', '81', '8F', '77', 'CC', '9C', 'B9', 'E2', 'AC', 'B8', '2F', '15', 'A4', '7C', 'DA', '38'], 
              ['1E', '0B', '05', 'D6', '14', '6E', '6C', '7E', '66', 'FD', 'B1', 'E5', '60', 'AF', '5E', '33'], 
              ['87', 'C9', 'F0', '5D', '6D', '3F', '88', '8D', 'C7', 'F7', '1D', 'E9', 'EC', 'ED', '80', '29'], 
              ['27', 'CF', '99', 'A8', '50', '0F', '37', '24', '28', '30', '95', 'D2', '3E', '5B', '40', '83'], 
              ['B3', '69', '57', '1F', '07', '1C', '8A', 'BC', '20', 'EB', 'CE', '8E', 'AB', 'EE', '31', 'A2'], 
              ['73', 'F9', 'CA', '3A', '1A', 'FB', '0D', 'C1', 'FE', 'FA', 'F2', '6F', 'BD', '96', 'DD', '43'], 
              ['52', 'B6', '08', 'F3', 'AE', 'BE', '19', '89', '32', '26', 'B0', 'EA', '4B', '64', '84', '82'], 
              ['6B', 'F5', '79', 'BF', '01', '5F', '75', '63', '1B', '23', '3D', '68', '2A', '65', 'E8', '91'], 
              ['F6', 'FF', '13', '58', 'F1', '47', '0A', '7F', 'C5', 'A7', 'E7', '61', '5A', '06', '46', '44'], 
              ['42', '04', 'A0', 'DB', '39', '86', '54', 'AA', '8C', '34', '21', '8B', 'F8', '0C', '74', '67']);
  
  my @sbox_3 = (['68', '8D', 'CA', '4D', '73', '4B', '4E', '2A', 'D4', '52', '26', 'B3', '54', '1E', '19', '1F'], 
              ['22', '03', '46', '3D', '2D', '4A', '53', '83', '13', '8A', 'B7', 'D5', '25', '79', 'F5', 'BD'], 
              ['58', '2F', '0D', '02', 'ED', '51', '9E', '11', 'F2', '3E', '55', '5E', 'D1', '16', '3C', '66'], 
              ['70', '5D', 'F3', '45', '40', 'CC', 'E8', '94', '56', '08', 'CE', '1A', '3A', 'D2', 'E1', 'DF'], 
              ['B5', '38', '6E', '0E', 'E5', 'F4', 'F9', '86', 'E9', '4F', 'D6', '85', '23', 'CF', '32', '99'], 
              ['31', '14', 'AE', 'EE', 'C8', '48', 'D3', '30', 'A1', '92', '41', 'B1', '18', 'C4', '2C', '71'], 
              ['72', '44', '15', 'FD', '37', 'BE', '5F', 'AA', '9B', '88', 'D8', 'AB', '89', '9C', 'FA', '60'], 
              ['EA', 'BC', '62', '0C', '24', 'A6', 'A8', 'EC', '67', '20', 'DB', '7C', '28', 'DD', 'AC', '5B'], 
              ['34', '7E', '10', 'F1', '7B', '8F', '63', 'A0', '05', '9A', '43', '77', '21', 'BF', '27', '09'], 
              ['C3', '9F', 'B6', 'D7', '29', 'C2', 'EB', 'C0', 'A4', '8B', '8C', '1D', 'FB', 'FF', 'C1', 'B2'], 
              ['97', '2E', 'F8', '65', 'F6', '75', '07', '04', '49', '33', 'E4', 'D9', 'B9', 'D0', '42', 'C7'], 
              ['6C', '90', '00', '8E', '6F', '50', '01', 'C5', 'DA', '47', '3F', 'CD', '69', 'A2', 'E2', '7A'], 
              ['A7', 'C6', '93', '0F', '0A', '06', 'E6', '2B', '96', 'A3', '1C', 'AF', '6A', '12', '84', '39'], 
              ['E7', 'B0', '82', 'F7', 'FE', '9D', '87', '5C', '81', '35', 'DE', 'B4', 'A5', 'FC', '80', 'EF'], 
              ['CB', 'BB', '6B', '76', 'BA', '5A', '7D', '78', '0B', '95', 'E3', 'AD', '74', '98', '3B', '36'], 
              ['64', '6D', 'DC', 'F0', '59', 'A9', '4C', '17', '7F', '91', 'B8', 'C9', '57', '1B', 'E0', '61']);
 

  my $the_byte = "";
  my $sbox_index = $the_index % 4;
  if ($sbox_index == 0){
    $the_byte = $sbox_0[hex($hex_x)][hex($hex_y)];
  }
  elsif ($sbox_index == 1){
    $the_byte = $sbox_1[hex($hex_x)][hex($hex_y)];
  }
  elsif ($sbox_index == 2){
    $the_byte = $sbox_2[hex($hex_x)][hex($hex_y)];
  }
  elsif ($sbox_index == 3){
    $the_byte = $sbox_3[hex($hex_x)][hex($hex_y)];
  }

  $x_hex = substr($the_byte, 0, 1);
  $y_hex = substr($the_byte, 1, 1);

  return ($x_hex, $y_hex);
}

sub sub_byte_alt{
  my ($the_index, $hex_x, $hex_y) = @_;

  my $x_hex = "";
  my $y_hex = "";

  my @sbox_0 = (['CE', 'BB', 'EB', '92', 'EA', 'CB', '13', 'C1', 'E9', '3A', 'D6', 'B2', 'D2', '90', '17', 'F8'], 
                ['42', '15', '56', 'B4', '65', '1C', '88', '43', 'C5', '5C', '36', 'BA', 'F5', '57', '67', '8D'], 
                ['31', 'F6', '64', '58', '9E', 'F4', '22', 'AA', '75', '0F', '02', 'B1', 'DF', '6D', '73', '4D'], 
                ['7C', '26', '2E', 'F7', '08', '5D', '44', '3E', '9F', '14', 'C8', 'AE', '54', '10', 'D8', 'BC'], 
                ['1A', '6B', '69', 'F3', 'BD', '33', 'AB', 'FA', 'D1', '9B', '68', '4E', '16', '95', '91', 'EE'], 
                ['4C', '63', '8E', '5B', 'CC', '3C', '19', 'A1', '81', '49', '7B', 'D9', '6F', '37', '60', 'CA'], 
                ['E7', '2B', '48', 'FD', '96', '45', 'FC', '41', '12', '0D', '79', 'E5', '89', '8C', 'E3', '20'], 
                ['30', 'DC', 'B7', '6C', '4A', 'B5', '3F', '97', 'D4', '62', '2D', '06', 'A4', 'A5', '83', '5F'], 
                ['2A', 'DA', 'C9', '00', '7E', 'A2', '55', 'BF', '11', 'D5', '9C', 'CF', '0E', '0A', '3D', '51'], 
                ['7D', '93', '1B', 'FE', 'C4', '47', '09', '86', '0B', '8F', '9D', '6A', '07', 'B9', 'B0', '98'], 
                ['18', '32', '71', '4B', 'EF', '3B', '70', 'A0', 'E4', '40', 'FF', 'C3', 'A9', 'E6', '78', 'F9'], 
                ['8B', '46', '80', '1E', '38', 'E1', 'B8', 'A8', 'E0', '0C', '23', '76', '1D', '25', '24', '05'], 
                ['F1', '6E', '94', '28', '9A', '84', 'E8', 'A3', '4F', '77', 'D3', '85', 'E2', '52', 'F2', '82'], 
                ['50', '7A', '2F', '74', '53', 'B3', '61', 'AF', '39', '35', 'DE', 'CD', '1F', '99', 'AC', 'AD'], 
                ['72', '2C', 'DD', 'D0', '87', 'BE', '5E', 'A6', 'EC', '04', 'C6', '03', '34', 'FB', 'DB', '59'], 
                ['B6', 'C2', '01', 'F0', '5A', 'ED', 'A7', '66', '21', '7F', '8A', '27', 'C7', 'C0', '29', 'D7']);
  
  my @sbox_1 = (['61', 'DF', 'F0', 'B4', '1E', 'FD', 'CB', '54', 'AC', '83', '00', '99', 'DD', 'DC', '24', '16'], 
                ['C8', 'E1', '95', '4E', '09', 'D6', 'D4', 'BC', '7D', '55', '76', 'CC', 'DB', '19', '53', 'E3'], 
                ['E6', '3B', '20', 'B6', '52', '0F', 'F5', 'A9', '0A', '64', '29', '3D', '8F', '07', '1F', '67'], 
                ['68', '4F', '65', '5C', '15', '42', 'D7', '79', '40', '03', 'C2', 'EF', '2E', '04', 'C9', '2C'], 
                ['F6', '60', '70', '98', '08', '4D', 'BE', '44', 'EC', '25', '92', 'D3', '90', '87', 'E7', '1D'], 
                ['CD', 'CE', '82', '9A', 'C4', '77', 'B8', 'F3', 'F4', 'F9', '6A', '6C', 'E0', '30', '0E', '9B'], 
                ['B3', '3A', '80', '51', '56', '8D', 'DE', '43', '7E', '63', '9C', '5D', '21', '93', 'FE', '84'], 
                ['CA', 'EB', '1C', 'E2', 'C0', '5A', '5E', 'B2', '3F', '6E', 'BF', 'E9', '69', '0D', '78', '13'], 
                ['4B', '57', 'FF', 'ED', '7B', '88', '62', '7A', 'C1', '0C', '96', '06', 'A4', 'C7', '85', '72'], 
                ['59', '36', 'BD', 'DA', '32', 'AD', '23', 'AF', '3E', 'D8', '9E', 'BB', '46', '71', 'C5', '01'], 
                ['86', 'B0', 'D5', '31', '38', '7C', 'FC', 'EA', '9F', '1B', 'B7', '35', '27', '39', 'B5', '05'], 
                ['6D', '81', 'AE', '02', '26', '10', '6B', '75', 'A5', '18', '89', 'C6', '58', 'A0', '11', '5B'], 
                ['E4', 'CF', '45', '3C', 'A7', '22', 'E5', '33', 'D1', 'A1', 'FA', '14', '7F', '8A', '73', '50'], 
                ['8C', 'C3', 'A6', 'D2', '37', '41', '66', 'F1', 'A2', '0B', 'F8', 'D0', '4A', 'A3', '2B', 'E8'], 
                ['B9', '34', '2A', '1A', 'D9', '97', '74', '6F', '2D', 'AA', 'BA', '47', '12', '49', '9D', '91'], 
                ['5F', 'FB', '17', '28', 'AB', '8B', '48', 'B1', '4C', 'EE', '2F', '94', 'A8', 'F7', '8E', 'F2']);

  my @sbox_2 = (['8C', '06', '10', '25', '07', '24', '20', '5B', 'BB', '19', '32', 'C6', '11', '0B', '9A', '17'], 
                ['97', '23', 'AF', '61', 'B2', 'A4', '79', '2E', '93', '58', '1E', '0A', '6D', 'F1', 'D8', '83'], 
                ['12', '66', 'AA', 'DA', 'E0', 'A3', '46', 'F4', '7E', '31', '86', '44', '5E', 'BD', '90', 'D1'], 
                ['8A', 'B9', 'B4', '74', 'C0', '5F', 'AD', '63', 'B3', 'C1', '73', 'FB', '3D', 'E2', '9C', 'A5'], 
                ['9B', 'B6', '94', 'B1', '08', '28', '6E', '2B', '00', '48', '34', '09', '26', 'D3', '51', '7F'], 
                ['BA', '6B', 'E4', 'D0', '75', 'F6', '87', 'CB', '70', '1B', 'FF', '39', 'FD', '4C', '55', 'CE'], 
                ['67', '7D', 'DE', '7B', 'A0', 'EF', 'E1', 'FA', '92', '3C', '05', '9F', '9E', '37', '22', '4D'], 
                ['F8', '2A', 'A1', '7C', '49', '9D', '5A', 'C7', '40', '4A', '59', 'F0', 'B8', '2F', '8F', '76'], 
                ['EA', '82', '35', 'C4', 'A9', '60', 'CF', 'E9', '0C', 'EC', '98', '13', '2C', '29', '21', '45'], 
                ['78', '43', '53', '89', '68', 'B0', 'F5', 'DF', 'CC', 'A2', '7A', 'D9', '3B', '52', '15', '8D'], 
                ['81', '54', '65', 'B5', '47', 'A7', '5D', '6C', 'E7', 'BF', '33', '80', '6F', 'C5', '04', 'E8'], 
                ['77', '36', '91', '6A', 'C3', 'DC', 'AC', '1F', '62', 'D7', '1A', 'F7', '3E', '64', 'AE', '41'], 
                ['96', 'F3', '88', 'E5', '4F', 'BE', '57', '0D', 'FC', 'C8', 'CD', '27', '4B', 'E3', '42', 'DB'], 
                ['99', '71', '03', 'D5', 'CA', '3A', '69', 'C9', 'BC', '85', '38', '84', 'DD', 'F9', 'ED', '14'], 
                ['D6', '0F', '50', '8B', '18', '56', '1D', '8E', '4E', 'AB', '5C', 'A8', '02', '3F', '2D', '95'], 
                ['0E', '01', 'EE', 'E6', 'C2', '30', '72', 'F2', '16', 'A6', 'EB', 'FE', 'D4', '1C', 'B7', 'D2']);

  my @sbox_3 = (['6D', 'A5', '3C', '05', 'D7', '98', 'CF', '68', 'EA', '6E', 'CE', 'E8', '00', '08', '87', '64'], 
                ['50', 'F5', '4F', '4D', '19', '52', '39', '58', 'A8', '77', 'CC', 'F7', 'A0', 'DE', 'AB', 'E1'], 
                ['9B', 'C3', 'B1', '0C', 'BE', 'E5', '18', 'B5', '1D', 'B7', 'C1', '2E', 'C0', 'FA', 'E9', 'FB'], 
                ['3E', '90', '71', '46', '6A', '0E', '2D', 'F0', '43', 'C7', '40', '97', '5B', '42', '0D', '4E'], 
                ['16', 'B3', 'DD', '2C', '4C', '13', '3D', '07', 'DB', '60', 'DA', '51', 'C2', '7C', '2A', 'D5'], 
                ['4B', 'FC', '7E', '15', 'DF', '10', '5E', '8E', 'F4', 'C8', '5C', '45', '21', 'D0', '1B', '3B'], 
                ['89', '0F', 'A1', '8A', 'BC', '66', '9A', '3A', 'CD', '6C', '5F', '09', '8C', '70', '5D', 'A4'], 
                ['91', '48', '03', '83', 'ED', 'B9', 'CA', '30', 'A3', 'D1', '61', '3F', '25', '17', '6F', '2B'], 
                ['44', '24', '69', 'D2', '55', '7B', 'D6', 'B2', '99', '02', '32', '59', '6B', '81', 'F1', '67'], 
                ['65', '80', '9F', '8D', '23', '76', 'AF', '11', '41', 'EE', 'D9', '36', 'A6', '22', '9D', '75'], 
                ['53', '85', '84', 'F3', '56', 'A2', '47', '0B', 'C9', 'BD', '06', 'DC', '94', 'E4', 'EC', '93'], 
                ['82', 'BF', 'EB', '8F', '62', 'E0', '54', '37', '31', 'B8', 'C5', '4A', '96', '73', '5A', 'D4'], 
                ['EF', 'CB', '29', '74', '2F', 'FF', 'E6', 'B0', '86', '28', 'AD', 'BB', 'F9', '78', 'A7', '1A'], 
                ['C4', '1C', 'E7', 'A9', '01', '1E', 'F8', 'B4', '95', '7D', 'AC', '79', '9C', 'E2', '0A', '20'], 
                ['D3', '92', '63', '26', '7F', '38', 'FE', '12', 'AA', '88', '1F', 'F6', '49', '35', 'F2', 'D8'], 
                ['9E', 'BA', '72', 'AE', '7A', 'C6', '8B', 'FD', 'E3', '04', '34', '57', 'B6', '27', '33', '14']);

  my $the_byte = "";
  my $sbox_index = $the_index % 4;
  if ($sbox_index == 0){
    $the_byte = $sbox_0[hex($hex_x)][hex($hex_y)];
  }
  elsif ($sbox_index == 1){
    $the_byte = $sbox_1[hex($hex_x)][hex($hex_y)];
  }
  elsif ($sbox_index == 2){
    $the_byte = $sbox_2[hex($hex_x)][hex($hex_y)];
  }
  elsif ($sbox_index == 3){
    $the_byte = $sbox_3[hex($hex_x)][hex($hex_y)];
  }

  $x_hex = substr($the_byte, 0, 1);
  $y_hex = substr($the_byte, 1, 1);

  return ($x_hex, $y_hex);
}

sub byte_substitute{
  my ($hex_cnt, $hex_arr) = @_;

  my @sub_arr = ();
  
  if ($the_verb){print "[INFO] Byte Substitution \n";}

  if ($the_verb){print_array_nos("hex_arr", $hex_cnt, $hex_arr);}

  my $mod_4 = 0;
  for (my $i=0; $i<$hex_cnt/2; $i++){
    if ($the_sbox == 0){
      ($sub_arr[2*$i], $sub_arr[2*$i+1]) = sub_byte_org($i, $hex_arr->[2*$i], $hex_arr->[2*$i+1]);
    }
    elsif ($the_sbox == 1){
      ($sub_arr[2*$i], $sub_arr[2*$i+1]) = sub_byte_alt($i, $hex_arr->[2*$i], $hex_arr->[2*$i+1]);
    }
  }
  
  if ($the_verb){print_array_nos("sub_arr", $hex_cnt, \@sub_arr);}

  return (\@sub_arr);
}

sub arr2state{
  my ($hex_cnt, $hex_arr) = @_;

  my $col_cnt = 0;
  my @state_mat = ();

  $col_cnt = ($hex_cnt*4)/64;

  for (my $i=0; $i<$col_cnt; $i++){
    for (my $j=0; $j<8; $j++){
      $state_mat[$j][$i] = $hex_arr->[16*$i+2*$j] . $hex_arr->[16*$i+2*$j+1];
    }
  }

  return ($col_cnt, \@state_mat);
}

sub state2arr{
  my ($col_cnt, $state_mat) = @_;

  my @hex_arr = ();

  for (my $i=0; $i<$col_cnt; $i++){
    for (my $j=0; $j<8; $j++){
      $hex_arr[16*$i+2*$j] = substr($state_mat->[$j][$i], 0, 1);
      $hex_arr[16*$i+2*$j+1] = substr($state_mat->[$j][$i], 1, 1);
    }
  }

  return (\@hex_arr);
}

sub shift_row{
  my ($hex_cnt, $hex_arr) = @_;

  my $shift_arr;
  
  if ($the_verb){print "[INFO] Shift Row \n";}

  if ($the_verb){print_array_nos("hex_arr", $hex_cnt, $hex_arr);}

  my ($col_cnt, $state_mat) = arr2state($hex_cnt, $hex_arr);
  #print_matrix("state_mat", 8, $col_cnt, $state_mat);

  my $the_shift = 0;
  my @shift_mat = ();
  for (my $i=0; $i<8; $i++){
    $the_shift = POSIX::floor(($i*$blk_size)/512);
    for (my $j=0; $j<$col_cnt; $j++){
      $shift_mat[$i][ ($j+$the_shift) % $col_cnt ] = $state_mat->[$i][$j];
    }
  }
  #print_matrix("state_mat", 8, $col_cnt, \@shift_mat);

  ($shift_arr) = state2arr($col_cnt, \@shift_mat);
  
  if ($the_verb){print_array_nos("shift_arr", $hex_cnt, $shift_arr);}

  return ($shift_arr);
}

sub cmvm_xor_enc{
  my ($the_cnt, $mds_in) = @_;

  my @mds_out = ();

  # Description of the MDS polynomial matrix multiplication in Verilog 
  # Date: Sun Sep  8 17:21:15 2024 
  # MDS File: ..\examples\aes_enc.txt 

  $mds_out[7] = $mds_in->[7] ^ $mds_in->[15] ^ $mds_in->[23] ^ $mds_in->[31] ^ $mds_in->[55] ^ $mds_in->[17] ^ $mds_in->[34] ^ $mds_in->[40] ^ $mds_in->[41] ^ $mds_in->[48] ^ $mds_in->[49] ^ $mds_in->[57]; 
  $mds_out[6] = $mds_in->[6] ^ $mds_in->[14] ^ $mds_in->[22] ^ $mds_in->[30] ^ $mds_in->[47] ^ $mds_in->[54] ^ $mds_in->[55] ^ $mds_in->[16] ^ $mds_in->[33] ^ $mds_in->[40] ^ $mds_in->[48] ^ $mds_in->[56]; 
  $mds_out[5] = $mds_in->[5] ^ $mds_in->[13] ^ $mds_in->[21] ^ $mds_in->[23] ^ $mds_in->[29] ^ $mds_in->[46] ^ $mds_in->[47] ^ $mds_in->[53] ^ $mds_in->[54] ^ $mds_in->[55] ^ $mds_in->[63] ^ $mds_in->[32] ^ $mds_in->[17] ^ $mds_in->[34] ^ $mds_in->[40] ^ $mds_in->[41] ^ $mds_in->[48] ^ $mds_in->[49] ^ $mds_in->[57]; 
  $mds_out[4] = $mds_in->[4] ^ $mds_in->[12] ^ $mds_in->[20] ^ $mds_in->[22] ^ $mds_in->[28] ^ $mds_in->[39] ^ $mds_in->[45] ^ $mds_in->[46] ^ $mds_in->[52] ^ $mds_in->[53] ^ $mds_in->[54] ^ $mds_in->[62] ^ $mds_in->[16] ^ $mds_in->[33] ^ $mds_in->[56] ^ $mds_in->[17] ^ $mds_in->[34] ^ $mds_in->[41] ^ $mds_in->[49] ^ $mds_in->[57]; 
  $mds_out[3] = $mds_in->[3] ^ $mds_in->[11] ^ $mds_in->[19] ^ $mds_in->[21] ^ $mds_in->[27] ^ $mds_in->[38] ^ $mds_in->[44] ^ $mds_in->[45] ^ $mds_in->[51] ^ $mds_in->[52] ^ $mds_in->[53] ^ $mds_in->[61] ^ $mds_in->[32] ^ $mds_in->[16] ^ $mds_in->[33] ^ $mds_in->[56] ^ $mds_in->[17] ^ $mds_in->[34] ^ $mds_in->[41] ^ $mds_in->[49] ^ $mds_in->[57]; 
  $mds_out[2] = $mds_in->[2] ^ $mds_in->[10] ^ $mds_in->[18] ^ $mds_in->[20] ^ $mds_in->[26] ^ $mds_in->[37] ^ $mds_in->[43] ^ $mds_in->[44] ^ $mds_in->[50] ^ $mds_in->[51] ^ $mds_in->[52] ^ $mds_in->[60] ^ $mds_in->[32] ^ $mds_in->[16] ^ $mds_in->[33] ^ $mds_in->[40] ^ $mds_in->[48] ^ $mds_in->[56]; 
  $mds_out[1] = $mds_in->[1] ^ $mds_in->[9] ^ $mds_in->[17] ^ $mds_in->[19] ^ $mds_in->[25] ^ $mds_in->[36] ^ $mds_in->[42] ^ $mds_in->[43] ^ $mds_in->[49] ^ $mds_in->[50] ^ $mds_in->[51] ^ $mds_in->[59] ^ $mds_in->[32]; 
  $mds_out[0] = $mds_in->[0] ^ $mds_in->[8] ^ $mds_in->[16] ^ $mds_in->[18] ^ $mds_in->[24] ^ $mds_in->[35] ^ $mds_in->[41] ^ $mds_in->[42] ^ $mds_in->[48] ^ $mds_in->[49] ^ $mds_in->[50] ^ $mds_in->[58]; 
  
  $mds_out[15] = $mds_in->[15] ^ $mds_in->[23] ^ $mds_in->[31] ^ $mds_in->[39] ^ $mds_in->[63] ^ $mds_in->[1] ^ $mds_in->[25] ^ $mds_in->[42] ^ $mds_in->[48] ^ $mds_in->[49] ^ $mds_in->[56] ^ $mds_in->[57]; 
  $mds_out[14] = $mds_in->[14] ^ $mds_in->[22] ^ $mds_in->[30] ^ $mds_in->[38] ^ $mds_in->[55] ^ $mds_in->[62] ^ $mds_in->[63] ^ $mds_in->[0] ^ $mds_in->[24] ^ $mds_in->[41] ^ $mds_in->[48] ^ $mds_in->[56]; 
  $mds_out[13] = $mds_in->[7] ^ $mds_in->[13] ^ $mds_in->[21] ^ $mds_in->[29] ^ $mds_in->[31] ^ $mds_in->[37] ^ $mds_in->[54] ^ $mds_in->[55] ^ $mds_in->[61] ^ $mds_in->[62] ^ $mds_in->[63] ^ $mds_in->[40] ^ $mds_in->[1] ^ $mds_in->[25] ^ $mds_in->[42] ^ $mds_in->[48] ^ $mds_in->[49] ^ $mds_in->[56] ^ $mds_in->[57]; 
  $mds_out[12] = $mds_in->[6] ^ $mds_in->[12] ^ $mds_in->[20] ^ $mds_in->[28] ^ $mds_in->[30] ^ $mds_in->[36] ^ $mds_in->[47] ^ $mds_in->[53] ^ $mds_in->[54] ^ $mds_in->[60] ^ $mds_in->[61] ^ $mds_in->[62] ^ $mds_in->[0] ^ $mds_in->[24] ^ $mds_in->[41] ^ $mds_in->[1] ^ $mds_in->[25] ^ $mds_in->[42] ^ $mds_in->[49] ^ $mds_in->[57]; 
  $mds_out[11] = $mds_in->[5] ^ $mds_in->[11] ^ $mds_in->[19] ^ $mds_in->[27] ^ $mds_in->[29] ^ $mds_in->[35] ^ $mds_in->[46] ^ $mds_in->[52] ^ $mds_in->[53] ^ $mds_in->[59] ^ $mds_in->[60] ^ $mds_in->[61] ^ $mds_in->[40] ^ $mds_in->[0] ^ $mds_in->[24] ^ $mds_in->[41] ^ $mds_in->[1] ^ $mds_in->[25] ^ $mds_in->[42] ^ $mds_in->[49] ^ $mds_in->[57]; 
  $mds_out[10] = $mds_in->[4] ^ $mds_in->[10] ^ $mds_in->[18] ^ $mds_in->[26] ^ $mds_in->[28] ^ $mds_in->[34] ^ $mds_in->[45] ^ $mds_in->[51] ^ $mds_in->[52] ^ $mds_in->[58] ^ $mds_in->[59] ^ $mds_in->[60] ^ $mds_in->[40] ^ $mds_in->[0] ^ $mds_in->[24] ^ $mds_in->[41] ^ $mds_in->[48] ^ $mds_in->[56]; 
  $mds_out[9] = $mds_in->[3] ^ $mds_in->[9] ^ $mds_in->[17] ^ $mds_in->[25] ^ $mds_in->[27] ^ $mds_in->[33] ^ $mds_in->[44] ^ $mds_in->[50] ^ $mds_in->[51] ^ $mds_in->[57] ^ $mds_in->[58] ^ $mds_in->[59] ^ $mds_in->[40]; 
  $mds_out[8] = $mds_in->[2] ^ $mds_in->[8] ^ $mds_in->[16] ^ $mds_in->[24] ^ $mds_in->[26] ^ $mds_in->[32] ^ $mds_in->[43] ^ $mds_in->[49] ^ $mds_in->[50] ^ $mds_in->[56] ^ $mds_in->[57] ^ $mds_in->[58]; 
  
  $mds_out[23] = $mds_in->[7] ^ $mds_in->[23] ^ $mds_in->[31] ^ $mds_in->[39] ^ $mds_in->[47] ^ $mds_in->[0] ^ $mds_in->[1] ^ $mds_in->[9] ^ $mds_in->[33] ^ $mds_in->[50] ^ $mds_in->[56] ^ $mds_in->[57]; 
  $mds_out[22] = $mds_in->[6] ^ $mds_in->[7] ^ $mds_in->[22] ^ $mds_in->[30] ^ $mds_in->[38] ^ $mds_in->[46] ^ $mds_in->[63] ^ $mds_in->[0] ^ $mds_in->[8] ^ $mds_in->[32] ^ $mds_in->[49] ^ $mds_in->[56]; 
  $mds_out[21] = $mds_in->[5] ^ $mds_in->[6] ^ $mds_in->[7] ^ $mds_in->[15] ^ $mds_in->[21] ^ $mds_in->[29] ^ $mds_in->[37] ^ $mds_in->[39] ^ $mds_in->[45] ^ $mds_in->[62] ^ $mds_in->[63] ^ $mds_in->[48] ^ $mds_in->[0] ^ $mds_in->[1] ^ $mds_in->[9] ^ $mds_in->[33] ^ $mds_in->[50] ^ $mds_in->[56] ^ $mds_in->[57]; 
  $mds_out[20] = $mds_in->[4] ^ $mds_in->[5] ^ $mds_in->[6] ^ $mds_in->[14] ^ $mds_in->[20] ^ $mds_in->[28] ^ $mds_in->[36] ^ $mds_in->[38] ^ $mds_in->[44] ^ $mds_in->[55] ^ $mds_in->[61] ^ $mds_in->[62] ^ $mds_in->[8] ^ $mds_in->[32] ^ $mds_in->[49] ^ $mds_in->[1] ^ $mds_in->[9] ^ $mds_in->[33] ^ $mds_in->[50] ^ $mds_in->[57]; 
  $mds_out[19] = $mds_in->[3] ^ $mds_in->[4] ^ $mds_in->[5] ^ $mds_in->[13] ^ $mds_in->[19] ^ $mds_in->[27] ^ $mds_in->[35] ^ $mds_in->[37] ^ $mds_in->[43] ^ $mds_in->[54] ^ $mds_in->[60] ^ $mds_in->[61] ^ $mds_in->[48] ^ $mds_in->[8] ^ $mds_in->[32] ^ $mds_in->[49] ^ $mds_in->[1] ^ $mds_in->[9] ^ $mds_in->[33] ^ $mds_in->[50] ^ $mds_in->[57]; 
  $mds_out[18] = $mds_in->[2] ^ $mds_in->[3] ^ $mds_in->[4] ^ $mds_in->[12] ^ $mds_in->[18] ^ $mds_in->[26] ^ $mds_in->[34] ^ $mds_in->[36] ^ $mds_in->[42] ^ $mds_in->[53] ^ $mds_in->[59] ^ $mds_in->[60] ^ $mds_in->[48] ^ $mds_in->[0] ^ $mds_in->[8] ^ $mds_in->[32] ^ $mds_in->[49] ^ $mds_in->[56]; 
  $mds_out[17] = $mds_in->[1] ^ $mds_in->[2] ^ $mds_in->[3] ^ $mds_in->[11] ^ $mds_in->[17] ^ $mds_in->[25] ^ $mds_in->[33] ^ $mds_in->[35] ^ $mds_in->[41] ^ $mds_in->[52] ^ $mds_in->[58] ^ $mds_in->[59] ^ $mds_in->[48]; 
  $mds_out[16] = $mds_in->[0] ^ $mds_in->[1] ^ $mds_in->[2] ^ $mds_in->[10] ^ $mds_in->[16] ^ $mds_in->[24] ^ $mds_in->[32] ^ $mds_in->[34] ^ $mds_in->[40] ^ $mds_in->[51] ^ $mds_in->[57] ^ $mds_in->[58]; 
  
  $mds_out[31] = $mds_in->[15] ^ $mds_in->[31] ^ $mds_in->[39] ^ $mds_in->[47] ^ $mds_in->[55] ^ $mds_in->[0] ^ $mds_in->[1] ^ $mds_in->[8] ^ $mds_in->[9] ^ $mds_in->[17] ^ $mds_in->[41] ^ $mds_in->[58]; 
  $mds_out[30] = $mds_in->[7] ^ $mds_in->[14] ^ $mds_in->[15] ^ $mds_in->[30] ^ $mds_in->[38] ^ $mds_in->[46] ^ $mds_in->[54] ^ $mds_in->[0] ^ $mds_in->[8] ^ $mds_in->[16] ^ $mds_in->[40] ^ $mds_in->[57]; 
  $mds_out[29] = $mds_in->[6] ^ $mds_in->[7] ^ $mds_in->[13] ^ $mds_in->[14] ^ $mds_in->[15] ^ $mds_in->[23] ^ $mds_in->[29] ^ $mds_in->[37] ^ $mds_in->[45] ^ $mds_in->[47] ^ $mds_in->[53] ^ $mds_in->[56] ^ $mds_in->[0] ^ $mds_in->[1] ^ $mds_in->[8] ^ $mds_in->[9] ^ $mds_in->[17] ^ $mds_in->[41] ^ $mds_in->[58]; 
  $mds_out[28] = $mds_in->[5] ^ $mds_in->[6] ^ $mds_in->[12] ^ $mds_in->[13] ^ $mds_in->[14] ^ $mds_in->[22] ^ $mds_in->[28] ^ $mds_in->[36] ^ $mds_in->[44] ^ $mds_in->[46] ^ $mds_in->[52] ^ $mds_in->[63] ^ $mds_in->[16] ^ $mds_in->[40] ^ $mds_in->[57] ^ $mds_in->[1] ^ $mds_in->[9] ^ $mds_in->[17] ^ $mds_in->[41] ^ $mds_in->[58]; 
  $mds_out[27] = $mds_in->[4] ^ $mds_in->[5] ^ $mds_in->[11] ^ $mds_in->[12] ^ $mds_in->[13] ^ $mds_in->[21] ^ $mds_in->[27] ^ $mds_in->[35] ^ $mds_in->[43] ^ $mds_in->[45] ^ $mds_in->[51] ^ $mds_in->[62] ^ $mds_in->[56] ^ $mds_in->[16] ^ $mds_in->[40] ^ $mds_in->[57] ^ $mds_in->[1] ^ $mds_in->[9] ^ $mds_in->[17] ^ $mds_in->[41] ^ $mds_in->[58]; 
  $mds_out[26] = $mds_in->[3] ^ $mds_in->[4] ^ $mds_in->[10] ^ $mds_in->[11] ^ $mds_in->[12] ^ $mds_in->[20] ^ $mds_in->[26] ^ $mds_in->[34] ^ $mds_in->[42] ^ $mds_in->[44] ^ $mds_in->[50] ^ $mds_in->[61] ^ $mds_in->[56] ^ $mds_in->[0] ^ $mds_in->[8] ^ $mds_in->[16] ^ $mds_in->[40] ^ $mds_in->[57]; 
  $mds_out[25] = $mds_in->[2] ^ $mds_in->[3] ^ $mds_in->[9] ^ $mds_in->[10] ^ $mds_in->[11] ^ $mds_in->[19] ^ $mds_in->[25] ^ $mds_in->[33] ^ $mds_in->[41] ^ $mds_in->[43] ^ $mds_in->[49] ^ $mds_in->[60] ^ $mds_in->[56]; 
  $mds_out[24] = $mds_in->[1] ^ $mds_in->[2] ^ $mds_in->[8] ^ $mds_in->[9] ^ $mds_in->[10] ^ $mds_in->[18] ^ $mds_in->[24] ^ $mds_in->[32] ^ $mds_in->[40] ^ $mds_in->[42] ^ $mds_in->[48] ^ $mds_in->[59]; 
  
  $mds_out[39] = $mds_in->[23] ^ $mds_in->[39] ^ $mds_in->[47] ^ $mds_in->[55] ^ $mds_in->[63] ^ $mds_in->[2] ^ $mds_in->[8] ^ $mds_in->[9] ^ $mds_in->[16] ^ $mds_in->[17] ^ $mds_in->[25] ^ $mds_in->[49]; 
  $mds_out[38] = $mds_in->[15] ^ $mds_in->[22] ^ $mds_in->[23] ^ $mds_in->[38] ^ $mds_in->[46] ^ $mds_in->[54] ^ $mds_in->[62] ^ $mds_in->[1] ^ $mds_in->[8] ^ $mds_in->[16] ^ $mds_in->[24] ^ $mds_in->[48]; 
  $mds_out[37] = $mds_in->[14] ^ $mds_in->[15] ^ $mds_in->[21] ^ $mds_in->[22] ^ $mds_in->[23] ^ $mds_in->[31] ^ $mds_in->[37] ^ $mds_in->[45] ^ $mds_in->[53] ^ $mds_in->[55] ^ $mds_in->[61] ^ $mds_in->[0] ^ $mds_in->[2] ^ $mds_in->[8] ^ $mds_in->[9] ^ $mds_in->[16] ^ $mds_in->[17] ^ $mds_in->[25] ^ $mds_in->[49]; 
  $mds_out[36] = $mds_in->[7] ^ $mds_in->[13] ^ $mds_in->[14] ^ $mds_in->[20] ^ $mds_in->[21] ^ $mds_in->[22] ^ $mds_in->[30] ^ $mds_in->[36] ^ $mds_in->[44] ^ $mds_in->[52] ^ $mds_in->[54] ^ $mds_in->[60] ^ $mds_in->[1] ^ $mds_in->[24] ^ $mds_in->[48] ^ $mds_in->[2] ^ $mds_in->[9] ^ $mds_in->[17] ^ $mds_in->[25] ^ $mds_in->[49]; 
  $mds_out[35] = $mds_in->[6] ^ $mds_in->[12] ^ $mds_in->[13] ^ $mds_in->[19] ^ $mds_in->[20] ^ $mds_in->[21] ^ $mds_in->[29] ^ $mds_in->[35] ^ $mds_in->[43] ^ $mds_in->[51] ^ $mds_in->[53] ^ $mds_in->[59] ^ $mds_in->[0] ^ $mds_in->[1] ^ $mds_in->[24] ^ $mds_in->[48] ^ $mds_in->[2] ^ $mds_in->[9] ^ $mds_in->[17] ^ $mds_in->[25] ^ $mds_in->[49]; 
  $mds_out[34] = $mds_in->[5] ^ $mds_in->[11] ^ $mds_in->[12] ^ $mds_in->[18] ^ $mds_in->[19] ^ $mds_in->[20] ^ $mds_in->[28] ^ $mds_in->[34] ^ $mds_in->[42] ^ $mds_in->[50] ^ $mds_in->[52] ^ $mds_in->[58] ^ $mds_in->[0] ^ $mds_in->[1] ^ $mds_in->[8] ^ $mds_in->[16] ^ $mds_in->[24] ^ $mds_in->[48]; 
  $mds_out[33] = $mds_in->[4] ^ $mds_in->[10] ^ $mds_in->[11] ^ $mds_in->[17] ^ $mds_in->[18] ^ $mds_in->[19] ^ $mds_in->[27] ^ $mds_in->[33] ^ $mds_in->[41] ^ $mds_in->[49] ^ $mds_in->[51] ^ $mds_in->[57] ^ $mds_in->[0]; 
  $mds_out[32] = $mds_in->[3] ^ $mds_in->[9] ^ $mds_in->[10] ^ $mds_in->[16] ^ $mds_in->[17] ^ $mds_in->[18] ^ $mds_in->[26] ^ $mds_in->[32] ^ $mds_in->[40] ^ $mds_in->[48] ^ $mds_in->[50] ^ $mds_in->[56]; 
  
  $mds_out[47] = $mds_in->[7] ^ $mds_in->[31] ^ $mds_in->[47] ^ $mds_in->[55] ^ $mds_in->[63] ^ $mds_in->[10] ^ $mds_in->[16] ^ $mds_in->[17] ^ $mds_in->[24] ^ $mds_in->[25] ^ $mds_in->[33] ^ $mds_in->[57]; 
  $mds_out[46] = $mds_in->[6] ^ $mds_in->[23] ^ $mds_in->[30] ^ $mds_in->[31] ^ $mds_in->[46] ^ $mds_in->[54] ^ $mds_in->[62] ^ $mds_in->[9] ^ $mds_in->[16] ^ $mds_in->[24] ^ $mds_in->[32] ^ $mds_in->[56]; 
  $mds_out[45] = $mds_in->[5] ^ $mds_in->[22] ^ $mds_in->[23] ^ $mds_in->[29] ^ $mds_in->[30] ^ $mds_in->[31] ^ $mds_in->[39] ^ $mds_in->[45] ^ $mds_in->[53] ^ $mds_in->[61] ^ $mds_in->[63] ^ $mds_in->[8] ^ $mds_in->[10] ^ $mds_in->[16] ^ $mds_in->[17] ^ $mds_in->[24] ^ $mds_in->[25] ^ $mds_in->[33] ^ $mds_in->[57]; 
  $mds_out[44] = $mds_in->[4] ^ $mds_in->[15] ^ $mds_in->[21] ^ $mds_in->[22] ^ $mds_in->[28] ^ $mds_in->[29] ^ $mds_in->[30] ^ $mds_in->[38] ^ $mds_in->[44] ^ $mds_in->[52] ^ $mds_in->[60] ^ $mds_in->[62] ^ $mds_in->[9] ^ $mds_in->[32] ^ $mds_in->[56] ^ $mds_in->[10] ^ $mds_in->[17] ^ $mds_in->[25] ^ $mds_in->[33] ^ $mds_in->[57]; 
  $mds_out[43] = $mds_in->[3] ^ $mds_in->[14] ^ $mds_in->[20] ^ $mds_in->[21] ^ $mds_in->[27] ^ $mds_in->[28] ^ $mds_in->[29] ^ $mds_in->[37] ^ $mds_in->[43] ^ $mds_in->[51] ^ $mds_in->[59] ^ $mds_in->[61] ^ $mds_in->[8] ^ $mds_in->[9] ^ $mds_in->[32] ^ $mds_in->[56] ^ $mds_in->[10] ^ $mds_in->[17] ^ $mds_in->[25] ^ $mds_in->[33] ^ $mds_in->[57]; 
  $mds_out[42] = $mds_in->[2] ^ $mds_in->[13] ^ $mds_in->[19] ^ $mds_in->[20] ^ $mds_in->[26] ^ $mds_in->[27] ^ $mds_in->[28] ^ $mds_in->[36] ^ $mds_in->[42] ^ $mds_in->[50] ^ $mds_in->[58] ^ $mds_in->[60] ^ $mds_in->[8] ^ $mds_in->[9] ^ $mds_in->[16] ^ $mds_in->[24] ^ $mds_in->[32] ^ $mds_in->[56]; 
  $mds_out[41] = $mds_in->[1] ^ $mds_in->[12] ^ $mds_in->[18] ^ $mds_in->[19] ^ $mds_in->[25] ^ $mds_in->[26] ^ $mds_in->[27] ^ $mds_in->[35] ^ $mds_in->[41] ^ $mds_in->[49] ^ $mds_in->[57] ^ $mds_in->[59] ^ $mds_in->[8]; 
  $mds_out[40] = $mds_in->[0] ^ $mds_in->[11] ^ $mds_in->[17] ^ $mds_in->[18] ^ $mds_in->[24] ^ $mds_in->[25] ^ $mds_in->[26] ^ $mds_in->[34] ^ $mds_in->[40] ^ $mds_in->[48] ^ $mds_in->[56] ^ $mds_in->[58]; 
  
  $mds_out[55] = $mds_in->[7] ^ $mds_in->[15] ^ $mds_in->[39] ^ $mds_in->[55] ^ $mds_in->[63] ^ $mds_in->[1] ^ $mds_in->[18] ^ $mds_in->[24] ^ $mds_in->[25] ^ $mds_in->[32] ^ $mds_in->[33] ^ $mds_in->[41]; 
  $mds_out[54] = $mds_in->[6] ^ $mds_in->[14] ^ $mds_in->[31] ^ $mds_in->[38] ^ $mds_in->[39] ^ $mds_in->[54] ^ $mds_in->[62] ^ $mds_in->[0] ^ $mds_in->[17] ^ $mds_in->[24] ^ $mds_in->[32] ^ $mds_in->[40]; 
  $mds_out[53] = $mds_in->[5] ^ $mds_in->[7] ^ $mds_in->[13] ^ $mds_in->[30] ^ $mds_in->[31] ^ $mds_in->[37] ^ $mds_in->[38] ^ $mds_in->[39] ^ $mds_in->[47] ^ $mds_in->[53] ^ $mds_in->[61] ^ $mds_in->[16] ^ $mds_in->[1] ^ $mds_in->[18] ^ $mds_in->[24] ^ $mds_in->[25] ^ $mds_in->[32] ^ $mds_in->[33] ^ $mds_in->[41]; 
  $mds_out[52] = $mds_in->[4] ^ $mds_in->[6] ^ $mds_in->[12] ^ $mds_in->[23] ^ $mds_in->[29] ^ $mds_in->[30] ^ $mds_in->[36] ^ $mds_in->[37] ^ $mds_in->[38] ^ $mds_in->[46] ^ $mds_in->[52] ^ $mds_in->[60] ^ $mds_in->[0] ^ $mds_in->[17] ^ $mds_in->[40] ^ $mds_in->[1] ^ $mds_in->[18] ^ $mds_in->[25] ^ $mds_in->[33] ^ $mds_in->[41]; 
  $mds_out[51] = $mds_in->[3] ^ $mds_in->[5] ^ $mds_in->[11] ^ $mds_in->[22] ^ $mds_in->[28] ^ $mds_in->[29] ^ $mds_in->[35] ^ $mds_in->[36] ^ $mds_in->[37] ^ $mds_in->[45] ^ $mds_in->[51] ^ $mds_in->[59] ^ $mds_in->[16] ^ $mds_in->[0] ^ $mds_in->[17] ^ $mds_in->[40] ^ $mds_in->[1] ^ $mds_in->[18] ^ $mds_in->[25] ^ $mds_in->[33] ^ $mds_in->[41]; 
  $mds_out[50] = $mds_in->[2] ^ $mds_in->[4] ^ $mds_in->[10] ^ $mds_in->[21] ^ $mds_in->[27] ^ $mds_in->[28] ^ $mds_in->[34] ^ $mds_in->[35] ^ $mds_in->[36] ^ $mds_in->[44] ^ $mds_in->[50] ^ $mds_in->[58] ^ $mds_in->[16] ^ $mds_in->[0] ^ $mds_in->[17] ^ $mds_in->[24] ^ $mds_in->[32] ^ $mds_in->[40]; 
  $mds_out[49] = $mds_in->[1] ^ $mds_in->[3] ^ $mds_in->[9] ^ $mds_in->[20] ^ $mds_in->[26] ^ $mds_in->[27] ^ $mds_in->[33] ^ $mds_in->[34] ^ $mds_in->[35] ^ $mds_in->[43] ^ $mds_in->[49] ^ $mds_in->[57] ^ $mds_in->[16]; 
  $mds_out[48] = $mds_in->[0] ^ $mds_in->[2] ^ $mds_in->[8] ^ $mds_in->[19] ^ $mds_in->[25] ^ $mds_in->[26] ^ $mds_in->[32] ^ $mds_in->[33] ^ $mds_in->[34] ^ $mds_in->[42] ^ $mds_in->[48] ^ $mds_in->[56]; 
  
  $mds_out[63] = $mds_in->[7] ^ $mds_in->[15] ^ $mds_in->[23] ^ $mds_in->[47] ^ $mds_in->[63] ^ $mds_in->[9] ^ $mds_in->[26] ^ $mds_in->[32] ^ $mds_in->[33] ^ $mds_in->[40] ^ $mds_in->[41] ^ $mds_in->[49]; 
  $mds_out[62] = $mds_in->[6] ^ $mds_in->[14] ^ $mds_in->[22] ^ $mds_in->[39] ^ $mds_in->[46] ^ $mds_in->[47] ^ $mds_in->[62] ^ $mds_in->[8] ^ $mds_in->[25] ^ $mds_in->[32] ^ $mds_in->[40] ^ $mds_in->[48]; 
  $mds_out[61] = $mds_in->[5] ^ $mds_in->[13] ^ $mds_in->[15] ^ $mds_in->[21] ^ $mds_in->[38] ^ $mds_in->[39] ^ $mds_in->[45] ^ $mds_in->[46] ^ $mds_in->[47] ^ $mds_in->[55] ^ $mds_in->[61] ^ $mds_in->[24] ^ $mds_in->[9] ^ $mds_in->[26] ^ $mds_in->[32] ^ $mds_in->[33] ^ $mds_in->[40] ^ $mds_in->[41] ^ $mds_in->[49]; 
  $mds_out[60] = $mds_in->[4] ^ $mds_in->[12] ^ $mds_in->[14] ^ $mds_in->[20] ^ $mds_in->[31] ^ $mds_in->[37] ^ $mds_in->[38] ^ $mds_in->[44] ^ $mds_in->[45] ^ $mds_in->[46] ^ $mds_in->[54] ^ $mds_in->[60] ^ $mds_in->[8] ^ $mds_in->[25] ^ $mds_in->[48] ^ $mds_in->[9] ^ $mds_in->[26] ^ $mds_in->[33] ^ $mds_in->[41] ^ $mds_in->[49]; 
  $mds_out[59] = $mds_in->[3] ^ $mds_in->[11] ^ $mds_in->[13] ^ $mds_in->[19] ^ $mds_in->[30] ^ $mds_in->[36] ^ $mds_in->[37] ^ $mds_in->[43] ^ $mds_in->[44] ^ $mds_in->[45] ^ $mds_in->[53] ^ $mds_in->[59] ^ $mds_in->[24] ^ $mds_in->[8] ^ $mds_in->[25] ^ $mds_in->[48] ^ $mds_in->[9] ^ $mds_in->[26] ^ $mds_in->[33] ^ $mds_in->[41] ^ $mds_in->[49]; 
  $mds_out[58] = $mds_in->[2] ^ $mds_in->[10] ^ $mds_in->[12] ^ $mds_in->[18] ^ $mds_in->[29] ^ $mds_in->[35] ^ $mds_in->[36] ^ $mds_in->[42] ^ $mds_in->[43] ^ $mds_in->[44] ^ $mds_in->[52] ^ $mds_in->[58] ^ $mds_in->[24] ^ $mds_in->[8] ^ $mds_in->[25] ^ $mds_in->[32] ^ $mds_in->[40] ^ $mds_in->[48]; 
  $mds_out[57] = $mds_in->[1] ^ $mds_in->[9] ^ $mds_in->[11] ^ $mds_in->[17] ^ $mds_in->[28] ^ $mds_in->[34] ^ $mds_in->[35] ^ $mds_in->[41] ^ $mds_in->[42] ^ $mds_in->[43] ^ $mds_in->[51] ^ $mds_in->[57] ^ $mds_in->[24]; 
  $mds_out[56] = $mds_in->[0] ^ $mds_in->[8] ^ $mds_in->[10] ^ $mds_in->[16] ^ $mds_in->[27] ^ $mds_in->[33] ^ $mds_in->[34] ^ $mds_in->[40] ^ $mds_in->[41] ^ $mds_in->[42] ^ $mds_in->[50] ^ $mds_in->[56]; 

  return (\@mds_out);
}

sub cmvm_opt_xor_enc{
  my ($the_cnt, $mds_in) = @_;

  my @mds_out = ();

  # Description of the MDS polynomial matrix multiplication in Verilog 
  # Date: Sun Sep  8 17:42:50 2024 
  # MDS File: ..\examples\kalyna_enc.txt 
  
  # S1: (+1*X47+1*X55) = +X47<<0 +X55<<0 
  my $sub_exp1; 
  $sub_exp1 = $mds_in->[41] ^ $mds_in->[49]; 
  
  # S2: (+1*X7+1*X63) = +X7<<0 +X63<<0 
  my $sub_exp2; 
  $sub_exp2 = $mds_in->[1] ^ $mds_in->[57]; 
  
  # S3: (+1*X15+1*X23) = +X15<<0 +X23<<0 
  my $sub_exp3; 
  $sub_exp3 = $mds_in->[9] ^ $mds_in->[17]; 
  
  # S4: (+1*X31+1*X39) = +X31<<0 +X39<<0 
  my $sub_exp4; 
  $sub_exp4 = $mds_in->[25] ^ $mds_in->[33]; 
  
  # S5: (+1*X48+1*X56) = +X48<<0 +X56<<0 
  my $sub_exp5; 
  $sub_exp5 = $mds_in->[40] ^ $mds_in->[48]; 
  
  # S6: (+1*X8+1*X32) = +X8<<0 +X32<<0 
  my $sub_exp6; 
  $sub_exp6 = $mds_in->[0] ^ $mds_in->[24]; 
  
  # S7: (+1*X16+1*X24) = +X16<<0 +X24<<0 
  my $sub_exp7; 
  $sub_exp7 = $mds_in->[8] ^ $mds_in->[16]; 
  
  # S8: (+1*X40+1*X64) = +X40<<0 +X64<<0 
  my $sub_exp8; 
  $sub_exp8 = $mds_in->[32] ^ $mds_in->[56]; 
  
  # S9: (+1*X23+1*X63) = +X23<<0 +X63<<0 
  my $sub_exp9; 
  $sub_exp9 = $mds_in->[17] ^ $mds_in->[57]; 
  
  # S10: (+1*X31+1*X55) = +X31<<0 +X55<<0 
  my $sub_exp10; 
  $sub_exp10 = $mds_in->[25] ^ $mds_in->[49]; 
  
  # S11: (+1*X15+1*X39) = +X15<<0 +X39<<0 
  my $sub_exp11; 
  $sub_exp11 = $mds_in->[9] ^ $mds_in->[33]; 
  
  # S12: (+1*X7+1*X47) = +X7<<0 +X47<<0 
  my $sub_exp12; 
  $sub_exp12 = $mds_in->[1] ^ $mds_in->[41]; 
  
  # S13: (+1*X30+1*X40+1*X64) = +X30<<0 +S8<<0 
  my $sub_exp13; 
  $sub_exp13 = $mds_in->[26] ^ $sub_exp8; 
  
  # S14: (+1*X38+1*X46) = +X38<<0 +X46<<0 
  my $sub_exp14; 
  $sub_exp14 = $mds_in->[34] ^ $mds_in->[42]; 
  
  # S15: (+1*X16+1*X24+1*X54) = +X54<<0 +S7<<0 
  my $sub_exp15; 
  $sub_exp15 = $mds_in->[50] ^ $sub_exp7; 
  
  # S16: (+1*X8+1*X32+1*X62) = +X62<<0 +S6<<0 
  my $sub_exp16; 
  $sub_exp16 = $mds_in->[58] ^ $sub_exp6; 
  
  # S17: (+1*X6+1*X14) = +X6<<0 +X14<<0 
  my $sub_exp17; 
  $sub_exp17 = $mds_in->[2] ^ $mds_in->[10]; 
  
  # S18: (+1*X22+1*X48+1*X56) = +X22<<0 +S5<<0 
  my $sub_exp18; 
  $sub_exp18 = $mds_in->[18] ^ $sub_exp5; 
  
  # S19: (+1*X1+1*X9) = +X1<<0 +X9<<0 
  my $sub_exp19; 
  $sub_exp19 = $mds_in->[7] ^ $mds_in->[15]; 
  
  # S20: (+1*X17+1*X25) = +X17<<0 +X25<<0 
  my $sub_exp20; 
  $sub_exp20 = $mds_in->[23] ^ $mds_in->[31]; 
  
  # S21: (+1*X49+1*X57) = +X49<<0 +X57<<0 
  my $sub_exp21; 
  $sub_exp21 = $mds_in->[55] ^ $mds_in->[63]; 
  
  # S22: (+1*X33+1*X41) = +X33<<0 +X41<<0 
  my $sub_exp22; 
  $sub_exp22 = $mds_in->[39] ^ $mds_in->[47]; 
  
  # S23: (+1*X2+1*X10) = +X2<<0 +X10<<0 
  my $sub_exp23; 
  $sub_exp23 = $mds_in->[6] ^ $mds_in->[14]; 
  
  # S24: (+1*X18+1*X26) = +X18<<0 +X26<<0 
  my $sub_exp24; 
  $sub_exp24 = $mds_in->[22] ^ $mds_in->[30]; 
  
  # S25: (+1*X50+1*X58) = +X50<<0 +X58<<0 
  my $sub_exp25; 
  $sub_exp25 = $mds_in->[54] ^ $mds_in->[62]; 
  
  # S26: (+1*X34+1*X42) = +X34<<0 +X42<<0 
  my $sub_exp26; 
  $sub_exp26 = $mds_in->[38] ^ $mds_in->[46]; 
  
  # S27: (+1*X4+1*X12) = +X4<<0 +X12<<0 
  my $sub_exp27; 
  $sub_exp27 = $mds_in->[4] ^ $mds_in->[12]; 
  
  # S28: (+1*X20+1*X28) = +X20<<0 +X28<<0 
  my $sub_exp28; 
  $sub_exp28 = $mds_in->[20] ^ $mds_in->[28]; 
  
  # S29: (+1*X52+1*X60) = +X52<<0 +X60<<0 
  my $sub_exp29; 
  $sub_exp29 = $mds_in->[52] ^ $mds_in->[60]; 
  
  # S30: (+1*X36+1*X44) = +X36<<0 +X44<<0 
  my $sub_exp30; 
  $sub_exp30 = $mds_in->[36] ^ $mds_in->[44]; 
  
  # S31: (+1*X3+1*X11) = +X3<<0 +X11<<0 
  my $sub_exp31; 
  $sub_exp31 = $mds_in->[5] ^ $mds_in->[13]; 
  
  # S32: (+1*X19+1*X27) = +X19<<0 +X27<<0 
  my $sub_exp32; 
  $sub_exp32 = $mds_in->[21] ^ $mds_in->[29]; 
  
  # S33: (+1*X51+1*X59) = +X51<<0 +X59<<0 
  my $sub_exp33; 
  $sub_exp33 = $mds_in->[53] ^ $mds_in->[61]; 
  
  # S34: (+1*X35+1*X43) = +X35<<0 +X43<<0 
  my $sub_exp34; 
  $sub_exp34 = $mds_in->[37] ^ $mds_in->[45]; 
  
  # S35: (+1*X21+1*X47+1*X55) = +X21<<0 +S1<<0 
  my $sub_exp35; 
  $sub_exp35 = $mds_in->[19] ^ $sub_exp1; 
  
  # S36: (+1*X5+1*X13) = +X5<<0 +X13<<0 
  my $sub_exp36; 
  $sub_exp36 = $mds_in->[3] ^ $mds_in->[11]; 
  
  # S37: (+1*X53+1*X61) = +X53<<0 +X61<<0 
  my $sub_exp37; 
  $sub_exp37 = $mds_in->[51] ^ $mds_in->[59]; 
  
  # S38: (+1*X37+1*X45) = +X37<<0 +X45<<0 
  my $sub_exp38; 
  $sub_exp38 = $mds_in->[35] ^ $mds_in->[43]; 
  
  # S39: (+1*X15+1*X23+1*X31+1*X55) = +S3<<0 +S10<<0 
  my $sub_exp39; 
  $sub_exp39 = $sub_exp3 ^ $sub_exp10; 
  
  # S40: (+1*X15+1*X23+1*X62) = +X62<<0 +S3<<0 
  my $sub_exp40; 
  $sub_exp40 = $mds_in->[58] ^ $sub_exp3; 
  
  # S41: (+1*X24+1*X38) = +X24<<0 +X38<<0 
  my $sub_exp41; 
  $sub_exp41 = $mds_in->[16] ^ $mds_in->[34]; 
  
  # S42: (+1*X6+1*X56) = +X6<<0 +X56<<0 
  my $sub_exp42; 
  $sub_exp42 = $mds_in->[2] ^ $mds_in->[48]; 
  
  # S43: (+1*X8+1*X16) = +X8<<0 +X16<<0 
  my $sub_exp43; 
  $sub_exp43 = $mds_in->[0] ^ $mds_in->[8]; 
  
  # S44: (+1*X8+1*X48) = +X8<<0 +X48<<0 
  my $sub_exp44; 
  $sub_exp44 = $mds_in->[0] ^ $mds_in->[40]; 
  
  # S45: (+1*X40+1*X48) = +X40<<0 +X48<<0 
  my $sub_exp45; 
  $sub_exp45 = $mds_in->[32] ^ $mds_in->[40]; 
  
  # S46: (+1*X16+1*X40) = +X16<<0 +X40<<0 
  my $sub_exp46; 
  $sub_exp46 = $mds_in->[8] ^ $mds_in->[32]; 
  
  # S47: (+1*X7+1*X31+1*X39+1*X47) = +S4<<0 +S12<<0 
  my $sub_exp47; 
  $sub_exp47 = $sub_exp4 ^ $sub_exp12; 
  
  # S48: (+1*X7+1*X63+1*X64) = +X64<<0 +S2<<0 
  my $sub_exp48; 
  $sub_exp48 = $mds_in->[56] ^ $sub_exp2; 
  
  # S49: (+1*X15+1*X39+1*X54) = +X54<<0 +S11<<0 
  my $sub_exp49; 
  $sub_exp49 = $mds_in->[50] ^ $sub_exp11; 
  
  # S50: (+1*X15+1*X32) = +X15<<0 +X32<<0 
  my $sub_exp50; 
  $sub_exp50 = $mds_in->[9] ^ $mds_in->[24]; 
  
  # S51: (+1*X14+1*X31+1*X39) = +X14<<0 +S4<<0 
  my $sub_exp51; 
  $sub_exp51 = $mds_in->[10] ^ $sub_exp4; 
  
  # S52: (+1*X7+1*X22+1*X31+1*X39+1*X47) = +X22<<0 +S47<<0 
  my $sub_exp52; 
  $sub_exp52 = $mds_in->[18] ^ $sub_exp47; 
  
  # S53: (+1*X21+1*X29+1*X47+1*X55) = +X29<<0 +S35<<0 
  my $sub_exp53; 
  $sub_exp53 = $mds_in->[27] ^ $sub_exp35; 
  
  # S54: (+1*X5+1*X29) = +X5<<0 +X29<<0 
  my $sub_exp54; 
  $sub_exp54 = $mds_in->[3] ^ $mds_in->[27]; 
  
  # S55: (+1*X18+1*X42) = +X18<<0 +X42<<0 
  my $sub_exp55; 
  $sub_exp55 = $mds_in->[22] ^ $mds_in->[46]; 
  
  # S56: (+1*X6+1*X14+1*X22+1*X48+1*X56) = +S17<<0 +S18<<0 
  my $sub_exp56; 
  $sub_exp56 = $sub_exp17 ^ $sub_exp18; 
  
  # S57: (+1*X33+1*X57) = +X33<<0 +X57<<0 
  my $sub_exp57; 
  $sub_exp57 = $mds_in->[39] ^ $mds_in->[63]; 
  
  # S58: (+1*X34+1*X58) = +X34<<0 +X58<<0 
  my $sub_exp58; 
  $sub_exp58 = $mds_in->[38] ^ $mds_in->[62]; 
  
  # S59: (+1*X35+1*X59) = +X35<<0 +X59<<0 
  my $sub_exp59; 
  $sub_exp59 = $mds_in->[37] ^ $mds_in->[61]; 
  
  # S60: (+1*X2+1*X26) = +X2<<0 +X26<<0 
  my $sub_exp60; 
  $sub_exp60 = $mds_in->[6] ^ $mds_in->[30]; 
  
  # S61: (+1*X3+1*X27) = +X3<<0 +X27<<0 
  my $sub_exp61; 
  $sub_exp61 = $mds_in->[5] ^ $mds_in->[29]; 
  
  # S62: (+1*X15+1*X23+1*X48+1*X62) = +X48<<0 +S40<<0 
  my $sub_exp62; 
  $sub_exp62 = $mds_in->[40] ^ $sub_exp40; 
  
  # S63: (+1*X35+1*X43+1*X56) = +X56<<0 +S34<<0 
  my $sub_exp63; 
  $sub_exp63 = $mds_in->[48] ^ $sub_exp34; 
  
  # S64: (+1*X9+1*X49) = +X9<<0 +X49<<0 
  my $sub_exp64; 
  $sub_exp64 = $mds_in->[15] ^ $mds_in->[55]; 
  
  # S65: (+1*X10+1*X50) = +X10<<0 +X50<<0 
  my $sub_exp65; 
  $sub_exp65 = $mds_in->[14] ^ $mds_in->[54]; 
  
  # S66: (+1*X11+1*X51) = +X11<<0 +X51<<0 
  my $sub_exp66; 
  $sub_exp66 = $mds_in->[13] ^ $mds_in->[53]; 
  
  # S67: (+1*X3+1*X11+1*X24) = +X24<<0 +S31<<0 
  my $sub_exp67; 
  $sub_exp67 = $mds_in->[16] ^ $sub_exp31; 
  
  # S68: (+1*X16+1*X24+1*X38+1*X46+1*X54) = +S14<<0 +S15<<0 
  my $sub_exp68; 
  $sub_exp68 = $sub_exp14 ^ $sub_exp15; 
  
  # S69: (+1*X19+1*X43) = +X19<<0 +X43<<0 
  my $sub_exp69; 
  $sub_exp69 = $mds_in->[21] ^ $mds_in->[45]; 
  
  # S70: (+1*X37+1*X61) = +X37<<0 +X61<<0 
  my $sub_exp70; 
  $sub_exp70 = $mds_in->[35] ^ $mds_in->[59]; 
  
  # S71: (+1*X4+1*X28) = +X4<<0 +X28<<0 
  my $sub_exp71; 
  $sub_exp71 = $mds_in->[4] ^ $mds_in->[28]; 
  
  # S72: (+1*X44+1*X63) = +X44<<0 +X63<<0 
  my $sub_exp72; 
  $sub_exp72 = $mds_in->[44] ^ $mds_in->[57]; 
  
  # S73: (+1*X13+1*X53) = +X13<<0 +X53<<0 
  my $sub_exp73; 
  $sub_exp73 = $mds_in->[11] ^ $mds_in->[51]; 
  
  # S74: (+1*X23+1*X47+1*X55+1*X63) = +S1<<0 +S9<<0 
  my $sub_exp74; 
  $sub_exp74 = $sub_exp1 ^ $sub_exp9; 
  
  # S75: (+1*X17+1*X41) = +X17<<0 +X41<<0 
  my $sub_exp75; 
  $sub_exp75 = $mds_in->[23] ^ $mds_in->[47]; 
  
  # S76: (+1*X39+1*X64) = +X39<<0 +X64<<0 
  my $sub_exp76; 
  $sub_exp76 = $mds_in->[33] ^ $mds_in->[56]; 
  
  # S77: (+1*X30+1*X64) = +X30<<0 +X64<<0 
  my $sub_exp77; 
  $sub_exp77 = $mds_in->[26] ^ $mds_in->[56]; 
  
  # S78: (+1*X16+1*X30) = +X16<<0 +X30<<0 
  my $sub_exp78; 
  $sub_exp78 = $mds_in->[8] ^ $mds_in->[26]; 
  
  # S79: (+1*X15+1*X30+1*X39) = +X30<<0 +S11<<0 
  my $sub_exp79; 
  $sub_exp79 = $mds_in->[26] ^ $sub_exp11; 
  
  # S80: (+1*X7+1*X21) = +X7<<0 +X21<<0 
  my $sub_exp80; 
  $sub_exp80 = $mds_in->[1] ^ $mds_in->[19]; 
  
  # S81: (+1*X1+1*X25) = +X1<<0 +X25<<0 
  my $sub_exp81; 
  $sub_exp81 = $mds_in->[7] ^ $mds_in->[31]; 
  
  # S82: (+1*X36+1*X60) = +X36<<0 +X60<<0 
  my $sub_exp82; 
  $sub_exp82 = $mds_in->[36] ^ $mds_in->[60]; 
  
  # S83: (+1*X7+1*X55+1*X63) = +X55<<0 +S2<<0 
  my $sub_exp83; 
  $sub_exp83 = $mds_in->[49] ^ $sub_exp2; 
  
  # S84: (+1*X12+1*X52) = +X12<<0 +X52<<0 
  my $sub_exp84; 
  $sub_exp84 = $mds_in->[12] ^ $mds_in->[52]; 
  
  # S85: (+1*X31+1*X46) = +X31<<0 +X46<<0 
  my $sub_exp85; 
  $sub_exp85 = $mds_in->[25] ^ $mds_in->[42]; 
  
  # S86: (+1*X24+1*X41) = +X24<<0 +X41<<0 
  my $sub_exp86; 
  $sub_exp86 = $mds_in->[16] ^ $mds_in->[47]; 
  
  # S87: (+1*X1+1*X9+1*X17+1*X41) = +S19<<0 +S75<<0 
  my $sub_exp87; 
  $sub_exp87 = $sub_exp19 ^ $sub_exp75; 
  
  # S88: (+1*X3+1*X11+1*X50) = +X50<<0 +S31<<0 
  my $sub_exp88; 
  $sub_exp88 = $mds_in->[54] ^ $sub_exp31; 
  
  # S89: (+1*X4+1*X12+1*X51) = +X51<<0 +S27<<0 
  my $sub_exp89; 
  $sub_exp89 = $mds_in->[53] ^ $sub_exp27; 
  
  # S90: (+1*X9+1*X56) = +X9<<0 +X56<<0 
  my $sub_exp90; 
  $sub_exp90 = $mds_in->[15] ^ $mds_in->[48]; 
  
  # S91: (+1*X3+1*X20+1*X28) = +X3<<0 +S28<<0 
  my $sub_exp91; 
  $sub_exp91 = $mds_in->[5] ^ $sub_exp28; 
  
  # S92: (+1*X9+1*X33+1*X41+1*X49) = +S22<<0 +S64<<0 
  my $sub_exp92; 
  $sub_exp92 = $sub_exp22 ^ $sub_exp64; 
  
  # S93: (+1*X15+1*X32+1*X61) = +X61<<0 +S50<<0 
  my $sub_exp93; 
  $sub_exp93 = $mds_in->[59] ^ $sub_exp50; 
  
  # S94: (+1*X18+1*X35+1*X43) = +X18<<0 +S34<<0 
  my $sub_exp94; 
  $sub_exp94 = $mds_in->[22] ^ $sub_exp34; 
  
  # S95: (+1*X33+1*X50+1*X58) = +X33<<0 +S25<<0 
  my $sub_exp95; 
  $sub_exp95 = $mds_in->[39] ^ $sub_exp25; 
  
  # S96: (+1*X2+1*X26+1*X50+1*X58) = +S25<<0 +S60<<0 
  my $sub_exp96; 
  $sub_exp96 = $sub_exp25 ^ $sub_exp60; 
  
  # S97: (+1*X20+1*X28+1*X36+1*X60) = +S28<<0 +S82<<0 
  my $sub_exp97; 
  $sub_exp97 = $sub_exp28 ^ $sub_exp82; 
  
  # S98: (+1*X24+1*X38+1*X52) = +X52<<0 +S41<<0 
  my $sub_exp98; 
  $sub_exp98 = $mds_in->[52] ^ $sub_exp41; 
  
  # S99: (+1*X35+1*X52+1*X60) = +X35<<0 +S29<<0 
  my $sub_exp99; 
  $sub_exp99 = $mds_in->[37] ^ $sub_exp29; 
  
  # S100: (+1*X4+1*X28+1*X52+1*X60) = +S29<<0 +S71<<0 
  my $sub_exp100; 
  $sub_exp100 = $sub_exp29 ^ $sub_exp71; 
  
  # S101: (+1*X18+1*X26+1*X34+1*X58) = +S24<<0 +S58<<0 
  my $sub_exp101; 
  $sub_exp101 = $sub_exp24 ^ $sub_exp58; 
  
  # S102: (+1*X1+1*X18+1*X26) = +X1<<0 +S24<<0 
  my $sub_exp102; 
  $sub_exp102 = $mds_in->[7] ^ $sub_exp24; 
  
  # S103: (+1*X45+1*X63) = +X45<<0 +X63<<0 
  my $sub_exp103; 
  $sub_exp103 = $mds_in->[43] ^ $mds_in->[57]; 
  
  # S104: (+1*X2+1*X19+1*X27) = +X2<<0 +S32<<0 
  my $sub_exp104; 
  $sub_exp104 = $mds_in->[6] ^ $sub_exp32; 
  
  # S105: (+1*X5+1*X29+1*X53+1*X61) = +S37<<0 +S54<<0 
  my $sub_exp105; 
  $sub_exp105 = $sub_exp37 ^ $sub_exp54; 
  
  # S106: (+1*X45+1*X54) = +X45<<0 +X54<<0 
  my $sub_exp106; 
  $sub_exp106 = $mds_in->[43] ^ $mds_in->[50]; 
  
  # S107: (+1*X24+1*X30+1*X40+1*X64) = +X24<<0 +S13<<0 
  my $sub_exp107; 
  $sub_exp107 = $mds_in->[16] ^ $sub_exp13; 
  
  # S108: (+1*X6+1*X14+1*X16+1*X22+1*X40+1*X48+1*X56) = +S46<<0 +S56<<0 
  my $sub_exp108; 
  $sub_exp108 = $sub_exp46 ^ $sub_exp56; 
  
  # S109: (+1*X12+1*X36+1*X44+1*X52) = +S30<<0 +S84<<0 
  my $sub_exp109; 
  $sub_exp109 = $sub_exp30 ^ $sub_exp84; 
  
  # S110: (+1*X19+1*X36+1*X44) = +X19<<0 +S30<<0 
  my $sub_exp110; 
  $sub_exp110 = $mds_in->[21] ^ $sub_exp30; 
  
  # S111: (+1*X2+1*X10+1*X18+1*X42) = +S23<<0 +S55<<0 
  my $sub_exp111; 
  $sub_exp111 = $sub_exp23 ^ $sub_exp55; 
  
  # S112: (+1*X2+1*X10+1*X49) = +X49<<0 +S23<<0 
  my $sub_exp112; 
  $sub_exp112 = $mds_in->[55] ^ $sub_exp23; 
  
  # S113: (+1*X7+1*X32) = +X7<<0 +X32<<0 
  my $sub_exp113; 
  $sub_exp113 = $mds_in->[1] ^ $mds_in->[24]; 
  
  # S114: (+1*X34+1*X51+1*X59) = +X34<<0 +S33<<0 
  my $sub_exp114; 
  $sub_exp114 = $mds_in->[38] ^ $sub_exp33; 
  
  # S115: (+1*X11+1*X46) = +X11<<0 +X46<<0 
  my $sub_exp115; 
  $sub_exp115 = $mds_in->[13] ^ $mds_in->[42]; 
  
  # S116: (+1*X7+1*X31+1*X55+1*X63+1*X64) = +S10<<0 +S48<<0 
  my $sub_exp116; 
  $sub_exp116 = $sub_exp10 ^ $sub_exp48; 
  
  # S117: (+1*X17+1*X25+1*X33+1*X57) = +S20<<0 +S57<<0 
  my $sub_exp117; 
  $sub_exp117 = $sub_exp20 ^ $sub_exp57; 
  
  # S118: (+1*X8+1*X17+1*X25) = +X8<<0 +S20<<0 
  my $sub_exp118; 
  $sub_exp118 = $mds_in->[0] ^ $sub_exp20; 
  
  # S119: (+1*X7+1*X15+1*X39+1*X54+1*X63+1*X64) = +S48<<0 +S49<<0 
  my $sub_exp119; 
  $sub_exp119 = $sub_exp48 ^ $sub_exp49; 
  
  # S120: (+1*X16+1*X24+1*X51+1*X59) = +S7<<0 +S33<<0 
  my $sub_exp120; 
  $sub_exp120 = $sub_exp7 ^ $sub_exp33; 
  
  # S121: (+1*X6+1*X15+1*X23+1*X31+1*X55) = +X6<<0 +S39<<0 
  my $sub_exp121; 
  $sub_exp121 = $mds_in->[2] ^ $sub_exp39; 
  
  # S122: (+1*X16+1*X17+1*X24) = +X17<<0 +S7<<0 
  my $sub_exp122; 
  $sub_exp122 = $mds_in->[23] ^ $sub_exp7; 
  
  # S123: (+1*X32+1*X37+1*X45) = +X32<<0 +S38<<0 
  my $sub_exp123; 
  $sub_exp123 = $mds_in->[24] ^ $sub_exp38; 
  
  # S124: (+1*X23+1*X38+1*X47+1*X55+1*X63) = +X38<<0 +S74<<0 
  my $sub_exp124; 
  $sub_exp124 = $mds_in->[34] ^ $sub_exp74; 
  
  # S125: (+1*X23+1*X38+1*X47+1*X48+1*X55+1*X56+1*X63) = +S5<<0 +S124<<0 
  my $sub_exp125; 
  $sub_exp125 = $sub_exp5 ^ $sub_exp124; 
  
  # S126: (+1*X19+1*X27+1*X49+1*X57) = +S21<<0 +S32<<0 
  my $sub_exp126; 
  $sub_exp126 = $sub_exp21 ^ $sub_exp32; 
  
  # S127: (+1*X20+1*X44) = +X20<<0 +X44<<0 
  my $sub_exp127; 
  $sub_exp127 = $mds_in->[20] ^ $mds_in->[44]; 
  
  # S128: (+1*X39+1*X53) = +X39<<0 +X53<<0 
  my $sub_exp128; 
  $sub_exp128 = $mds_in->[33] ^ $mds_in->[51]; 
  
  # S129: (+1*X21+1*X23+1*X29+1*X47+1*X55+1*X63) = +S9<<0 +S53<<0 
  my $sub_exp129; 
  $sub_exp129 = $sub_exp9 ^ $sub_exp53; 
  
  # S130: (+1*X10+1*X34+1*X42+1*X50) = +S26<<0 +S65<<0 
  my $sub_exp130; 
  $sub_exp130 = $sub_exp26 ^ $sub_exp65; 
  
  # S131: (+1*X22+1*X56) = +X22<<0 +X56<<0 
  my $sub_exp131; 
  $sub_exp131 = $mds_in->[18] ^ $mds_in->[48]; 
  
  # S132: (+1*X8+1*X22+1*X32+1*X56+1*X62) = +S16<<0 +S131<<0 
  my $sub_exp132; 
  $sub_exp132 = $sub_exp16 ^ $sub_exp131; 
  
  # S133: (+1*X8+1*X12+1*X32) = +X12<<0 +S6<<0 
  my $sub_exp133; 
  $sub_exp133 = $mds_in->[12] ^ $sub_exp6; 
  
  # S134: (+1*X31+1*X46+1*X51+1*X59) = +S33<<0 +S85<<0 
  my $sub_exp134; 
  $sub_exp134 = $sub_exp33 ^ $sub_exp85; 
  
  # S135: (+1*X7+1*X31+1*X46+1*X51+1*X59+1*X63) = +S2<<0 +S134<<0 
  my $sub_exp135; 
  $sub_exp135 = $sub_exp2 ^ $sub_exp134; 
  
  # S136: (+1*X21+1*X29+1*X37+1*X47+1*X55+1*X61) = +S53<<0 +S70<<0 
  my $sub_exp136; 
  $sub_exp136 = $sub_exp53 ^ $sub_exp70; 
  
  # S137: (+1*X8+1*X16+1*X55) = +X55<<0 +S43<<0 
  my $sub_exp137; 
  $sub_exp137 = $mds_in->[49] ^ $sub_exp43; 
  
  # S138: (+1*X6+1*X38+1*X46+1*X56) = +S14<<0 +S42<<0 
  my $sub_exp138; 
  $sub_exp138 = $sub_exp14 ^ $sub_exp42; 
  
  # S139: (+1*X6+1*X30+1*X38+1*X40+1*X46+1*X56+1*X64) = +S13<<0 +S138<<0 
  my $sub_exp139; 
  $sub_exp139 = $sub_exp13 ^ $sub_exp138; 
  
  # S140: (+1*X7+1*X15+1*X23+1*X47+1*X62) = +S12<<0 +S40<<0 
  my $sub_exp140; 
  $sub_exp140 = $sub_exp12 ^ $sub_exp40; 
  
  # S141: (+1*X7+1*X8+1*X15+1*X16+1*X23+1*X47+1*X62) = +S43<<0 +S140<<0 
  my $sub_exp141; 
  $sub_exp141 = $sub_exp43 ^ $sub_exp140; 
  
  # S142: (+1*X7+1*X28+1*X63) = +X28<<0 +S2<<0 
  my $sub_exp142; 
  $sub_exp142 = $mds_in->[28] ^ $sub_exp2; 
  
  # S143: (+1*X7+1*X28+1*X47+1*X63) = +X47<<0 +S142<<0 
  my $sub_exp143; 
  $sub_exp143 = $mds_in->[41] ^ $sub_exp142; 
  
  # S144: (+1*X3+1*X11+1*X15+1*X23+1*X24+1*X48+1*X62) = +S62<<0 +S67<<0 
  my $sub_exp144; 
  $sub_exp144 = $sub_exp62 ^ $sub_exp67; 
  
  # S145: (+1*X29+1*X47) = +X29<<0 +X47<<0 
  my $sub_exp145; 
  $sub_exp145 = $mds_in->[27] ^ $mds_in->[41]; 
  
  # S146: (+1*X14+1*X22+1*X48+1*X56) = +X14<<0 +S18<<0 
  my $sub_exp146; 
  $sub_exp146 = $mds_in->[10] ^ $sub_exp18; 
  
  # S147: (+1*X30+1*X38+1*X64) = +X38<<0 +S77<<0 
  my $sub_exp147; 
  $sub_exp147 = $mds_in->[34] ^ $sub_exp77; 
  
  # S148: (+1*X8+1*X30+1*X32+1*X38+1*X62+1*X64) = +S16<<0 +S147<<0 
  my $sub_exp148; 
  $sub_exp148 = $sub_exp16 ^ $sub_exp147; 
  
  # S149: (+1*X14+1*X16+1*X24+1*X38+1*X46+1*X54) = +X14<<0 +S68<<0 
  my $sub_exp149; 
  $sub_exp149 = $mds_in->[10] ^ $sub_exp68; 
  
  # S150: (+1*X8+1*X14+1*X16+1*X24+1*X38+1*X46+1*X48+1*X54) = +S44<<0 +S149<<0 
  my $sub_exp150; 
  $sub_exp150 = $sub_exp44 ^ $sub_exp149; 
  
  # S151: (+1*X5+1*X13+1*X23) = +X23<<0 +S36<<0 
  my $sub_exp151; 
  $sub_exp151 = $mds_in->[17] ^ $sub_exp36; 
  
  # S152: (+1*X23+1*X40+1*X48) = +X23<<0 +S45<<0 
  my $sub_exp152; 
  $sub_exp152 = $mds_in->[17] ^ $sub_exp45; 
  
  # S153: (+1*X36+1*X53+1*X61) = +X36<<0 +S37<<0 
  my $sub_exp153; 
  $sub_exp153 = $mds_in->[36] ^ $sub_exp37; 
  
  # S154: (+1*X7+1*X8+1*X22+1*X31+1*X39+1*X47+1*X48) = +S44<<0 +S52<<0 
  my $sub_exp154; 
  $sub_exp154 = $sub_exp44 ^ $sub_exp52; 
  
  # S155: (+1*X7+1*X15+1*X21+1*X23+1*X31+1*X55) = +S39<<0 +S80<<0 
  my $sub_exp155; 
  $sub_exp155 = $sub_exp39 ^ $sub_exp80; 
  
  # S156: (+1*X6+1*X20+1*X56) = +X20<<0 +S42<<0 
  my $sub_exp156; 
  $sub_exp156 = $mds_in->[20] ^ $sub_exp42; 
  
  # S157: (+1*X5+1*X29+1*X37+1*X45) = +S38<<0 +S54<<0 
  my $sub_exp157; 
  $sub_exp157 = $sub_exp38 ^ $sub_exp54; 
  
  # S158: (+1*X5+1*X7+1*X29+1*X37+1*X45+1*X55+1*X63) = +S83<<0 +S157<<0 
  my $sub_exp158; 
  $sub_exp158 = $sub_exp83 ^ $sub_exp157; 
  
  # S159: (+1*X4+1*X16+1*X40) = +X4<<0 +S46<<0 
  my $sub_exp159; 
  $sub_exp159 = $mds_in->[4] ^ $sub_exp46; 
  
  # S160: (+1*X4+1*X15+1*X16+1*X39+1*X40+1*X54) = +S49<<0 +S159<<0 
  my $sub_exp160; 
  $sub_exp160 = $sub_exp49 ^ $sub_exp159; 
  
  # S161: (+1*X6+1*X8+1*X14+1*X32+1*X62) = +S16<<0 +S17<<0 
  my $sub_exp161; 
  $sub_exp161 = $sub_exp16 ^ $sub_exp17; 
  
  # S162: (+1*X6+1*X8+1*X14+1*X24+1*X32+1*X38+1*X62) = +S41<<0 +S161<<0 
  my $sub_exp162; 
  $sub_exp162 = $sub_exp41 ^ $sub_exp161; 
  
  # S163: (+1*X15+1*X60) = +X15<<0 +X60<<0 
  my $sub_exp163; 
  $sub_exp163 = $mds_in->[9] ^ $mds_in->[60]; 
  
  # S164: (+1*X14+1*X23+1*X31+1*X39+1*X63) = +S9<<0 +S51<<0 
  my $sub_exp164; 
  $sub_exp164 = $sub_exp9 ^ $sub_exp51; 
  
  # S165: (+1*X14+1*X23+1*X31+1*X32+1*X39+1*X63) = +X32<<0 +S164<<0 
  my $sub_exp165; 
  $sub_exp165 = $mds_in->[24] ^ $sub_exp164; 
  
  # S166: (+1*X32+1*X40) = +X32<<0 +X40<<0 
  my $sub_exp166; 
  $sub_exp166 = $mds_in->[24] ^ $mds_in->[32]; 
  
  # S167: (+1*X7+1*X22+1*X31+1*X32+1*X39+1*X40+1*X47) = +S52<<0 +S166<<0 
  my $sub_exp167; 
  $sub_exp167 = $sub_exp52 ^ $sub_exp166; 
  
  # S168: (+1*X40+1*X47+1*X48+1*X55) = +S1<<0 +S45<<0 
  my $sub_exp168; 
  $sub_exp168 = $sub_exp1 ^ $sub_exp45; 
  
  # S169: (+1*X15+1*X30+1*X39+1*X40+1*X47+1*X48+1*X55) = +S79<<0 +S168<<0 
  my $sub_exp169; 
  $sub_exp169 = $sub_exp79 ^ $sub_exp168; 
  
  # S170: (+1*X16+1*X30+1*X35+1*X43+1*X56) = +S63<<0 +S78<<0 
  my $sub_exp170; 
  $sub_exp170 = $sub_exp63 ^ $sub_exp78; 
  
  # S171: (+1*X15+1*X31+1*X39+1*X60) = +S4<<0 +S163<<0 
  my $sub_exp171; 
  $sub_exp171 = $sub_exp4 ^ $sub_exp163; 
  
  # S172: (+1*X21+1*X45+1*X47+1*X55) = +X45<<0 +S35<<0 
  my $sub_exp172; 
  $sub_exp172 = $mds_in->[43] ^ $sub_exp35; 
  
  # S173: (+1*X5+1*X13+1*X21+1*X45+1*X47+1*X55) = +S36<<0 +S172<<0 
  my $sub_exp173; 
  $sub_exp173 = $sub_exp36 ^ $sub_exp172; 
  
  # S174: (+1*X6+1*X62) = +X6<<0 +X62<<0 
  my $sub_exp174; 
  $sub_exp174 = $mds_in->[2] ^ $mds_in->[58]; 
  
  # S175: (+1*X16+1*X24+1*X30+1*X40+1*X54+1*X64) = +S13<<0 +S15<<0 
  my $sub_exp175; 
  $sub_exp175 = $sub_exp13 ^ $sub_exp15; 
  
  # S176: (+1*X6+1*X16+1*X24+1*X30+1*X40+1*X54+1*X62+1*X64) = +S174<<0 +S175<<0 
  my $sub_exp176; 
  $sub_exp176 = $sub_exp174 ^ $sub_exp175; 
  
  # S177: (+1*X15+1*X23+1*X40+1*X64) = +S3<<0 +S8<<0 
  my $sub_exp177; 
  $sub_exp177 = $sub_exp3 ^ $sub_exp8; 
  
  # S178: (+1*X14+1*X19+1*X27+1*X31+1*X39) = +S32<<0 +S51<<0 
  my $sub_exp178; 
  $sub_exp178 = $sub_exp32 ^ $sub_exp51; 
  
  # S179: (+1*X14+1*X15+1*X19+1*X23+1*X27+1*X31+1*X39+1*X40+1*X64) = +S177<<0 +S178<<0 
  my $sub_exp179; 
  $sub_exp179 = $sub_exp177 ^ $sub_exp178; 
  
  # S180: (+1*X1+1*X9+1*X49) = +X49<<0 +S19<<0 
  my $sub_exp180; 
  $sub_exp180 = $mds_in->[55] ^ $sub_exp19; 
  
  # S181: (+1*X1+1*X9+1*X17+1*X25+1*X49) = +S180<<0 +S20<<0 
  my $sub_exp181; 
  $sub_exp181 = $sub_exp180 ^ $sub_exp20; 
  
  # O1: (+1*X1+1*X9+1*X17+1*X23+1*X25+1*X38+1*X47+1*X48+1*X49+1*X55+1*X56+1*X63) = +S181<<0 +S125<<0 
  $mds_out[7] = $sub_exp181 ^ $sub_exp125; 
  
  # S182: (+1*X48+1*X50+1*X56) = +X50<<0 +S5<<0 
  my $sub_exp182; 
  $sub_exp182 = $mds_in->[54] ^ $sub_exp5; 
  
  # S183: (+1*X18+1*X26+1*X39+1*X64) = +S76<<0 +S24<<0 
  my $sub_exp183; 
  $sub_exp183 = $sub_exp76 ^ $sub_exp24; 
  
  # S184: (+1*X24+1*X41+1*X48+1*X50+1*X56) = +S182<<0 +S86<<0 
  my $sub_exp184; 
  $sub_exp184 = $sub_exp182 ^ $sub_exp86; 
  
  # S185: (+1*X2+1*X10+1*X18+1*X26+1*X39+1*X49+1*X64) = +S112<<0 +S183<<0 
  my $sub_exp185; 
  $sub_exp185 = $sub_exp112 ^ $sub_exp183; 
  
  # O2: (+1*X2+1*X10+1*X18+1*X24+1*X26+1*X39+1*X41+1*X48+1*X49+1*X50+1*X56+1*X64) = +S184<<0 +S185<<0 
  $mds_out[6] = $sub_exp184 ^ $sub_exp185; 
  
  # S186: (+1*X40+1*X42) = +X40<<0 +X42<<0 
  my $sub_exp186; 
  $sub_exp186 = $mds_in->[32] ^ $mds_in->[46]; 
  
  # S187: (+1*X40+1*X42+1*X51) = +S186<<0 +X51<<0 
  my $sub_exp187; 
  $sub_exp187 = $sub_exp186 ^ $mds_in->[53]; 
  
  # S188: (+1*X17+1*X40+1*X41+1*X42+1*X51) = +S187<<0 +S75<<0 
  my $sub_exp188; 
  $sub_exp188 = $sub_exp187 ^ $sub_exp75; 
  
  # S189: (+1*X3+1*X11+1*X19+1*X27+1*X49+1*X50+1*X57) = +S126<<0 +S88<<0 
  my $sub_exp189; 
  $sub_exp189 = $sub_exp126 ^ $sub_exp88; 
  
  # S190: (+1*X3+1*X11+1*X17+1*X19+1*X27+1*X40+1*X41+1*X42+1*X49+1*X50+1*X51+1*X57) = +S188<<0 +S189<<0 
  my $sub_exp190; 
  $sub_exp190 = $sub_exp188 ^ $sub_exp189; 
  
  # O3: (+1*X3+1*X11+1*X17+1*X19+1*X23+1*X27+1*X38+1*X40+1*X41+1*X42+1*X47+1*X48+1*X49+1*X50+1*X51+1*X55+1*X56+1*X57+1*X63) = +S190<<0 +S125<<0 
  $mds_out[5] = $sub_exp190 ^ $sub_exp125; 
  
  # S191: (+1*X20+1*X28+1*X43) = +X43<<0 +S28<<0 
  my $sub_exp191; 
  $sub_exp191 = $mds_in->[45] ^ $sub_exp28; 
  
  # S192: (+1*X18+1*X39+1*X42+1*X64) = +S76<<0 +S55<<0 
  my $sub_exp192; 
  $sub_exp192 = $sub_exp76 ^ $sub_exp55; 
  
  # S193: (+1*X18+1*X20+1*X28+1*X39+1*X42+1*X43+1*X64) = +S191<<0 +S192<<0 
  my $sub_exp193; 
  $sub_exp193 = $sub_exp191 ^ $sub_exp192; 
  
  # S194: (+1*X4+1*X12+1*X23+1*X47+1*X51+1*X55+1*X63) = +S89<<0 +S74<<0 
  my $sub_exp194; 
  $sub_exp194 = $sub_exp89 ^ $sub_exp74; 
  
  # S195: (+1*X24+1*X33+1*X38+1*X50+1*X52+1*X58) = +S98<<0 +S95<<0 
  my $sub_exp195; 
  $sub_exp195 = $sub_exp98 ^ $sub_exp95; 
  
  # S196: (+1*X4+1*X12+1*X18+1*X20+1*X23+1*X28+1*X39+1*X42+1*X43+1*X47+1*X51+1*X55+1*X63+1*X64) = +S193<<0 +S194<<0 
  my $sub_exp196; 
  $sub_exp196 = $sub_exp193 ^ $sub_exp194; 
  
  # O4: (+1*X4+1*X12+1*X18+1*X20+1*X23+1*X24+1*X28+1*X33+1*X38+1*X39+1*X42+1*X43+1*X47+1*X50+1*X51+1*X52+1*X55+1*X58+1*X63+1*X64) = +S196<<0 +S195<<0 
  $mds_out[4] = $sub_exp196 ^ $sub_exp195; 
  
  # S197: (+1*X40+1*X44+1*X64) = +X44<<0 +S8<<0 
  my $sub_exp197; 
  $sub_exp197 = $mds_in->[44] ^ $sub_exp8; 
  
  # S198: (+1*X5+1*X13+1*X19+1*X43) = +S69<<0 +S36<<0 
  my $sub_exp198; 
  $sub_exp198 = $sub_exp69 ^ $sub_exp36; 
  
  # S199: (+1*X39+1*X40+1*X44+1*X53+1*X64) = +S197<<0 +S128<<0 
  my $sub_exp199; 
  $sub_exp199 = $sub_exp197 ^ $sub_exp128; 
  
  # S200: (+1*X5+1*X13+1*X19+1*X24+1*X38+1*X43+1*X52) = +S98<<0 +S198<<0 
  my $sub_exp200; 
  $sub_exp200 = $sub_exp98 ^ $sub_exp198; 
  
  # S201: (+1*X34+1*X39+1*X40+1*X44+1*X51+1*X53+1*X59+1*X64) = +S199<<0 +S114<<0 
  my $sub_exp201; 
  $sub_exp201 = $sub_exp199 ^ $sub_exp114; 
  
  # S202: (+1*X5+1*X13+1*X19+1*X24+1*X34+1*X38+1*X39+1*X40+1*X43+1*X44+1*X51+1*X52+1*X53+1*X59+1*X64) = +S201<<0 +S200<<0 
  my $sub_exp202; 
  $sub_exp202 = $sub_exp201 ^ $sub_exp200; 
  
  # O5: (+1*X5+1*X13+1*X19+1*X21+1*X23+1*X24+1*X29+1*X34+1*X38+1*X39+1*X40+1*X43+1*X44+1*X47+1*X51+1*X52+1*X53+1*X55+1*X59+1*X63+1*X64) = +S202<<0 +S129<<0 
  $mds_out[3] = $sub_exp202 ^ $sub_exp129; 
  
  # S203: (+1*X20+1*X44+1*X45+1*X54) = +S106<<0 +S127<<0 
  my $sub_exp203; 
  $sub_exp203 = $sub_exp106 ^ $sub_exp127; 
  
  # S204: (+1*X20+1*X39+1*X44+1*X45+1*X53+1*X54) = +S203<<0 +S128<<0 
  my $sub_exp204; 
  $sub_exp204 = $sub_exp203 ^ $sub_exp128; 
  
  # S205: (+1*X24+1*X30+1*X35+1*X40+1*X52+1*X60+1*X64) = +S107<<0 +S99<<0 
  my $sub_exp205; 
  $sub_exp205 = $sub_exp107 ^ $sub_exp99; 
  
  # S206: (+1*X6+1*X14+1*X22+1*X24+1*X30+1*X35+1*X40+1*X48+1*X52+1*X56+1*X60+1*X64) = +S56<<0 +S205<<0 
  my $sub_exp206; 
  $sub_exp206 = $sub_exp56 ^ $sub_exp205; 
  
  # O6: (+1*X6+1*X14+1*X20+1*X22+1*X24+1*X30+1*X35+1*X39+1*X40+1*X44+1*X45+1*X48+1*X52+1*X53+1*X54+1*X56+1*X60+1*X64) = +S206<<0 +S204<<0 
  $mds_out[2] = $sub_exp206 ^ $sub_exp204; 
  
  # S207: (+1*X40+1*X46) = +X40<<0 +X46<<0 
  my $sub_exp207; 
  $sub_exp207 = $mds_in->[32] ^ $mds_in->[42]; 
  
  # S208: (+1*X40+1*X45+1*X46+1*X54) = +S207<<0 +S106<<0 
  my $sub_exp208; 
  $sub_exp208 = $sub_exp207 ^ $sub_exp106; 
  
  # S209: (+1*X36+1*X40+1*X45+1*X46+1*X53+1*X54+1*X61) = +S208<<0 +S153<<0 
  my $sub_exp209; 
  $sub_exp209 = $sub_exp208 ^ $sub_exp153; 
  
  # O7: (+1*X7+1*X15+1*X21+1*X23+1*X31+1*X36+1*X40+1*X45+1*X46+1*X53+1*X54+1*X55+1*X61) = +S209<<0 +S155<<0 
  $mds_out[1] = $sub_exp209 ^ $sub_exp155; 
  
  # S210: (+1*X37+1*X46) = +X37<<0 +X46<<0 
  my $sub_exp210; 
  $sub_exp210 = $mds_in->[35] ^ $mds_in->[42]; 
  
  # S211: (+1*X37+1*X46+1*X47+1*X55) = +S210<<0 +S1<<0 
  my $sub_exp211; 
  $sub_exp211 = $sub_exp210 ^ $sub_exp1; 
  
  # S212: (+1*X16+1*X24+1*X37+1*X46+1*X47+1*X54+1*X55) = +S211<<0 +S15<<0 
  my $sub_exp212; 
  $sub_exp212 = $sub_exp211 ^ $sub_exp15; 
  
  # O8: (+1*X8+1*X16+1*X22+1*X24+1*X32+1*X37+1*X46+1*X47+1*X54+1*X55+1*X56+1*X62) = +S212<<0 +S132<<0 
  $mds_out[0] = $sub_exp212 ^ $sub_exp132; 
  
  # S213: (+1*X9+1*X46+1*X56) = +X46<<0 +S90<<0 
  my $sub_exp213; 
  $sub_exp213 = $mds_in->[42] ^ $sub_exp90; 
  
  # S214: (+1*X9+1*X17+1*X25+1*X33+1*X46+1*X56+1*X57) = +S213<<0 +S117<<0 
  my $sub_exp214; 
  $sub_exp214 = $sub_exp213 ^ $sub_exp117; 
  
  # O9: (+1*X7+1*X9+1*X17+1*X25+1*X31+1*X33+1*X46+1*X55+1*X56+1*X57+1*X63+1*X64) = +S214<<0 +S116<<0 
  $mds_out[15] = $sub_exp214 ^ $sub_exp116; 
  
  # S215: (+1*X10+1*X47) = +X10<<0 +X47<<0 
  my $sub_exp215; 
  $sub_exp215 = $mds_in->[14] ^ $mds_in->[41]; 
  
  # S216: (+1*X56+1*X64) = +X64<<0 +X56<<0 
  my $sub_exp216; 
  $sub_exp216 = $mds_in->[56] ^ $mds_in->[48]; 
  
  # S217: (+1*X10+1*X47+1*X56+1*X64) = +S215<<0 +S216<<0 
  my $sub_exp217; 
  $sub_exp217 = $sub_exp215 ^ $sub_exp216; 
  
  # S218: (+1*X8+1*X32+1*X49+1*X57) = +S21<<0 +S6<<0 
  my $sub_exp218; 
  $sub_exp218 = $sub_exp21 ^ $sub_exp6; 
  
  # S219: (+1*X8+1*X10+1*X32+1*X47+1*X49+1*X56+1*X57+1*X64) = +S217<<0 +S218<<0 
  my $sub_exp219; 
  $sub_exp219 = $sub_exp217 ^ $sub_exp218; 
  
  # O10: (+1*X8+1*X10+1*X18+1*X26+1*X32+1*X34+1*X47+1*X49+1*X56+1*X57+1*X58+1*X64) = +S219<<0 +S101<<0 
  $mds_out[14] = $sub_exp219 ^ $sub_exp101; 
  
  # S220: (+1*X48+1*X50+1*X56+1*X58) = +S5<<0 +S25<<0 
  my $sub_exp220; 
  $sub_exp220 = $sub_exp5 ^ $sub_exp25; 
  
  # S221: (+1*X1+1*X25+1*X35+1*X59) = +S81<<0 +S59<<0 
  my $sub_exp221; 
  $sub_exp221 = $sub_exp81 ^ $sub_exp59; 
  
  # S222: (+1*X11+1*X46+1*X48+1*X50+1*X56+1*X58) = +S220<<0 +S115<<0 
  my $sub_exp222; 
  $sub_exp222 = $sub_exp220 ^ $sub_exp115; 
  
  # S223: (+1*X1+1*X19+1*X25+1*X27+1*X35+1*X49+1*X57+1*X59) = +S126<<0 +S221<<0 
  my $sub_exp223; 
  $sub_exp223 = $sub_exp126 ^ $sub_exp221; 
  
  # S224: (+1*X1+1*X11+1*X19+1*X25+1*X27+1*X35+1*X46+1*X48+1*X49+1*X50+1*X56+1*X57+1*X58+1*X59) = +S222<<0 +S223<<0 
  my $sub_exp224; 
  $sub_exp224 = $sub_exp222 ^ $sub_exp223; 
  
  # O11: (+1*X1+1*X7+1*X11+1*X19+1*X25+1*X27+1*X31+1*X35+1*X46+1*X48+1*X49+1*X50+1*X55+1*X56+1*X57+1*X58+1*X59+1*X63+1*X64) = +S224<<0 +S116<<0 
  $mds_out[13] = $sub_exp224 ^ $sub_exp116; 
  
  # S225: (+1*X41+1*X47+1*X55) = +X41<<0 +S1<<0 
  my $sub_exp225; 
  $sub_exp225 = $mds_in->[47] ^ $sub_exp1; 
  
  # S226: (+1*X2+1*X26+1*X41+1*X47+1*X50+1*X55+1*X58) = +S225<<0 +S96<<0 
  my $sub_exp226; 
  $sub_exp226 = $sub_exp225 ^ $sub_exp96; 
  
  # S227: (+1*X8+1*X12+1*X20+1*X28+1*X32+1*X36+1*X60) = +S133<<0 +S97<<0 
  my $sub_exp227; 
  $sub_exp227 = $sub_exp133 ^ $sub_exp97; 
  
  # S228: (+1*X2+1*X8+1*X12+1*X20+1*X26+1*X28+1*X32+1*X36+1*X41+1*X47+1*X50+1*X55+1*X58+1*X60) = +S226<<0 +S227<<0 
  my $sub_exp228; 
  $sub_exp228 = $sub_exp226 ^ $sub_exp227; 
  
  # O12: (+1*X2+1*X7+1*X8+1*X12+1*X20+1*X26+1*X28+1*X31+1*X32+1*X36+1*X41+1*X46+1*X47+1*X50+1*X51+1*X55+1*X58+1*X59+1*X60+1*X63) = +S228<<0 +S135<<0 
  $mds_out[12] = $sub_exp228 ^ $sub_exp135; 
  
  # S229: (+1*X13+1*X42) = +X13<<0 +X42<<0 
  my $sub_exp229; 
  $sub_exp229 = $mds_in->[11] ^ $mds_in->[46]; 
  
  # S230: (+1*X13+1*X42+1*X48) = +S229<<0 +X48<<0 
  my $sub_exp230; 
  $sub_exp230 = $sub_exp229 ^ $mds_in->[40]; 
  
  # S231: (+1*X8+1*X32+1*X52+1*X60) = +S29<<0 +S6<<0 
  my $sub_exp231; 
  $sub_exp231 = $sub_exp29 ^ $sub_exp6; 
  
  # S232: (+1*X3+1*X13+1*X27+1*X42+1*X48) = +S230<<0 +S61<<0 
  my $sub_exp232; 
  $sub_exp232 = $sub_exp230 ^ $sub_exp61; 
  
  # S233: (+1*X3+1*X8+1*X13+1*X27+1*X32+1*X42+1*X48+1*X52+1*X60) = +S232<<0 +S231<<0 
  my $sub_exp233; 
  $sub_exp233 = $sub_exp232 ^ $sub_exp231; 
  
  # S234: (+1*X7+1*X21+1*X29+1*X31+1*X37+1*X46+1*X47+1*X51+1*X55+1*X59+1*X61+1*X63) = +S136<<0 +S135<<0 
  my $sub_exp234; 
  $sub_exp234 = $sub_exp136 ^ $sub_exp135; 
  
  # O13: (+1*X3+1*X7+1*X8+1*X13+1*X21+1*X27+1*X29+1*X31+1*X32+1*X37+1*X42+1*X46+1*X47+1*X48+1*X51+1*X52+1*X55+1*X59+1*X60+1*X61+1*X63) = +S233<<0 +S234<<0 
  $mds_out[11] = $sub_exp233 ^ $sub_exp234; 
  
  # S235: (+1*X43+1*X47) = +X43<<0 +X47<<0 
  my $sub_exp235; 
  $sub_exp235 = $mds_in->[45] ^ $mds_in->[41]; 
  
  # S236: (+1*X43+1*X47+1*X53+1*X61) = +S235<<0 +S37<<0 
  my $sub_exp236; 
  $sub_exp236 = $sub_exp235 ^ $sub_exp37; 
  
  # S237: (+1*X4+1*X28+1*X43+1*X47+1*X52+1*X53+1*X60+1*X61) = +S236<<0 +S100<<0 
  my $sub_exp237; 
  $sub_exp237 = $sub_exp236 ^ $sub_exp100; 
  
  # S238: (+1*X4+1*X14+1*X22+1*X28+1*X43+1*X47+1*X48+1*X52+1*X53+1*X56+1*X60+1*X61) = +S237<<0 +S146<<0 
  my $sub_exp238; 
  $sub_exp238 = $sub_exp237 ^ $sub_exp146; 
  
  # O14: (+1*X4+1*X8+1*X14+1*X22+1*X28+1*X30+1*X32+1*X38+1*X43+1*X47+1*X48+1*X52+1*X53+1*X56+1*X60+1*X61+1*X62+1*X64) = +S238<<0 +S148<<0 
  $mds_out[10] = $sub_exp238 ^ $sub_exp148; 
  
  # S239: (+1*X31+1*X39+1*X54) = +X54<<0 +S4<<0 
  my $sub_exp239; 
  $sub_exp239 = $mds_in->[50] ^ $sub_exp4; 
  
  # S240: (+1*X31+1*X39+1*X44+1*X54+1*X63) = +S239<<0 +S72<<0 
  my $sub_exp240; 
  $sub_exp240 = $sub_exp239 ^ $sub_exp72; 
  
  # S241: (+1*X5+1*X15+1*X23+1*X29+1*X48+1*X53+1*X61+1*X62) = +S105<<0 +S62<<0 
  my $sub_exp241; 
  $sub_exp241 = $sub_exp105 ^ $sub_exp62; 
  
  # O15: (+1*X5+1*X15+1*X23+1*X29+1*X31+1*X39+1*X44+1*X48+1*X53+1*X54+1*X61+1*X62+1*X63) = +S240<<0 +S241<<0 
  $mds_out[9] = $sub_exp240 ^ $sub_exp241; 
  
  # S242: (+1*X32+1*X55) = +X32<<0 +X55<<0 
  my $sub_exp242; 
  $sub_exp242 = $mds_in->[24] ^ $mds_in->[49]; 
  
  # S243: (+1*X32+1*X45+1*X55+1*X63) = +S242<<0 +S103<<0 
  my $sub_exp243; 
  $sub_exp243 = $sub_exp242 ^ $sub_exp103; 
  
  # O16: (+1*X6+1*X16+1*X24+1*X30+1*X32+1*X40+1*X45+1*X54+1*X55+1*X62+1*X63+1*X64) = +S243<<0 +S176<<0 
  $mds_out[8] = $sub_exp243 ^ $sub_exp176; 
  
  # S244: (+1*X1+1*X33+1*X41) = +X1<<0 +S22<<0 
  my $sub_exp244; 
  $sub_exp244 = $mds_in->[7] ^ $sub_exp22; 
  
  # S245: (+1*X1+1*X8+1*X17+1*X25+1*X33+1*X41) = +S244<<0 +S118<<0 
  my $sub_exp245; 
  $sub_exp245 = $sub_exp244 ^ $sub_exp118; 
  
  # O17: (+1*X1+1*X7+1*X8+1*X15+1*X17+1*X25+1*X33+1*X39+1*X41+1*X54+1*X63+1*X64) = +S245<<0 +S119<<0 
  $mds_out[23] = $sub_exp245 ^ $sub_exp119; 
  
  # S246: (+1*X2+1*X57) = +X2<<0 +X57<<0 
  my $sub_exp246; 
  $sub_exp246 = $mds_in->[6] ^ $mds_in->[63]; 
  
  # S247: (+1*X2+1*X40+1*X57+1*X64) = +S246<<0 +S8<<0 
  my $sub_exp247; 
  $sub_exp247 = $sub_exp246 ^ $sub_exp8; 
  
  # S248: (+1*X2+1*X34+1*X40+1*X42+1*X57+1*X64) = +S247<<0 +S26<<0 
  my $sub_exp248; 
  $sub_exp248 = $sub_exp247 ^ $sub_exp26; 
  
  # S249: (+1*X1+1*X8+1*X16+1*X18+1*X26+1*X55) = +S137<<0 +S102<<0 
  my $sub_exp249; 
  $sub_exp249 = $sub_exp137 ^ $sub_exp102; 
  
  # O18: (+1*X1+1*X2+1*X8+1*X16+1*X18+1*X26+1*X34+1*X40+1*X42+1*X55+1*X57+1*X64) = +S248<<0 +S249<<0 
  $mds_out[22] = $sub_exp248 ^ $sub_exp249; 
  
  # S250: (+1*X3+1*X8) = +X3<<0 +X8<<0 
  my $sub_exp250; 
  $sub_exp250 = $mds_in->[5] ^ $mds_in->[0]; 
  
  # S251: (+1*X3+1*X8+1*X58) = +S250<<0 +X58<<0 
  my $sub_exp251; 
  $sub_exp251 = $sub_exp250 ^ $mds_in->[62]; 
  
  # S252: (+1*X1+1*X9+1*X33+1*X57) = +S57<<0 +S19<<0 
  my $sub_exp252; 
  $sub_exp252 = $sub_exp57 ^ $sub_exp19; 
  
  # S253: (+1*X1+1*X3+1*X8+1*X9+1*X33+1*X57+1*X58) = +S251<<0 +S252<<0 
  my $sub_exp253; 
  $sub_exp253 = $sub_exp251 ^ $sub_exp252; 
  
  # S254: (+1*X2+1*X19+1*X27+1*X35+1*X43+1*X56) = +S104<<0 +S63<<0 
  my $sub_exp254; 
  $sub_exp254 = $sub_exp104 ^ $sub_exp63; 
  
  # S255: (+1*X1+1*X2+1*X3+1*X8+1*X9+1*X19+1*X27+1*X33+1*X35+1*X43+1*X56+1*X57+1*X58) = +S253<<0 +S254<<0 
  my $sub_exp255; 
  $sub_exp255 = $sub_exp253 ^ $sub_exp254; 
  
  # O19: (+1*X1+1*X2+1*X3+1*X7+1*X8+1*X9+1*X15+1*X19+1*X27+1*X33+1*X35+1*X39+1*X43+1*X54+1*X56+1*X57+1*X58+1*X63+1*X64) = +S255<<0 +S119<<0 
  $mds_out[21] = $sub_exp255 ^ $sub_exp119; 
  
  # S256: (+1*X36+1*X44+1*X59) = +X59<<0 +S30<<0 
  my $sub_exp256; 
  $sub_exp256 = $mds_in->[61] ^ $sub_exp30; 
  
  # S257: (+1*X34+1*X36+1*X44+1*X58+1*X59) = +S256<<0 +S58<<0 
  my $sub_exp257; 
  $sub_exp257 = $sub_exp256 ^ $sub_exp58; 
  
  # S258: (+1*X3+1*X7+1*X20+1*X28+1*X55+1*X63) = +S91<<0 +S83<<0 
  my $sub_exp258; 
  $sub_exp258 = $sub_exp91 ^ $sub_exp83; 
  
  # S259: (+1*X2+1*X10+1*X34+1*X36+1*X44+1*X49+1*X58+1*X59) = +S257<<0 +S112<<0 
  my $sub_exp259; 
  $sub_exp259 = $sub_exp257 ^ $sub_exp112; 
  
  # S260: (+1*X2+1*X3+1*X7+1*X10+1*X20+1*X28+1*X34+1*X36+1*X44+1*X49+1*X55+1*X58+1*X59+1*X63) = +S259<<0 +S258<<0 
  my $sub_exp260; 
  $sub_exp260 = $sub_exp259 ^ $sub_exp258; 
  
  # O20: (+1*X2+1*X3+1*X4+1*X7+1*X10+1*X15+1*X16+1*X20+1*X28+1*X34+1*X36+1*X39+1*X40+1*X44+1*X49+1*X54+1*X55+1*X58+1*X59+1*X63) = +S260<<0 +S160<<0 
  $mds_out[20] = $sub_exp260 ^ $sub_exp160; 
  
  # S261: (+1*X21+1*X56) = +X21<<0 +X56<<0 
  my $sub_exp261; 
  $sub_exp261 = $mds_in->[19] ^ $mds_in->[48]; 
  
  # S262: (+1*X21+1*X56+1*X60) = +S261<<0 +X60<<0 
  my $sub_exp262; 
  $sub_exp262 = $sub_exp261 ^ $mds_in->[60]; 
  
  # S263: (+1*X21+1*X35+1*X56+1*X59+1*X60) = +S262<<0 +S59<<0 
  my $sub_exp263; 
  $sub_exp263 = $sub_exp262 ^ $sub_exp59; 
  
  # S264: (+1*X3+1*X11+1*X21+1*X35+1*X50+1*X56+1*X59+1*X60) = +S263<<0 +S88<<0 
  my $sub_exp264; 
  $sub_exp264 = $sub_exp263 ^ $sub_exp88; 
  
  # S265: (+1*X3+1*X5+1*X7+1*X11+1*X21+1*X29+1*X35+1*X37+1*X45+1*X50+1*X55+1*X56+1*X59+1*X60+1*X63) = +S264<<0 +S158<<0 
  my $sub_exp265; 
  $sub_exp265 = $sub_exp264 ^ $sub_exp158; 
  
  # O21: (+1*X3+1*X4+1*X5+1*X7+1*X11+1*X15+1*X16+1*X21+1*X29+1*X35+1*X37+1*X39+1*X40+1*X45+1*X50+1*X54+1*X55+1*X56+1*X59+1*X60+1*X63) = +S265<<0 +S160<<0 
  $mds_out[19] = $sub_exp265 ^ $sub_exp160; 
  
  # S266: (+1*X5+1*X22) = +X5<<0 +X22<<0 
  my $sub_exp266; 
  $sub_exp266 = $mds_in->[3] ^ $mds_in->[18]; 
  
  # S267: (+1*X5+1*X22+1*X61) = +S266<<0 +X61<<0 
  my $sub_exp267; 
  $sub_exp267 = $sub_exp266 ^ $mds_in->[59]; 
  
  # S268: (+1*X5+1*X22+1*X36+1*X60+1*X61) = +S267<<0 +S82<<0 
  my $sub_exp268; 
  $sub_exp268 = $sub_exp267 ^ $sub_exp82; 
  
  # S269: (+1*X4+1*X8+1*X12+1*X16+1*X51+1*X55) = +S137<<0 +S89<<0 
  my $sub_exp269; 
  $sub_exp269 = $sub_exp137 ^ $sub_exp89; 
  
  # S270: (+1*X4+1*X5+1*X8+1*X12+1*X16+1*X22+1*X36+1*X51+1*X55+1*X60+1*X61) = +S268<<0 +S269<<0 
  my $sub_exp270; 
  $sub_exp270 = $sub_exp268 ^ $sub_exp269; 
  
  # O22: (+1*X4+1*X5+1*X6+1*X8+1*X12+1*X16+1*X22+1*X30+1*X36+1*X38+1*X40+1*X46+1*X51+1*X55+1*X56+1*X60+1*X61+1*X64) = +S270<<0 +S139<<0 
  $mds_out[18] = $sub_exp270 ^ $sub_exp139; 
  
  # S271: (+1*X52+1*X62) = +X52<<0 +X62<<0 
  my $sub_exp271; 
  $sub_exp271 = $mds_in->[52] ^ $mds_in->[58]; 
  
  # S272: (+1*X6+1*X52+1*X56+1*X62) = +S271<<0 +S42<<0 
  my $sub_exp272; 
  $sub_exp272 = $sub_exp271 ^ $sub_exp42; 
  
  # S273: (+1*X6+1*X37+1*X52+1*X56+1*X61+1*X62) = +S272<<0 +S70<<0 
  my $sub_exp273; 
  $sub_exp273 = $sub_exp272 ^ $sub_exp70; 
  
  # S274: (+1*X5+1*X7+1*X13+1*X23+1*X31+1*X39+1*X47) = +S151<<0 +S47<<0 
  my $sub_exp274; 
  $sub_exp274 = $sub_exp151 ^ $sub_exp47; 
  
  # O23: (+1*X5+1*X6+1*X7+1*X13+1*X23+1*X31+1*X37+1*X39+1*X47+1*X52+1*X56+1*X61+1*X62) = +S273<<0 +S274<<0 
  $mds_out[17] = $sub_exp273 ^ $sub_exp274; 
  
  # S275: (+1*X7+1*X53+1*X63) = +X53<<0 +S2<<0 
  my $sub_exp275; 
  $sub_exp275 = $mds_in->[51] ^ $sub_exp2; 
  
  # S276: (+1*X7+1*X40+1*X48+1*X53+1*X63) = +S275<<0 +S45<<0 
  my $sub_exp276; 
  $sub_exp276 = $sub_exp275 ^ $sub_exp45; 
  
  # O24: (+1*X6+1*X7+1*X8+1*X14+1*X24+1*X32+1*X38+1*X40+1*X48+1*X53+1*X62+1*X63) = +S276<<0 +S162<<0 
  $mds_out[16] = $sub_exp276 ^ $sub_exp162; 
  
  # S277: (+1*X9+1*X25+1*X33+1*X41+1*X49) = +X25<<0 +S92<<0 
  my $sub_exp277; 
  $sub_exp277 = $mds_in->[31] ^ $sub_exp92; 
  
  # O25: (+1*X7+1*X8+1*X9+1*X15+1*X16+1*X23+1*X25+1*X33+1*X41+1*X47+1*X49+1*X62) = +S277<<0 +S141<<0 
  $mds_out[31] = $sub_exp277 ^ $sub_exp141; 
  
  # S278: (+1*X26+1*X63) = +X26<<0 +X63<<0 
  my $sub_exp278; 
  $sub_exp278 = $mds_in->[30] ^ $mds_in->[57]; 
  
  # S279: (+1*X16+1*X24+1*X26+1*X63) = +S278<<0 +S7<<0 
  my $sub_exp279; 
  $sub_exp279 = $sub_exp278 ^ $sub_exp7; 
  
  # S280: (+1*X1+1*X8+1*X9+1*X48) = +S44<<0 +S19<<0 
  my $sub_exp280; 
  $sub_exp280 = $sub_exp44 ^ $sub_exp19; 
  
  # S281: (+1*X1+1*X8+1*X9+1*X16+1*X24+1*X26+1*X48+1*X63) = +S279<<0 +S280<<0 
  my $sub_exp281; 
  $sub_exp281 = $sub_exp279 ^ $sub_exp280; 
  
  # O26: (+1*X1+1*X8+1*X9+1*X10+1*X16+1*X24+1*X26+1*X34+1*X42+1*X48+1*X50+1*X63) = +S281<<0 +S130<<0 
  $mds_out[30] = $sub_exp281 ^ $sub_exp130; 
  
  # S282: (+1*X27+1*X64) = +X27<<0 +X64<<0 
  my $sub_exp282; 
  $sub_exp282 = $mds_in->[29] ^ $mds_in->[56]; 
  
  # S283: (+1*X2+1*X10+1*X27+1*X64) = +S282<<0 +S23<<0 
  my $sub_exp283; 
  $sub_exp283 = $sub_exp282 ^ $sub_exp23; 
  
  # S284: (+1*X11+1*X35+1*X43+1*X51) = +S66<<0 +S34<<0 
  my $sub_exp284; 
  $sub_exp284 = $sub_exp66 ^ $sub_exp34; 
  
  # S285: (+1*X2+1*X10+1*X11+1*X27+1*X35+1*X43+1*X51+1*X64) = +S283<<0 +S284<<0 
  my $sub_exp285; 
  $sub_exp285 = $sub_exp283 ^ $sub_exp284; 
  
  # S286: (+1*X1+1*X2+1*X9+1*X10+1*X11+1*X17+1*X27+1*X35+1*X41+1*X43+1*X51+1*X64) = +S285<<0 +S87<<0 
  my $sub_exp286; 
  $sub_exp286 = $sub_exp285 ^ $sub_exp87; 
  
  # O27: (+1*X1+1*X2+1*X7+1*X8+1*X9+1*X10+1*X11+1*X15+1*X16+1*X17+1*X23+1*X27+1*X35+1*X41+1*X43+1*X47+1*X51+1*X62+1*X64) = +S286<<0 +S141<<0 
  $mds_out[29] = $sub_exp286 ^ $sub_exp141; 
  
  # S287: (+1*X12+1*X36+1*X44+1*X52+1*X57) = +X57<<0 +S109<<0 
  my $sub_exp287; 
  $sub_exp287 = $mds_in->[63] ^ $sub_exp109; 
  
  # S288: (+1*X2+1*X7+1*X10+1*X18+1*X28+1*X42+1*X47+1*X63) = +S143<<0 +S111<<0 
  my $sub_exp288; 
  $sub_exp288 = $sub_exp143 ^ $sub_exp111; 
  
  # S289: (+1*X2+1*X7+1*X10+1*X12+1*X18+1*X28+1*X36+1*X42+1*X44+1*X47+1*X52+1*X57+1*X63) = +S287<<0 +S288<<0 
  my $sub_exp289; 
  $sub_exp289 = $sub_exp287 ^ $sub_exp288; 
  
  # O28: (+1*X2+1*X3+1*X7+1*X10+1*X11+1*X12+1*X15+1*X18+1*X23+1*X24+1*X28+1*X36+1*X42+1*X44+1*X47+1*X48+1*X52+1*X57+1*X62+1*X63) = +S289<<0 +S144<<0 
  $mds_out[28] = $sub_exp289 ^ $sub_exp144; 
  
  # S290: (+1*X4+1*X12+1*X58) = +X58<<0 +S27<<0 
  my $sub_exp290; 
  $sub_exp290 = $mds_in->[62] ^ $sub_exp27; 
  
  # S291: (+1*X19+1*X37+1*X43+1*X45) = +S69<<0 +S38<<0 
  my $sub_exp291; 
  $sub_exp291 = $sub_exp69 ^ $sub_exp38; 
  
  # S292: (+1*X13+1*X29+1*X47+1*X53) = +S145<<0 +S73<<0 
  my $sub_exp292; 
  $sub_exp292 = $sub_exp145 ^ $sub_exp73; 
  
  # S293: (+1*X4+1*X12+1*X19+1*X37+1*X43+1*X45+1*X58) = +S290<<0 +S291<<0 
  my $sub_exp293; 
  $sub_exp293 = $sub_exp290 ^ $sub_exp291; 
  
  # S294: (+1*X7+1*X13+1*X29+1*X47+1*X53+1*X63+1*X64) = +S292<<0 +S48<<0 
  my $sub_exp294; 
  $sub_exp294 = $sub_exp292 ^ $sub_exp48; 
  
  # S295: (+1*X4+1*X7+1*X12+1*X13+1*X19+1*X29+1*X37+1*X43+1*X45+1*X47+1*X53+1*X58+1*X63+1*X64) = +S293<<0 +S294<<0 
  my $sub_exp295; 
  $sub_exp295 = $sub_exp293 ^ $sub_exp294; 
  
  # O29: (+1*X3+1*X4+1*X7+1*X11+1*X12+1*X13+1*X15+1*X19+1*X23+1*X24+1*X29+1*X37+1*X43+1*X45+1*X47+1*X48+1*X53+1*X58+1*X62+1*X63+1*X64) = +S295<<0 +S144<<0 
  $mds_out[27] = $sub_exp295 ^ $sub_exp144; 
  
  # S296: (+1*X20+1*X59) = +X20<<0 +X59<<0 
  my $sub_exp296; 
  $sub_exp296 = $mds_in->[20] ^ $mds_in->[61]; 
  
  # S297: (+1*X4+1*X12+1*X20+1*X59) = +S296<<0 +S27<<0 
  my $sub_exp297; 
  $sub_exp297 = $sub_exp296 ^ $sub_exp27; 
  
  # S298: (+1*X5+1*X13+1*X44+1*X63) = +S72<<0 +S36<<0 
  my $sub_exp298; 
  $sub_exp298 = $sub_exp72 ^ $sub_exp36; 
  
  # S299: (+1*X4+1*X12+1*X20+1*X30+1*X59+1*X64) = +S297<<0 +S77<<0 
  my $sub_exp299; 
  $sub_exp299 = $sub_exp297 ^ $sub_exp77; 
  
  # S300: (+1*X4+1*X5+1*X12+1*X13+1*X20+1*X30+1*X44+1*X59+1*X63+1*X64) = +S299<<0 +S298<<0 
  my $sub_exp300; 
  $sub_exp300 = $sub_exp299 ^ $sub_exp298; 
  
  # O30: (+1*X4+1*X5+1*X8+1*X12+1*X13+1*X14+1*X16+1*X20+1*X24+1*X30+1*X38+1*X44+1*X46+1*X48+1*X54+1*X59+1*X63+1*X64) = +S300<<0 +S150<<0 
  $mds_out[26] = $sub_exp300 ^ $sub_exp150; 
  
  # S301: (+1*X6+1*X14+1*X64) = +X64<<0 +S17<<0 
  my $sub_exp301; 
  $sub_exp301 = $mds_in->[56] ^ $sub_exp17; 
  
  # S302: (+1*X6+1*X14+1*X15+1*X31+1*X39+1*X60+1*X64) = +S301<<0 +S171<<0 
  my $sub_exp302; 
  $sub_exp302 = $sub_exp301 ^ $sub_exp171; 
  
  # O31: (+1*X5+1*X6+1*X13+1*X14+1*X15+1*X21+1*X31+1*X39+1*X45+1*X47+1*X55+1*X60+1*X64) = +S302<<0 +S173<<0 
  $mds_out[25] = $sub_exp302 ^ $sub_exp173; 
  
  # S303: (+1*X7+1*X46) = +X7<<0 +X46<<0 
  my $sub_exp303; 
  $sub_exp303 = $mds_in->[1] ^ $mds_in->[42]; 
  
  # S304: (+1*X7+1*X15+1*X32+1*X46+1*X61) = +S303<<0 +S93<<0 
  my $sub_exp304; 
  $sub_exp304 = $sub_exp303 ^ $sub_exp93; 
  
  # O32: (+1*X6+1*X7+1*X14+1*X15+1*X16+1*X22+1*X32+1*X40+1*X46+1*X48+1*X56+1*X61) = +S304<<0 +S108<<0 
  $mds_out[24] = $sub_exp304 ^ $sub_exp108; 
  
  # S305: (+1*X33+1*X41+1*X49+1*X57) = +S21<<0 +S22<<0 
  my $sub_exp305; 
  $sub_exp305 = $sub_exp21 ^ $sub_exp22; 
  
  # S306: (+1*X16+1*X17+1*X24+1*X33+1*X41+1*X49+1*X57) = +S305<<0 +S122<<0 
  my $sub_exp306; 
  $sub_exp306 = $sub_exp305 ^ $sub_exp122; 
  
  # O33: (+1*X6+1*X15+1*X16+1*X17+1*X23+1*X24+1*X31+1*X33+1*X41+1*X49+1*X55+1*X57) = +S306<<0 +S121<<0 
  $mds_out[39] = $sub_exp306 ^ $sub_exp121; 
  
  # S307: (+1*X18+1*X50+1*X58) = +X18<<0 +S25<<0 
  my $sub_exp307; 
  $sub_exp307 = $mds_in->[22] ^ $sub_exp25; 
  
  # S308: (+1*X9+1*X34+1*X42+1*X56) = +S90<<0 +S26<<0 
  my $sub_exp308; 
  $sub_exp308 = $sub_exp90 ^ $sub_exp26; 
  
  # S309: (+1*X7+1*X18+1*X32+1*X50+1*X58) = +S307<<0 +S113<<0 
  my $sub_exp309; 
  $sub_exp309 = $sub_exp307 ^ $sub_exp113; 
  
  # S310: (+1*X9+1*X16+1*X17+1*X24+1*X34+1*X42+1*X56) = +S122<<0 +S308<<0 
  my $sub_exp310; 
  $sub_exp310 = $sub_exp122 ^ $sub_exp308; 
  
  # O34: (+1*X7+1*X9+1*X16+1*X17+1*X18+1*X24+1*X32+1*X34+1*X42+1*X50+1*X56+1*X58) = +S309<<0 +S310<<0 
  $mds_out[38] = $sub_exp309 ^ $sub_exp310; 
  
  # S311: (+1*X10+1*X19) = +X10<<0 +X19<<0 
  my $sub_exp311; 
  $sub_exp311 = $mds_in->[14] ^ $mds_in->[21]; 
  
  # S312: (+1*X9+1*X10+1*X19+1*X49) = +S311<<0 +S64<<0 
  my $sub_exp312; 
  $sub_exp312 = $sub_exp311 ^ $sub_exp64; 
  
  # S313: (+1*X9+1*X10+1*X18+1*X19+1*X35+1*X43+1*X49) = +S312<<0 +S94<<0 
  my $sub_exp313; 
  $sub_exp313 = $sub_exp312 ^ $sub_exp94; 
  
  # S314: (+1*X8+1*X16+1*X17+1*X24+1*X25+1*X51+1*X59) = +S120<<0 +S118<<0 
  my $sub_exp314; 
  $sub_exp314 = $sub_exp120 ^ $sub_exp118; 
  
  # S315: (+1*X8+1*X9+1*X10+1*X16+1*X17+1*X18+1*X19+1*X24+1*X25+1*X35+1*X43+1*X49+1*X51+1*X59) = +S313<<0 +S314<<0 
  my $sub_exp315; 
  $sub_exp315 = $sub_exp313 ^ $sub_exp314; 
  
  # O35: (+1*X6+1*X8+1*X9+1*X10+1*X15+1*X16+1*X17+1*X18+1*X19+1*X23+1*X24+1*X25+1*X31+1*X35+1*X43+1*X49+1*X51+1*X55+1*X59) = +S315<<0 +S121<<0 
  $mds_out[37] = $sub_exp315 ^ $sub_exp121; 
  
  # S316: (+1*X11+1*X52+1*X60) = +X11<<0 +S29<<0 
  my $sub_exp316; 
  $sub_exp316 = $mds_in->[13] ^ $sub_exp29; 
  
  # S317: (+1*X7+1*X10+1*X32+1*X50) = +S113<<0 +S65<<0 
  my $sub_exp317; 
  $sub_exp317 = $sub_exp113 ^ $sub_exp65; 
  
  # S318: (+1*X11+1*X15+1*X23+1*X31+1*X52+1*X55+1*X60) = +S316<<0 +S39<<0 
  my $sub_exp318; 
  $sub_exp318 = $sub_exp316 ^ $sub_exp39; 
  
  # S319: (+1*X1+1*X7+1*X10+1*X18+1*X26+1*X32+1*X50) = +S102<<0 +S317<<0 
  my $sub_exp319; 
  $sub_exp319 = $sub_exp102 ^ $sub_exp317; 
  
  # S320: (+1*X6+1*X19+1*X20+1*X36+1*X44+1*X56) = +S156<<0 +S110<<0 
  my $sub_exp320; 
  $sub_exp320 = $sub_exp156 ^ $sub_exp110; 
  
  # S321: (+1*X1+1*X7+1*X10+1*X11+1*X15+1*X18+1*X23+1*X26+1*X31+1*X32+1*X50+1*X52+1*X55+1*X60) = +S318<<0 +S319<<0 
  my $sub_exp321; 
  $sub_exp321 = $sub_exp318 ^ $sub_exp319; 
  
  # O36: (+1*X1+1*X6+1*X7+1*X10+1*X11+1*X15+1*X18+1*X19+1*X20+1*X23+1*X26+1*X31+1*X32+1*X36+1*X44+1*X50+1*X52+1*X55+1*X56+1*X60) = +S321<<0 +S320<<0 
  $mds_out[36] = $sub_exp321 ^ $sub_exp320; 
  
  # S322: (+1*X37+1*X45+1*X53+1*X61) = +S37<<0 +S38<<0 
  my $sub_exp322; 
  $sub_exp322 = $sub_exp37 ^ $sub_exp38; 
  
  # S323: (+1*X11+1*X37+1*X45+1*X51+1*X53+1*X61) = +S322<<0 +S66<<0 
  my $sub_exp323; 
  $sub_exp323 = $sub_exp322 ^ $sub_exp66; 
  
  # S324: (+1*X2+1*X8+1*X12+1*X19+1*X27+1*X32) = +S133<<0 +S104<<0 
  my $sub_exp324; 
  $sub_exp324 = $sub_exp133 ^ $sub_exp104; 
  
  # S325: (+1*X6+1*X11+1*X20+1*X37+1*X45+1*X51+1*X53+1*X56+1*X61) = +S323<<0 +S156<<0 
  my $sub_exp325; 
  $sub_exp325 = $sub_exp323 ^ $sub_exp156; 
  
  # S326: (+1*X2+1*X7+1*X8+1*X12+1*X15+1*X19+1*X21+1*X23+1*X27+1*X31+1*X32+1*X55) = +S155<<0 +S324<<0 
  my $sub_exp326; 
  $sub_exp326 = $sub_exp155 ^ $sub_exp324; 
  
  # O37: (+1*X2+1*X6+1*X7+1*X8+1*X11+1*X12+1*X15+1*X19+1*X20+1*X21+1*X23+1*X27+1*X31+1*X32+1*X37+1*X45+1*X51+1*X53+1*X55+1*X56+1*X61) = +S325<<0 +S326<<0 
  $mds_out[35] = $sub_exp325 ^ $sub_exp326; 
  
  # S327: (+1*X7+1*X13+1*X21) = +X13<<0 +S80<<0 
  my $sub_exp327; 
  $sub_exp327 = $mds_in->[11] ^ $sub_exp80; 
  
  # S328: (+1*X7+1*X12+1*X13+1*X21+1*X52) = +S327<<0 +S84<<0 
  my $sub_exp328; 
  $sub_exp328 = $sub_exp327 ^ $sub_exp84; 
  
  # S329: (+1*X3+1*X7+1*X12+1*X13+1*X20+1*X21+1*X28+1*X52) = +S328<<0 +S91<<0 
  my $sub_exp329; 
  $sub_exp329 = $sub_exp328 ^ $sub_exp91; 
  
  # S330: (+1*X3+1*X7+1*X12+1*X13+1*X16+1*X20+1*X21+1*X24+1*X28+1*X38+1*X46+1*X52+1*X54) = +S329<<0 +S68<<0 
  my $sub_exp330; 
  $sub_exp330 = $sub_exp329 ^ $sub_exp68; 
  
  # O38: (+1*X3+1*X7+1*X8+1*X12+1*X13+1*X16+1*X20+1*X21+1*X22+1*X24+1*X28+1*X32+1*X38+1*X46+1*X52+1*X54+1*X56+1*X62) = +S330<<0 +S132<<0 
  $mds_out[34] = $sub_exp330 ^ $sub_exp132; 
  
  # S331: (+1*X4+1*X8) = +X4<<0 +X8<<0 
  my $sub_exp331; 
  $sub_exp331 = $mds_in->[4] ^ $mds_in->[0]; 
  
  # S332: (+1*X14+1*X22) = +X22<<0 +X14<<0 
  my $sub_exp332; 
  $sub_exp332 = $mds_in->[18] ^ $mds_in->[10]; 
  
  # S333: (+1*X4+1*X8+1*X39) = +S331<<0 +X39<<0 
  my $sub_exp333; 
  $sub_exp333 = $sub_exp331 ^ $mds_in->[33]; 
  
  # S334: (+1*X13+1*X14+1*X22+1*X53) = +S73<<0 +S332<<0 
  my $sub_exp334; 
  $sub_exp334 = $sub_exp73 ^ $sub_exp332; 
  
  # S335: (+1*X4+1*X8+1*X13+1*X14+1*X22+1*X39+1*X53) = +S333<<0 +S334<<0 
  my $sub_exp335; 
  $sub_exp335 = $sub_exp333 ^ $sub_exp334; 
  
  # O39: (+1*X4+1*X8+1*X13+1*X14+1*X21+1*X22+1*X23+1*X29+1*X39+1*X47+1*X53+1*X55+1*X63) = +S335<<0 +S129<<0 
  $mds_out[33] = $sub_exp335 ^ $sub_exp129; 
  
  # S336: (+1*X5+1*X54) = +X5<<0 +X54<<0 
  my $sub_exp336; 
  $sub_exp336 = $mds_in->[3] ^ $mds_in->[50]; 
  
  # S337: (+1*X5+1*X15+1*X23+1*X54) = +S336<<0 +S3<<0 
  my $sub_exp337; 
  $sub_exp337 = $sub_exp336 ^ $sub_exp3; 
  
  # S338: (+1*X5+1*X15+1*X23+1*X24+1*X30+1*X40+1*X54+1*X64) = +S337<<0 +S107<<0 
  my $sub_exp338; 
  $sub_exp338 = $sub_exp337 ^ $sub_exp107; 
  
  # O40: (+1*X5+1*X14+1*X15+1*X22+1*X23+1*X24+1*X30+1*X40+1*X48+1*X54+1*X56+1*X64) = +S338<<0 +S146<<0 
  $mds_out[32] = $sub_exp338 ^ $sub_exp146; 
  
  # S339: (+1*X1+1*X25+1*X49+1*X57) = +S21<<0 +S81<<0 
  my $sub_exp339; 
  $sub_exp339 = $sub_exp21 ^ $sub_exp81; 
  
  # S340: (+1*X1+1*X24+1*X25+1*X41+1*X49+1*X57) = +S339<<0 +S86<<0 
  my $sub_exp340; 
  $sub_exp340 = $sub_exp339 ^ $sub_exp86; 
  
  # O41: (+1*X1+1*X14+1*X23+1*X24+1*X25+1*X31+1*X32+1*X39+1*X41+1*X49+1*X57+1*X63) = +S340<<0 +S165<<0 
  $mds_out[47] = $sub_exp340 ^ $sub_exp165; 
  
  # S341: (+1*X24+1*X42) = +X24<<0 +X42<<0 
  my $sub_exp341; 
  $sub_exp341 = $mds_in->[16] ^ $mds_in->[46]; 
  
  # S342: (+1*X24+1*X40+1*X42+1*X64) = +S341<<0 +S8<<0 
  my $sub_exp342; 
  $sub_exp342 = $sub_exp341 ^ $sub_exp8; 
  
  # S343: (+1*X15+1*X17+1*X25+1*X32) = +S50<<0 +S20<<0 
  my $sub_exp343; 
  $sub_exp343 = $sub_exp50 ^ $sub_exp20; 
  
  # S344: (+1*X15+1*X17+1*X24+1*X25+1*X32+1*X40+1*X42+1*X64) = +S342<<0 +S343<<0 
  my $sub_exp344; 
  $sub_exp344 = $sub_exp342 ^ $sub_exp343; 
  
  # O42: (+1*X2+1*X15+1*X17+1*X24+1*X25+1*X26+1*X32+1*X40+1*X42+1*X50+1*X58+1*X64) = +S344<<0 +S96<<0 
  $mds_out[46] = $sub_exp344 ^ $sub_exp96; 
  
  # S345: (+1*X18+1*X26+1*X43) = +X43<<0 +S24<<0 
  my $sub_exp345; 
  $sub_exp345 = $mds_in->[45] ^ $sub_exp24; 
  
  # S346: (+1*X3+1*X18+1*X26+1*X27+1*X43) = +S345<<0 +S61<<0 
  my $sub_exp346; 
  $sub_exp346 = $sub_exp345 ^ $sub_exp61; 
  
  # S347: (+1*X16+1*X17+1*X24+1*X25+1*X33+1*X51+1*X57+1*X59) = +S120<<0 +S117<<0 
  my $sub_exp347; 
  $sub_exp347 = $sub_exp120 ^ $sub_exp117; 
  
  # S348: (+1*X3+1*X16+1*X17+1*X18+1*X24+1*X25+1*X26+1*X27+1*X33+1*X43+1*X51+1*X57+1*X59) = +S346<<0 +S347<<0 
  my $sub_exp348; 
  $sub_exp348 = $sub_exp346 ^ $sub_exp347; 
  
  # O43: (+1*X3+1*X14+1*X16+1*X17+1*X18+1*X23+1*X24+1*X25+1*X26+1*X27+1*X31+1*X32+1*X33+1*X39+1*X43+1*X51+1*X57+1*X59+1*X63) = +S348<<0 +S165<<0 
  $mds_out[45] = $sub_exp348 ^ $sub_exp165; 
  
  # S349: (+1*X9+1*X44+1*X63) = +X9<<0 +S72<<0 
  my $sub_exp349; 
  $sub_exp349 = $mds_in->[15] ^ $sub_exp72; 
  
  # S350: (+1*X4+1*X9+1*X28+1*X44+1*X52+1*X60+1*X63) = +S349<<0 +S100<<0 
  my $sub_exp350; 
  $sub_exp350 = $sub_exp349 ^ $sub_exp100; 
  
  # S351: (+1*X4+1*X9+1*X18+1*X26+1*X28+1*X34+1*X44+1*X52+1*X58+1*X60+1*X63) = +S350<<0 +S101<<0 
  my $sub_exp351; 
  $sub_exp351 = $sub_exp350 ^ $sub_exp101; 
  
  # O44: (+1*X4+1*X9+1*X14+1*X15+1*X18+1*X19+1*X23+1*X26+1*X27+1*X28+1*X31+1*X34+1*X39+1*X40+1*X44+1*X52+1*X58+1*X60+1*X63+1*X64) = +S351<<0 +S179<<0 
  $mds_out[44] = $sub_exp351 ^ $sub_exp179; 
  
  # S352: (+1*X10+1*X16) = +X10<<0 +X16<<0 
  my $sub_exp352; 
  $sub_exp352 = $mds_in->[14] ^ $mds_in->[8]; 
  
  # S353: (+1*X10+1*X16+1*X20+1*X28) = +S352<<0 +S28<<0 
  my $sub_exp353; 
  $sub_exp353 = $sub_exp352 ^ $sub_exp28; 
  
  # S354: (+1*X35+1*X45+1*X59+1*X63) = +S103<<0 +S59<<0 
  my $sub_exp354; 
  $sub_exp354 = $sub_exp103 ^ $sub_exp59; 
  
  # S355: (+1*X10+1*X16+1*X20+1*X28+1*X35+1*X45+1*X59+1*X63) = +S353<<0 +S354<<0 
  my $sub_exp355; 
  $sub_exp355 = $sub_exp353 ^ $sub_exp354; 
  
  # S356: (+1*X5+1*X10+1*X16+1*X20+1*X28+1*X29+1*X35+1*X45+1*X53+1*X59+1*X61+1*X63) = +S355<<0 +S105<<0 
  my $sub_exp356; 
  $sub_exp356 = $sub_exp355 ^ $sub_exp105; 
  
  # O45: (+1*X5+1*X10+1*X14+1*X15+1*X16+1*X19+1*X20+1*X23+1*X27+1*X28+1*X29+1*X31+1*X35+1*X39+1*X40+1*X45+1*X53+1*X59+1*X61+1*X63+1*X64) = +S356<<0 +S179<<0 
  $mds_out[43] = $sub_exp356 ^ $sub_exp179; 
  
  # S357: (+1*X21+1*X29) = +X21<<0 +X29<<0 
  my $sub_exp357; 
  $sub_exp357 = $mds_in->[19] ^ $mds_in->[27]; 
  
  # S358: (+1*X15+1*X21+1*X29+1*X32) = +S357<<0 +S50<<0 
  my $sub_exp358; 
  $sub_exp358 = $sub_exp357 ^ $sub_exp50; 
  
  # S359: (+1*X11+1*X15+1*X21+1*X29+1*X32+1*X46) = +S358<<0 +S115<<0 
  my $sub_exp359; 
  $sub_exp359 = $sub_exp358 ^ $sub_exp115; 
  
  # S360: (+1*X11+1*X15+1*X20+1*X21+1*X28+1*X29+1*X32+1*X36+1*X46+1*X60) = +S359<<0 +S97<<0 
  my $sub_exp360; 
  $sub_exp360 = $sub_exp359 ^ $sub_exp97; 
  
  # O46: (+1*X6+1*X11+1*X15+1*X16+1*X20+1*X21+1*X24+1*X28+1*X29+1*X30+1*X32+1*X36+1*X40+1*X46+1*X54+1*X60+1*X62+1*X64) = +S360<<0 +S176<<0 
  $mds_out[42] = $sub_exp360 ^ $sub_exp176; 
  
  # S361: (+1*X12+1*X22) = +X12<<0 +X22<<0 
  my $sub_exp361; 
  $sub_exp361 = $mds_in->[12] ^ $mds_in->[18]; 
  
  # S362: (+1*X12+1*X22+1*X31) = +S361<<0 +X31<<0 
  my $sub_exp362; 
  $sub_exp362 = $sub_exp361 ^ $mds_in->[25]; 
  
  # S363: (+1*X7+1*X16+1*X30+1*X63) = +S78<<0 +S2<<0 
  my $sub_exp363; 
  $sub_exp363 = $sub_exp78 ^ $sub_exp2; 
  
  # S364: (+1*X7+1*X12+1*X16+1*X22+1*X30+1*X31+1*X63) = +S362<<0 +S363<<0 
  my $sub_exp364; 
  $sub_exp364 = $sub_exp362 ^ $sub_exp363; 
  
  # O47: (+1*X7+1*X12+1*X16+1*X21+1*X22+1*X29+1*X30+1*X31+1*X37+1*X47+1*X55+1*X61+1*X63) = +S364<<0 +S136<<0 
  $mds_out[41] = $sub_exp364 ^ $sub_exp136; 
  
  # S365: (+1*X13+1*X23) = +X13<<0 +X23<<0 
  my $sub_exp365; 
  $sub_exp365 = $mds_in->[11] ^ $mds_in->[17]; 
  
  # S366: (+1*X13+1*X23+1*X31) = +S365<<0 +X31<<0 
  my $sub_exp366; 
  $sub_exp366 = $sub_exp365 ^ $mds_in->[25]; 
  
  # S367: (+1*X13+1*X22+1*X23+1*X31+1*X48+1*X56) = +S366<<0 +S18<<0 
  my $sub_exp367; 
  $sub_exp367 = $sub_exp366 ^ $sub_exp18; 
  
  # O48: (+1*X8+1*X13+1*X22+1*X23+1*X30+1*X31+1*X32+1*X38+1*X48+1*X56+1*X62+1*X64) = +S367<<0 +S148<<0 
  $mds_out[40] = $sub_exp367 ^ $sub_exp148; 
  
  # S368: (+1*X1+1*X9+1*X33) = +X33<<0 +S19<<0 
  my $sub_exp368; 
  $sub_exp368 = $mds_in->[39] ^ $sub_exp19; 
  
  # S369: (+1*X1+1*X9+1*X33+1*X49+1*X57) = +S368<<0 +S21<<0 
  my $sub_exp369; 
  $sub_exp369 = $sub_exp368 ^ $sub_exp21; 
  
  # O49: (+1*X1+1*X7+1*X9+1*X22+1*X31+1*X32+1*X33+1*X39+1*X40+1*X47+1*X49+1*X57) = +S369<<0 +S167<<0 
  $mds_out[55] = $sub_exp369 ^ $sub_exp167; 
  
  # S370: (+1*X25+1*X34) = +X25<<0 +X34<<0 
  my $sub_exp370; 
  $sub_exp370 = $mds_in->[31] ^ $mds_in->[38]; 
  
  # S371: (+1*X8+1*X25+1*X32+1*X34) = +S370<<0 +S6<<0 
  my $sub_exp371; 
  $sub_exp371 = $sub_exp370 ^ $sub_exp6; 
  
  # S372: (+1*X2+1*X8+1*X10+1*X25+1*X32+1*X34) = +S371<<0 +S23<<0 
  my $sub_exp372; 
  $sub_exp372 = $sub_exp371 ^ $sub_exp23; 
  
  # S373: (+1*X23+1*X33+1*X40+1*X48+1*X50+1*X58) = +S152<<0 +S95<<0 
  my $sub_exp373; 
  $sub_exp373 = $sub_exp152 ^ $sub_exp95; 
  
  # O50: (+1*X2+1*X8+1*X10+1*X23+1*X25+1*X32+1*X33+1*X34+1*X40+1*X48+1*X50+1*X58) = +S372<<0 +S373<<0 
  $mds_out[54] = $sub_exp372 ^ $sub_exp373; 
  
  # S374: (+1*X26+1*X35) = +X26<<0 +X35<<0 
  my $sub_exp374; 
  $sub_exp374 = $mds_in->[30] ^ $mds_in->[37]; 
  
  # S375: (+1*X26+1*X33+1*X35+1*X41) = +S374<<0 +S22<<0 
  my $sub_exp375; 
  $sub_exp375 = $sub_exp374 ^ $sub_exp22; 
  
  # S376: (+1*X1+1*X25+1*X26+1*X33+1*X35+1*X41) = +S375<<0 +S81<<0 
  my $sub_exp376; 
  $sub_exp376 = $sub_exp375 ^ $sub_exp81; 
  
  # S377: (+1*X3+1*X11+1*X24+1*X34+1*X51+1*X59) = +S114<<0 +S67<<0 
  my $sub_exp377; 
  $sub_exp377 = $sub_exp114 ^ $sub_exp67; 
  
  # S378: (+1*X1+1*X3+1*X11+1*X24+1*X25+1*X26+1*X33+1*X34+1*X35+1*X41+1*X51+1*X59) = +S376<<0 +S377<<0 
  my $sub_exp378; 
  $sub_exp378 = $sub_exp376 ^ $sub_exp377; 
  
  # O51: (+1*X1+1*X3+1*X7+1*X11+1*X22+1*X24+1*X25+1*X26+1*X31+1*X32+1*X33+1*X34+1*X35+1*X39+1*X40+1*X41+1*X47+1*X51+1*X59) = +S378<<0 +S167<<0 
  $mds_out[53] = $sub_exp378 ^ $sub_exp167; 
  
  # S379: (+1*X17+1*X23) = +X17<<0 +X23<<0 
  my $sub_exp379; 
  $sub_exp379 = $mds_in->[23] ^ $mds_in->[17]; 
  
  # S380: (+1*X27+1*X36) = +X36<<0 +X27<<0 
  my $sub_exp380; 
  $sub_exp380 = $mds_in->[36] ^ $mds_in->[29]; 
  
  # S381: (+1*X17+1*X23+1*X27+1*X36) = +S379<<0 +S380<<0 
  my $sub_exp381; 
  $sub_exp381 = $sub_exp379 ^ $sub_exp380; 
  
  # S382: (+1*X4+1*X12+1*X34+1*X42) = +S27<<0 +S26<<0 
  my $sub_exp382; 
  $sub_exp382 = $sub_exp27 ^ $sub_exp26; 
  
  # S383: (+1*X2+1*X17+1*X23+1*X26+1*X27+1*X36) = +S381<<0 +S60<<0 
  my $sub_exp383; 
  $sub_exp383 = $sub_exp381 ^ $sub_exp60; 
  
  # S384: (+1*X4+1*X12+1*X34+1*X35+1*X42+1*X52+1*X60) = +S99<<0 +S382<<0 
  my $sub_exp384; 
  $sub_exp384 = $sub_exp99 ^ $sub_exp382; 
  
  # S385: (+1*X2+1*X4+1*X12+1*X17+1*X23+1*X26+1*X27+1*X34+1*X35+1*X36+1*X42+1*X52+1*X60) = +S383<<0 +S384<<0 
  my $sub_exp385; 
  $sub_exp385 = $sub_exp383 ^ $sub_exp384; 
  
  # O52: (+1*X2+1*X4+1*X7+1*X8+1*X12+1*X17+1*X22+1*X23+1*X26+1*X27+1*X31+1*X34+1*X35+1*X36+1*X39+1*X42+1*X47+1*X48+1*X52+1*X60) = +S385<<0 +S154<<0 
  $mds_out[52] = $sub_exp385 ^ $sub_exp154; 
  
  # S386: (+1*X24+1*X28) = +X24<<0 +X28<<0 
  my $sub_exp386; 
  $sub_exp386 = $mds_in->[16] ^ $mds_in->[28]; 
  
  # S387: (+1*X24+1*X28+1*X37) = +S386<<0 +X37<<0 
  my $sub_exp387; 
  $sub_exp387 = $sub_exp386 ^ $mds_in->[35]; 
  
  # S388: (+1*X3+1*X24+1*X27+1*X28+1*X37) = +S387<<0 +S61<<0 
  my $sub_exp388; 
  $sub_exp388 = $sub_exp387 ^ $sub_exp61; 
  
  # S389: (+1*X5+1*X13+1*X18+1*X23+1*X35+1*X43) = +S151<<0 +S94<<0 
  my $sub_exp389; 
  $sub_exp389 = $sub_exp151 ^ $sub_exp94; 
  
  # S390: (+1*X3+1*X24+1*X27+1*X28+1*X36+1*X37+1*X53+1*X61) = +S388<<0 +S153<<0 
  my $sub_exp390; 
  $sub_exp390 = $sub_exp388 ^ $sub_exp153; 
  
  # S391: (+1*X3+1*X5+1*X13+1*X18+1*X23+1*X24+1*X27+1*X28+1*X35+1*X36+1*X37+1*X43+1*X53+1*X61) = +S390<<0 +S389<<0 
  my $sub_exp391; 
  $sub_exp391 = $sub_exp390 ^ $sub_exp389; 
  
  # O53: (+1*X3+1*X5+1*X7+1*X8+1*X13+1*X18+1*X22+1*X23+1*X24+1*X27+1*X28+1*X31+1*X35+1*X36+1*X37+1*X39+1*X43+1*X47+1*X48+1*X53+1*X61) = +S391<<0 +S154<<0 
  $mds_out[51] = $sub_exp391 ^ $sub_exp154; 
  
  # S392: (+1*X29+1*X37) = +X29<<0 +X37<<0 
  my $sub_exp392; 
  $sub_exp392 = $mds_in->[27] ^ $mds_in->[35]; 
  
  # S393: (+1*X29+1*X37+1*X54) = +S392<<0 +X54<<0 
  my $sub_exp393; 
  $sub_exp393 = $sub_exp392 ^ $mds_in->[50]; 
  
  # S394: (+1*X4+1*X28+1*X29+1*X37+1*X54) = +S393<<0 +S71<<0 
  my $sub_exp394; 
  $sub_exp394 = $sub_exp393 ^ $sub_exp71; 
  
  # S395: (+1*X19+1*X23+1*X36+1*X40+1*X44+1*X48) = +S152<<0 +S110<<0 
  my $sub_exp395; 
  $sub_exp395 = $sub_exp152 ^ $sub_exp110; 
  
  # S396: (+1*X4+1*X19+1*X23+1*X28+1*X29+1*X36+1*X37+1*X40+1*X44+1*X48+1*X54) = +S394<<0 +S395<<0 
  my $sub_exp396; 
  $sub_exp396 = $sub_exp394 ^ $sub_exp395; 
  
  # O54: (+1*X4+1*X6+1*X8+1*X14+1*X19+1*X23+1*X24+1*X28+1*X29+1*X32+1*X36+1*X37+1*X38+1*X40+1*X44+1*X48+1*X54+1*X62) = +S396<<0 +S162<<0 
  $mds_out[50] = $sub_exp396 ^ $sub_exp162; 
  
  # S397: (+1*X20+1*X24+1*X38) = +X20<<0 +S41<<0 
  my $sub_exp397; 
  $sub_exp397 = $mds_in->[20] ^ $sub_exp41; 
  
  # S398: (+1*X15+1*X20+1*X24+1*X30+1*X38+1*X39) = +S397<<0 +S79<<0 
  my $sub_exp398; 
  $sub_exp398 = $sub_exp397 ^ $sub_exp79; 
  
  # O55: (+1*X5+1*X7+1*X15+1*X20+1*X24+1*X29+1*X30+1*X37+1*X38+1*X39+1*X45+1*X55+1*X63) = +S398<<0 +S158<<0 
  $mds_out[49] = $sub_exp398 ^ $sub_exp158; 
  
  # S399: (+1*X21+1*X31+1*X39) = +X21<<0 +S4<<0 
  my $sub_exp399; 
  $sub_exp399 = $mds_in->[19] ^ $sub_exp4; 
  
  # S400: (+1*X8+1*X16+1*X21+1*X31+1*X39) = +S399<<0 +S43<<0 
  my $sub_exp400; 
  $sub_exp400 = $sub_exp399 ^ $sub_exp43; 
  
  # O56: (+1*X6+1*X8+1*X16+1*X21+1*X30+1*X31+1*X38+1*X39+1*X40+1*X46+1*X56+1*X64) = +S400<<0 +S139<<0 
  $mds_out[48] = $sub_exp400 ^ $sub_exp139; 
  
  # S401: (+1*X1+1*X9+1*X17+1*X41+1*X57) = +X57<<0 +S87<<0 
  my $sub_exp401; 
  $sub_exp401 = $mds_in->[63] ^ $sub_exp87; 
  
  # O57: (+1*X1+1*X9+1*X15+1*X17+1*X30+1*X39+1*X40+1*X41+1*X47+1*X48+1*X55+1*X57) = +S401<<0 +S169<<0 
  $mds_out[63] = $sub_exp401 ^ $sub_exp169; 
  
  # S402: (+1*X31+1*X58) = +X31<<0 +X58<<0 
  my $sub_exp402; 
  $sub_exp402 = $mds_in->[25] ^ $mds_in->[62]; 
  
  # S403: (+1*X31+1*X48+1*X56+1*X58) = +S402<<0 +S5<<0 
  my $sub_exp403; 
  $sub_exp403 = $sub_exp402 ^ $sub_exp5; 
  
  # S404: (+1*X16+1*X33+1*X40+1*X41) = +S46<<0 +S22<<0 
  my $sub_exp404; 
  $sub_exp404 = $sub_exp46 ^ $sub_exp22; 
  
  # S405: (+1*X16+1*X31+1*X33+1*X40+1*X41+1*X48+1*X56+1*X58) = +S403<<0 +S404<<0 
  my $sub_exp405; 
  $sub_exp405 = $sub_exp403 ^ $sub_exp404; 
  
  # O58: (+1*X2+1*X10+1*X16+1*X18+1*X31+1*X33+1*X40+1*X41+1*X42+1*X48+1*X56+1*X58) = +S405<<0 +S111<<0 
  $mds_out[62] = $sub_exp405 ^ $sub_exp111; 
  
  # S406: (+1*X32+1*X59) = +X32<<0 +X59<<0 
  my $sub_exp406; 
  $sub_exp406 = $mds_in->[24] ^ $mds_in->[61]; 
  
  # S407: (+1*X32+1*X34+1*X42+1*X59) = +S406<<0 +S26<<0 
  my $sub_exp407; 
  $sub_exp407 = $sub_exp406 ^ $sub_exp26; 
  
  # S408: (+1*X3+1*X11+1*X19+1*X43) = +S69<<0 +S31<<0 
  my $sub_exp408; 
  $sub_exp408 = $sub_exp69 ^ $sub_exp31; 
  
  # S409: (+1*X3+1*X11+1*X19+1*X32+1*X34+1*X42+1*X43+1*X59) = +S407<<0 +S408<<0 
  my $sub_exp409; 
  $sub_exp409 = $sub_exp407 ^ $sub_exp408; 
  
  # S410: (+1*X3+1*X9+1*X11+1*X19+1*X32+1*X33+1*X34+1*X41+1*X42+1*X43+1*X49+1*X59) = +S409<<0 +S92<<0 
  my $sub_exp410; 
  $sub_exp410 = $sub_exp409 ^ $sub_exp92; 
  
  # O59: (+1*X3+1*X9+1*X11+1*X15+1*X19+1*X30+1*X32+1*X33+1*X34+1*X39+1*X40+1*X41+1*X42+1*X43+1*X47+1*X48+1*X49+1*X55+1*X59) = +S410<<0 +S169<<0 
  $mds_out[61] = $sub_exp410 ^ $sub_exp169; 
  
  # S411: (+1*X25+1*X47+1*X55) = +X25<<0 +S1<<0 
  my $sub_exp411; 
  $sub_exp411 = $mds_in->[31] ^ $sub_exp1; 
  
  # S412: (+1*X4+1*X12+1*X20+1*X44) = +S127<<0 +S27<<0 
  my $sub_exp412; 
  $sub_exp412 = $sub_exp127 ^ $sub_exp27; 
  
  # S413: (+1*X4+1*X12+1*X20+1*X25+1*X44+1*X47+1*X55) = +S411<<0 +S412<<0 
  my $sub_exp413; 
  $sub_exp413 = $sub_exp411 ^ $sub_exp412; 
  
  # S414: (+1*X10+1*X15+1*X31+1*X34+1*X39+1*X42+1*X50+1*X60) = +S171<<0 +S130<<0 
  my $sub_exp414; 
  $sub_exp414 = $sub_exp171 ^ $sub_exp130; 
  
  # S415: (+1*X4+1*X10+1*X12+1*X15+1*X20+1*X25+1*X31+1*X34+1*X39+1*X42+1*X44+1*X47+1*X50+1*X55+1*X60) = +S413<<0 +S414<<0 
  my $sub_exp415; 
  $sub_exp415 = $sub_exp413 ^ $sub_exp414; 
  
  # O60: (+1*X4+1*X10+1*X12+1*X15+1*X16+1*X20+1*X25+1*X30+1*X31+1*X34+1*X35+1*X39+1*X42+1*X43+1*X44+1*X47+1*X50+1*X55+1*X56+1*X60) = +S415<<0 +S170<<0 
  $mds_out[60] = $sub_exp415 ^ $sub_exp170; 
  
  # S416: (+1*X26+1*X31+1*X39) = +X26<<0 +S4<<0 
  my $sub_exp416; 
  $sub_exp416 = $mds_in->[30] ^ $sub_exp4; 
  
  # S417: (+1*X11+1*X36+1*X44+1*X51) = +S66<<0 +S30<<0 
  my $sub_exp417; 
  $sub_exp417 = $sub_exp66 ^ $sub_exp30; 
  
  # S418: (+1*X11+1*X26+1*X31+1*X36+1*X39+1*X44+1*X51) = +S416<<0 +S417<<0 
  my $sub_exp418; 
  $sub_exp418 = $sub_exp416 ^ $sub_exp417; 
  
  # S419: (+1*X11+1*X15+1*X26+1*X31+1*X32+1*X36+1*X39+1*X44+1*X51+1*X61) = +S418<<0 +S93<<0 
  my $sub_exp419; 
  $sub_exp419 = $sub_exp418 ^ $sub_exp93; 
  
  # S420: (+1*X5+1*X13+1*X16+1*X21+1*X30+1*X35+1*X43+1*X45+1*X47+1*X55+1*X56) = +S173<<0 +S170<<0 
  my $sub_exp420; 
  $sub_exp420 = $sub_exp173 ^ $sub_exp170; 
  
  # O61: (+1*X5+1*X11+1*X13+1*X15+1*X16+1*X21+1*X26+1*X30+1*X31+1*X32+1*X35+1*X36+1*X39+1*X43+1*X44+1*X45+1*X47+1*X51+1*X55+1*X56+1*X61) = +S419<<0 +S420<<0 
  $mds_out[59] = $sub_exp419 ^ $sub_exp420; 
  
  # S421: (+1*X27+1*X62) = +X27<<0 +X62<<0 
  my $sub_exp421; 
  $sub_exp421 = $mds_in->[29] ^ $mds_in->[58]; 
  
  # S422: (+1*X27+1*X31+1*X46+1*X62) = +S421<<0 +S85<<0 
  my $sub_exp422; 
  $sub_exp422 = $sub_exp421 ^ $sub_exp85; 
  
  # S423: (+1*X12+1*X27+1*X31+1*X36+1*X44+1*X46+1*X52+1*X62) = +S422<<0 +S109<<0 
  my $sub_exp423; 
  $sub_exp423 = $sub_exp422 ^ $sub_exp109; 
  
  # S424: (+1*X12+1*X27+1*X31+1*X32+1*X36+1*X37+1*X44+1*X45+1*X46+1*X52+1*X62) = +S423<<0 +S123<<0 
  my $sub_exp424; 
  $sub_exp424 = $sub_exp423 ^ $sub_exp123; 
  
  # O62: (+1*X6+1*X12+1*X14+1*X16+1*X22+1*X27+1*X31+1*X32+1*X36+1*X37+1*X40+1*X44+1*X45+1*X46+1*X48+1*X52+1*X56+1*X62) = +S424<<0 +S108<<0 
  $mds_out[58] = $sub_exp424 ^ $sub_exp108; 
  
  # S425: (+1*X15+1*X23+1*X38+1*X46) = +S3<<0 +S14<<0 
  my $sub_exp425; 
  $sub_exp425 = $sub_exp3 ^ $sub_exp14; 
  
  # S426: (+1*X13+1*X15+1*X23+1*X38+1*X46+1*X53) = +S425<<0 +S73<<0 
  my $sub_exp426; 
  $sub_exp426 = $sub_exp425 ^ $sub_exp73; 
  
  # S427: (+1*X7+1*X28+1*X32+1*X37+1*X45+1*X47+1*X63) = +S143<<0 +S123<<0 
  my $sub_exp427; 
  $sub_exp427 = $sub_exp143 ^ $sub_exp123; 
  
  # O63: (+1*X7+1*X13+1*X15+1*X23+1*X28+1*X32+1*X37+1*X38+1*X45+1*X46+1*X47+1*X53+1*X63) = +S426<<0 +S427<<0 
  $mds_out[57] = $sub_exp426 ^ $sub_exp427; 
  
  # S428: (+1*X29+1*X39+1*X47+1*X64) = +S76<<0 +S145<<0 
  my $sub_exp428; 
  $sub_exp428 = $sub_exp76 ^ $sub_exp145; 
  
  # O64: (+1*X8+1*X14+1*X16+1*X24+1*X29+1*X38+1*X39+1*X46+1*X47+1*X48+1*X54+1*X64) = +S428<<0 +S150<<0 
  $mds_out[56] = $sub_exp428 ^ $sub_exp150; 

  return (\@mds_out);
}

sub mix_column{
  my ($blk_cnt, $hex_arr) = @_;

  my @mix_col_arr = ();
  
  if ($the_verb){print "[INFO] Mix Column \n";}

  if ($the_verb){print_array_nos("hex_arr", $blk_cnt, $hex_arr);}
  
  my $col_cnt = ($blk_cnt*4)/64;

  my $bin_rep;
  my $cmvm_arr;
  my $the_dec = 0;
  my @bin_arr = ();
  my $bit_index = 3;
  my $mix_col_cnt = 0;
  for (my $i=0; $i<$col_cnt; $i++){
    for (my $j=0; $j<16; $j++){
      ($bin_rep) = dec2bin(hex($hex_arr->[$i*16+$j]), 4);
      for (my $k=0; $k<4; $k++){
        $bin_arr[$j*4+3-$k] = $bin_rep->[$k];
      }
    }

    if ($the_cmvm == 0){
      ($cmvm_arr) = cmvm_xor_enc(64, \@bin_arr);
    }
    elsif ($the_cmvm == 1){
      ($cmvm_arr) = cmvm_opt_xor_enc(64, \@bin_arr);
    }

    $the_dec = 0;
    $bit_index = 3; 
    for (my $j=0; $j<64; $j++){
      $the_dec += $cmvm_arr->[$j]*(2**$bit_index);
      $bit_index--;
      if ($bit_index == -1){
        $mix_col_arr[$mix_col_cnt] = word2hex($the_dec);
        $mix_col_cnt++;
        $bit_index = 3;
        $the_dec = 0;
      }
    }
  }
  
  if ($the_verb){print_array_nos("mix_col_arr", $blk_cnt, \@mix_col_arr);}

  return (\@mix_col_arr);
}

sub add_modulo_2{
  my ($hex_cnt, $hex_one_arr, $hex_two_arr) = @_;

  if ($the_verb){print "[INFO] Addition Modulo 2 \n";}
  
  if ($the_verb){print_array_nos("hex_one_arr", $hex_cnt, $hex_one_arr);}
  if ($the_verb){print_array_nos("hex_two_arr", $hex_cnt, $hex_two_arr);}

  
  my $sum_hex_cnt = 0;
  my @sum_hex_arr = ();

  my $the_sum = 0;
  my $the_dec = 0;
  my $the_hex = 0;
  my $add_bin_arr;
  my $add_hex_arr;
  my $bin_one_rep;
  my $bin_two_rep;
  my $bit_index = 0;
  my @bin_one_arr = ();
  my @bin_two_arr = ();
  my $col_num = ($hex_cnt*4)/64; 
  for (my $i=0; $i<$col_num; $i++){
    for (my $j=0; $j<16; $j++){
      #printf "hex_one: %d \n", hex($hex_one_arr->[$i*16+$j]);
      ($bin_one_rep) = dec2bin(hex($hex_one_arr->[$i*16+$j]), 4);
      #print_array("bin_one_rep", 4, $bin_one_rep);

      #printf "hex_two: %d \n", hex($hex_two_arr->[$i*16+$j]);
      ($bin_two_rep) = dec2bin(hex($hex_two_arr->[$i*16+$j]), 4);
      #print_array("bin_two_rep", 4, $bin_two_rep);
      for (my $k=0; $k<4; $k++){
        $bin_one_arr[$j*4+3-$k] = $bin_one_rep->[$k];
        $bin_two_arr[$j*4+3-$k] = $bin_two_rep->[$k];
      }
    }
    #print_array("bin_one_arr", 64, \@bin_one_arr);
    #print_array("bin_two_arr", 64, \@bin_two_arr);
    #(add_bin_arr) = add_binary_array(64, \@bin_one_arr, \@bin_two_arr);

    $the_dec = 0;
    $bit_index = 3; 
    for (my $j=0; $j<64; $j++){
      $the_sum = $bin_one_arr[$j] ^ $bin_two_arr[$j];
      $the_dec += $the_sum*(2**$bit_index);
      $bit_index--;
      if ($bit_index == -1){
        $sum_hex_arr[$sum_hex_cnt] = word2hex($the_dec);
        $sum_hex_cnt++;
        $bit_index = 3;
        $the_dec = 0;
      }
    }
  }

  if ($the_verb){print_array_nos("sum_hex_arr_nos", $sum_hex_cnt, \@sum_hex_arr);}

  return (\@sum_hex_arr);
}

sub generate_inter_key{
  my ($key_cnt, $key_arr) = @_;

  my $int_key_arr;
  my $blk_cnt = $blk_size/4;

  #Initialize Key State
  my $state_key_cnt = 0;
  my @state_key_arr = ();
  for (my $i=0; $i<$blk_cnt; $i++){
    $state_key_arr[$state_key_cnt] = 0;
    $state_key_cnt++;
  }
  my $state_dec = ($blk_size + $key_len)/64 + 1;
  #print "state_dec: $state_dec \n";
  my ($hex_arr) = dec2hex($state_dec, 2);
  #print_array("hex_arr", 2, $hex_arr);
  $state_key_arr[0] = $hex_arr->[1];
  $state_key_arr[1] = $hex_arr->[0];
  #print_array("state_key_arr", $blk_cnt, \@state_key_arr);

  #Initialize Alfa and Omega State
  my $alfa_key_cnt = 0;
  my @alfa_key_arr = ();
  my $omega_key_cnt = 0;
  my @omega_key_arr = ();
  if ($key_len == $blk_size){
    for (my $i=0; $i<$key_cnt; $i++){
      $alfa_key_arr[$alfa_key_cnt] = $key_arr->[$i];
      $omega_key_arr[$omega_key_cnt] = $key_arr->[$i];
      $omega_key_cnt++;
      $alfa_key_cnt++;
    }
  }
  else{
    for (my $i=0; $i<$key_cnt/2; $i++){
      $alfa_key_arr[$alfa_key_cnt] = $key_arr->[$i];
      $omega_key_arr[$omega_key_cnt] = $key_arr->[$i+$key_cnt/2];
      $omega_key_cnt++;
      $alfa_key_cnt++;
    }
  }
  if ($the_verb){print_array_nos("alfa_key_arr", $alfa_key_cnt, \@alfa_key_arr);}
  if ($the_verb){print_array_nos("omega_key_arr", $omega_key_cnt, \@omega_key_arr);}

  #Add modulo 2^64
  my ($add_mod64_arr) = add_modulo_2pow64($blk_cnt, \@alfa_key_arr, \@state_key_arr);
  #Byte Substitute
  my ($byte_sub_arr) = byte_substitute($blk_cnt, $add_mod64_arr);
  #Shift Rows
  my ($shift_row_arr) = shift_row($blk_cnt, $byte_sub_arr);
  #Mix Column
  my ($mix_col_arr) = mix_column($blk_cnt, $shift_row_arr);
  #Add Modulo 2
  my ($add_mod2_arr) = add_modulo_2($blk_cnt, \@omega_key_arr, $mix_col_arr);
  #Byte Substitute
  ($byte_sub_arr) = byte_substitute($blk_cnt, $add_mod2_arr);
  #Shift Rows
  ($shift_row_arr) = shift_row($blk_cnt, $byte_sub_arr);
  #Mix Column
  ($mix_col_arr) = mix_column($blk_cnt, $shift_row_arr);
  #Add modulo 2^64
  ($add_mod64_arr) = add_modulo_2pow64($blk_cnt, \@alfa_key_arr, $mix_col_arr);
  #Byte Substitute
  ($byte_sub_arr) = byte_substitute($blk_cnt, $add_mod64_arr);
  #Shift Rows
  ($shift_row_arr) = shift_row($blk_cnt, $byte_sub_arr);
  #Mix Column
  ($int_key_arr) = mix_column($blk_cnt, $shift_row_arr);

  return ($blk_cnt, $int_key_arr);
}

sub generate_id{
  my ($key_cnt, $key_arr, $the_round) = @_;

  my @id_arr = ();

  if ($the_verb){print "[INFO] Generating the ID array...\n";}
  if ($the_verb){print_array_nos("key_arr", $key_cnt, $key_arr);}

  my $the_shift = 0;
  my $hex_cnt = $blk_size/4;
  if ($blk_size == $key_len){
    $the_shift = (8*$the_round) % $hex_cnt;
    for (my $i=0; $i<$key_cnt; $i++){
      $id_arr[$i] = $key_arr->[ ($i+$the_shift) % $key_cnt ];
    }
  }
  else{
    my $the_init = 0;
    my $the_last = 0;
    my @id_key_arr = ();
    if ($the_round % 4){
      $the_init = $key_cnt/2;
      $the_last = $key_cnt;
      $the_shift = (16*(POSIX::floor($the_round/4))) % $key_cnt;
    }
    else{
      $the_init = 0;
      $the_last = $key_cnt/2;
      $the_shift = (4*$the_round) % $key_cnt;
    }
    for (my $i=0; $i<$key_cnt; $i++){
      $id_key_arr[$i] = $key_arr->[ ($i+$the_shift) % $key_cnt ];
    }
    #print "the_init: $the_init the_last: $the_last \n";
    for (my $i=$the_init; $i<$the_last; $i++){
      $id_arr[$i-$the_init] = $id_key_arr[$i];
    }
  }

  if ($the_verb){print_array_nos("id_arr", $hex_cnt, \@id_arr);}

  return (\@id_arr);
}

sub generate_tmv{
  my ($the_round) = @_;

  my @tmv_arr = ();
  
  if ($the_verb){print "[INFO] Generating the TMV array...\n";}

  #Initialize
  my @tmv_bin_arr = ();
  my @tmv_shift_bin_arr = ();
  for (my $i=0; $i<$blk_size; $i++){
    $tmv_bin_arr[$i] = 0;
    $tmv_shift_bin_arr[$i] = 0;
  }
  my $tmv_index = 7;
  while ($tmv_index < $blk_size){
    $tmv_bin_arr[$tmv_index] = 1;
    $tmv_index += 16;
  }
  #print_array("tmv_bin_arr      ", $blk_size, \@tmv_bin_arr);

  #Left Shift
  my $the_shift = $the_round/2;
  #for (my $i=0; $i<$blk_size-$the_shift; $i++){
  #  $tmv_shift_bin_arr[$i] = $tmv_bin_arr[$i+$the_shift];
  #}
  #print_array("tmv_shift_bin_arr", $blk_size, \@tmv_shift_bin_arr);
  
  #Left Rotate
  for (my $i=0; $i<$blk_size; $i++){
    $tmv_shift_bin_arr[$i] = $tmv_bin_arr[ ($i+$the_shift) % $blk_size ];
  }

  my $tmv_cnt = 0;
  my $the_dec = 0;
  my $bit_index = 3; 
  for (my $i=0; $i<$blk_size; $i++){
    $the_dec += $tmv_shift_bin_arr[$i]*(2**$bit_index);
    #print "the_bit: $tmv_shift_bin_arr[$i] bit_index; $bit_index the_dec: $the_dec \n";
    $bit_index--;
    if ($bit_index == -1){
      #print "the_dec: $the_dec \n";
      $tmv_arr[$tmv_cnt] = word2hex($the_dec);
      $tmv_cnt++;
      $bit_index = 3;
      $the_dec = 0;
    }
  }

  if ($the_verb){print_array_nos("tmv_arr", $tmv_cnt, \@tmv_arr);}

  return (\@tmv_arr);
}

sub generate_round_key{
  my ($key_cnt, $key_arr, $int_key_cnt, $int_key_arr, $even_key_arr, $the_round) = @_;

  if ($the_round % 2){
    my @odd_key_arr = ();

    if ($the_verb){print"[INFO] Generating the round key for the odd round... \n";}
    if ($the_verb){print_array_nos("even_key_arr", $int_key_cnt, $even_key_arr);}

    my $the_shift = ($blk_size/4+24)/4;
    for (my $i=0; $i<$int_key_cnt; $i++){
      $odd_key_arr[$i] = $even_key_arr->[ ($i+$the_shift) % $int_key_cnt ];
    }
    
    if ($the_verb){print_array_nos("odd_key_arr", $int_key_cnt, \@odd_key_arr);}

    return (\@odd_key_arr);
  }
  else{
    if ($the_verb){print"[INFO] Generating the round key for the even round... \n";}

    #PREPARATION
    my ($id_arr) = generate_id($key_cnt, $key_arr, $the_round);
    my ($tmv_arr) = generate_tmv($the_round);
    my ($add_inttmv_arr) = add_modulo_2pow64($int_key_cnt, $int_key_arr, $tmv_arr);
    #ROUND KEY FUNCTION
    my ($add_mod64_arr) = add_modulo_2pow64($int_key_cnt, $add_inttmv_arr, $id_arr);
    my ($byte_sub_arr) = byte_substitute($int_key_cnt, $add_mod64_arr);
    my ($shift_row_arr) = shift_row($int_key_cnt, $byte_sub_arr);
    my ($mix_col_arr) = mix_column($int_key_cnt, $shift_row_arr);
    my ($add_mod2_arr) = add_modulo_2($int_key_cnt, $add_inttmv_arr, $mix_col_arr);
    ($byte_sub_arr) = byte_substitute($int_key_cnt, $add_mod2_arr);
    ($shift_row_arr) = shift_row($int_key_cnt, $byte_sub_arr);
    ($mix_col_arr) = mix_column($int_key_cnt, $shift_row_arr);
    ($add_mod64_arr) = add_modulo_2pow64($int_key_cnt, $add_inttmv_arr, $mix_col_arr);
 
    return ($add_mod64_arr);
  }
}

sub kalyna_encrypt_block{
  my ($the_nor, $kalyna_in, $the_key, $tvla_g1) = @_;

  my $kalyna_out = "";
  my $tvla_g1_sat = 0;

  my ($key_cnt, $key_arr) = data2hex($the_key);
  my ($kalyna_in_cnt, $kalyna_in_arr) = data2hex($kalyna_in);
  if ($the_verb){print_array_nos("key_arr", $key_cnt, $key_arr);}
  if ($the_verb){print_array_nos("kalyna_in_arr", $kalyna_in_cnt, $kalyna_in_arr);}

  #Generate Intermediate Key
  my ($int_key_cnt, $int_key_arr) = generate_inter_key($key_cnt, $key_arr);
  if ($the_verb){print_array_nos("int_key_arr", $int_key_cnt, $int_key_arr);}

  if ($the_verb){print "[INFO] round: 0 \n";}
  #Generate Round Key 0
  my $rnd_key_arr;
  ($rnd_key_arr) = generate_round_key($key_cnt, $key_arr, $int_key_cnt, $int_key_arr, $rnd_key_arr, 0);
  if ($the_verb){print_array_nos("rnd_key_arr", $int_key_cnt, $rnd_key_arr);}
  my ($round_in_arr) = add_modulo_2pow64($int_key_cnt, $rnd_key_arr, $kalyna_in_arr);

  #KALYNA ROUNDS
  my $mix_col_arr;
  my $byte_sub_arr;
  my $shift_row_arr;
  my $add_mod64_arr;
  my $tvla_g1_sub = 0;
  my $tvla_g1_mix = 0;
  my $tvla_g1_xor = 0;
  for (my $i=1; $i<$the_nor; $i++){
    if ($the_verb){print "[INFO] round: $i \n";}
    #Generate Round Key
    ($rnd_key_arr) = generate_round_key($key_cnt, $key_arr, $int_key_cnt, $int_key_arr, $rnd_key_arr, $i);
    if ($the_verb){print_array_nos("rnd_key_arr", $int_key_cnt, $rnd_key_arr);}
    #Round Operations
    ($byte_sub_arr) = byte_substitute($int_key_cnt, $round_in_arr);
    ($shift_row_arr) = shift_row($int_key_cnt, $byte_sub_arr);
    ($mix_col_arr) = mix_column($int_key_cnt, $shift_row_arr);
    ($round_in_arr) = add_modulo_2($int_key_cnt, $rnd_key_arr, $mix_col_arr);
    #Conditions for generating group 1 in TVLA
    if ($tvla_g1_sat == 0 and $tvla_g1){
      $tvla_g1_sub = ($i== 4) ? onebyte_zero_sat($int_key_cnt, $round_in_arr) : 0;
      $tvla_g1_mix = ($i== 4) ? onebyte_zero_sat($int_key_cnt, $mix_col_arr) : 0;
      $tvla_g1_xor = ($i== 4) ? onebyte_zero_sat($int_key_cnt, $round_in_arr) : 0;
      if ($tvla_g1_sub and $tvla_g1_mix and $tvla_g1_xor){
        $tvla_g1_sat = 1;
      }
    }
  }
  #LAST ROUND
  if ($the_verb){print "[INFO] round: $the_nor \n";}
  #Generate Round Key
  ($rnd_key_arr) = generate_round_key($key_cnt, $key_arr, $int_key_cnt, $int_key_arr, $rnd_key_arr, $the_nor);
  if ($the_verb){print_array_nos("rnd_key_arr", $int_key_cnt, $rnd_key_arr);}
  #Round Operations
  ($byte_sub_arr) = byte_substitute($int_key_cnt, $round_in_arr);
  ($shift_row_arr) = shift_row($int_key_cnt, $byte_sub_arr);
  ($mix_col_arr) = mix_column($int_key_cnt, $shift_row_arr);
  ($add_mod64_arr) = add_modulo_2pow64($int_key_cnt, $rnd_key_arr, $mix_col_arr);

  for (my $i=0; $i<$int_key_cnt; $i++){
    $kalyna_out .= $add_mod64_arr->[$i];
  }

  return ($kalyna_out, $tvla_g1_sat);
}

sub main_part{
  my ($msg_file, $the_msg, $the_key, $tvla_g1) = @_;

  my $initial_time = time();

  #Number of rounds
  my $the_nor = 0;
  if ($key_len == $blk_size){
    $the_nor = ($blk_size == 128) ? 10 : ($blk_size == 256) ? 14 : 18;
  }
  elsif ($key_len == 2*$blk_size){
    $the_nor = ($blk_size == 128) ? 14 : 18;
  }

  #Generate the message in chunks of block size in an array
  my $msg_arr;
  my $msg_cnt = 0;
  if ($msg_file ne ""){
    ($msg_cnt, $msg_arr) = read_file($msg_file);
  }
  elsif ($the_msg ne ""){
    ($msg_cnt, $msg_arr) = read_message($the_msg);
  }
  if ($the_verb){print_array_nos("msg_arr", $msg_cnt, $msg_arr);}
  
  #Encrypt/Decrypt
  my $kalyna_out = "";
  my $tvla_g1_sat = 0; 
  my $kalyna_enc_out = "";
  for (my $i=0; $i<$msg_cnt; $i++){
    if ($the_proc == 0){
      ($kalyna_enc_out, $tvla_g1_sat) = kalyna_encrypt_block($the_nor, $msg_arr->[$i], $the_key, $tvla_g1);
      $kalyna_out .= $kalyna_enc_out;
    }
    elsif ($the_proc == 1){
      $kalyna_out .= kalyna_decrypt_block($the_nor, $msg_arr->[$i], $the_key);
    }
  }

  #Write File
  if ($out_file ne ""){
    write_file($kalyna_out);
  }
  else{
    if ($the_verb){printf "[INFO] Output of KALYNA: %s \n", $kalyna_out;}
  }
  if ($the_verb){printf "[INFO] CPU: %.2f \n", (time() - $initial_time);}

  return ($kalyna_out, $tvla_g1_sat);
}

sub generate_tb_ios{
  my ($the_dut, $test_cnt) = @_;

  my $k_file = $the_dut . "_tb_key.txt";
  my $m_file = $the_dut . "_tb_plain.txt";
  my $c_file = $the_dut . "_tb_cipher.txt";

  open (my $k_fid, '>', $k_file);
  open (my $m_fid, '>', $m_file);
  open (my $c_fid, '>', $c_file);

  my $test_cph = "";
  my $test_msg = "";
  my $test_key = "";
  for (my $i=0; $i<$test_cnt; $i++){
    $test_msg = "";
    for (my $j=0; $j<$blk_size/4; $j++){
      $test_msg .= word2hex(int(rand(16)));
    }
    printf $m_fid "%s \n", $test_msg;

    $test_key = "";
    for (my $j=0; $j<$key_len/4; $j++){
      $test_key .= word2hex(int(rand(16)));
    }
    printf $k_fid "%s \n", $test_key;

    ($test_cph) = main_part("", $test_msg, $test_key, 0);
    printf $c_fid "%s \n", $test_cph;
  }

  close ($k_fid);
  close ($m_fid);
  close ($c_fid);

  return ($k_file, $m_file, $c_file);
}

sub generate_tvla_ios{
  my ($the_dut, $test_cnt, $tv_cnt) = @_;

  my $test_msg = "";
  my $test_key = "";
  my $test_cph = "";
  my $tvla_g1_sat = 0;

  #Generate the Group 0 test vectors
  my $kg0_file = $the_dut . "_g0_key.txt";
  my $mg0_file = $the_dut . "_g0_plain.txt";
  my $cg0_file = $the_dut . "_g0_cipher.txt";
  open (my $kg0_fid, '>', $kg0_file);
  open (my $mg0_fid, '>', $mg0_file);
  open (my $cg0_fid, '>', $cg0_file);
  #Starts with zero plaintext with a fixed key 
  if ($g0_tech == 0){
    #Generate the initial plaintext set to all 0
    $test_msg = "";
    for (my $j=0; $j<$blk_size/4; $j++){
      $test_msg .= "0";
    }
    #Generate the fixed secret key 
    $test_key = "";
    for (my $j=0; $j<$key_len/4; $j++){
      $test_key .= word2hex(int(rand(16)));
    }
    #Find the cipher texts
    for (my $i=0; $i<$test_cnt; $i++){
      ($test_cph, $tvla_g1_sat) = main_part("", $test_msg, $test_key, 0);
      printf $mg0_fid "%s \n", $test_msg;
      printf $kg0_fid "%s \n", $test_key;
      printf $cg0_fid "%s \n", $test_cph;
      $test_msg = $test_cph;
    }
  }
  #Random plaintext and key 
  elsif ($g0_tech == 1){
    $test_key = "";
    $test_msg = "";
    #Find the cipher texts
    for (my $i=0; $i<$test_cnt; $i++){
      $test_key = "";
      for (my $j=0; $j<$key_len/4; $j++){
        $test_key .= word2hex(int(rand(16)));
      }
      $test_msg = "";
      for (my $j=0; $j<$blk_size/4; $j++){
        $test_msg .= word2hex(int(rand(16)));
      }
      ($test_cph, $tvla_g1_sat) = main_part("", $test_msg, $test_key, 0);
      printf $mg0_fid "%s \n", $test_msg;
      printf $kg0_fid "%s \n", $test_key;
      printf $cg0_fid "%s \n", $test_cph;
    }
  }
  close ($kg0_fid);
  close ($mg0_fid);
  close ($cg0_fid);

  #Generate the Group 1 test vector
  my $try_cnt = 0;
  my $kg1_file = $the_dut . "_g1_key.txt";
  my $mg1_file = $the_dut . "_g1_plain.txt";
  my $cg1_file = $the_dut . "_g1_cipher.txt";
  open (my $kg1_fid, '>', $kg1_file);
  open (my $mg1_fid, '>', $mg1_file);
  open (my $cg1_fid, '>', $cg1_file);
  #1/10/100 specific plaintext with a fixed key
  if ($g1_tech == 0 or $g1_tech == 1 or $g1_tech == 2){
    #Generate the fixed secret key 
    if ($g0_tech == 1){
      $test_key = "";
      for (my $j=0; $j<$key_len/4; $j++){
        $test_key .= word2hex(int(rand(16)));
      }
    }
    $try_cnt = 0;
    while ($tv_cnt){
      #Generate a random plain text
      $test_msg = "";
      for (my $j=0; $j<$blk_size/4; $j++){
        $test_msg .= word2hex(int(rand(16)));
      }
      #Encrypt the plain text
      my ($test_cph, $tvla_g1_sat) = main_part("", $test_msg, $test_key, 1);
      $try_cnt++;
      if ($tvla_g1_sat){
        print "[INFO] Found when try_cnt is $try_cnt \n";
        printf $mg1_fid "%s \n", $test_msg;
        printf $kg1_fid "%s \n", $test_key;
        printf $cg1_fid "%s \n", $test_cph;
        $tv_cnt--;
      }
    }
  }
  #1/10/100 specific plaintext with a random key
  elsif ($g1_tech == 3 or $g1_tech == 4 or $g1_tech == 5){
    $try_cnt = 0;
    while ($tv_cnt){
      #Generate a random key
      $test_key = "";
      for (my $j=0; $j<$key_len/4; $j++){
        $test_key .= word2hex(int(rand(16)));
      }
      #Generate a random plain text
      $test_msg = "";
      for (my $j=0; $j<$blk_size/4; $j++){
        $test_msg .= word2hex(int(rand(16)));
      }
      #Encrypt the plain text
      my ($test_cph, $tvla_g1_sat) = main_part("", $test_msg, $test_key, 1);
      $try_cnt++;
      if ($tvla_g1_sat){
        print "[INFO] Found when try_cnt is $try_cnt \n";
        printf $mg1_fid "%s \n", $test_msg;
        printf $kg1_fid "%s \n", $test_key;
        printf $cg1_fid "%s \n", $test_cph;
        $tv_cnt--;
      }
    }
  }
  close ($kg1_fid);
  close ($mg1_fid);
  close ($cg1_fid);

  return ($kg0_file, $mg0_file, $cg0_file, $kg1_file, $mg1_file, $cg1_file);
}

sub generate_block_parallel_tb{
  my ($tb_fid, $tb_name, $m_file, $k_file, $c_file, $the_sf) = @_;

  my $in_file = ($tb_mode eq "dec") ? $c_file : $m_file;
  my $out_file = ($tb_mode eq "dec") ? $m_file : $c_file;
  
  my $gl_str = "";
  my $dut_str = "";
  if ($is_gl){
    $gl_str = "`timescale 1ns/1ps \n";
    $gl_str .= "`include \"/export/designkits/tsmc/tsmc65/ip/msrflp/STDCELL/tcbn65lp_220a/FE/TSMCHOME/digital/Front_End/verilog/tcbn65lp_200a/tcbn65lp.v\"";
    $dut_str = $dut_name . "_BLOCK_SIZE" . $blk_size .  "_KEY_LENGTH" . $key_len . " " . $dut_name . "_BLOCK_SIZE" . $blk_size . "_KEY_LENGTH" . $key_len . " " . " (.block_in(block_in), .key_in(key_in), .block_out(block_out)); ";
  }
  else{
    $dut_str = $dut_name . " #(.BLOCK_SIZE(BLOCK_SIZE), .KEY_LENGTH(KEY_LENGTH)) " . $dut_name . " (.block_in(block_in), .key_in(key_in), .block_out(block_out)); ";
  }
  my $sf_str = "";
  if ($the_sf){
    $sf_str .= "\$dumpfile(\"" . $tb_name . ".vcd\"); \n";
    $sf_str .= "  \$dumpvars(); \n";
  }

  my $not_m1 = $num_test-1;
  my $the_message = <<END_OF_MESSAGE;  
$gl_str

module $tb_name ();

parameter BLOCK_SIZE = $blk_size;
parameter KEY_LENGTH = $key_len;

reg [BLOCK_SIZE-1:0] block_in;
reg [KEY_LENGTH-1:0] key_in;
wire [BLOCK_SIZE-1:0] block_out;

integer test_index; 
reg [BLOCK_SIZE-1:0] test_in_reg [0:$not_m1]; 
reg [KEY_LENGTH-1:0] test_key_reg [0:$not_m1]; 
reg [BLOCK_SIZE-1:0] test_out_reg [0:$not_m1]; 

$dut_str

initial begin
  $sf_str
  \$readmemh("$in_file", test_in_reg); 
  \$readmemh("$k_file", test_key_reg); 
  \$readmemh("$out_file", test_out_reg); 

  #100;
  
  // Run the simulation over the test inputs and outputs
  for (test_index=0; test_index<$num_test; test_index=test_index+1) begin 
    block_in = test_in_reg[test_index][BLOCK_SIZE-1:0]; 
    key_in = test_key_reg[test_index][KEY_LENGTH-1:0]; 
    #1;
    if (test_out_reg[test_index] !== block_out) begin 
      \$display("[ERROR] KALYNA output has been computed WRONG on the %d test pattern!", test_index); 
      #10; 
      \$finish; 
    end
    #10;
  end 

  \$display("[INFO] KALYNA block has just been verified!"); 
  \$stop; 
end

endmodule
  
END_OF_MESSAGE
  printf $tb_fid "%s \n", $the_message;
}

sub generate_tvla_tb{
  my ($tb_fid, $tb_name, $m_file, $k_file, $c_file, $test_cnt, $test_index) = @_;

  my $in_file = ($tb_mode eq "dec") ? $c_file : $m_file;
  my $out_file = ($tb_mode eq "dec") ? $m_file : $c_file;

  my $rst_act_str = ($the_rst eq "low") ? "1'b0" : "1'b1";
  my $rst_inact_str = ($the_rst eq "low") ? "1'b1" : "1'b0";

  my $gl_str = "`timescale 1ns/1ps \n";
  $gl_str .= "`include \"/export/designkits/tsmc/tsmc65/ip/msrflp/STDCELL/tcbn65lp_220a/FE/TSMCHOME/digital/Front_End/verilog/tcbn65lp_200a/tcbn65lp.v\"";
  my $dut_str = "";
  if ($tb_mode eq "encdec"){
    $dut_str = $dut_name . "_BLOCK_SIZE" . $blk_size .  "_KEY_LENGTH" . $key_len . " " . $dut_name . "_BLOCK_SIZE" . $blk_size . "_KEY_LENGTH" . $key_len . " " . " (.clk(clk), .rst(rst), .start(start), .mode(mode), .block_in(block_in), .key_in(key_in), .block_out(block_out), .block_rdy(block_rdy)); ";
  }
  else{
    $dut_str = $dut_name . "_BLOCK_SIZE" . $blk_size .  "_KEY_LENGTH" . $key_len . " " . $dut_name . "_BLOCK_SIZE" . $blk_size . "_KEY_LENGTH" . $key_len . " " . " (.clk(clk), .rst(rst), .start(start), .block_in(block_in), .key_in(key_in), .block_out(block_out), .block_rdy(block_rdy)); ";
  }
  my $clk_per_str = int($clk_per/2);

  my $vcd_file = $tb_name . ".vcd";
  my $vcd_str .= "\$dumpfile(\"$vcd_file\"); \n";
  $vcd_str .= "  \$dumpvars(0, " . $dut_name . "_BLOCK_SIZE" . $blk_size . "_KEY_LENGTH" . $key_len . "); \n";
  $vcd_str .= "  \$dumpall; \n";

  my $not_m1 = $test_cnt-1;

  my $the_message = "";
  if ($tb_mode eq "encdec"){
    $the_message = <<END_OF_MESSAGE;  
$gl_str

module $tb_name ();

parameter BLOCK_SIZE = $blk_size;
parameter KEY_LENGTH = $key_len;

reg clk, rst, start, mode;
reg [BLOCK_SIZE-1:0] block_in;
reg [KEY_LENGTH-1:0] key_in;
wire [BLOCK_SIZE-1:0] block_out;
wire block_rdy;

integer test_index; 
reg [BLOCK_SIZE-1:0] test_in_reg [0:$not_m1]; 
reg [KEY_LENGTH-1:0] test_key_reg [0:$not_m1]; 
reg [BLOCK_SIZE-1:0] test_out_reg [0:$not_m1]; 

$dut_str

always begin
  #$clk_per_str clk = !clk;
end

initial begin
  $vcd_str
  \$readmemh("$in_file", test_in_reg); 
  \$readmemh("$k_file", test_key_reg); 
  \$readmemh("$out_file", test_out_reg); 

  clk = 1'b0;
  rst = $rst_act_str;
  mode = 1'b0;
  start = 1'b0;
  block_in = test_in_reg[$test_index][BLOCK_SIZE-1:0]; 
  key_in = test_key_reg[$test_index][KEY_LENGTH-1:0]; 
  @(posedge clk);
  
  rst = $rst_inact_str;
  start = 1'b1;
  @(posedge block_rdy);
  @(posedge clk);
  
  rst = $rst_act_str;
  mode = 1'b1;
  start = 1'b0;
  block_in = test_out_reg[$test_index][BLOCK_SIZE-1:0]; 
  key_in = test_key_reg[$test_index][KEY_LENGTH-1:0]; 
  @(posedge clk);
  
  rst = $rst_inact_str;
  start = 1'b1;
  @(posedge block_rdy);
  @(posedge clk);

  \$stop; 
end

endmodule
  
END_OF_MESSAGE
  }
  else{
    $the_message = <<END_OF_MESSAGE;  
$gl_str

module $tb_name ();

parameter BLOCK_SIZE = $blk_size;
parameter KEY_LENGTH = $key_len;

reg clk, rst, start;
reg [BLOCK_SIZE-1:0] block_in;
reg [KEY_LENGTH-1:0] key_in;
wire [BLOCK_SIZE-1:0] block_out;
wire block_rdy;

integer test_index; 
reg [BLOCK_SIZE-1:0] test_in_reg [0:$not_m1]; 
reg [KEY_LENGTH-1:0] test_key_reg [0:$not_m1]; 
reg [BLOCK_SIZE-1:0] test_out_reg [0:$not_m1]; 

$dut_str

always begin
  #$clk_per_str clk = !clk;
end

initial begin
  $vcd_str
  \$readmemh("$in_file", test_in_reg); 
  \$readmemh("$k_file", test_key_reg); 
  \$readmemh("$out_file", test_out_reg); 

  clk = 1'b0;
  rst = $rst_act_str;
  start = 1'b0;
  block_in = test_in_reg[$test_index][BLOCK_SIZE-1:0]; 
  key_in = test_key_reg[$test_index][KEY_LENGTH-1:0]; 
  @(posedge clk);
  rst = $rst_inact_str;
  start = 1'b1;
  wait (block_rdy);
  @(posedge clk);
  \$stop; 
end

endmodule
  
END_OF_MESSAGE
  }
  printf $tb_fid "%s \n", $the_message;
}

sub generate_block_serial_tb{
  my ($tb_fid, $tb_name, $m_file, $k_file, $c_file, $test_cnt, $test_index) = @_;

  my $in_file = ($tb_mode eq "dec") ? $c_file : $m_file;
  my $out_file = ($tb_mode eq "dec") ? $m_file : $c_file;

  my $rst_act_str = ($the_rst eq "low") ? "1'b0" : "1'b1";
  my $rst_inact_str = ($the_rst eq "low") ? "1'b1" : "1'b0";

  my $gl_str = "";
  my $dut_str = "";
  if ($is_gl or $the_tvla){
    $gl_str = "`timescale 1ns/1ps \n";
    $gl_str .= "`include \"/export/designkits/tsmc/tsmc65/ip/msrflp/STDCELL/tcbn65lp_220a/FE/TSMCHOME/digital/Front_End/verilog/tcbn65lp_200a/tcbn65lp.v\"";
    if ($tb_mode eq "encdec"){
      $dut_str = $dut_name . "_BLOCK_SIZE" . $blk_size .  "_KEY_LENGTH" . $key_len . " " . $dut_name . "_BLOCK_SIZE" . $blk_size . "_KEY_LENGTH" . $key_len . " " . " (.clk(clk), .rst(rst), .start(start), .mode(mode), .block_in(block_in), .key_in(key_in), .block_out(block_out), .block_rdy(block_rdy)); ";
    }
    else{
      $dut_str = $dut_name . "_BLOCK_SIZE" . $blk_size .  "_KEY_LENGTH" . $key_len . " " . $dut_name . "_BLOCK_SIZE" . $blk_size . "_KEY_LENGTH" . $key_len . " " . " (.clk(clk), .rst(rst), .start(start), .block_in(block_in), .key_in(key_in), .block_out(block_out), .block_rdy(block_rdy)); ";
    }
  }
  else{
    if ($tb_mode eq "encdec"){
      $dut_str = $dut_name . " #(.BLOCK_SIZE(BLOCK_SIZE), .KEY_LENGTH(KEY_LENGTH)) " . $dut_name . " (.clk(clk), .rst(rst), .start(start), .mode(mode), .block_in(block_in), .key_in(key_in), .block_out(block_out), .block_rdy(block_rdy)); ";
    }
    else{
      $dut_str = $dut_name . " #(.BLOCK_SIZE(BLOCK_SIZE), .KEY_LENGTH(KEY_LENGTH)) " . $dut_name . " (.clk(clk), .rst(rst), .start(start), .block_in(block_in), .key_in(key_in), .block_out(block_out), .block_rdy(block_rdy)); ";
    }
  }
  my $clk_per_str = int($clk_per/2);

  my $vcd_str = "";
  my $vcd_file = $tb_name . ".vcd";
  if ($the_tvla){
    $vcd_str .= "\$dumpfile(\"$vcd_file\"); \n";
    $vcd_str .= "  \$dumpvars(0, " . $dut_name . "_BLOCK_SIZE" . $blk_size . "_KEY_LENGTH" . $key_len . "); \n";
    $vcd_str .= "  \$dumpall; \n";
  }

  my $the_message = "";
  my $init_test_index = 0;
  my $last_test_index = 0;
  my $not_m1 = $test_cnt-1;

  if ($tb_mode eq "encdec"){
    $init_test_index = $test_index;
    $last_test_index = ($the_tvla) ? ($test_index+1) : int($test_cnt/2);
    my $next_init_test_index = int($test_cnt/2);
    my $next_last_test_index = ($the_tvla) ? ($test_index+1) : $test_cnt;

    $the_message = <<END_OF_MESSAGE;  
$gl_str

module $tb_name ();

parameter BLOCK_SIZE = $blk_size;
parameter KEY_LENGTH = $key_len;

reg clk, rst, start, mode;
reg [BLOCK_SIZE-1:0] block_in;
reg [KEY_LENGTH-1:0] key_in;
wire [BLOCK_SIZE-1:0] block_out;
wire block_rdy;

integer test_index; 
reg [BLOCK_SIZE-1:0] test_in_reg [0:$not_m1]; 
reg [KEY_LENGTH-1:0] test_key_reg [0:$not_m1]; 
reg [BLOCK_SIZE-1:0] test_out_reg [0:$not_m1]; 

$dut_str

always begin
  #$clk_per_str clk = !clk;
end

initial begin
  $vcd_str
  \$readmemh("$in_file", test_in_reg); 
  \$readmemh("$k_file", test_key_reg); 
  \$readmemh("$out_file", test_out_reg); 

  clk = 1'b0;
  rst = $rst_act_str;
  #100;
  rst = $rst_inact_str;
  start = 1'b0;
  mode = 1'b0;
  #100;
  
  // Run the simulation over the test inputs and outputs for encryption
  for (test_index=$init_test_index; test_index<$last_test_index; test_index=test_index+1) begin 
    block_in = test_in_reg[test_index][BLOCK_SIZE-1:0]; 
    key_in = test_key_reg[test_index][KEY_LENGTH-1:0]; 
    start = 1'b1;

    wait (block_rdy);

    if (test_out_reg[test_index] !== block_out) begin 
      \$display("[ERROR] KALYNA output has been computed WRONG on the %d test pattern!", test_index); 
      #10; 
      \$finish; 
    end

    start = 1'b0;
    #100;
  end

  mode = 1'b1;
  #100;

  // Run the simulation over the test inputs and outputs for decryption
  for (test_index=$next_init_test_index; test_index<$next_last_test_index; test_index=test_index+1) begin 
    block_in = test_out_reg[test_index][BLOCK_SIZE-1:0]; 
    key_in = test_key_reg[test_index][KEY_LENGTH-1:0]; 
    start = 1'b1;

    wait (block_rdy);

    if (test_in_reg[test_index] !== block_out) begin 
      \$display("[ERROR] KALYNA output has been computed WRONG on the %d test pattern!", test_index); 
      #10; 
      \$finish; 
    end

    start = 1'b0;
    #100;
  end

  \$display("[INFO] KALYNA block has just been verified!"); 
  \$stop; 
end

endmodule
  
END_OF_MESSAGE
  }
  else{
    $init_test_index = $test_index;
    $last_test_index = ($the_tvla) ? ($test_index+1) : $test_cnt;
    $the_message = <<END_OF_MESSAGE;  
$gl_str

module $tb_name ();

parameter BLOCK_SIZE = $blk_size;
parameter KEY_LENGTH = $key_len;

reg clk, rst, start;
reg [BLOCK_SIZE-1:0] block_in;
reg [KEY_LENGTH-1:0] key_in;
wire [BLOCK_SIZE-1:0] block_out;
wire block_rdy;

integer test_index; 
reg [BLOCK_SIZE-1:0] test_in_reg [0:$not_m1]; 
reg [KEY_LENGTH-1:0] test_key_reg [0:$not_m1]; 
reg [BLOCK_SIZE-1:0] test_out_reg [0:$not_m1]; 

$dut_str

always begin
  #$clk_per_str clk = !clk;
end

initial begin
  $vcd_str
  \$readmemh("$in_file", test_in_reg); 
  \$readmemh("$k_file", test_key_reg); 
  \$readmemh("$out_file", test_out_reg); 

  clk = 1'b0;
  rst = $rst_act_str;
  #100;
  rst = $rst_inact_str;
  start = 1'b0;
  #100;
  
  // Run the simulation over the test inputs and outputs
  for (test_index=$init_test_index; test_index<$last_test_index; test_index=test_index+1) begin 
    block_in = test_in_reg[test_index][BLOCK_SIZE-1:0]; 
    key_in = test_key_reg[test_index][KEY_LENGTH-1:0]; 
    start = 1'b1;

    wait (block_rdy);

    if (test_out_reg[test_index] !== block_out) begin 
      \$display("[ERROR] KALYNA output has been computed WRONG on the %d test pattern!", test_index); 
      #10; 
      \$finish; 
    end

    start = 1'b0;
    #100;
  end 

  \$display("[INFO] KALYNA block has just been verified!"); 
  \$stop; 
end

endmodule
  
END_OF_MESSAGE

  }
  printf $tb_fid "%s \n", $the_message;
}

sub generate_rtl_synth_tcl{
  my ($blk_size, $key_len) = @_;

  my $the_message = "";

  my $clk_str = "";
  if ($is_par == 0){
    $clk_str = "clk";
  }
  my $clk_per_str = $clk_per*1000;
  my $sdc_str = ($the_tvla) ? "-exclude current_design" : "";

  my $rtl_tcl_file = $dut_name . "_synth_rtl_genus.tcl";
  my $mapped_file = $dut_name . "_mapped_tsmc_genus.v";

  open (my $fid_tcl, '>', $rtl_tcl_file);

  $the_message = <<END_OF_MESSAGE;
### Initial Settings ###

set TOP_DESIGN $dut_name
set VERILOG_FILES {kalyna_misc.sv}

#Set information level high
set_db information_level 11

# Setting analytical optimization to extreme
# From the datapath manual: Set the attribute value before elaboration to achieve better results
set_db dp_analytical_opt extreme
# Set datapath optimization focus on area
set_db dp_area_mode true

### Using the libraries ###

# To set the library search path and library file
set_db init_lib_search_path /export/designkits/tsmc/tsmc65/ip/msrflp/STDCELL/tcbn65lp_220a/FE/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65lp_220a
set_db library tcbn65lptc.lib 

### Loading Files ###

read_hdl -language sv \$VERILOG_FILES

### Elaborating the Design ###

elaborate \$TOP_DESIGN -parameters {$blk_size $key_len}
check_design -all

### Applying Constraints ###

set_time_unit -picoseconds
create_clock -domain clk_domain -name "clk_name" -period $clk_per_str $clk_str
set_input_delay -clock clk_name 20 [all_inputs]
set_output_delay -clock clk_name 20 [all_outputs]
set_clock_uncertainty 14 clk_name
set_clock_latency 100 clk_name

### Defining Optimization Settings ###

# Ungroup all the instances manually
ungroup -all -flatten

# Set the power analysis effort high
set_db lp_power_analysis_effort high 

# To automatically enable partitioning
set_db auto_partition true

# For control logic optimization
set_db control_logic_optimization advanced

# To keep the feedback loops in front of flip-flops
set_db hdl_ff_keep_feedback true

# Boundary optimizations
set_db delete_unloaded_seqs true 
set_db boundary_optimize_invert_hpins true
set_db boundary_optimize_constant_hpins true
set_db boundary_optimize_feedthrough_hpins true 
set_db boundary_optimize_equal_opposite_hpins true 

# DP (datapath) commands
set_db dp_csa basic
# Setting dp_rewriting to advanced increases the area
set_db dp_rewriting basic
set_db dp_sharing advanced 
set_db dp_speculation none

# Use multibits in the library
set_db use_multibit_cells true
set_db use_multibit_combo_cells true
set_db use_multibit_seq_and_tristate_cells true
# Merge commands on multibits, merge commands generally works with instances
set_db multibit_adaptive_costing true
set_db force_merge_combos_into_multibit_cells true
set_db force_merge_seqs_into_multibit_cells true
#set_db merge_combinational_hier_instance true

# Parallelization of the area optimization to reduce the run-time

set_db distributed_area_opt_cleanup true

#puts "The value for db_rewriting is [get_db dp_rewriting]"

### Reducing Runtime Using SuperThreading ###

set_db auto_super_thread true

### Performing Synthesis ###

# syn_generic (for generic synthesis)
set_db syn_generic_effort high
syn_generic

# syn_map (for technology mapping)
set_db syn_map_effort high
syn_map

# syn_opt (for place and route) - can lead to unreasonable results for the delay of large constant multiplications
set_db syn_opt_effort high
syn_opt

### Write the Netlist in Verilog ###
write_hdl > \${TOP_DESIGN}_mapped_tsmc_genus.v;

### Write SPEF SDC and SDF files
write_sdf -setuphold split -recrem split -nonegchecks -edges check_edge > \${TOP_DESIGN}.sdf
write_sdc $sdc_str > \${TOP_DESIGN}.sdc
write_spef > \${TOP_DESIGN}.spef

### Generating Reports ###
report_area > \${TOP_DESIGN}_rtl_area_genus.report
report_timing > \${TOP_DESIGN}_rtl_time_genus.report
report_gates > \${TOP_DESIGN}_rtl_gates_genus.report
report_power > \${TOP_DESIGN}_rtl_power_genus.report

puts "The RUNTIME is [get_db real_runtime]"
puts "The MEMORY USAGE is [get_db memory_usage]"
END_OF_MESSAGE

  printf $fid_tcl "%s", $the_message;
  close ($fid_tcl);

  return ($rtl_tcl_file);
}

sub generate_gl_synth_tcl{
  my ($blk_size, $key_len, $the_sf) = @_;

  my $the_message = "";

  my $clk_str = "";
  if ($is_par == 0){
    $clk_str = "clk";
  }
  my $clk_per_str = $clk_per*1000;

  my $sdf_str = "";
  my $sdc_str = "";
  if ($is_sdc){
    $sdc_str = "read_sdc " . $dut_name . ".sdc";
    $sdf_str = "read_sdf " . $dut_name . ".sdf";
  }
  else{
    $sdc_str = "set_time_unit -picoseconds\n";
    $sdc_str .= "create_clock -domain clk_domain -name \"clk_name\" -period " . $clk_per_str . " ". $clk_str . "\n";
    $sdc_str .= "set_input_delay -clock clk_name 20 [all_inputs]\n";
    $sdc_str .= "set_output_delay -clock clk_name 20 [all_outputs]\n";
    $sdc_str .= "set_clock_uncertainty 14 clk_name\n";
    $sdc_str .= "set_clock_latency 100 clk_name";
  }
  my $saif_str = "";
  if ($the_sf == 0){
    $saif_str .= "# Read the SAIF file \n";
    $saif_str .= "read_saif " . $dut_name . ".saif";
  }
  my $top_design = $dut_name . "_BLOCK_SIZE" . $blk_size . "_KEY_LENGTH" . $key_len;
  my $gl_tcl_file = $dut_name . "_synth_gl_genus.tcl";
  my $mapped_file = $dut_name . "_mapped_tsmc_genus.v";

  open (my $fid_tcl, '>', $gl_tcl_file);

  $the_message = <<END_OF_MESSAGE;
### Initial Settings ###

set TOP_DESIGN $top_design
set VERILOG_FILES {$mapped_file}

#Set information level high
set_db information_level 11

### Using the libraries ###

# To set the library search path and library file
set_db init_lib_search_path /export/designkits/tsmc/tsmc65/ip/msrflp/STDCELL/tcbn65lp_220a/FE/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65lp_220a
set_db library tcbn65lptc.lib 

### Loading Files ###

read_hdl -language v2001 \$VERILOG_FILES

### Elaborating the Design ###

elaborate \$TOP_DESIGN
check_design -unresolved

### Applying Constraints ###
$sdc_str
$sdf_str
# Set the power analysis effort high
set_db lp_power_analysis_effort high 

$saif_str

### Generating Reports ###
report_area > \${TOP_DESIGN}_area_gl_genus.report
report_timing > \${TOP_DESIGN}_time_gl_genus.report
report_gates > \${TOP_DESIGN}_gates_gl_genus.report
report_power > \${TOP_DESIGN}_power_gl_genus.report

puts "The RUNTIME is [get_db real_runtime]"
puts "The MEMORY USAGE is [get_db memory_usage]"
END_OF_MESSAGE

  printf $fid_tcl "%s", $the_message;
  close ($fid_tcl);

  return ($gl_tcl_file);
}

sub generate_sim_tcl{
  my ($file_name, $tb_name, $module_name, $the_sf) = @_;

  my $the_message = "";
  my $sf_file = ($the_sf) ? $file_name. "_tb.vcd" : $file_name . ".saif";
  my $sim_tcl_file = $file_name . "_sim.tcl";
  open (my $fid_tcl, '>', $sim_tcl_file);

  #CAD_VER=19
  if ($cad_ver == 19){
    if ($the_sf == 0){
      $the_message = <<END_OF_MESSAGE;
dumpsaif -scope $module_name -overwrite -output $sf_file 
run
dumpsaif -end 
exit
END_OF_MESSAGE
    }
    else {
      $the_message = <<END_OF_MESSAGE;
run
exit
END_OF_MESSAGE
    }
  }
  #CAD_VER=23
  else{
    if ($the_sf == 0){
      $the_message = <<END_OF_MESSAGE;
dumpsaif -scope $tb_name:$module_name -overwrite -output $sf_file 
run
dumpsaif -end 
exit
END_OF_MESSAGE
    }
    else{
      $the_message = <<END_OF_MESSAGE;
run
exit
END_OF_MESSAGE
    }
  }

  printf $fid_tcl "%s", $the_message;
  close ($fid_tcl);

  return ($sf_file, $sim_tcl_file);
}

sub generate_sim_run{
  my ($blk_size, $key_len, $sim_run_name, $tb_name, $tb_file, $rtl_tcl_file, $gl_tcl_file, $the_sf) = @_;

  my $the_message = "";
  my $module_name = $dut_name . "_BLOCK_SIZE" . $blk_size . "_KEY_LENGTH" . $key_len;
  my $mapped_file = $dut_name . "_mapped_tsmc_genus.v";
  my ($sf_file, $sim_tcl_file) = generate_sim_tcl($sim_run_name, $tb_name, $module_name, $the_sf);

  my $file_run = $sim_run_name . "_run.sh";
  open (my $fid_run, '>', $file_run);

  #CAD_VER=19
  if ($cad_ver == 19){
    $the_message = <<END_OF_MESSAGE;
#!/bin/bash 
genus -batch -files $rtl_tcl_file
sed -i '1 i `timescale 1ns/1ps' $mapped_file
ncvlog -logfile ncvlog.log -errormax 15 -update -linedebug -status $mapped_file $tb_file
ncelab -logfile ncelab.log -errormax 15 -access +wc -status worklib.$tb_name
ncsim  -logfile ncsim.log  -errormax 15 -status worklib.$tb_name:module -input $sim_tcl_file
genus -batch -files $gl_tcl_file
END_OF_MESSAGE
  }
  #CAD_VER=23
  else{
    $the_message = <<END_OF_MESSAGE;
#!/bin/bash 
genus -batch -files $rtl_tcl_file
sed -i '1 i `timescale 1ns/1ps' $mapped_file
xmverilog +access+r $tb_file $mapped_file +tcl+$sim_tcl_file
genus -batch -files $gl_tcl_file
END_OF_MESSAGE
  }

  printf $fid_run "%s", $the_message;
  close ($fid_run);
}

sub generate_tvla_synth_run{
  my ($blk_size, $key_len, $rtl_tcl_file) = @_;

  my $module_name = $dut_name . "_BLOCK_SIZE" . $blk_size . "_KEY_LENGTH" . $key_len;
  my $mapped_file = $dut_name . "_mapped_tsmc_genus.v";

  my $file_run = $dut_name . "_synth_run.sh";
  open (my $fid_run, '>', $file_run);

  my $the_message = <<END_OF_MESSAGE;
#!/bin/bash 
genus -batch -files $rtl_tcl_file
sed -i '1 i `timescale 1ns/1ps' $mapped_file
END_OF_MESSAGE

  printf $fid_run "%s", $the_message;
  close ($fid_run);

  return ($file_run);
}

sub generate_tvla_sim_run{
  my ($blk_size, $key_len, $tv_name, $tb_name, $tb_file) = @_;

  my $the_message = "";
  my $module_name = $dut_name . "_BLOCK_SIZE" . $blk_size . "_KEY_LENGTH" . $key_len;
  my $mapped_file = $dut_name . "_mapped_tsmc_genus.v";
  my ($sf_file, $sim_tcl_file) = generate_sim_tcl($tv_name, $tb_name, $module_name, 1);

  my $file_run = $tv_name . "_sim_run.sh";
  open (my $fid_run, '>', $file_run);

  #CAD_VER=19
  if ($cad_ver == 19){
    $the_message = <<END_OF_MESSAGE;
#!/bin/bash 
ncvlog -logfile ncvlog.log -errormax 15 -update -linedebug -status $mapped_file $tb_file
ncelab -logfile ncelab.log -errormax 15 -access +wc -status worklib.$tb_name
ncsim  -logfile ncsim.log  -errormax 15 -status worklib.$tb_name:module -input $sim_tcl_file
END_OF_MESSAGE
  }
  #CAD_VER=23
  else{
    $the_message = <<END_OF_MESSAGE;
#!/bin/bash 
xmverilog +access+r $tb_file $mapped_file +tcl+$sim_tcl_file
END_OF_MESSAGE
  }

  printf $fid_run "%s", $the_message;
  close ($fid_run);

  return ($sf_file, $file_run);
}

sub generate_tvla_ptpx_run{
  my ($blk_size, $key_len, $vcd_file, $tv_name) = @_;

  my $module_name = $dut_name . "_BLOCK_SIZE" . $blk_size . "_KEY_LENGTH" . $key_len;
  my $mapped_file = $dut_name . "_mapped_tsmc_genus.v";
  my $ptpx_file_name = $tv_name . "_ptpx";
  my $strip_path = $tv_name . "_tb/" . $module_name;

  my $file_tcl = $ptpx_file_name . ".tcl";
  open (my $fid_tcl, '>', $file_tcl);

  my $the_message = <<END_OF_MESSAGE;
set power_enable_analysis TRUE

if {\$power_enable_timing_analysis == false} {set_app_var power_enable_timing_analysis true} 

set power_analysis_mode time_based

#####################################################################
#       link design
#####################################################################
set search_path         "/export/designkits/tsmc/tsmc65/ip/msrflp/STDCELL/tcbn65lp_220a/FE/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65lp_220a . "
set link_library	"tcbn65lptc.db"

read_verilog		$mapped_file
current_design		$module_name
link

#####################################################################
#       set transition time / annotate parasitics
#####################################################################
read_sdc -version 2.0 $dut_name.sdc
read_parasitics $dut_name.spef

#####################################################################
#       check/update/report timing 
#####################################################################
check_timing
update_timing
report_timing

#####################################################################
#       read switching activity file
#####################################################################
read_vcd "$vcd_file" -strip_path "$strip_path"

#####################################################################
#       check/update/report power 
#####################################################################
check_power
#set_power_analysis_options -waveform_format fsdb -waveform_output $tv_name -waveform_interval 0.5
set_power_analysis_options -waveform_format out -waveform_output $tv_name 
update_power
report_power
quit

END_OF_MESSAGE

  printf $fid_tcl "%s", $the_message;
  close ($fid_tcl);

  #Generate the PTPX bash file
  my $file_run = $ptpx_file_name . "_run.sh";
  open (my $fid_run, '>', $file_run);
  $the_message = <<END_OF_MESSAGE;
#!/bin/bash 
pt_shell -file $file_tcl
END_OF_MESSAGE

  printf $fid_run "%s", $the_message;
  close ($fid_run);

  return ($file_run);
}

sub tb_part{
  my $tb_name = $dut_name . "_tb";
  my $tb_file = $tb_name . ".v";
  open (my $tb_fid, '>', $tb_file);

  #Generate the testbench inputs and outputs
  my ($k_file, $m_file, $c_file) = generate_tb_ios($dut_name, $num_test);
  
  #Generate the static part of the test-bench
  if ($is_par){
    generate_block_parallel_tb($tb_fid, $tb_name, $m_file, $k_file, $c_file, $saif_vcd);
  }
  else{
    generate_block_serial_tb($tb_fid, $tb_name, $m_file, $k_file, $c_file, $num_test, 0);
  }
  close ($tb_fid);

  if ($is_gl){
    my ($rtl_tcl_file) = generate_rtl_synth_tcl ($blk_size, $key_len);
    my ($gl_tcl_file) = generate_gl_synth_tcl ($blk_size, $key_len, $saif_vcd);
    generate_sim_run($blk_size, $key_len, $dut_name, $tb_name, $tb_file, $rtl_tcl_file, $gl_tcl_file, $saif_vcd);
  }
}

sub generate_innovus_load_tcl{
  my $mmmc_file = $dut_name . "_innovus_mmmc.tcl";
  my $mapped_file = $dut_name . "_mapped_tsmc_genus.v";

  my $the_file = $dut_name . "_innovus_load.tcl";
  open (my $the_fid, '>', $the_file);
  my $the_message = <<END_OF_MESSAGE;  
setMultiCpuUsage -localCpu 8
# tell innovus to use at most 8 CPUs

setDesignMode -process 65
# tells innovus that our chip is in a 65nm technology

set init_verilog {$mapped_file}
# tells innovus where our initial netlist is, i.e., the netlist coming from Genus

set init_design_netlisttype {Verilog}
# tells innovus the file format for the netlist is Verilog

set init_mmmc_file {$mmmc_file}
# tells innovus where the MMMC file is located

set init_pwr_net {VDD}
# tells innovus what is the name of the power net

set init_gnd_net {VSS}
# tells innovus what is the name of the ground net

init_design
# instructs innovus to read all the files set above

END_OF_MESSAGE
  printf $the_fid "%s", $the_message;

  return ($the_file);
}

sub generate_innovus_mmmc_tcl{
  my $sdc_file = $dut_name . ".sdc";
  my $the_file = $dut_name . "_innovus_mmmc.tcl";
  open (my $the_fid, '>', $the_file);
  my $the_message = <<END_OF_MESSAGE;  
# LEF File
set init_lef_file {/export/designkits/tsmc/tsmc65/ip/msrflp/STDCELL/tcbn65lp_220a/BE/TSMCHOME/digital/Back_End/lef/tcbn65lp_200a/lef/tcbn65lp_9lmT2.lef}

# Design Libraries
create_library_set -name bc -timing {/export/designkits/tsmc/tsmc65/ip/msrflp/STDCELL/tcbn65lp_220a/FE/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65lp_220a/tcbn65lpbc.lib}
create_library_set -name wc -timing {/export/designkits/tsmc/tsmc65/ip/msrflp/STDCELL/tcbn65lp_220a/FE/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65lp_220a/tcbn65lpwc.lib}
create_library_set -name nc -timing {/export/designkits/tsmc/tsmc65/ip/msrflp/STDCELL/tcbn65lp_220a/FE/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65lp_220a/tcbn65lptc.lib}

# Timing Constraints
create_constraint_mode -name sdc -sdc_files {$sdc_file}

# RC Corners
set all_rc_corners "cbest cworst rcbest rcworst typical"
set all_temps      "0 25 125"
foreach rc_corner \$all_rc_corners {
    foreach temp \$all_temps {
	create_rc_corner -name \${rc_corner}_\${temp} -qx_tech_file /export/designkits/tsmc/tsmc65/pdk/RC/Cadence/\${rc_corner}/qrcTechFile -T \$temp
    }    
}

# Delay Corners
set all_lib "bc wc nc"
foreach lib_set \$all_lib {
    foreach rc_corner \$all_rc_corners {
	foreach temp \$all_temps {
	    create_delay_corner -name \${lib_set}_\${rc_corner}_\${temp} -library_set \$lib_set -rc_corner \${rc_corner}_\${temp}
	}
    }
}

# Analysis Views
foreach lib_set \$all_lib {
    foreach rc_corner \$all_rc_corners {
	foreach temp \$all_temps {
	    create_analysis_view -name \${lib_set}_\${rc_corner}_\${temp} -delay_corner \${lib_set}_\${rc_corner}_\${temp} -constraint_mode sdc
	}
    }
}

set_analysis_view -setup { wc_rcworst_0 wc_rcworst_125 wc_cworst_0 wc_cworst_125 } -hold  { bc_rcbest_0 bc_rcbest_125 bc_cbest_0 bc_cbest_125 } -leakage wc_rcworst_125 -dynamic wc_rcworst_125
#set_analysis_view -setup { wc_rcworst_0 wc_rcworst_125 wc_cworst_0 wc_cworst_125 } -hold  { bc_rcbest_0 bc_rcbest_125 bc_cbest_0 bc_cbest_125 } -leakage wc_rcworst_0 -dynamic wc_rcworst_0
#setAnalysisMode -analysisType single

END_OF_MESSAGE
  printf $the_fid "%s", $the_message;

  return ($the_file);
}

sub generate_innovus_imp_tcl{
  my $the_file = $dut_name . "_innovus_imp.tcl";
  open (my $the_fid, '>', $the_file);
  my $the_message = <<END_OF_MESSAGE;  
deleteAllFPObjects
# resets the floorplan

setMultiCpuUsage -localCpu 8 -cpuPerRemoteHost 1 -remoteHost 0 -keepLicense true 

# Floorplan
floorPlan -site core -r 0.98487994333 0.699987 20.0 20.0 20.0 20.0 

# Power Rings
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape } 
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top M9 bottom M9 left M8 right M8} -width {top 6.5 bottom 6.5 left 6.5 right 6.5} -spacing {top 2 bottom 2 left 2 right 2} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None 

# Pins locations
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -spreadDirection clockwise -edge 0 -layer 3 -spreadType side -pin {{block_out[0]} {block_out[1]} {block_out[2]} {block_out[3]} {block_out[4]} {block_out[5]} {block_out[6]} {block_out[7]} {block_out[8]} {block_out[9]} {block_out[10]} {block_out[11]} {block_out[12]} {block_out[13]} {block_out[14]} {block_out[15]} {block_out[16]} {block_out[17]} {block_out[18]} {block_out[19]} {block_out[20]} {block_out[21]} {block_out[22]} {block_out[23]} {block_out[24]} {block_out[25]} {block_out[26]} {block_out[27]} {block_out[28]} {block_out[29]} {block_out[30]} {block_out[31]} {block_out[32]} {block_out[33]} {block_out[34]} {block_out[35]} {block_out[36]} {block_out[37]} {block_out[38]} {block_out[39]} {block_out[40]} {block_out[41]} {block_out[42]} {block_out[43]} {block_out[44]} {block_out[45]} {block_out[46]} {block_out[47]} {block_out[48]} {block_out[49]} {block_out[50]} {block_out[51]} {block_out[52]} {block_out[53]} {block_out[54]} {block_out[55]} {block_out[56]} {block_out[57]} {block_out[58]} {block_out[59]} {block_out[60]} {block_out[61]} {block_out[62]} {block_out[63]} {block_out[64]} {block_out[65]} {block_out[66]} {block_out[67]} {block_out[68]} {block_out[69]} {block_out[70]} {block_out[71]} {block_out[72]} {block_out[73]} {block_out[74]} {block_out[75]} {block_out[76]} {block_out[77]} {block_out[78]} {block_out[79]} {block_out[80]} {block_out[81]} {block_out[82]} {block_out[83]} {block_out[84]} {block_out[85]} {block_out[86]} {block_out[87]} {block_out[88]} {block_out[89]} {block_out[90]} {block_out[91]} {block_out[92]} {block_out[93]} {block_out[94]} {block_out[95]} {block_out[96]} {block_out[97]} {block_out[98]} {block_out[99]} {block_out[100]} {block_out[101]} {block_out[102]} {block_out[103]} {block_out[104]} {block_out[105]} {block_out[106]} {block_out[107]} {block_out[108]} {block_out[109]} {block_out[110]} {block_out[111]} {block_out[112]} {block_out[113]} {block_out[114]} {block_out[115]} {block_out[116]} {block_out[117]} {block_out[118]} {block_out[119]} {block_out[120]} {block_out[121]} {block_out[122]} {block_out[123]} {block_out[124]} {block_out[125]} {block_out[126]} {block_out[127]} block_rdy}
editPin -fixOverlap 1 -spreadDirection clockwise -edge 2 -layer 3 -spreadType side -pin {{block_in[0]} {block_in[1]} {block_in[2]} {block_in[3]} {block_in[4]} {block_in[5]} {block_in[6]} {block_in[7]} {block_in[8]} {block_in[9]} {block_in[10]} {block_in[11]} {block_in[12]} {block_in[13]} {block_in[14]} {block_in[15]} {block_in[16]} {block_in[17]} {block_in[18]} {block_in[19]} {block_in[20]} {block_in[21]} {block_in[22]} {block_in[23]} {block_in[24]} {block_in[25]} {block_in[26]} {block_in[27]} {block_in[28]} {block_in[29]} {block_in[30]} {block_in[31]} {block_in[32]} {block_in[33]} {block_in[34]} {block_in[35]} {block_in[36]} {block_in[37]} {block_in[38]} {block_in[39]} {block_in[40]} {block_in[41]} {block_in[42]} {block_in[43]} {block_in[44]} {block_in[45]} {block_in[46]} {block_in[47]} {block_in[48]} {block_in[49]} {block_in[50]} {block_in[51]} {block_in[52]} {block_in[53]} {block_in[54]} {block_in[55]} {block_in[56]} {block_in[57]} {block_in[58]} {block_in[59]} {block_in[60]} {block_in[61]} {block_in[62]} {block_in[63]} {block_in[64]} {block_in[65]} {block_in[66]} {block_in[67]} {block_in[68]} {block_in[69]} {block_in[70]} {block_in[71]} {block_in[72]} {block_in[73]} {block_in[74]} {block_in[75]} {block_in[76]} {block_in[77]} {block_in[78]} {block_in[79]} {block_in[80]} {block_in[81]} {block_in[82]} {block_in[83]} {block_in[84]} {block_in[85]} {block_in[86]} {block_in[87]} {block_in[88]} {block_in[89]} {block_in[90]} {block_in[91]} {block_in[92]} {block_in[93]} {block_in[94]} {block_in[95]} {block_in[96]} {block_in[97]} {block_in[98]} {block_in[99]} {block_in[100]} {block_in[101]} {block_in[102]} {block_in[103]} {block_in[104]} {block_in[105]} {block_in[106]} {block_in[107]} {block_in[108]} {block_in[109]} {block_in[110]} {block_in[111]} {block_in[112]} {block_in[113]} {block_in[114]} {block_in[115]} {block_in[116]} {block_in[117]} {block_in[118]} {block_in[119]} {block_in[120]} {block_in[121]} {block_in[122]} {block_in[123]} {block_in[124]} {block_in[125]} {block_in[126]} {block_in[127]} clk {key_in[0]} {key_in[1]} {key_in[2]} {key_in[3]} {key_in[4]} {key_in[5]} {key_in[6]} {key_in[7]} {key_in[8]} {key_in[9]} {key_in[10]} {key_in[11]} {key_in[12]} {key_in[13]} {key_in[14]} {key_in[15]} {key_in[16]} {key_in[17]} {key_in[18]} {key_in[19]} {key_in[20]} {key_in[21]} {key_in[22]} {key_in[23]} {key_in[24]} {key_in[25]} {key_in[26]} {key_in[27]} {key_in[28]} {key_in[29]} {key_in[30]} {key_in[31]} {key_in[32]} {key_in[33]} {key_in[34]} {key_in[35]} {key_in[36]} {key_in[37]} {key_in[38]} {key_in[39]} {key_in[40]} {key_in[41]} {key_in[42]} {key_in[43]} {key_in[44]} {key_in[45]} {key_in[46]} {key_in[47]} {key_in[48]} {key_in[49]} {key_in[50]} {key_in[51]} {key_in[52]} {key_in[53]} {key_in[54]} {key_in[55]} {key_in[56]} {key_in[57]} {key_in[58]} {key_in[59]} {key_in[60]} {key_in[61]} {key_in[62]} {key_in[63]} {key_in[64]} {key_in[65]} {key_in[66]} {key_in[67]} {key_in[68]} {key_in[69]} {key_in[70]} {key_in[71]} {key_in[72]} {key_in[73]} {key_in[74]} {key_in[75]} {key_in[76]} {key_in[77]} {key_in[78]} {key_in[79]} {key_in[80]} {key_in[81]} {key_in[82]} {key_in[83]} {key_in[84]} {key_in[85]} {key_in[86]} {key_in[87]} {key_in[88]} {key_in[89]} {key_in[90]} {key_in[91]} {key_in[92]} {key_in[93]} {key_in[94]} {key_in[95]} {key_in[96]} {key_in[97]} {key_in[98]} {key_in[99]} {key_in[100]} {key_in[101]} {key_in[102]} {key_in[103]} {key_in[104]} {key_in[105]} {key_in[106]} {key_in[107]} {key_in[108]} {key_in[109]} {key_in[110]} {key_in[111]} {key_in[112]} {key_in[113]} {key_in[114]} {key_in[115]} {key_in[116]} {key_in[117]} {key_in[118]} {key_in[119]} {key_in[120]} {key_in[121]} {key_in[122]} {key_in[123]} {key_in[124]} {key_in[125]} {key_in[126]} {key_in[127]} rst start}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
legalizePin

# tell innovus that all cells that have a pin named VDD should be connect to a global net also called VDD. Same for VSS.
globalNetConnect VDD -type pgpin -pin VDD -instanceBasename * -override
globalNetConnect VSS -type pgpin -pin VSS -instanceBasename * -override

# places the logical cells
place_opt_design

# creates a clock tree
ccopt_design

# routes the design
routeDesign

END_OF_MESSAGE
  printf $the_fid "%s", $the_message;

  return ($the_file);
}

sub generate_innovus_pow_tcl{
  my ($g0_test_cnt, $g1_test_cnt, $innovus_load_file, $innovus_imp_file) = @_;

  my $run_file = $dut_name . "_innovus_run.sh";
  open (my $run_fid, '>', $run_file);

  my $tb_top = "";
  my $out_file = "";
  my $vcd_file = "";

  #Clock frequency in MHz and clock period in ns
  my $clk_freq = int (1000/$clk_per);
  my $the_dut = $dut_name . "_BLOCK_SIZE" . $blk_size . "_KEY_LENGTH" . $key_len;

  my $the_file = $dut_name . "_innovus_pow.tcl";
  open (my $the_fid, '>', $the_file);
  my $the_message = <<END_OF_MESSAGE;  
set_power_analysis_mode -reset
set_analysis_view -setup { wc_rcworst_0 wc_rcworst_125 wc_cworst_0 wc_cworst_125 } -hold  { bc_rcbest_0 bc_rcbest_125 bc_cbest_0 bc_cbest_125 } -leakage wc_rcworst_125 -dynamic wc_rcworst_125
set_power_analysis_mode -disable_static false -write_static_currents true
set_power_analysis_mode -method dynamic_vectorbased
set_power_analysis_mode -create_gui_db true
set_power_analysis_mode -default_frequency $clk_freq
# most of these are just configuring the power engine to do dynamic power reporting
# the last one sets the frequency to match clock frequency
END_OF_MESSAGE
  printf $the_fid "%s", $the_message;
  #Group 0 
  for (my $i=0; $i<$g0_test_cnt; $i++){
    $tb_top = $dut_name . "_g0_" . $i . "_tb";
    $out_file = $dut_name . "_g0_" . $i . ".out";
    $vcd_file = $dut_name . "_g0_" . $i . "_tb.vcd";
    printf $the_fid "# Test Vector %d \n", $i;
    printf $the_fid "read_activity_file -reset \n";
    printf $the_fid "read_activity_file -format VCD -scope %s.%s %s \n", $tb_top, $the_dut, $vcd_file;
    printf $the_fid "report_vector_profile -step $the_step -outfile %s -propagate -nworst $sim_time \n", $out_file;
    printf $the_fid "\n";
  }
  #Group 1 
  for (my $i=0; $i<$g1_test_cnt; $i++){
    $tb_top = $dut_name . "_g1_" . $i . "_tb";
    $out_file = $dut_name . "_g1_" . $i . ".out";
    $vcd_file = $dut_name . "_g1_" . $i . "_tb.vcd";
    printf $the_fid "# Test Vector %d \n", $i;
    printf $the_fid "read_activity_file -reset \n";
    printf $the_fid "read_activity_file -format VCD -scope %s.%s %s \n", $tb_top, $the_dut, $vcd_file;
    printf $the_fid "report_vector_profile -step $the_step -outfile %s -propagate -nworst $sim_time \n", $out_file;
    printf $the_fid "\n";
    
  }
  printf $the_fid "exit \n";
  close ($the_fid);

  $the_message = <<END_OF_MESSAGE;
#!/bin/bash 
source $innovus_load_file
source $innovus_imp_file
source $the_file

END_OF_MESSAGE
  printf $run_fid "%s", $the_message;
  close ($run_fid);

  return ($run_file);
}

sub tvla_part{
  my $init_time = time();

  my $the_cmd = "";
  my $tv_name = "";
  my $tb_name = "";
  my $tb_file = "";
  my $vcd_file = "";
  my $the_cwd = cwd;
  my $sim_run_file = "";
  my $ptpx_run_file = "";
  my $innovus_imp_file = "";
  my $innovus_run_file = "";
  my $innovus_load_file = "";
  my $innovus_mmmc_file = "";
  
  #Run Synthesis
  if ($no_synth == 0){
    #Generate the RTL and gate-level synthesis scripts
    my ($rtl_tcl_file) = generate_rtl_synth_tcl ($blk_size, $key_len);
    my ($synth_run_file) = generate_tvla_synth_run($blk_size, $key_len, $rtl_tcl_file);
    #Run Genus
    $the_cmd = "bash " . $synth_run_file;
    system ($the_cmd);
  }

  #Generate the test vectors for leakage assessment on a non-specific scenario
  my $tv_num = ($g1_tech == 0 or $g1_tech == 3) ? 1 : ($g1_tech == 1 or $g1_tech == 4) ? 10 : 100;
  my ($kg0_file, $mg0_file, $cg0_file, $kg1_file, $mg1_file, $cg1_file) = generate_tvla_ios($dut_name, $num_test, $tv_num);

  #Generate the group 0 test-vectors for simulation and power analysis
  for (my $i=0; $i<$num_test; $i++){
    $tv_name = $dut_name . "_g0_" . $i;
    $tb_name = $tv_name . "_tb";
    $tb_file = $tb_name . ".v";
    open (my $tb_fid, '>', $tb_file);
    generate_tvla_tb($tb_fid, $tb_name, $mg0_file, $kg0_file, $cg0_file, $num_test, $i);
    close ($tb_fid);

    #Run Xcelium
    ($vcd_file, $sim_run_file) = generate_tvla_sim_run($blk_size, $key_len, $tv_name, $tb_name, $tb_file);
    $the_cmd = "bash " . $sim_run_file;
    system ($the_cmd);

    #Run PTPX
    if ($pow_tool eq "primetime"){
      ($ptpx_run_file) = generate_tvla_ptpx_run($blk_size, $key_len, $vcd_file, $tv_name);
      $the_cmd = "bash " . $ptpx_run_file;
      system ($the_cmd);
    }
  }
 
  #Generate the group 1 test-vectors for simulation and power analysis
  for (my $i=0; $i<$tv_num; $i++){
    $tv_name = $dut_name . "_g1_" . $i;
    $tb_name = $tv_name . "_tb";
    $tb_file = $tb_name . ".v";
    open (my $tb_fid, '>', $tb_file);
    generate_tvla_tb($tb_fid, $tb_name, $mg1_file, $kg1_file, $cg1_file, $tv_num, $i);
    close ($tb_fid);

    #Run Xcelium
    ($vcd_file, $sim_run_file) = generate_tvla_sim_run($blk_size, $key_len, $tv_name, $tb_name, $tb_file);
    $the_cmd = "bash " . $sim_run_file;
    system ($the_cmd);

    #Run PTPX
    if ($pow_tool eq "primetime"){
      ($ptpx_run_file) = generate_tvla_ptpx_run($blk_size, $key_len, $vcd_file, $tv_name);
      $the_cmd = "bash " . $ptpx_run_file;
      system ($the_cmd);
    }
  }

  #Run Innovus 
  if ($pow_tool eq "innovus"){
    ($innovus_load_file) = generate_innovus_load_tcl();
    ($innovus_mmmc_file) = generate_innovus_mmmc_tcl();
    ($innovus_imp_file) = generate_innovus_imp_tcl();
    ($innovus_run_file) = generate_innovus_pow_tcl($num_test, $tv_num, $innovus_load_file, $innovus_imp_file);
    $the_cmd = "innovus -batch -files " . $innovus_run_file;
    system ($the_cmd);
  }

  #Compute T-test
  $the_cmd = "perl compute_power_ttest.pl -pd=" . $the_cwd . " -pt=" . $pow_tool;
  if ($pow_tool eq "innovus"){
    $the_cmd .= " -step=" . $the_step . " -st=" . $sim_time;
  }
  system($the_cmd);

  if ($is_rem){
    $the_cmd = "rm *.tcl; rm *.out; rm *_tb.v; rm *.sh; rm *.report; rm *.log; rm *.history; rm -r fv; rm -r xcelium.d; rm genus*; rm *.vcd; " ;
    system ($the_cmd);
  }

  printf "[INFO] Total CPU time: %.2f \n", time()-$init_time;
}

