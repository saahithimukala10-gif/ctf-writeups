# Bandit — Level 16 → 17

**Category:** OverTheWire / Bandit  
**Difficulty:** Medium  
**Date:** 2026-08-12  
**Level page:** [bandit16.html](https://overthewire.org/wargames/bandit/bandit16.html)

## Goal

The password for `bandit17` was returned by one of several listening ports in the 31000–32000 range, specifically the one running an SSL service.

    ssh bandit16@bandit.labs.overthewire.org -p 2220

![Connecting to bandit16 via SSH](images/bandit-16-17-login.png)

## Solution

Scanned the given port range to see what was actually listening:

    $ nmap -p 31000-32000 localhost
    31046/tcp open  unknown
    31518/tcp open  unknown
    31691/tcp open  unknown
    31790/tcp open  unknown
    31960/tcp open  unknown

![nmap port scan across the range](images/bandit-16-17-nmap-scan.png)

Five ports were open, so ran a version scan (`-sV`) on just those to identify which one spoke SSL:

    $ nmap -sV -p 31046,31518,31691,31790,31960 localhost
    31046/tcp open  echo
    31518/tcp open  ssl/echo
    31691/tcp open  echo
    31790/tcp open  ssl/unknown
    31960/tcp open  echo

![nmap version scan flagging the SSL ports](images/bandit-16-17-nmap-sv.png)

Two ports showed `ssl`. `31790` was `ssl/unknown` rather than `ssl/echo`, which pointed to it being the actual target service rather than a simple echo server. Connected with `openssl s_client` and submitted `bandit16`'s password:

    $ openssl s_client -connect localhost:31790 -quiet
    [bandit16's password]
    Correct!
    -----BEGIN OPENSSH PRIVATE KEY-----
    ...
    -----END OPENSSH PRIVATE KEY-----

![openssl s_client returning a private key](images/bandit-16-17-openssl.png)

Saved the returned key to a local file, locked down its permissions, and used it to log in:

    $ nano /tmp/bandit17.key
    $ chmod 600 /tmp/bandit17.key
    $ ssh -i /tmp/bandit17.key bandit17@bandit.labs.overthewire.org -p 2220

![Creating the key file, fixing permissions, and connecting](images/bandit-16-17-key-setup.png)

    bandit17@bandit:~$

![Successful login as bandit17](images/bandit-16-17-login-success.png)

## Result

Login as `bandit17` was granted via the private key rather than a plaintext password — no `Password for bandit17` line to redact here, just the key itself (already blurred above).

## Key Takeaway

`nmap -sV` on a handful of open ports narrows down which service is worth talking to when several ports are open — here, two ports both showed `ssl`, but the service type (`ssl/unknown` vs `ssl/echo`) distinguished the real target from a decoy echo server.
