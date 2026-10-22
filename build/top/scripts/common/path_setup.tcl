if { [info exists ::env(UA_CRYPTO_ROOT) ] } {
	set UA_CRYPTO_ROOT $::env(UA_CRYPTO_ROOT)
} else {
    puts "Error: Environment variable UA_CRYPTO_ROOT not set"
    exit 1
}

set SRCS_DIR ${UA_CRYPTO_ROOT}/src
set SCRIPTS_DIR ${UA_CRYPTO_ROOT}/build/top/scripts
set DELIVERABLES_DIR ${UA_CRYPTO_ROOT}/build/top/deliverables
set REPORTS_DIR ${UA_CRYPTO_ROOT}/build/top/reports
set WORK_DIR ${UA_CRYPTO_ROOT}/build/top/work

set PDK_ROOT_DIR __REDACTED__
