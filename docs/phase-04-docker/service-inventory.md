# Service Inventory

## Purpose

This document tracks Docker services created during Phase 4.

Each service should have a clear purpose, known ports, a documented location, and a tested status.

## Service Inventory

| Service | Location | Host Port | Container Port | Purpose | Status |
|---------|----------|-----------|----------------|---------|--------|
| Nginx test container | Manual Docker run | 8080 | 80 | Initial containerized web service test | Complete |
| Nginx Compose service | `docker/nginx/docker-compose.yml` | 8080 | 80 | Repeatable Nginx service using Docker Compose | Planned |
| Custom static page | `docker/nginx/html/index.html` | 8080 | 80 | Serve a homelab web page from Nginx | Complete |

## Completion Criteria

A Docker service is considered complete when:

- The service has a clear purpose
- The service runs on atlas
- The container status has been verified
- Logs have been reviewed
- Network access has been tested where applicable
- The service is documented
- The configuration is committed to GitHub if applicable

## Current Status

No Docker services have been completed yet.