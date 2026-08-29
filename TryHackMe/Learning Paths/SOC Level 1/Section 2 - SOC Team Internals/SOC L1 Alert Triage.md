# SOC L1 Alert Triage

**Section:** SOC Team Internals

## Key Points

- Alert triage is the first pass an L1 analyst makes on incoming alerts: deciding what's noise, what's a false positive, and what actually needs escalation.
- Typical triage questions: what triggered the alert, which asset/user is involved, is this expected behavior, has this happened before, and what's the potential impact.
- Prioritization follows severity/impact and how critical the affected asset is — not just raw alert volume.
- Good triage relies on context: threat intel enrichment, asset inventory, and user/business context (e.g. is this admin account normally active at 3am?).
- Consistent triage protects the rest of the team from alert fatigue by filtering noise before it reaches higher tiers.

## Remember

Triage = a fast, first-pass judgment call: real or noise, and how urgent. Context — asset criticality, normal-behavior baseline, threat intel — is what turns a raw alert into an actual decision.
