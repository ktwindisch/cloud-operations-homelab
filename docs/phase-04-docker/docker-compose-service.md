# Docker Compose Nginx Service

## Purpose

This document records the Docker Compose deployment for the Nginx service in Phase 4.

The goal was to replace the manual `docker run` command with a repeatable Docker Compose configuration.

## Why Docker Compose Was Added

The first Nginx containers were started manually with `docker run`.

That worked, but the full command included the image, container name, port mapping, bind mount, and runtime options.

Docker Compose moves those settings into a version-controlled YAML file so the service can be started, stopped, reviewed, and recreated more consistently.

## Compose File Location

The Compose file was created in the repository at:

```text
docker/nginx/docker-compose.yml
```

## Compose Configuration

```yaml
services:
  nginx:
    image: nginx:alpine
    container_name: nginx-compose
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html:ro
    restart: unless-stopped
```

## Service Details

| Item | Value |
|------|-------|
| Server | atlas |
| Compose project path on atlas | `/home/kevin/docker-nginx` |
| Service name | `nginx` |
| Container name | `nginx-compose` |
| Image | `nginx:alpine` |
| Host port | 8080 |
| Container port | 80 |
| Static content path | `./html` |
| Container web root | `/usr/share/nginx/html` |
| Restart policy | `unless-stopped` |

## Copying the Compose Project to atlas

The Compose project was copied to atlas:

```bash
ssh atlas "mkdir -p ~/docker-nginx"
scp docker/nginx/docker-compose.yml atlas:~/docker-nginx/docker-compose.yml
scp -r docker/nginx/html atlas:~/docker-nginx/html
```

## Removing the Manual Container

The previous manual custom Nginx container was removed because it was already using port `8080`:

```bash
docker rm -f nginx-custom
```

## Starting the Compose Service

The Compose service was started from the project directory on atlas:

```bash
cd ~/docker-nginx
docker compose up -d
```

## Compose Verification

The service was verified with:

```bash
docker compose ps
```

Result:

```text
NAME            IMAGE          SERVICE   STATUS          PORTS
nginx-compose   nginx:alpine   nginx     Up              0.0.0.0:8080->80/tcp, [::]:8080->80/tcp
```

The running container was also verified with:

```bash
docker ps --filter name=nginx-compose
```

Result:

```text
CONTAINER ID   IMAGE          STATUS          PORTS                                     NAMES
43bf1836b518   nginx:alpine   Up              0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   nginx-compose
```

## Local HTTP Test

The service was tested locally from atlas:

```bash
curl -I http://localhost:8080
```

Result:

```text
HTTP/1.1 200 OK
Server: nginx/1.31.3
Content-Type: text/html
Content-Length: 2709
```

## Custom Content Verification

The custom page content was verified with:

```bash
curl http://localhost:8080 | grep "Cloud Operations Homelab"
```

Result:

```text
<title>Cloud Operations Homelab</title>
<h1>Cloud Operations Homelab</h1>
```

## Workstation Browser Test

The custom page was successfully reached from the Windows workstation at:

```text
http://192.168.1.191:8080
```

This confirmed that the Docker Compose service was reachable across the local network.

## Result

The Nginx service was successfully converted from a manual Docker run command to a Docker Compose service.

The Compose service started successfully, served the custom static page, returned `HTTP/1.1 200 OK`, and was reachable from the Windows workstation.

## Current Status

Phase 4.6 is complete.

Next step: document Compose operations and basic service management commands.