ifndef UA_CRYPTO_ROOT
$(error UA_CRYPTO_ROOT is not set. Please set the UA_CRYPTO_ROOT environment variable before running make.)
endif

PDK_ROOT_DIR=__REDACTED__

# Synthesize crypto blocks and top-level controller
synth:
	UA_CRYPTO_SYNTH_BLOCK=aes genus -f ../scripts/genus/block_synth.tcl -log genus_aes.log -abort_on_error
	UA_CRYPTO_SYNTH_BLOCK=sha256 genus -f ../scripts/genus/block_synth.tcl -log genus_sha256.log -abort_on_error
	UA_CRYPTO_SYNTH_BLOCK=kupyna_hs genus -f ../scripts/genus/block_synth.tcl -log genus_kupyna_hs.log -abort_on_error
	UA_CRYPTO_SYNTH_BLOCK=kalyna_hs genus -f ../scripts/genus/block_synth.tcl -log genus_kalyna_hs.log -abort_on_error
	UA_CRYPTO_SYNTH_BLOCK=kalyna_hs_enc genus -f ../scripts/genus/block_synth.tcl -log genus_kalyna_hs_enc.log -abort_on_error
	UA_CRYPTO_SYNTH_BLOCK=kalyna_kupyna genus -f ../scripts/genus/block_synth.tcl -log genus_kalyna_kupyna.log -abort_on_error
	UA_CRYPTO_SYNTH_BLOCK=kalyna_lp genus -f ../scripts/genus/block_synth.tcl -log genus_kalyna_lp.log -abort_on_error
	UA_CRYPTO_SYNTH_BLOCK=kalyna_secure1 genus -f ../scripts/genus/block_synth.tcl -log genus_kalyna_secure1.log -abort_on_error
	UA_CRYPTO_SYNTH_BLOCK=kalyna_secure2 genus -f ../scripts/genus/block_synth.tcl -log genus_kalyna_secure2.log -abort_on_error
	UA_CRYPTO_SYNTH_BLOCK=kupyna_lp genus -f ../scripts/genus/block_synth.tcl -log genus_kupyna_lp.log -abort_on_error
	UA_CRYPTO_SYNTH_BLOCK=top_ctrl genus -f ../scripts/genus/block_synth.tcl -log genus_top_ctrl.log -abort_on_error

clean:
	rm -f innovus.*
	rm -f chip_top.*
	rm -f fe_init.*
	rm -f .addstripe*
	rm -f rc_model.bin
	rm -rf timingReports
	rm -rf .cadence
	rm -rf *.log*
	rm -rf *.cmd*
	rm -rf fv
