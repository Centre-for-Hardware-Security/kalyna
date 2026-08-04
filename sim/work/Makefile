ifndef UA_CRYPTO_ROOT
$(error UA_CRYPTO_ROOT is not set. Please set the UA_CRYPTO_ROOT environment variable before running make.)
endif

TECHCELLS=

RTL_FILELISTS=-F ${UA_CRYPTO_ROOT}/src/common/common.flist \
              -F ${UA_CRYPTO_ROOT}/src/top/top.flist \
              -F ${UA_CRYPTO_ROOT}/src/crypto_wrappers/crypto_wrappers.flist \
			  -F ${UA_CRYPTO_ROOT}/src/aes/aes.flist \
			  -F ${UA_CRYPTO_ROOT}/src/sha256/sha256.flist \
              -F ${UA_CRYPTO_ROOT}/src/kalyna/kalyna.flist \
              -F ${UA_CRYPTO_ROOT}/src/kupyna/kupyna.flist \
              -F ${UA_CRYPTO_ROOT}/src/kalyna_kupyna/kalyna_kupyna.flist
GLS_FILELISTS=-F ${UA_CRYPTO_ROOT}/src/top/gls.flist
TESTBENCH_FILELISTS=-F ${UA_CRYPTO_ROOT}/src/testbench/testbench.flist

RTL_INCDIRS=+INCDIR+${UA_CRYPTO_ROOT}/src/common \
			+INCDIR+${UA_CRYPTO_ROOT}/src/crypto_wrappers \
			+INCDIR+${UA_CRYPTO_ROOT}/src/kalyna/TAPEOUT \
			+INCDIR+${UA_CRYPTO_ROOT}/src/kupyna/TAPEOUT \
			+INCDIR+${UA_CRYPTO_ROOT}/src/kalyna_kupyna/TAPEOUT \
			+INCDIR+${UA_CRYPTO_ROOT}/src/top
GLS_INCDIRS=
TESTBENCH_INCDIRS=+INCDIR+${UA_CRYPTO_ROOT}/src/testbench \
				  +INCDIR+${UA_CRYPTO_ROOT}/src/testbench/tests

# SystemVerilog plusargs
TEST?=register_access_test

PLUSARGS:=+TEST=${TEST}

# Additional plusargs for debugging
ifdef VERBOSE
	PLUSARGS+=+VERBOSE
endif
ifdef DUMP_VCD
	PLUSARGS+=+DUMP_VCD
endif

LOGFILE=ua_crypto_${TEST}_xrun.log

# NOTE: We are using -ALLOWREDEFINITION because some components in the standard cell libraries are defined once per library
xrun_rtl:
	@if xrun -sv -timescale 1ns/1ps ${RTL_FILELISTS} ${TESTBENCH_FILELISTS} ${RTL_INCDIRS} ${TESTBENCH_INCDIRS} ${PLUSARGS} -top tb_ua_crypto -access rc -ALLOWREDEFINITION +DEFINE+SIMULATION -input ${UA_CRYPTO_ROOT}/sim/scripts/xmsim_probe.tcl -l ${LOGFILE}; then \
		echo "==================== SIMULATION PASSED ====================";\
		echo "Simulation completed successfully!";\
	else \
		echo "==================== SIMULATION FAILED ====================";\
		echo "Simulation failed with exit code $$?";\
	fi
	@echo "==================== LOG ANALYSIS ===================="
	@echo "Checking for WARNINGS in ${LOGFILE}:"
	@grep -inH "warning" ${LOGFILE} || echo "No warnings found"
	@echo ""
	@echo "Checking for ERRORS in ${LOGFILE}:"
	@grep -inH "error" ${LOGFILE} || echo "No errors found"
	@echo ""
	@echo "Checking for FAILURES in ${LOGFILE}:"
	@grep -inH "fail" ${LOGFILE} || echo "No failures found"
	@echo "======================================================="

# NOTE: We are using -ALLOWREDEFINITION because some components in the standard cell libraries are defined once per library
xrun_gls:
	xrun -sv -timescale 1ns/1ps -vtimescale 1ns/1ps -sdf_cmd_file ../scripts/tc_typical_25_sdc_fast.sdf.cmd ${TECHCELLS} ${GLS_FILELISTS} ${TESTBENCH_FILELISTS} ${GLS_INCDIRS} ${TESTBENCH_INCDIRS} ${PLUSARGS} \
	     -top tb_ua_crypto -access r -ntc_level 2 -ALLOWREDEFINITION +DEFINE+SIMULATION +DEFINE+RECREM +DEFINE+NTC -neg_tchk -sdf_simtime -anno_simtime -input ${UA_CRYPTO_ROOT}/sim/scripts/xmsim_probe.tcl \
		 -sdf_verbose -sdfstats sdfstats.txt -dumptiming dumptiming.log -nowarn NTCDMIN

clean:
	@echo "Cleaning simulation output files..."
	rm -rf xrun.* *.log *.history  *.err *.key tb_ua_crypto.vcd waves.shm xcelium.d .bpad .simvision

help:
	@echo "Usage:"
	@echo "  make xrun_rtl                                  # Run RTL simulation (default test is <register_access_test>)"
	@echo "  make clean                                     # Remove generated files"
	@echo "  make help                                      # Show this help message"
	@echo ""
	@echo "Test Selection:"
	@echo "  make xrun_rtl TEST=register_access_test        # Test serial register read/write operations"
	@echo "  make xrun_rtl TEST=fi_register_access_test     # Test FI serial register operations"
	@echo "  make xrun_rtl TEST=kalyna_KAT_test             # Test Kalyna encryption/decryption with performance benchmarking"
	@echo "  make xrun_rtl TEST=AES_KAT_test                # Test AES encryption with performance benchmarking"
	@echo "  make xrun_rtl TEST=SHA256_KAT_test             # Test SHA-256 hashing with performance benchmarking"
	@echo "  make xrun_rtl TEST=kupyna_KAT_test             # Test Kupyna hashing with performance benchmarking"
	@echo ""
	@echo "Testing Options:"
	@echo "  make xrun_rtl TEST=kalyna_KAT_test VERBOSE=1   # Run with verbose output"
	@echo "  make xrun_rtl TEST=kalyna_KAT_test DUMP_VCD=1  # Generate VCD waveform file (in addition to the SHM database)"

# .PHONY: clean help xrun_rtl xrun_gls
.PHONY: clean help xrun_rtl
