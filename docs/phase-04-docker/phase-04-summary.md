# Phase 4 Summary: Docker Services

## Overview

Phase 4 introduced Docker services to the Cloud Operations Homelab.

The goal was to install Docker on atlas, run containerized services, expose a service over the local network, serve custom content, convert the service to Docker Compose, and practice basic service operations.

By the end of this phase, atlas was running a Docker Compose-managed Nginx service serving a custom Cloud Operations Homelab static page.

## Server

| Item | Value |
|------|-------|
| Server | atlas |
| Operating system | Ubuntu Server 26.04 LTS |
| User | kevin |
| Service | Nginx |
| Container image | `nginx:alpine` |
| Host port | 8080 |
| Container port | 80 |
| Access URL | `http://192.168.1.191:8080` |

## Completed Work

The following work was completed during Phase 4:

| Step | Task | Status |
|------|------|--------|
| 4.1 | Created Phase 4 folder structure and planning docs | Complete |
| 4.2 | Installed Docker Engine and Docker Compose on atlas | Complete |
| 4.3 | Ran the first Docker test container | Complete |
| 4.4 | Ran Nginx in Docker and tested port access | Complete |
| 4.5 | Created a custom Nginx static page | Complete |
| 4.6 | Converted the Nginx service to Docker Compose | Complete |
| 4.7 | Tested Compose operations and service recovery | Complete |
| 4.8 | Documented Docker troubleshooting and safe cleanup | Complete |
| 4.9 | Updated final Phase 4 documentation and tagged the milestone | Complete |

## Docker Installation

Docker Engine and Docker Compose were installed on atlas using the Docker apt repository.

Docker was verified with:

```bash
docker --version
docker compose version
sudo systemctl status docker --no-pager
docker run hello-world
```

Docker was also configured so the `kevin` user could run Docker commands without `sudo`.

## First Container Test

The `hello-world` container was used to confirm that Docker could:

- contact the Docker daemon
- pull an image
- create a container
- run container output in the terminal

This confirmed that the Docker installation was working.

## Nginx Container Test

An Nginx container was started manually with Docker and exposed on port `8080`.

The service was tested from atlas with:

```bash
curl -I http://localhost:8080
```

The service returned:

```text
HTTP/1.1 200 OK
```

The default Nginx page was also reached successfully from the Windows workstation.

## Custom Static Page

A custom Cloud Operations Homelab static page was created at:

```text
docker/nginx/html/index.html
```

The page was copied to atlas and served through Nginx using a bind mount.

The custom page was verified locally and from the Windows workstation.

## Docker Compose Service

The Nginx service was converted from a manual `docker run` command to Docker Compose.

The Compose file was added at:

```text
docker/nginx/docker-compose.yml
```

The service is managed with:

```bash
docker compose up -d
docker compose ps
docker compose logs
docker compose restart
docker compose down
```

## Operations Tested

Basic Docker Compose operations were tested, including:

- service status checks
- log review
- controlled restart
- controlled shutdown
- expected HTTP failure while down
- service recovery
- HTTP verification after recovery
- browser verification after recovery

## Troubleshooting and Cleanup

Docker troubleshooting and cleanup commands were tested, including:

```bash
docker ps
docker ps -a
docker images
docker network ls
docker volume ls
docker inspect
docker stats
docker container prune -f
```

Cleanup was limited to stopped containers.

The running Compose service remained available after cleanup.

## Final Service State

At the end of Phase 4, the Nginx Compose service was running successfully.

The custom Cloud Operations Homelab page loaded from:

```text
http://192.168.1.191:8080
```

The service returned:

```text
HTTP/1.1 200 OK
```

and served the custom static page content.

## Skills Demonstrated

Phase 4 demonstrated:

- Docker Engine installation
- Docker Compose installation
- Linux service verification with `systemctl`
- Docker group configuration
- container image pulling
- container execution
- port mapping
- bind mounts
- Nginx container deployment
- local network service testing
- Docker Compose service definition
- Compose service operations
- container logs
- controlled service restart
- controlled service shutdown
- service recovery
- Docker state inspection
- safe stopped-container cleanup
- Git-based documentation workflow

## Result

Phase 4 successfully added containerized services to the Cloud Operations Homelab.

The project now has a working Docker Compose-managed Nginx service running on atlas, serving custom content over the local network.

## Next Phase

Phase 5 will focus on monitoring and observability.

The next goal is to begin monitoring system and service behavior instead of only running services manually.