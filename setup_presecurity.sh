#!/usr/bin/env bash
#
# Restructures TryHackMe/Learning Paths into a Pre Security/ folder with
# per-module subfolders and per-topic revision notes, committing granularly
# (1 restructure commit + 20 note commits = 21 commits total).
#
# RUN THIS FROM THE ROOT OF YOUR ctf-writeups REPO:
#   cd ~/Documents/ctf-writeups
#   bash setup_presecurity.sh
#
set -e

LP="TryHackMe/Learning Paths"
PS="$LP/Pre Security"

if [ ! -f "$LP/PreSecurity.md" ]; then
  echo "ERROR: '$LP/PreSecurity.md' not found. Run this from the repo root."
  exit 1
fi

GIT="git -c user.email=saahithimukala10@gmail.com -c user.name=Saahithi"

# ---- Commit 1: restructure (folder + rename PreSecurity.md -> README.md + module folders) ----
mkdir -p "$PS"
git mv "$LP/PreSecurity.md" "$PS/README.md"
mkdir -p \
  "$PS/Module 1 - Introduction to Cyber Security" \
  "$PS/Module 2 - Computer Fundamentals" \
  "$PS/Module 3 - Operating Systems Basics" \
  "$PS/Module 4 - Software Basics" \
  "$PS/Module 5 - Network Fundamentals"
git add -A
$GIT commit -q -m "Restructure Pre Security into module subfolders, PreSecurity.md -> README.md"
echo "[1/21] restructure committed"

# ---- note: Offensive Security Intro ----
cat > "$PS/Module 1 - Introduction to Cyber Security/Offensive Security Intro.md" << 'THM_EOF'
# Offensive Security Intro

**Module:** Introduction to Cyber Security

## Key Points

- Offensive security is the practice of breaking into systems the way an attacker would — exploiting bugs, abusing insecure setups, and bypassing controls — to find weaknesses before a real attacker does.
- The mindset is "think like a hacker": legally and ethically probing a target to understand how it can be misused.
- Typical activities: finding and exploiting vulnerabilities, cracking passwords, exploiting web apps, testing network security.
- Roles that live here: penetration tester, red teamer, bug bounty hunter.
- Everything is done with permission — the difference between a security professional and a criminal is authorisation.

## Remember

Offensive = attack to find flaws. Always with explicit authorisation.
THM_EOF
git add "$PS/Module 1 - Introduction to Cyber Security/Offensive Security Intro.md"
$GIT commit -q -m "Add Pre Security notes: Offensive Security Intro"
echo "[2/21] Offensive Security Intro committed"

# ---- note: Defensive Security Intro ----
cat > "$PS/Module 1 - Introduction to Cyber Security/Defensive Security Intro.md" << 'THM_EOF'
# Defensive Security Intro

**Module:** Introduction to Cyber Security

## Key Points

- Defensive security is about preventing intrusions and detecting/responding to them when they happen — the opposite side of the coin from offensive security.
- Two broad tasks: stopping attacks from succeeding, and detecting + responding when one does.
- Related areas and concepts:
  - **SOC (Security Operations Center):** team that monitors the network for malicious activity.
  - **Threat Intelligence:** gathering info on attackers to prepare defences.
  - **DFIR (Digital Forensics & Incident Response):** investigating and reacting to breaches.
  - **Malware Analysis:** studying malicious software to understand and defend against it.
- Uses tools like SIEMs, IDS/IPS, firewalls, and endpoint protection.

## Remember

Defensive = protect, detect, respond. SOC, Threat Intel, DFIR, Malware Analysis are the four pillars.
THM_EOF
git add "$PS/Module 1 - Introduction to Cyber Security/Defensive Security Intro.md"
$GIT commit -q -m "Add Pre Security notes: Defensive Security Intro"
echo "[3/21] Defensive Security Intro committed"

# ---- note: Careers in Cyber ----
cat > "$PS/Module 1 - Introduction to Cyber Security/Careers in Cyber.md" << 'THM_EOF'
# Careers in Cyber

**Module:** Introduction to Cyber Security

## Key Points

- Cyber security is a broad field with many specialised roles, not just "hacker".
- Common roles:
  - **Penetration Tester:** legally attacks systems to find and report vulnerabilities.
  - **Red Teamer:** simulates a real adversary to test an org's people, processes, and tech.
  - **Security Engineer:** designs and builds secure systems and monitoring.
  - **SOC Analyst:** watches for and triages security alerts.
  - **DFIR / Incident Responder:** investigates and contains breaches.
  - **Malware Analyst:** reverse-engineers malicious code.
- Roles split loosely into offensive (red) and defensive (blue) tracks.

