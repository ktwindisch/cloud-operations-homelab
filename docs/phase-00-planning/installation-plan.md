# Ubuntu Server Installation Plan

## Purpose

This document defines the installation plan for converting the Lenovo ThinkPad T530 into atlas, the primary Ubuntu Server for the Cloud Operations Homelab project.

The goal is to install a clean, headless Ubuntu Server environment that can later be administered remotely over SSH.

## Target System

| Item | Value |
|------|-------|
| Hardware | Lenovo ThinkPad T530 |
| Hostname | atlas |
| Planned OS | Ubuntu Server 26.04 LTS |
| Install type | Clean install |
| Desktop environment | None |
| Access method | SSH |
| Disk wipe | Approved |
| Network | Wi-Fi |

## Installation Media

Ubuntu Server will be installed from a bootable USB drive.

Planned tools:

| Item | Tool |
|------|------|
| ISO source | Official Ubuntu Server download |
| USB creation tool | Rufus |
| USB size | 8 GB or larger |
| Workstation | Windows PC |

## Disk Plan

The internal SSD will be fully erased during installation.

The installer will use the full disk for Ubuntu Server.

| Decision | Value |
|----------|-------|
| Preserve existing OS | No |
| Preserve existing files | No |
| Use full disk | Yes |
| Encryption | Not planned for initial setup |
| LVM | To be decided during install |

## User Plan

The primary administrative user will be:

| Item | Value |
|------|-------|
| Username | kevin |
| Privileges | sudo |
| Login method | Password initially, SSH later |

Password authentication may be used during the first setup stage.

SSH key authentication will be configured later as part of the secure remote administration phase.

## SSH Plan

OpenSSH Server should be installed during the Ubuntu Server installation if the installer provides the option.

This will allow the server to be accessed remotely after installation.

Initial goal:

- Confirm SSH service is installed
- Confirm the server has network connectivity
- Confirm the server can be reached from the Windows workstation
- Later configure SSH keys
- Later harden SSH access

## Network Plan

The server will connect using Wi-Fi.

A more detailed network strategy is documented separately in:

docs/phase-00-planning/network-plan.md

Initial goal:

- Connect atlas to the home Wi-Fi network
- Confirm it receives an IP address
- Confirm internet access works
- Confirm the Windows workstation can reach it

## Installation Steps

High-level installation sequence:

1. Download Ubuntu Server ISO
2. Create bootable USB using Rufus
3. Boot ThinkPad T530 from USB
4. Choose Ubuntu Server installation
5. Connect to Wi-Fi during setup
6. Set hostname to atlas
7. Create admin user kevin
8. Install OpenSSH Server during setup
9. Use full disk for Ubuntu Server
10. Complete installation
11. Reboot into Ubuntu Server
12. Log in locally for first verification
13. Confirm network connectivity
14. Confirm SSH availability
15. Document results

## Success Criteria

The Ubuntu Server installation is successful when:

- The ThinkPad boots into Ubuntu Server
- The hostname is set to atlas
- The kevin user can log in
- The server connects to the network
- The server receives an IP address
- OpenSSH Server is installed
- The server can be reached from the Windows workstation
- Installation notes are documented in GitHub

## Risks

| Risk | Mitigation |
|------|------------|
| Data loss | Disk wipe already approved |
| Wi-Fi driver issue | Use temporary Ethernet adapter if needed |
| SSH not available after install | Log in locally and install OpenSSH manually |
| IP address changes | Use router DHCP reservation later |
| Boot issue after install | Recheck BIOS boot settings |

## Notes

This phase is focused on creating a clean server foundation.

Hardening, firewall configuration, SSH keys, fail2ban, Docker, monitoring, and automation will be handled in later phases.