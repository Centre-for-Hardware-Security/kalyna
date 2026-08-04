// UA Crypto Package - Common definitions and types

package ua_crypto_pkg;

    // Register width constants
    parameter int unsigned KEY_WIDTH = 128;
    parameter int unsigned PLAINTEXT_WIDTH = 128;
    parameter int unsigned MESSAGE_WIDTH = 512;
    parameter int unsigned CIPHERTEXT_WIDTH = 128;
    parameter int unsigned HASH_WIDTH = 256;
    parameter int unsigned CIPHER_HASH_MODE_WIDTH = 1;
    parameter int unsigned BLOCK_SEL_WIDTH = 4;
    parameter int unsigned CHICKEN_BITS_WIDTH = 2;
    parameter int unsigned HASH_MSG_CHUNK_WIDTH = 1;

    // Serial register address enumeration
    typedef enum logic[2:0] {
        REG_KEY              = 3'd0,  // Key register (128-bit)
        REG_PLAINTEXT        = 3'd1,  // Plaintext register (128-bit)
        REG_MESSAGE          = 3'd2,  // Message register (512-bit)
        REG_CIPHERTEXT       = 3'd3,  // Ciphertext register (128-bit)
        REG_HASH             = 3'd4,  // Hash register (256-bit)
        REG_CIPHER_HASH_MODE = 3'd5,  // Cipher/Hash mode register (1-bit)
        REG_BLOCK_SEL        = 3'd6,  // Block select register (4-bit)
        REG_HASH_MSG_CHUNK   = 3'd7   // Hash message chunk selector: first chunk vs final chunk (1-bit)
    } serial_reg_addr_e;

    // FI (Frequency Injection) serial register address enumeration
    typedef enum logic[1:0] {
        FI_REG_ENABLE_OSC    = 2'd0,  // Enable oscillators register (8-bit)
        FI_REG_TRIMMING      = 2'd1,  // Trimming register (8-bit)
        FI_REG_OSC_MUX_SEL   = 2'd2,  // MUX OSC1 sel + MUX OSC2 sel register (6-bit)
        FI_REG_TRNG_MUX_SEL  = 2'd3   // Enable MUX TRNG register (2-bit)
    } fi_serial_reg_addr_e;

    // Encryption/Decryption mode enumeration
    typedef enum logic {
        ENC_MODE = 1'b0,  // Encryption mode
        DEC_MODE = 1'b1   // Decryption mode
    } enc_dec_mode_e;

    // Cipher/Hash operation mode enumeration
    typedef enum logic {
        CIPHER_MODE = 1'b0,  // Cipher operation mode
        HASH_MODE   = 1'b1   // Hash operation mode
    } cipher_hash_mode_e;

    // Crypto block selection enumeration with explicit values
    typedef enum logic[3:0] {
        KALYNA_HS      = 4'd0,
        KALYNA_LP      = 4'd1,
        KALYNA_SECURE1 = 4'd2,
        KALYNA_SECURE2 = 4'd3,
        KUPYNA_HS      = 4'd4,
        KUPYNA_LP      = 4'd5,
        KALYNA_KUPYNA  = 4'd6,
        AES            = 4'd7,
        SHA256         = 4'd8,
        KALYNA_HS_ENC  = 4'd9
    } crypto_block_e;

    // Hash message chunk selector enumeration
    typedef enum logic [0:0] {
        HASH_FIRST_CHUNK = 1'b0,  // First chunk in hash function message
        HASH_FINAL_CHUNK = 1'b1   // Final chunk in hash function message
    } hash_msg_chunk_e;

endpackage
