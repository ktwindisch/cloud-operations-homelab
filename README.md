# Cloud Operations Homelab

**Status:** Active  
**Current Phase:** Phase 1 Complete: Ubuntu Server Foundation  
**Primary Hardware:** Lenovo ThinkPad T530  
**Primary Goal:** Build a production-inspired Linux server environment for Cloud and DevOps engineering practice.

## Overview

Cloud Operations Homelab is a long-term engineering project focused on transforming a repurposed Lenovo ThinkPad T530 into a headless Ubuntu Server environment.

This project is being built to develop practical skills in Linux administration, remote server management, automation, containerization, monitoring, Infrastructure as Code, CI/CD, and cloud engineering.

This repository is not meant to be a collection of completed tutorials. It is a transparent engineering journal that documents the design, implementation, failures, troubleshooting, and continuous improvement of a real homelab environment.

## Why This Project Exists

This project exists to build practical DevOps and cloud engineering experience through hands-on infrastructure work.

The goal is to move beyond passive learning and create a system that can be installed, configured, secured, automated, monitored, and eventually mirrored in the cloud.

This homelab will grow over time. Each phase will introduce new infrastructure concepts and each change will be documented.

## Why This Machine

This Lenovo ThinkPad T530 was the laptop I used while studying at night after working full-time as a security officer. It helped me build the skills that led to my first technology role as a Salesforce Administrator.

After sitting unused for over a year, I am repurposing it as the foundation of my Cloud Operations Homelab.

The same laptop that helped me break into tech is now being used to help me transition deeper into Cloud and DevOps engineering.

## Project Objectives

The main objectives of this project are to:

- Build and administer a headless Ubuntu Server
- Manage the server remotely through SSH
- Practice Linux users, groups, permissions, logs, services, and firewalls
- Write Bash scripts for operational automation
- Run containerized services with Docker
- Monitor system and container health with Prometheus and Grafana
- Use Terraform to mirror parts of the lab in AWS
- Use GitHub Actions for CI/CD workflows
- Use Ansible for configuration management
- Document decisions, problems, fixes, and lessons learned

## Hardware

| Component | Details |
|----------|---------|
| Device | Lenovo ThinkPad T530 |
| CPU | Intel Core i7-3520M |
| Cores | 2 cores, 4 logical processors |
| Memory | 16 GB RAM |
| Storage | 238 GB SSD |
| Network | Wi-Fi |
| Planned OS | Ubuntu Server |
| Administration | Remote SSH only |

## Planned Architecture

The first version of the homelab will be simple:

```text
Windows Workstation
        |
        | SSH
        v
Lenovo ThinkPad T530
Ubuntu Server

```

As the project grows, the architecture will expand to include Docker, monitoring, automation, AWS, Terraform, CI/CD, and Ansible.

## Roadmap

| Phase | Focus | Status |
|------|-------|--------|
| Phase 0 | Project Foundation | Complete |
| Phase 1 | Ubuntu Server Installation | Complete |
| Phase 2 | SSH Remote Administration | Next |
| Phase 3 | Bash Automation | Not Started |
| Phase 4 | Docker Services | Not Started |
| Phase 5 | Monitoring and Observability | Not Started |
| Phase 6 | Terraform and AWS | Not Started |
| Phase 7 | GitHub Actions CI/CD | Not Started |
| Phase 8 | Ansible Configuration Management | Not Started |
| Phase 9 | Kubernetes Expansion | Future |

## Current System State

| Item | Value |
|------|-------|
| Server Name | atlas |
| Operating System | Ubuntu Server 26.04 LTS |
| Access Method | SSH from Windows workstation |
| Primary User | kevin |
| Initial IPv4 Address | 192.168.1.191 |
| SSH Status | Active and verified |
| System Updates | Completed |
| Current Milestone | Phase 1 Complete |

## Repository Structure

```text
cloud-operations-homelab/
|
├── README.md
├── CHANGELOG.md
├── .gitignore
|
├── architecture/
|   ├── adr/
|   └── diagrams/
|
├── docs/
|   ├── phase-00-planning/
|   └── phase-01-linux-foundation/
|
├── screenshots/
└── assets/
```

## Documentation

Project documentation is organized by phase.

### Phase 0: Planning

- Hardware baseline
- Server identity plan
- Backup checklist
- Ubuntu Server installation plan
- Network plan

### Phase 1: Linux Foundation

- Ubuntu Server installation results
- First login verification
- Remote SSH verification
- Baseline system information

## Documentation Philosophy

This repository documents more than finished results.

Each phase includes:

- What was built
- Why it was built
- Commands used
- Configuration decisions
- Problems encountered
- Troubleshooting steps
- Lessons learned
- Future improvements

The goal is not to appear perfect. The goal is to demonstrate growth as an engineer.

## Current Status

Phase 1 is complete.

atlas is now running Ubuntu Server and can be administered remotely from the Windows workstation using SSH.

Next phase:

Phase 2: SSH Remote Administration