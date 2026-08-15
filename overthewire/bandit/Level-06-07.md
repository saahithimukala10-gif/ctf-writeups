# Bandit — Level 6 → 7

**Category:** OverTheWire / Bandit  
**Difficulty:** Easy  
**Date:** 2026-08-11

## Goal

The password for `bandit7` was in a file somewhere on the entire filesystem, owned by user `bandit7`, group `bandit6`, and exactly 33 bytes.

    ssh bandit6@bandit.labs.overthewire.org -p 2220

![Connecting to bandit6 via SSH](images/bandit-06-07-login.png)

## Solution

The file wasn't in the home directory this time, so I searched from `/` using the ownership and size the level gave me:

    $ find / -type f -user bandit7 -group bandit6 -size 33c

Most of the output was `Permission denied` noise from directories bandit6 couldn't read:

![find output, part 1](images/bandit-06-07-find-1.png)

Buried in the rest of the denied errors was the one real match:

    /var/lib/dpkg/info/bandit7.password

![find output, part 2, with the match highlighted](images/bandit-06-07-find-2.png)

Read it with `cat`:

    $ cat /var/lib/dpkg/info/bandit7.password
    [REDACTED]

![cat output](images/bandit-06-07-cat.png)

## Result

    Password for bandit7: [REDACTED]

## Key Takeaway

A system-wide `find` from `/` will throw a wall of `Permission denied` errors for directories you can't read — that's expected and not a failure. The real match sits mixed in with the noise, so scan the full output (or filter stderr with `2>/dev/null`) rather than assuming the search failed.
