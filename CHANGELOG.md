# Changelog

All notable changes to this project will be documented in this file.

This project uses version-style milestones to track progress over time.

## v5.0.0 - Monitoring and Observability

### Added

- Installed Node Exporter for Linux host metrics.
- Installed and configured Prometheus.
- Added Prometheus scrape targets for Node Exporter, cAdvisor, and Blackbox Exporter.
- Added cAdvisor for Docker container monitoring.
- Added Blackbox Exporter for Nginx HTTP availability monitoring.
- Installed and configured Grafana.
- Connected Grafana to Prometheus.
- Created the Atlas Host Overview dashboard.
- Created the Docker and Nginx Service Overview dashboard.
- Exported both Grafana dashboards as JSON for version control and reuse.
- Added monitoring health threshold documentation.
- Added the Phase 5 Monitoring and Observability summary.

### Changed

- Extended the Docker Compose configuration with cAdvisor.
- Extended Prometheus configuration with container and HTTP service monitoring.
- Updated monitoring documentation to reflect the completed observability stack.
- Added healthy, warning, and critical dashboard states.
- Updated Grafana dashboard exports after threshold and value mapping changes.

### Verified

- Verified Node Exporter metrics from atlas.
- Verified Prometheus and Node Exporter targets are healthy.
- Verified host CPU, memory, disk, uptime, and scrape metrics through PromQL.
- Verified cAdvisor detects the `nginx-compose` container.
- Verified Prometheus collects Nginx container CPU and memory metrics.
- Verified Blackbox Exporter reports `probe_success = 1`.
- Verified Nginx returns HTTP status `200`.
- Verified Grafana can query Prometheus through Explore.
- Verified Atlas Host Overview displays live host metrics.
- Verified Docker and Nginx Service Overview displays live container and HTTP metrics.
- Verified monitoring targets display healthy status.
- Verified dashboard health thresholds and value mappings.

### Notes

Phase 5 moves the homelab from manually checking system state to a centralized monitoring and observability model.

The project can now collect, query, visualize, and interpret Linux host health, Docker container behavior, and Nginx HTTP availability.

Next phase: Terraform and AWS.

## v4.0.0 - Docker Services

### Added

- Installed Docker Engine on atlas.
- Installed Docker Compose on atlas.
- Verified Docker with the `hello-world` test container.
- Added Phase 4 Docker documentation.
- Added a custom Nginx static page.
- Added a Docker Compose configuration for the Nginx service.
- Added Docker Compose operations documentation.
- Added Docker troubleshooting and cleanup documentation.
- Added the Phase 4 Docker Services summary.

### Changed

- Updated the Docker service inventory.
- Updated the Phase 4 plan to reflect completed Docker service work.
- Updated Docker documentation to reflect the Compose-managed Nginx service.

### Verified

- Verified Docker service status with `systemctl`.
- Verified Docker commands work without `sudo` for the `kevin` user.
- Verified Nginx port mapping from atlas port `8080` to container port `80`.
- Verified local HTTP access from atlas.
- Verified browser access from the Windows workstation.
- Verified custom static content served through Nginx.
- Verified Docker Compose service startup, restart, shutdown, and recovery.
- Verified safe cleanup of stopped containers without interrupting the running service.

## [3.0.0] Bash Automation

### Added

- Created `automation/` folder for Bash scripts
- Created Phase 3 Bash documentation folder
- Added `system-health.sh` for basic server health reporting
- Added `disk-check.sh` for root filesystem disk threshold checks
- Added `memory-check.sh` for available memory threshold checks
- Added `system-update.sh` for safe package update assistance
- Added `backup-home.sh` for timestamped backup archive creation and verification
- Added `.gitattributes` to keep shell scripts using Linux line endings
- Added script documentation for each Phase 3 automation script
- Added Phase 3 summary documentation

### Tested

- Verified `system-health.sh` on atlas
- Verified `disk-check.sh` on atlas with an 80% disk usage threshold
- Verified `memory-check.sh` on atlas with a 20% available memory threshold
- Verified `system-update.sh` on atlas with confirmation prompts
- Verified `backup-home.sh` on atlas with archive creation and verification

### Fixed

- Corrected a mistaken folder path typo involving `automnation` instead of `automation`
- Resolved Git Bash and Windows line ending concerns with `.gitattributes`
- Updated `system-update.sh` to use `PAGER=cat apt list --upgradable` so upgrade output prints without pausing in a pager

### Notes

Phase 3 moved the project from manual Linux administration toward repeatable operational automation.

The scripts are intentionally small, readable, and focused on real server administration tasks.

Completed scripts:

- `system-health.sh`
- `disk-check.sh`
- `memory-check.sh`
- `system-update.sh`
- `backup-home.sh`

Next phase: Docker Services.

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