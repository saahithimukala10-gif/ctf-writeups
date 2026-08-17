# TryHackMe — Neighbour

**Category:** TryHackMe / Neighbour  
**Difficulty:** Easy  
**Date:** 2026-08-17

## Goal

Cloud auth service challenge — log in and find the flag on the admin's profile without knowing the admin credentials.

## Solution

Quick scan first:

    nmap -sC -sV 10.48.175.126

![nmap scan showing SSH and HTTP open](images/neighbour-nmap.png)

Port 80 had a login page, no registration open yet:

![Login page](images/neighbour-login.png)

Viewed the page source and found guest credentials left in an HTML comment, along with a note that the admin account is "off limits":

    view-source:http://10.48.175.126/

![HTML comment revealing guest:guest credentials](images/neighbour-source-creds.png)

Logged in with `guest:guest` and landed on a profile page keyed off a `user` query parameter:

    http://10.48.175.126/profile.php?user=guest

![Profile page for the guest user](images/neighbour-profile-guest.png)

The page copy itself hints at it ("try not to peep your neighbour's profile") — swapped the parameter to `admin`:

    http://10.48.175.126/profile.php?user=admin

![Profile page for admin, with the flag](images/neighbour-profile-admin.png)

## Result

    Flag: [REDACTED]

## Key Takeaway

Access control that's just "whatever `user` is in the URL, show that profile" isn't access control — an IDOR like this needs a server-side check that the logged-in session actually owns the profile being requested, not just a client-visible parameter swap.
