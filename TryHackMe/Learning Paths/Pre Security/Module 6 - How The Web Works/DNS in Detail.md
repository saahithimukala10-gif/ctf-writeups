# DNS in Detail

**Module:** How The Web Works

## Key Points

- **DNS (Domain Name System)** translates human-friendly domain names (e.g. `example.com`) into IP addresses computers actually use.
- Resolution process (simplified): browser asks a **recursive resolver** (often the ISP's) → resolver queries a **root server** → root points to the right **TLD server** (e.g. `.com`) → TLD points to the domain's **authoritative name server** → that server returns the actual IP.
- Common DNS record types:
  - **A** — maps a domain to an IPv4 address.
  - **AAAA** — maps a domain to an IPv6 address.
  - **CNAME** — alias, points one domain name to another.
  - **MX** — mail exchange server for the domain.
  - **NS** — the authoritative name servers for the domain.
  - **TXT** — arbitrary text, often used for verification/SPF records.
- Results are **cached** (by browser, OS, resolver) for a period set by the record's **TTL (Time To Live)** to reduce repeated lookups.

## Remember

DNS = phonebook for the internet. Recursive resolver → root → TLD → authoritative server. A = IPv4, AAAA = IPv6, MX = mail, NS = nameservers.
