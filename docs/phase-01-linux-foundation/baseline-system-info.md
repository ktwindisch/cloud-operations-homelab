# Baseline System Information

## Purpose

This document records the baseline system information for atlas immediately after Ubuntu Server installation, first login, SSH verification, and system updates.

This baseline gives me a known starting point before future configuration, hardening, automation, monitoring, and DevOps tooling.

## System Identity

| Item | Value |
|------|-------|
| Hostname | `atlas` |
| User | `kevin` |
| Home Directory | `/home/kevin` |
| Primary Access Method | SSH from Windows workstation |

## Operating System

Command used:

`lsb_release -a`

| Field | Value |
|------|-------|
| Distributor ID | Ubuntu |
| Description | Ubuntu 26.04 LTS |
| Release | 26.04 |
| Codename | resolute |

## Kernel

Command used:

`uname -r`

| Field | Value |
|------|-------|
| Kernel Version | `7.0.0-27-generic` |

## Memory

Command used:

`free -h`

| Item | Value |
|------|-------|
| Memory Total | 14Gi |
| Memory Used | 557Mi |
| Memory Free | 13Gi |
| Memory Available | 14Gi |
| Swap Total | 4.0Gi |
| Swap Used | 0B |

## Filesystem Usage

Command used:

`df -h`

| Filesystem | Size | Used | Available | Use | Mount |
|-----------|------|------|-----------|-----|-------|
| `/dev/mapper/ubuntu--vg-ubuntu--lv` | 98G | 7.4G | 86G | 8% | `/` |
| `/dev/sda2` | 2.0G | 185M | 1.7G | 11% | `/boot` |

## Block Devices

Command used:

`lsblk`

| Device | Size | Type | Mount |
|--------|------|------|-------|
| `sda` | 238.5G | disk | Internal SSD |
| `sda1` | 1M | part | BIOS boot partition |
| `sda2` | 2G | part | `/boot` |
| `sda3` | 236.5G | part | LVM physical volume |
| `ubuntu--vg-ubuntu--lv` | 100G | lvm | `/` |
| `sr0` | 1024M | rom | Optical drive |

## Storage Notes

Ubuntu created an LVM-based layout during installation.

The root filesystem is currently a `100G` logical volume mounted at `/`.

The internal SSD is `238.5G`, which means additional storage remains available inside the LVM structure.

This unused space may be expanded later as a Linux storage administration exercise.

## Network

Command used:

`hostname -I`

| Item | Value |
|------|-------|
| Primary IPv4 Address | `192.168.1.191` |
| Workstation IPv4 Address | `192.168.1.192` |
| Network Type | Wi-Fi |

Additional IPv6 addresses were assigned, but the primary address used for SSH verification was `192.168.1.191`.

## SSH Service

Command used:

`systemctl status ssh`

| Item | Value |
|------|-------|
| Service | `ssh.service` |
| Status | `active (running)` |
| IPv4 Listener | `0.0.0.0 port 22` |
| IPv6 Listener | `:: port 22` |
| Authentication Tested | Password login |
| Remote Access | Verified from Windows workstation |

## System Updates

System package updates were completed after SSH verification.

No reboot was required after updates.

## Baseline Summary

| Item | Value |
|------|-------|
| Hostname | `atlas` |
| User | `kevin` |
| OS | Ubuntu 26.04 LTS |
| Kernel | `7.0.0-27-generic` |
| IPv4 Address | `192.168.1.191` |
| Workstation IP | `192.168.1.192` |
| Memory | 14Gi visible to Ubuntu |
| Swap | 4.0Gi |
| Disk | 238.5G SSD |
| Root Filesystem | 98G LVM-backed filesystem |
| SSH | Active and running |
| Updates | Completed |
| Reboot Required | No |

## Result

The baseline system state was successfully captured.

atlas is ready for the next phase of the Cloud Operations Homelab project.