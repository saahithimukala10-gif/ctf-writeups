# Bandit — Level 13 → 14

**Category:** OverTheWire / Bandit  
**Difficulty:** Medium  
**Date:** 2026-08-12

## Goal

`bandit13`'s home directory held an SSH private key (`sshkey.private`) for logging in as `bandit14`. The next password was in `/etc/bandit_pass/bandit14`, readable only by `bandit14`.

    ssh bandit13@bandit.labs.overthewire.org -p 2220

![Connecting to bandit13 via SSH](images/bandit-13-14-login.png)

## Solution

Confirmed the key was there:

    $ ls -la
    -rw-r----- 1 bandit14 bandit13 2602 Jun 24 14:58 sshkey.private
    $ cat sshkey.private
    -----BEGIN OPENSSH PRIVATE KEY-----
    ...

![Listing home directory and viewing the private key](images/bandit-13-14-cat-sshkey.png)

Tried using the key directly from inside the `bandit13` session, but the wargame blocks chained SSH connections from localhost:

    $ ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
    Could not create directory '/home/bandit13/.ssh' (Permission denied).
    !!! You are trying to log into this SSH server with a password on port 2220 from localhost.
    !!! Connecting from localhost is blocked to conserve resources.

![Failed SSH attempt from within the bandit13 session](images/bandit-13-14-ssh-fail.png)

Exited back to my own machine and copied the key down with `scp` instead:

    $ exit
    $ scp -P 2220 bandit13@bandit.labs.overthewire.org:sshkey.private .

![scp pulling the private key to the local machine](images/bandit-13-14-scp.png)

The first login attempt with the downloaded key failed because its permissions were too open — SSH refuses to use a private key that's readable by others:

    $ ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
    WARNING: UNPROTECTED PRIVATE KEY FILE!
    Permissions 0640 for 'sshkey.private' are too open.

![SSH refusing the key over bad permissions](images/bandit-13-14-ssh-perm-warn.png)

Fixed the permissions and retried:

    $ chmod 600 sshkey.private
    $ ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220

![Successful login as bandit14](images/bandit-13-14-login-success.png)

Once in as `bandit14`, read the password file directly:

    $ cat /etc/bandit_pass/bandit14
    [REDACTED]

![cat /etc/bandit_pass/bandit14 output](images/bandit-13-14-cat-password.png)

## Result

    Password for bandit14: [REDACTED]

## Key Takeaway

Learned two things the hard way: you can't chain SSH from inside a Bandit session (it blocks localhost logins), so I had to `scp` the key down first — and SSH won't touch a key with loose permissions until you `chmod 600` it.
