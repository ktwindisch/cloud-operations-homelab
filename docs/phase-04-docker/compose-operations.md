# Docker Compose Operations

## Purpose

This document records basic Docker Compose service management for the Nginx service running on atlas.

The goal was to verify that the Compose-managed service could be inspected, restarted, stopped, removed, recreated, and recovered successfully.

## Service Details

| Item | Value |
|------|-------|
| Server | atlas |
| Compose project path | `/home/kevin/docker-nginx` |
| Service name | `nginx` |
| Container name | `nginx-compose` |
| Image | `nginx:alpine` |
| Host port | 8080 |
| Container port | 80 |
| Access URL | `http://192.168.1.191:8080` |

## Commands Tested

The following Docker Compose operations were tested:

```bash
docker compose ps
docker compose logs --tail 20
docker compose restart
docker compose down
docker compose up -d
```

The service was also tested with:

```bash
curl -I http://localhost:8080
curl http://localhost:8080 | grep "Cloud Operations Homelab"
```

## Service Status Check

The Compose service was checked with:

```bash
docker compose ps
```

Result:

```text
NAME            IMAGE          SERVICE   STATUS              PORTS
nginx-compose   nginx:alpine   nginx     Up                  0.0.0.0:8080->80/tcp, [::]:8080->80/tcp
```

This confirmed that the Compose service was running and exposing port `8080`.

## Log Review

Logs were reviewed with:

```bash
docker compose logs --tail 20
```

The logs showed successful HTTP requests from:

```text
172.18.0.1
192.168.1.192
```

The `192.168.1.192` entry confirmed browser access from the Windows workstation.

## HTTP Test Before Restart

The service was tested before restart:

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

## Restart Test

The Compose service was restarted with:

```bash
docker compose restart
```

This tested a controlled restart of the running service.

## Controlled Shutdown Test

The Compose service was stopped and removed with:

```bash
docker compose down
```

Result:

```text
Container nginx-compose Removed
Network docker-nginx_default Removed
```

This confirmed that Compose removed both the service container and the project network.

## Expected Failure While Down

After the service was brought down, the HTTP endpoint was tested:

```bash
curl -I --max-time 5 http://localhost:8080 || echo "Expected failure: service is down"
```

Result:

```text
curl: (7) Failed to connect to localhost port 8080
Expected failure: service is down
```

This confirmed that port `8080` depended on the Compose service being active.

## Recovery Test

The service was recreated with:

```bash
docker compose up -d
```

Result:

```text
Network docker-nginx_default Created
Container nginx-compose Started
```

The service was then checked again:

```bash
docker compose ps
```

Result:

```text
NAME            IMAGE          SERVICE   STATUS                  PORTS
nginx-compose   nginx:alpine   nginx     Up                      0.0.0.0:8080->80/tcp, [::]:8080->80/tcp
```

## HTTP Test After Recovery

The recovered service returned a successful response:

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

## Content Verification After Recovery

The custom static page was verified after recovery:

```bash
curl http://localhost:8080 | grep "Cloud Operations Homelab"
```

Result:

```text
<title>Cloud Operations Homelab</title>
<h1>Cloud Operations Homelab</h1>
```

## Workstation Browser Recovery Test

After the Compose service was recreated, the custom page still loaded from the Windows workstation at:

```text
http://192.168.1.191:8080
```

This confirmed successful service recovery across the local network.

## Operational Notes

`docker compose ps` is useful for checking service state.

`docker compose logs` is useful for reviewing service startup messages, access logs, and errors.

`docker compose restart` performs a controlled restart without rewriting the Compose file.

`docker compose down` removes the running container and the Compose-created network.

`docker compose up -d` recreates the service in detached mode.

## Result

The Nginx Compose service was successfully managed through basic operational commands.

The service was restarted, stopped, removed, recreated, and verified after recovery.

## Current Status

Phase 4.7 is complete.

Next step: document basic Docker troubleshooting and cleanup commands.