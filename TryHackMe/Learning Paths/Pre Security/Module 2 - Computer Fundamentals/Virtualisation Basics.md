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
