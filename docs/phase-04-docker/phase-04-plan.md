# Phase 4 Plan: Docker Services

## Goal

The goal of Phase 4 is to run and manage containerized services on atlas using Docker.

This phase introduces Docker Engine, Docker Compose, container lifecycle management, port mapping, logs, troubleshooting, and repeatable service definitions.

## Scope

Phase 4 will include:

- Docker installation on atlas
- Docker Compose verification
- Running a test container
- Running an Nginx container
- Exposing Nginx over a host port
- Testing access from the Windows workstation
- Creating a custom static page
- Managing the service with Docker Compose
- Reviewing container logs
- Documenting troubleshooting steps

## Out of Scope

The following items are not part of this phase:

- Kubernetes
- Terraform
- AWS infrastructure
- GitHub Actions deployment workflows
- Ansible configuration management
- Production-grade reverse proxy design
- Public internet exposure

Those topics are planned for later phases.

## Planned Work

| Step | Task | Status |
|------|------|--------|
| 4.1 | Create Phase 4 folder structure and planning docs | Complete |
| 4.2 | Install Docker Engine and Docker Compose on atlas | Complete |
| 4.3 | Run first Docker test container | Complete |
| 4.4 | Run Nginx container and test port access | Complete |
| 4.5 | Create custom Nginx static page | Not Started |
| 4.6 | Convert Nginx service to Docker Compose | Not Started |
| 4.7 | Review logs and troubleshoot container behavior | Not Started |
| 4.8 | Update README, CHANGELOG, and tag `v4.0.0` | Not Started |

## Success Criteria

Phase 4 will be complete when:

- Docker Engine is installed on atlas
- Docker Compose is working
- At least one container has been run successfully
- Nginx is running in a container
- Nginx is reachable from the Windows workstation
- A custom static page is served from a container
- A Docker Compose file is created and tested
- Container logs have been reviewed
- Troubleshooting notes have been documented
- README has been updated
- CHANGELOG has been updated
- The work has been committed and pushed
- A `v4.0.0` tag has been created

## Current Status

Docker Engine and Docker Compose have been installed and verified on atlas.

The `hello-world` test container ran successfully.

An Nginx test container was started with Docker, exposed on port `8080`, and verified from both atlas and the Windows workstation.

Next step: create a custom Nginx static page.