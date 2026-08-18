# Natas — Level 0 → 1

**Category:** OverTheWire / Natas  
**Difficulty:** Easy  
**Date:** 2026-08-15  
**Level page:** [natas0.html](https://overthewire.org/wargames/natas/natas0.html)

## Goal

The password for `natas1` was somewhere on the `natas0` page.

    http://natas0.natas.labs.overthewire.org
    (username: natas0, password: natas0)

The rendered page just said "You can find the password for the next level on this page":

![Rendered natas0 page](images/natas-00-01-page.png)

## Solution

The visible page content had nothing else on it, so the password had to be hidden in the HTML itself rather than displayed. Right-clicked and used "Inspect" to open DevTools and read the underlying markup:

    <!--The password for natas1 is [REDACTED] -->

![DevTools Elements panel showing the password in an HTML comment](images/natas-00-01-devtools.png)

## Result

    Password for natas1: [REDACTED]

## Key Takeaway

The password was sitting in an HTML comment that never showed up on the rendered page — the source is the first place to look when the visible page is empty.
