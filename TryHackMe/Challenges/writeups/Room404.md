# TryHackMe — Room 404

**Category:** Web Exploitation / Recon  
**Difficulty:** Easy  
**Date:** 2026-08-24  

## Goal

Byte Lotus is a hotel "guest experience platform" whose staging build was reachable directly on the network. The goal was to find whatever the developers left exposed on that staging server and recover the flag.

## Solution

The site itself ("Byte Lotus — Stay Noticed") was just a marketing landing page — rooms, the app, concierge, stay — nothing obviously vulnerable on the surface.

![Byte Lotus homepage](images/room404-homepage.png)

Poking at obvious paths came up empty at first. `/booking` 404'd:

![/booking returns 404](images/room404-booking-404.png)

And so did `/robots.txt`:

    curl http://10.49.143.245:8080/robots.txt

![/robots.txt returns 404](images/room404-robots-404.png)

The interesting one was `/.git/HEAD` — a path developers often forget to block when a `.git` folder gets pushed to a staging server along with the rest of the app:

    curl -i http://10.49.143.245:8080/.git/HEAD

![.git/HEAD is exposed and returns 200 OK](images/room404-git-head-exposed.png)

That came back `200 OK` with a real git ref (`ref: refs/heads/main`), confirming the whole `.git` directory — history, objects, everything — was being served by the app's static file handler (Werkzeug/Flask dev server). That's enough to reconstruct the entire repository without ever touching a proper git smart-HTTP endpoint.

![The dumped .git/HEAD sitting locally alongside other lab repos](images/room404-find-git-head.png)

    cd './10.49.143.245:8080'
    ls -la

![The dumped .git directory on its own](images/room404-cd-ls.png)

With the `.git` folder pulled down locally, the tracked files could be listed and read straight out of the repo's history — no more guessing routes on the live server:

    git ls-tree -r HEAD --name-only
    git show HEAD:README.md

![Listing tracked files and reading README.md out of git history](images/room404-git-show-readme.png)

`README.md` turned out to be an internal note that was never meant to ship: a warning that this was a staging repo not meant for production, followed by a "staging flag (remove before launch)" line — exactly the kind of leftover secret an exposed `.git` folder hands over for free.

## Result

    flag{[REDACTED]}

## Key Takeaway

A 404 on every guessed route doesn't mean there's nothing there — `/.git/HEAD` returning `200 OK` on a Flask/Werkzeug static server was the real finding, because it meant the entire version-control history, including files never linked from the live site, was sitting in the open. Once a `.git` directory is reachable, the fastest path in is treating it as an ordinary git repo rather than continuing to brute-force URLs.
