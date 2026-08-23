# Bandit — Level 3 → 4

**Category:** OverTheWire / Bandit  
**Difficulty:** Easy  
**Date:** 2026-08-10

## Goal

The password for `bandit4` was stored in a hidden file inside a directory called `inhere`.

    ssh bandit3@bandit.labs.overthewire.org -p 2220

![Connecting to bandit3 via SSH](images/bandit-03-04-login.png)

## Solution

Listed the home directory and found `inhere`:

    $ ls -la
    drwxr-xr-x 2 root root 4096 Jun 24 14:59 inhere

![ls -la output](images/bandit-03-04-ls.png)

Nothing jumped out in `inhere` at first, so I went in and ran `ls -la` again — that's where the hidden dotfile `...Hiding-From-You` turned up.

    $ cd inhere
    $ ls -la
    -rw-r----- 1 bandit4 bandit3 33 Jun 24 14:59 ...Hiding-From-You

![ls -la inside inhere](images/bandit-03-04-inhere-ls.png)

Read it with `cat`:

    $ cat ...Hiding-From-You
    [REDACTED]

![cat output](images/bandit-03-04-cat.png)

## Result

    Password for bandit4: [REDACTED]

## Key Takeaway

The password wasn't in the home directory — it required `cd`-ing into `inhere` first, then running `ls -la` again to reveal the hidden dotfile `...Hiding-From-You`. Same trick as level 0, just one directory deeper — had to `cd` in before `-la` would show anything.
