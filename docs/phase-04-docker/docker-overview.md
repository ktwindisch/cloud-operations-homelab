# Docker Overview

## Purpose

Phase 4 introduces Docker Services to the Cloud Operations Homelab.

The goal is to move from Linux server automation into running containerized services on atlas.

## Why Docker Matters

Docker allows applications and services to run in isolated containers.

A container packages the application runtime, dependencies, and process environment while still depending on the host system for CPU, memory, networking, storage, and kernel-level resources.

## What This Phase Builds On

Phase 4 builds on the previous milestones:

| Phase | Foundation |
|-------|------------|
| Phase 1 | Ubuntu Server installed on atlas |
| Phase 2 | SSH remote administration configured |
| Phase 3 | Bash automation scripts created |

Because atlas is now installed, remotely accessible, and supported by basic automation scripts, it is ready to run containerized services.

## Skills Practiced

This phase will practice:

- Docker installation
- Docker service management
- Image pulls
- Container creation
- Container lifecycle commands
- Port mapping
- Bind mounts
- Docker Compose
- Container logs
- Troubleshooting failed containers
- Documenting repeatable service deployment

## Planned First Service

The first planned containerized service is Nginx.

Nginx will be used because it is lightweight, easy to test, and useful for learning container networking and web service exposure.

## Engineering Approach

Each service will follow the same process:

1. Define the service purpose
2. Run a simple container test
3. Verify the container is running
4. Test network access from the workstation
5. Review logs
6. Stop and remove test containers cleanly
7. Convert manual commands into Docker Compose where appropriate
8. Document the behavior and troubleshooting notes
9. Commit the work to GitHub

## Current Status

Phase 4 planning has started.

Docker has not been installed yet.