## Remember

Many paths in cyber — pick offensive (red) or defensive (blue) and specialise from there.
THM_EOF
git add "$PS/Module 1 - Introduction to Cyber Security/Careers in Cyber.md"
$GIT commit -q -m "Add Pre Security notes: Careers in Cyber"
echo "[4/21] Careers in Cyber committed"

# ---- note: Inside a Computer System ----
cat > "$PS/Module 2 - Computer Fundamentals/Inside a Computer System.md" << 'THM_EOF'
# Inside a Computer System

**Module:** Computer Fundamentals

## Key Points

- A computer is built from hardware components working together to process data.
- Core components:
  - **CPU (Central Processing Unit):** the "brain" — executes instructions.
  - **RAM (Random Access Memory):** fast, volatile short-term memory; cleared on power off.
  - **Motherboard:** connects all components together.
  - **Storage (HDD/SSD):** non-volatile long-term data storage.
  - **GPU:** handles graphics/parallel processing.
- **Volatile vs non-volatile:** RAM loses data without power; storage keeps it.

## Remember

CPU processes, RAM = fast temporary memory (volatile), storage = permanent (non-volatile).
THM_EOF
git add "$PS/Module 2 - Computer Fundamentals/Inside a Computer System.md"
$GIT commit -q -m "Add Pre Security notes: Inside a Computer System"
echo "[5/21] Inside a Computer System committed"

# ---- note: Computer Types ----
cat > "$PS/Module 2 - Computer Fundamentals/Computer Types.md" << 'THM_EOF'
# Computer Types

**Module:** Computer Fundamentals

## Key Points

- Computers come in many forms, each suited to a purpose:
  - **Servers:** provide services/resources to other machines (web, mail, files).
  - **Desktops / Laptops:** general personal use.
  - **Mainframes:** large, powerful machines for bulk processing in big orgs.
  - **Embedded systems:** small computers built into other devices (routers, appliances, cars).
  - **IoT devices:** internet-connected everyday objects.
- Choice depends on workload, scale, and reliability needs.

## Remember

Servers serve resources; embedded/IoT are computers hidden inside other things.
THM_EOF
git add "$PS/Module 2 - Computer Fundamentals/Computer Types.md"
$GIT commit -q -m "Add Pre Security notes: Computer Types"
echo "[6/21] Computer Types committed"

# ---- note: Client-Server Basics ----
cat > "$PS/Module 2 - Computer Fundamentals/Client-Server Basics.md" << 'THM_EOF'
# Client-Server Basics

**Module:** Computer Fundamentals

## Key Points

- The **client-server model** is how most networked services work.
- **Client:** requests a resource or service (e.g. your browser).
- **Server:** receives the request, processes it, and sends back a response.
- Example: browser (client) requests a web page → web server responds with the page.
- Many clients can talk to one server at the same time.

## Remember

Client asks, server answers. One server, many clients.
THM_EOF
git add "$PS/Module 2 - Computer Fundamentals/Client-Server Basics.md"
$GIT commit -q -m "Add Pre Security notes: Client-Server Basics"
echo "[7/21] Client-Server Basics committed"

# ---- note: Virtualisation Basics ----
cat > "$PS/Module 2 - Computer Fundamentals/Virtualisation Basics.md" << 'THM_EOF'
# Virtualisation Basics

**Module:** Computer Fundamentals

## Key Points

- **Virtualisation** lets one physical machine run multiple virtual machines (VMs), each acting like a separate computer.
- A **hypervisor** is the software that creates and manages VMs, sharing the host's hardware between them.
  - **Type 1 (bare-metal):** runs directly on hardware (e.g. ESXi) — efficient, used in data centres.
  - **Type 2 (hosted):** runs on top of an OS (e.g. VirtualBox, VMware Workstation).
- Benefits: isolation, efficient use of hardware, snapshots, safe environment for testing malware/exploits.

## Remember

Hypervisor splits one physical machine into many isolated VMs. Type 1 = on hardware, Type 2 = on an OS.
THM_EOF
git add "$PS/Module 2 - Computer Fundamentals/Virtualisation Basics.md"
$GIT commit -q -m "Add Pre Security notes: Virtualisation Basics"
echo "[8/21] Virtualisation Basics committed"

# ---- note: Cloud Computing Fundamentals ----
cat > "$PS/Module 2 - Computer Fundamentals/Cloud Computing Fundamentals.md" << 'THM_EOF'
# Cloud Computing Fundamentals

**Module:** Computer Fundamentals

## Key Points

