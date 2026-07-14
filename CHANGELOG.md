# Changelog

All notable changes to this project will be documented in this file.

This project uses version-style milestones to track progress over time.

## [2.0.0] SSH Remote Administration

### Added

- Created dedicated SSH key pair for atlas
- Copied public SSH key to atlas
- Verified key-based SSH authentication
- Created SSH config alias for atlas
- Verified simplified SSH access using `ssh atlas`
- Tested SCP file transfer from Windows workstation to atlas
- Tested SCP file transfer from atlas to Windows workstation
- Checked rsync availability on both systems
- Documented rsync limitation on Windows Git Bash
- Added SSH hardening notes and future security plan

### Notes

This milestone improves remote administration for atlas.

The server can now be accessed from the Windows workstation using a dedicated SSH key and the simplified command `ssh atlas`.

Password login remains enabled temporarily as a safety fallback until key-based access is verified across multiple sessions and future hardening steps are completed.

## [1.0.0] Ubuntu Server Foundation

### Added

- Installed Ubuntu Server 26.04 LTS on the Lenovo ThinkPad T530
- Set server hostname to atlas
- Created administrative user kevin
- Connected atlas to the home Wi-Fi network
- Verified local login after installation
- Verified remote SSH access from the Windows workstation
- Captured baseline system information
- Documented OS version, kernel, memory, storage, network, and SSH status
- Completed initial system package updates

### Notes

This milestone marks the first operational version of atlas.

The ThinkPad T530 has been successfully repurposed into a headless Ubuntu Server for the Cloud Operations Homelab project.

Remote administration over SSH is working.

######

## [0.2.0] Ubuntu Server Installation Planning

### Added

- Added server identity plan for atlas
- Added backup checklist before disk wipe
- Added Ubuntu Server installation plan
- Added network plan for Wi-Fi and SSH access
- Documented planned hostname, admin user, and access method
- Documented DHCP reservation as the preferred long-term IP strategy
- Documented installation risks and mitigation steps

### Notes

This milestone documents the installation plan before wiping the ThinkPad T530 and installing Ubuntu Server.

The server identity has been defined as atlas.

The laptop has been approved for a full disk wipe.

######

## [0.1.0] Project Foundation

### Added

- Created public GitHub repository
- Added initial repository structure
- Added project README
- Added changelog
- Added architecture decision record directory
- Added Phase 0 planning directory
- Documented initial hardware profile
- Captured before photo of Lenovo ThinkPad T530

### Notes

This milestone marks the beginning of the Cloud Operations Homelab project.

The project is currently in the planning stage before Ubuntu Server installation.