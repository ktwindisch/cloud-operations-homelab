# Docker Services

This folder contains Docker-related files for the Cloud Operations Homelab.

Phase 4 focuses on running containerized services on atlas.

The goal is to learn how to install Docker, run containers, expose services over ports, use Docker Compose, inspect logs, troubleshoot containers, and document repeatable service deployments.

## Planned Structure

```text
docker/
├── README.md
└── nginx/
    ├── docker-compose.yml
    └── html/
        └── index.html
```

## Planned Services

| Service | Purpose | Status |
|---------|---------|--------|
| Nginx | Initial web service container test | Planned |
| Custom Nginx static page | Serve a simple homelab web page | Planned |
| Docker Compose service | Manage the Nginx service using Compose | Planned |

## Phase 4 Goals

The Docker services in this folder should demonstrate:

- Docker Engine installation
- Docker Compose usage
- Container lifecycle management
- Port mapping
- Basic service exposure
- Bind mounts
- Logs and troubleshooting
- Repeatable service definitions

## Current Status

Phase 4 Docker Services structure has been created.

Docker has not been installed yet.