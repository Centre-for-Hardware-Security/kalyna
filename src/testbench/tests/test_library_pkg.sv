// Test Library Package - includes all test classes
package test_library_pkg;

    import ua_crypto_pkg::*;

    // Include base test class and all test implementations
    `include "tests/base_test.svh"

    `include "tests/register_access_test.svh"
    `include "tests/fi_register_access_test.svh"
    `include "tests/kalyna_KAT_test.svh"
    `include "tests/kupyna_KAT_test.svh"
    `include "tests/AES_KAT_test.svh"
    `include "tests/SHA256_KAT_test.svh"

    `include "tests/test_factory.svh"

endpackage
