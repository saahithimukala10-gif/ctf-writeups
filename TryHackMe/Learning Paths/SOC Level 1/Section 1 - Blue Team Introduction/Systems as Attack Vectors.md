# Systems as Attack Vectors

**Section:** Blue Team Introduction

## Key Points

- Beyond people, the technical attack surface includes networks, servers, endpoints, applications, and any internet-facing service.
- Common systems-level entry points: unpatched software with known CVEs, misconfigurations (default credentials, open ports, excessive permissions), weak or reused passwords, and outdated/unsupported systems still running in production.
- Attackers usually chain a small, boring misconfiguration together with a known public exploit, rather than needing a novel zero-day.
- Reducing this attack surface is proactive work: patch management, hardening configurations, least-privilege access, network segmentation, and regular vulnerability scanning.

## Remember

Systems get attacked through what's exposed and unmaintained — unpatched software, misconfigurations, weak credentials — not usually a novel exploit. Patching, hardening, least privilege, and segmentation shrink that surface before an attacker finds it.