- **Cloud computing** = renting computing resources (servers, storage, apps) over the internet instead of owning hardware.
- Built on virtualisation — providers run huge pools of virtual resources.
- Service models:
  - **IaaS (Infrastructure as a Service):** rent raw VMs/storage/network (e.g. AWS EC2).
  - **PaaS (Platform as a Service):** rent a platform to build/deploy apps, no OS management.
  - **SaaS (Software as a Service):** use ready-made software over the web (e.g. Gmail).
- Benefits: scalable, pay-as-you-go, no physical maintenance.

## Remember

IaaS = infrastructure, PaaS = platform, SaaS = software. More you go up, less you manage.
THM_EOF
git add "$PS/Module 2 - Computer Fundamentals/Cloud Computing Fundamentals.md"
$GIT commit -q -m "Add Pre Security notes: Cloud Computing Fundamentals"
echo "[9/21] Cloud Computing Fundamentals committed"

# ---- note: Operating Systems Introduction ----
cat > "$PS/Module 3 - Operating Systems Basics/Operating Systems Introduction.md" << 'THM_EOF'
# Operating Systems: Introduction

**Module:** Operating Systems Basics

## Key Points

- An **operating system (OS)** is the software that sits between hardware and the user/apps, managing resources.
- Core jobs:
  - **Process management** — running and scheduling programs.
  - **Memory management** — allocating RAM to processes.
  - **File system management** — organising data on storage.
  - **Device/hardware management** — talking to peripherals via drivers.
  - **User interface** — CLI and/or GUI.
- Common OSes: Windows, Linux, macOS, Android, iOS.

## Remember

The OS manages hardware and resources so apps and users don't have to.
THM_EOF
git add "$PS/Module 3 - Operating Systems Basics/Operating Systems Introduction.md"
$GIT commit -q -m "Add Pre Security notes: Operating Systems Introduction"
echo "[10/21] Operating Systems Introduction committed"

# ---- note: Windows Basics ----
cat > "$PS/Module 3 - Operating Systems Basics/Windows Basics.md" << 'THM_EOF'
# Windows Basics

**Module:** Operating Systems Basics

## Key Points

- Windows is the most widely used desktop OS — important target and defence surface.
- Key concepts:
  - **File system:** typically NTFS; drives labelled C:\, D:\ etc.
  - **Users & accounts:** standard users vs Administrator; UAC (User Account Control) prompts for elevation.
  - **Registry:** central hierarchical database of system/app settings.
  - **Services:** background processes; managed via services.msc.
  - **Task Manager:** view/kill processes and monitor resources.
- GUI-driven, but has powerful CLIs (cmd, PowerShell).

## Remember

Windows = NTFS, Administrator + UAC, Registry for settings, Services for background tasks.
THM_EOF
git add "$PS/Module 3 - Operating Systems Basics/Windows Basics.md"
$GIT commit -q -m "Add Pre Security notes: Windows Basics"
echo "[11/21] Windows Basics committed"

# ---- note: Linux CLI Basics ----
cat > "$PS/Module 3 - Operating Systems Basics/Linux CLI Basics.md" << 'THM_EOF'
# Linux CLI Basics

**Module:** Operating Systems Basics

## Key Points

- Linux is open-source and dominant on servers — the CLI (terminal) is essential.
- Everything is a file; paths use `/` and start from root `/`.
- Core commands:
  - `pwd` — print working directory
  - `ls` — list files (`ls -la` for all + details)
  - `cd` — change directory
  - `cat` — read a file
  - `echo` — print text
  - `find` / `grep` — search files / search inside files
  - `mkdir`, `touch`, `rm`, `mv`, `cp` — manage files/folders
- Permissions shown as `rwx` for user/group/other; changed with `chmod`.

## Remember

Everything is a file, root is `/`, and pwd/ls/cd/cat/grep/find are the daily-driver commands.
THM_EOF
git add "$PS/Module 3 - Operating Systems Basics/Linux CLI Basics.md"
$GIT commit -q -m "Add Pre Security notes: Linux CLI Basics"
echo "[12/21] Linux CLI Basics committed"

# ---- note: Windows CLI Basics ----
cat > "$PS/Module 3 - Operating Systems Basics/Windows CLI Basics.md" << 'THM_EOF'
# Windows CLI Basics

**Module:** Operating Systems Basics

## Key Points

- Windows has two command-line environments: **Command Prompt (cmd)** and **PowerShell** (more powerful, object-based).
- Useful cmd commands:
  - `dir` — list directory contents (like `ls`)
  - `cd` — change directory
  - `type` — show file contents (like `cat`)
  - `ipconfig` — network configuration
  - `ping`, `netstat`, `tasklist`, `systeminfo`
