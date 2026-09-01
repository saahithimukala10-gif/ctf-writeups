# SOC Workbooks and Lookups

**Section:** SOC Team Internals

## Key Points

- **Workbooks** are structured internal reference docs that standardize how an analyst investigates a specific alert type, step by step — so triage and reporting stay consistent across analysts and shifts.
- **Lookups** are reference data — known-good/known-bad IPs, asset owners, VIP users, whitelisted processes — pulled into the SIEM/alert workflow to enrich context automatically, instead of manually looking things up every time.
- The point of both is reducing inconsistency and speeding up investigation: every analyst works from the same playbook and the same enrichment data, rather than reinventing their own process.
- Well-maintained workbooks and lookups are also what makes onboarding new SOC analysts faster — a junior analyst can follow a workbook instead of relying purely on tribal knowledge from a senior teammate.

## Remember

Workbooks = step-by-step playbooks for handling a specific alert type consistently. Lookups = reference data (asset owners, VIPs, known-bad IPs) that auto-enriches alerts instead of manual lookups. Together they turn "go ask a senior analyst" into "follow the doc."
