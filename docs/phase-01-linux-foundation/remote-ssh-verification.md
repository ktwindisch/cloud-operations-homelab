# Remote SSH Verification

## Purpose

This document records the first successful SSH connection from the Windows workstation to atlas.

Remote SSH access is a core requirement for this project because atlas is intended to operate as a headless Ubuntu Server.

## SSH Connection

The Windows workstation connected to atlas over the local network using SSH.

Initial SSH target:

`ssh kevin@192.168.1.191`

## Remote Session Verification

After connecting over SSH, the shell prompt showed:

`kevin@atlas:~$`

This confirmed that the workstation was connected to the server remotely.

## Verification Commands

The following commands were run from the SSH session:

- `whoami`
- `hostname`
- `pwd`
- `uptime`

## Results

| Command | Result |
|--------|--------|
| `whoami` | `kevin` |
| `hostname` | `atlas` |
| `pwd` | `/home/kevin` |
| `uptime` | `03:40:21 up 6 min, 2 users, load average: 0.07, 0.17, 0.09` |

## SSH Service Status

The SSH service was verified with:

`systemctl status ssh`

Relevant result:

| Item | Result |
|------|--------|
| Service | `ssh.service` |
| Status | `active (running)` |
| Listening IPv4 | `0.0.0.0 port 22` |
| Listening IPv6 | `:: port 22` |
| Authentication | Password login accepted |
| Workstation IP | `192.168.1.192` |
| Server IP | `192.168.1.191` |

## Meaning

These results confirmed that:

- OpenSSH Server was installed
- The SSH service was running
- atlas was listening on port 22
- The Windows workstation could reach atlas over the local network
- The `kevin` user could authenticate remotely
- atlas could now be administered without using the laptop keyboard or screen

## Result

Remote SSH access was successful.

atlas can now be managed from the Windows workstation over the local network.