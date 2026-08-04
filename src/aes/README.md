AES implementation from https://github.com/secworks/aes/tree/on_the_fly_keygen

This implementation was chosen as to be comparable to our kalyna_enc_block_serial_oboc (Encryption-only):

- Encryption only
- 4 parallel SBOXes (column-by-column processing) implemented with a trivial LUT (no circuit minimization techniques)
- On-the-fly key expansion
- Key schedule SBOXes shared with main encryption datapath

This core supports both 128- and 256-bit keys, chosen by the "keylen" input
The wrapper in <src/crypto_wrappers/aes_top.sv> hardwires the upper 128 bits of the key and "keylen" to 0, matching the 128-bit key length we use in our Kalyna implementations
