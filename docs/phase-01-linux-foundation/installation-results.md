# Ubuntu Server Installation Results

## Purpose

This document records the results of installing Ubuntu Server on atlas, the primary server for the Cloud Operations Homelab project.

## Installation Summary

| Item | Result |
|------|--------|
| Hardware | Lenovo ThinkPad T530 |
| Hostname | atlas |
| Operating System | Ubuntu Server 26.04 LTS |
| Install Type | Clean install |
| Disk Wipe | Completed |
| Admin User | kevin |
| Network | Wi-Fi |
| Initial DHCP Address | 192.168.1.191/24 |
| SSH Server | Installed |
| Remote SSH Access | Verified |

## Installation Outcome

Ubuntu Server was successfully installed on the Lenovo ThinkPad T530.

The laptop was wiped and repurposed as a dedicated Linux server for the Cloud Operations Homelab project.

The server hostname was set to `atlas`.

The primary administrative user was created as `kevin`.

## Storage Notes

During installation, Ubuntu created an LVM-based storage layout.

The internal SSD was detected as `238.5G`.

The root filesystem was created as a `100G` logical volume.

This leaves additional unused storage available inside the volume group, which may be expanded later as a Linux storage administration exercise.

## Network Notes

During installation, atlas successfully connected to the home Wi-Fi network and received the following DHCP address:

`192.168.1.191/24`

This confirmed that Wi-Fi worked during installation and that atlas could join the local network.

## SSH Notes

OpenSSH Server was installed during setup.

Remote SSH access was later verified from the Windows workstation.

## Result

The Ubuntu Server installation was successful.

atlas is now a working Linux server and is ready for remote administration, system hardening, and future DevOps tooling.