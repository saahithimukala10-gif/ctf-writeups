# SOC L1 Alert Reporting

**Section:** SOC Team Internals

## Key Points

- Once an alert is triaged, it needs to be documented clearly enough that someone else — L2, the IR team, or a future you — can pick it up without redoing the investigation.
- A good alert report typically covers: what happened, when, affected systems/users, evidence and indicators gathered, actions already taken, and a clear recommendation (escalate, close as false positive, or keep monitoring).
- A clear, consistent format matters more than length — vague reports slow down escalation and can cause real incidents to get deprioritized.
- Reporting is also how SOC metrics get generated (time to triage, false-positive rate, etc.), so sloppy reporting quietly damages the whole team's visibility into its own performance.

## Remember

A report should let someone else act on your work without having to ask you questions first: what happened, what you found, what you already did, and what should happen next. Bad reporting doesn't just slow the current case — it corrupts the metrics the whole SOC uses to improve.