- PowerShell uses **cmdlets** in Verb-Noun form (e.g. `Get-Process`, `Get-ChildItem`) and can pipe objects, not just text.

## Remember

cmd basics: dir/type/ipconfig. PowerShell = Verb-Noun cmdlets, more powerful.
THM_EOF
git add "$PS/Module 3 - Operating Systems Basics/Windows CLI Basics.md"
$GIT commit -q -m "Add Pre Security notes: Windows CLI Basics"
echo "[13/21] Windows CLI Basics committed"

# ---- note: Operating System Security ----
cat > "$PS/Module 3 - Operating Systems Basics/Operating System Security.md" << 'THM_EOF'
# Operating System Security

**Module:** Operating Systems Basics

## Key Points

- OS security is about protecting the system from unauthorised access and misuse.
- Key measures:
  - **Authentication:** strong passwords, MFA.
  - **Least privilege:** users/processes get only the access they need (standard user vs admin/root).
  - **Patching/updates:** fix known vulnerabilities promptly.
  - **Access controls & permissions:** file/resource permissions.
  - **Logging & monitoring:** track activity to detect abuse.
  - **Antivirus/EDR & firewalls:** block and detect malicious activity.
- Weak points attackers target: default/weak creds, unpatched software, over-privileged accounts.

## Remember

Least privilege + patching + strong auth are the core of hardening any OS.
THM_EOF
git add "$PS/Module 3 - Operating Systems Basics/Operating System Security.md"
$GIT commit -q -m "Add Pre Security notes: Operating System Security"
echo "[14/21] Operating System Security committed"

# ---- note: Data Representation ----
cat > "$PS/Module 4 - Software Basics/Data Representation.md" << 'THM_EOF'
# Data Representation

**Module:** Software Basics

## Key Points

- Computers store everything as **binary** (0s and 1s) — bits.
- **8 bits = 1 byte.** Bytes represent numbers, characters, etc.
- Number systems:
  - **Binary (base 2):** 0-1
  - **Decimal (base 10):** 0-9 (human)
  - **Hexadecimal (base 16):** 0-9, A-F — compact way to write binary (1 hex digit = 4 bits).
- **Character encoding** maps numbers to characters (e.g. ASCII: `A` = 65, Unicode/UTF-8 for wider character sets).

## Remember

Everything is binary underneath. 8 bits = 1 byte. Hex is shorthand for binary; ASCII maps numbers to characters.
THM_EOF
git add "$PS/Module 4 - Software Basics/Data Representation.md"
$GIT commit -q -m "Add Pre Security notes: Data Representation"
echo "[15/21] Data Representation committed"

# ---- note: Data Encoding ----
cat > "$PS/Module 4 - Software Basics/Data Encoding.md" << 'THM_EOF'
# Data Encoding

**Module:** Software Basics

## Key Points

- **Encoding** transforms data into another format for safe transport/storage — NOT encryption (no secrecy, fully reversible by anyone).
- Common schemes:
  - **Base64:** represents binary data as ASCII text; used in URLs, emails, tokens. Often ends with `=` padding.
  - **URL encoding (percent-encoding):** replaces unsafe URL characters (e.g. space → `%20`).
  - **Hex encoding:** bytes written as hexadecimal.
- Encoding ≠ encryption ≠ hashing:
  - Encoding = reversible, no key, for compatibility.
  - Encryption = reversible with a key, for confidentiality.
  - Hashing = one-way, for integrity/verification.

## Remember

Encoding (e.g. Base64) is reversible and offers NO security. Don't confuse it with encryption or hashing.
THM_EOF
git add "$PS/Module 4 - Software Basics/Data Encoding.md"
$GIT commit -q -m "Add Pre Security notes: Data Encoding"
echo "[16/21] Data Encoding committed"

# ---- note: Python Simple Demo ----
cat > "$PS/Module 4 - Software Basics/Python Simple Demo.md" << 'THM_EOF'
# Python: Simple Demo

**Module:** Software Basics

## Key Points

- Python is a beginner-friendly, readable scripting language, heavily used in security tooling.
- Core building blocks:
  - **Variables:** `name = "value"` (no type declaration needed).
  - **Data types:** strings, integers, floats, booleans, lists, dictionaries.
  - **Operators:** arithmetic (`+ - * /`), comparison (`== != < >`).
  - **Control flow:** `if/elif/else`, `for` and `while` loops.
  - **Functions:** `def my_func():`.
  - **Output/input:** `print()`, `input()`.
- Indentation defines code blocks (no braces).

## Remember

