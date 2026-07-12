# First Login Verification

## Purpose

This document records the first successful local login to atlas after installing Ubuntu Server.

## Local Login

After installation and reboot, the server displayed the login prompt for atlas.

The local login was successful using the administrative user `kevin`.

After logging in, the shell prompt showed:

`kevin@atlas:~$`

## Verification Commands

The following commands were used to verify the system identity:

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
| `uptime` | Server was running successfully after boot |

## Meaning

These results confirmed that:

- The correct user account was created
- The hostname was set correctly
- The user home directory exists
- The server booted successfully into Ubuntu Server
- The system was ready for further verification

## Result

First local login was successful.

atlas was confirmed to be running as a clean Ubuntu Server installation with the expected user and hostname.