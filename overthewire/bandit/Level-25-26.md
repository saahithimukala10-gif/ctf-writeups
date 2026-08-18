# Bandit — Level 25 → 26

**Category:** OverTheWire / Bandit  
**Difficulty:** Hard  
**Date:** 2026-08-14  
**Level page:** [bandit25.html](https://overthewire.org/wargames/bandit/bandit25.html)

## Goal

`bandit25`'s home directory held a private key for `bandit26`. But `bandit26`'s login shell isn't a normal shell — it runs a program that displays some text and then disconnects, so logging in normally never gives a usable prompt.

    ssh bandit25@bandit.labs.overthewire.org -p 2220

![Connecting to bandit25 via SSH](images/bandit-25-26-login.png)

## Solution

Found and read the key for `bandit26`:

    $ ls
    bandit26.sshkey
    $ cat bandit26.sshkey
    -----BEGIN OPENSSH PRIVATE KEY-----
    ...

![Listing home directory and viewing bandit26's private key](images/bandit-25-26-cat-sshkey.png)

Saved it locally and locked down the permissions, same as the earlier private-key levels:

    $ nano /tmp/bandit26.key
    $ chmod 600 /tmp/bandit26.key

![Saving the key locally and fixing permissions](images/bandit-25-26-save-key.png)

Logging in with the key ran `bandit26`'s restricted login shell, which piped some ASCII art through the `more` pager and then would exit — not a real shell:

    $ ssh -i /tmp/bandit26.key bandit26@bandit.labs.overthewire.org -p 2220
    --More--(66%)

![more pager displaying the login banner](images/bandit-25-26-more-pager.png)

`more` lets you drop into an editor with the `v` key. Pressing `v` opened `vi` on the file being paged, still running as `bandit26`. From inside `vi`, set its shell option to a real shell:

    :set shell=/bin/bash

![Inside vi, setting the shell option](images/bandit-25-26-vi-setshell.png)

Then used `:shell` to actually spawn it, landing in a working `bandit26` shell instead of the restricted one:

    :shell
    bandit26@bandit:~$ whoami
    bandit26
    bandit26@bandit:~$ cat /etc/bandit_pass/bandit26
    [REDACTED]

![Spawning a real shell from vi and reading the password](images/bandit-25-26-shell-cat.png)

## Result

    Password for bandit26: [REDACTED]

## Key Takeaway

A restricted login shell that pipes output through a pager like `more` can be escaped: pagers commonly support dropping into an editor (`v`), and an editor like `vi` can spawn its own shell (`:set shell=... ` then `:shell`) — turning a "view only" login into a full interactive shell as that user.