Python: no type declarations, indentation matters, print()/input(), if/for/while, def for functions.
THM_EOF
git add "$PS/Module 4 - Software Basics/Python Simple Demo.md"
$GIT commit -q -m "Add Pre Security notes: Python Simple Demo"
echo "[17/21] Python Simple Demo committed"

# ---- note: JavaScript Simple Demo ----
cat > "$PS/Module 4 - Software Basics/JavaScript Simple Demo.md" << 'THM_EOF'
# JavaScript: Simple Demo

**Module:** Software Basics

## Key Points

- JavaScript (JS) runs in the browser and makes web pages interactive — key for understanding web attacks.
- Basics:
  - **Variables:** `let`, `const`, `var`.
  - **Functions:** `function name() { ... }`.
  - **Output:** `console.log()`, `alert()`, or manipulating the page.
  - **DOM manipulation:** JS can read/change HTML elements on the page (`document.getElementById(...)`).
- Runs client-side; can be embedded in HTML via `<script>` tags — relevant to XSS attacks.

## Remember

JS makes web pages interactive, runs in the browser, and manipulates the DOM. `<script>` + DOM = why XSS matters.
THM_EOF
git add "$PS/Module 4 - Software Basics/JavaScript Simple Demo.md"
$GIT commit -q -m "Add Pre Security notes: JavaScript Simple Demo"
echo "[18/21] JavaScript Simple Demo committed"

# ---- note: Database SQL Basics ----
cat > "$PS/Module 4 - Software Basics/Database SQL Basics.md" << 'THM_EOF'
# Database SQL Basics

**Module:** Software Basics

## Key Points

- A **database** stores structured data; **relational databases** organise it into tables (rows and columns).
- **SQL (Structured Query Language)** is used to interact with them.
- Core statements:
  - `SELECT ... FROM table` — read data (`SELECT * FROM users`).
  - `WHERE` — filter rows.
  - `INSERT INTO` — add rows.
  - `UPDATE ... SET` — modify rows.
  - `DELETE FROM` — remove rows.
- Understanding SQL is essential for **SQL injection**, where attacker input is inserted into a query to manipulate it.

## Remember

Tables = rows + columns. SELECT/INSERT/UPDATE/DELETE. Unsanitised input into a query = SQL injection.
THM_EOF
git add "$PS/Module 4 - Software Basics/Database SQL Basics.md"
$GIT commit -q -m "Add Pre Security notes: Database SQL Basics"
echo "[19/21] Database SQL Basics committed"

# ---- note: What is Networking ----
cat > "$PS/Module 5 - Network Fundamentals/What is Networking.md" << 'THM_EOF'
# What is Networking?

**Module:** Network Fundamentals

## Key Points

- A **network** is two or more devices connected to share data/resources. The internet is a giant network of networks.
- Key identifiers:
  - **IP address:** logical address identifying a device on a network (IPv4 e.g. `192.168.1.1`; IPv6 for larger space).
  - **MAC address:** physical hardware address burned into a network card (e.g. `a4:c3:f0:...`).
- **Ping / ICMP:** tests connectivity between devices and measures round-trip time.
- Devices can be identified and reached using these addresses.

## Remember

IP = logical (changeable) address; MAC = physical hardware address. Ping (ICMP) tests if a host is reachable.
THM_EOF
git add "$PS/Module 5 - Network Fundamentals/What is Networking.md"
$GIT commit -q -m "Add Pre Security notes: What is Networking"
echo "[20/21] What is Networking committed"

# ---- note: Intro to LAN ----
cat > "$PS/Module 5 - Network Fundamentals/Intro to LAN.md" << 'THM_EOF'
# Intro to LAN

**Module:** Network Fundamentals

## Key Points

- **LAN (Local Area Network):** devices connected in a small area (home, office).
- **Topologies** (how devices are arranged):
  - **Star:** all devices connect to a central switch/hub — most common; one cable fault doesn't kill the whole network.
  - **Bus:** all share a single backbone cable — cheap but a break affects everyone.
  - **Ring:** each device connects to two others in a loop.
- Key devices:
  - **Switch:** connects devices within a LAN, forwarding frames by MAC address (smart).
  - **Router:** connects different networks together and routes traffic between them (e.g. LAN to internet).
- **DHCP:** automatically assigns IP addresses to devices on the network.

## Remember

Switch connects devices inside a LAN (by MAC); router connects networks together. Star topology is the common, resilient layout.
THM_EOF
git add "$PS/Module 5 - Network Fundamentals/Intro to LAN.md"
$GIT commit -q -m "Add Pre Security notes: Intro to LAN"
echo "[21/21] Intro to LAN committed"

echo "Done — 21 commits created. Review with: git log --oneline -21"
echo "Then push with: git push"
