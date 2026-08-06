# Docker Installation Notes

## Purpose

This document records the Docker installation and verification process for atlas.

Docker was installed as part of Phase 4: Docker Services.

The goal of this phase is to run containerized services on atlas and begin practicing repeatable application deployment.

## Installation Target

| Item | Value |
|------|-------|
| Server | atlas |
| Operating system | Ubuntu Server 26.04 LTS |
| User | kevin |
| Installation method | Docker apt repository |
| Phase | Phase 4.2 |

## Installed Components

The following Docker components were installed:

- Docker Engine
- Docker CLI
- containerd
- Docker Buildx plugin
- Docker Compose plugin

## Verification Commands

Docker was verified with:

```bash
docker --version
docker compose version
sudo systemctl status docker --no-pager
sudo docker run hello-world
```

## Verification Results

| Check | Result |
|------|--------|
| Docker Engine | Docker version 29.7.2 |
| Docker Compose | Docker Compose version v5.4.0 |
| Docker service | Active and running |
| hello-world test with sudo | Successful |
| hello-world test without sudo | Successful |

## Docker Service Status

The Docker service was confirmed as active:

```text
docker.service - Docker Application Container Engine
Active: active (running)
```

## Docker Group Access

After installation, Docker initially required `sudo`.

Running Docker without `sudo` returned a permission error when trying to connect to:

```text
unix:///var/run/docker.sock
```

The `kevin` user was then added to the `docker` group:

```bash
sudo usermod -aG docker kevin
```

After logging out and back in, group membership was verified:

```bash
groups
```

The output included:

```text
docker
```

Docker was then tested without `sudo`:

```bash
docker ps
docker run hello-world
```

Both commands worked successfully.

## Docker Group Security Note

Adding a user to the `docker` group gives that user permission to interact with the Docker daemon.

For this homelab, adding the `kevin` user to the Docker group was an intentional usability decision.

This allows Docker commands to be run without `sudo` during local homelab work.

## Test Container Result

The `hello-world` image was pulled and executed successfully.

This confirmed that:

- the Docker client can contact the Docker daemon
- the Docker daemon can pull an image
- a container can be created
- container output can be streamed back to the terminal

## Current Status

Docker Engine and Docker Compose are installed and working on atlas.

Docker can be run by the `kevin` user without `sudo`.

Phase 4.2 is complete.