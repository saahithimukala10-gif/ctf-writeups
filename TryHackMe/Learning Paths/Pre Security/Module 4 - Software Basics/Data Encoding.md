# Data Encoding

**Module:** Software Basics

## Key Points

- **Encoding** transforms data into another format for safe transport/storage — NOT encryption (no secrecy, fully reversible by anyone).
- Common schemes:
  - **Base64:** represents binary data as ASCII text; used in URLs, emails, tokens. Often ends with `=` padding.
  - **URL encoding (percent-encoding):** replaces unsafe URL characters (e.g. space → `%20`).
  - **Hex encoding:** bytes written as hexadecimal.
- Encoding ≠ encryption ≠ hashing:
  - Encoding = reversible, no key, for compatibility.
  - Encryption = reversible with a key, for confidentiality.
  - Hashing = one-way, for integrity/verification.

## Remember

Encoding (e.g. Base64) is reversible and offers NO security. Don't confuse it with encryption or hashing.
