# set sdc_version 2.0
set_units -capacitance pF -time ns

# 1GHz fast clock
# set FAST_CLOCK_PERIOD 1

if {$TOP_MODULE == "aes"} {
    set FAST_CLOCK_PERIOD 1.25;  # 800 MHz
} elseif {$TOP_MODULE == "sha256"} {
    set FAST_CLOCK_PERIOD 2;  # 500 MHz
} elseif {$TOP_MODULE == "kupyna_hs"} {
    set FAST_CLOCK_PERIOD 2.5;  # 400 MHz
} elseif {$TOP_MODULE == "kupyna_lp"} {
    # set FAST_CLOCK_PERIOD 2.5;  # 400 MHz
    set FAST_CLOCK_PERIOD 2.75;
} elseif {$TOP_MODULE == "kalyna_hs"} {
    set FAST_CLOCK_PERIOD 3.25;  # 308 MHz, to match kalyna_secure1
} elseif {$TOP_MODULE == "kalyna_hs_enc"} {
    set FAST_CLOCK_PERIOD 1.5;  # 666 MHz
} elseif {$TOP_MODULE == "kalyna_lp"} {
    set FAST_CLOCK_PERIOD 3.25;  # 308 MHz, to match kalyna_secure1
} elseif {$TOP_MODULE == "kalyna_secure1"} {
    set FAST_CLOCK_PERIOD 3.25;  # 308 MHz
} elseif {$TOP_MODULE == "kalyna_secure2"} {
    set FAST_CLOCK_PERIOD 3.25;  # 308 MHz
} elseif {$TOP_MODULE == "kalyna_kupyna"} {
    set FAST_CLOCK_PERIOD 2.5;  # 400 MHz
} else {
    puts "Unknown top module <${TOP_MODULE}>"
    exit 1
}

create_clock -period ${FAST_CLOCK_PERIOD} -name fast_clock [get_ports clk];

set_input_delay -clock fast_clock [expr ${FAST_CLOCK_PERIOD} * 0.10] [remove_from_collection [all_inputs] [get_ports {clk}]]
set_output_delay -clock fast_clock [expr ${FAST_CLOCK_PERIOD} * 0.10] [all_outputs]

# 4x D pin __REDACTED__ cell (D FF with async clear)
# TODO: Maybe the input of an isolation cell would be better?
set_load [expr 4*__REDACTED__] [all_outputs]

set_driving_cell -lib_cell __REDACTED__ -pin Q [remove_from_collection [all_inputs] [get_ports {clk}]]
set_driving_cell -lib_cell __REDACTED__ [get_ports {clk}]
