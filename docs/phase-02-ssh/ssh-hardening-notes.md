# SSH Hardening Notes

## Purpose

This document records SSH hardening notes for atlas.

The goal of this phase was not to fully lock down SSH yet. The goal was to move from basic password-based remote access to a cleaner and more secure SSH workflow using keys and an SSH config alias.

Further hardening will be handled carefully in later phases to avoid accidentally locking myself out of the server.

## Current SSH State

| Item | Status |
|------|--------|
| SSH installed | Yes |
| SSH service | Active |
| SSH port | 22 |
| Password login | Still enabled |
| Key-based login | Working |
| SSH config alias | Working |
| Access command | `ssh atlas` |

## Improvements Completed

### SSH Key Authentication

A dedicated SSH key pair was created for atlas.

The public key was installed on atlas for the `kevin` user.

Key-based login was verified with:

`ssh -i ~/.ssh/atlas_ed25519 kevin@192.168.1.191`

### SSH Config Alias

The Windows workstation was configured with an SSH alias.

This allows connecting with:

`ssh atlas`

instead of typing the full username, IP address, and key path.

### File Transfer

SCP file transfer was tested in both directions:

- Windows workstation to atlas
- atlas to Windows workstation

This confirmed that files can be moved between the systems over SSH.

## Hardening Not Completed Yet

The following hardening steps were intentionally not completed during this phase:

| Hardening Item | Status | Reason |
|---------------|--------|--------|
| Disable password authentication | Deferred | Key access should be tested over multiple sessions first |
| Change default SSH port | Deferred | Not necessary for local-only homelab at this stage |
| Configure UFW firewall | Deferred | Needs careful sequencing to avoid blocking SSH |
| Install fail2ban | Deferred | Better suited for later security hardening phase |
| Restrict SSH users | Deferred | Will be reviewed after user management is documented |
| Disable root SSH login | To verify | Ubuntu typically does not allow direct root login by default |

## Why Password Login Remains Enabled

Password login remains enabled for now as a safety fallback.

Since this is the first SSH key setup on atlas, it is safer to confirm stable key-based access across multiple reboots before disabling password authentication.

Disabling password authentication too early could cause a lockout if the key or SSH config is misconfigured.

## Future Hardening Plan

Future SSH hardening may include:

- Confirm key-based login after reboot
- Confirm sudo access still works
- Review `/etc/ssh/sshd_config`
- Disable root SSH login if not already disabled
- Disable password authentication after key login is fully trusted
- Configure UFW to allow SSH before enabling firewall
- Install and configure fail2ban
- Document recovery steps before applying stricter controls

## Engineering Note

The goal is not to rush hardening.

The goal is to make one safe change at a time, verify access, document the result, and keep a fallback path available.

SSH is the primary management path for atlas, so hardening must be done carefully.

## Result

Phase 2 improved SSH administration without taking unnecessary lockout risks.

atlas now supports key-based SSH access and a clean workstation alias while keeping password login available as a temporary fallback.

## Status

Initial SSH remote administration setup is complete.

Full SSH hardening is deferred to a later phase.