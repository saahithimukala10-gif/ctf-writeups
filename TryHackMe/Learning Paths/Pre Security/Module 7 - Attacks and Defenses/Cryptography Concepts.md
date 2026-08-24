# Cryptography Concepts

**Module:** Attacks and Defenses

## Key Points

- **Encryption** is reversible — data is scrambled with a key and can be unscrambled with the right key, protecting confidentiality.
- **Symmetric encryption** uses the same key to encrypt and decrypt (e.g. AES) — fast, but both parties need to share that key securely first.
- **Asymmetric encryption** uses a key pair — a public key to encrypt, a private key to decrypt (e.g. RSA) — solves the key-sharing problem but is slower, so it's usually used just to exchange a symmetric session key.
- **Hashing** is one-way — it produces a fixed-length digest of data that can't be reversed back to the original (e.g. SHA-256). It's for verifying integrity (has the data changed?), not for hiding it.
- **Digital signatures** combine hashing and asymmetric encryption: hash the data, then encrypt the hash with your private key. Anyone with your public key can verify it came from you and wasn't altered.
- HTTPS uses both: asymmetric crypto for the initial handshake/key exchange, then fast symmetric encryption for the actual session traffic.

## Remember

Encryption = reversible (confidentiality). Hashing = one-way (integrity). Symmetric = same key, fast. Asymmetric = key pair, slower, solves key exchange. HTTPS: asymmetric to exchange a symmetric session key, then symmetric for speed.
