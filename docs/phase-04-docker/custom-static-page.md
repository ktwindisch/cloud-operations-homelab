# Custom Nginx Static Page

## Purpose

This document records the custom Nginx static page test for Phase 4 Docker Services.

The goal was to replace the default Nginx welcome page with a custom Cloud Operations Homelab page served from atlas through a Docker container.

## Service Details

| Item | Value |
|------|-------|
| Server | atlas |
| Container name | `nginx-custom` |
| Image | `nginx:alpine` |
| Host port | 8080 |
| Container port | 80 |
| Local content path on workstation | `docker/nginx/html/index.html` |
| Content path on atlas | `/home/kevin/nginx-html` |
| Container content path | `/usr/share/nginx/html` |

## Static Page File

The custom page was created in the repository at:

```text
docker/nginx/html/index.html
```

The page identifies the service as part of the Cloud Operations Homelab and includes the current Docker service details.

## Copying the Static Page to atlas

The static page folder was copied from the Windows workstation to atlas:

```bash
scp -r docker/nginx/html atlas:~/nginx-html
```

## Removing the Previous Test Container

The previous default Nginx test container used port `8080`.

It was removed before starting the custom container:

```bash
docker rm -f nginx-test
```

## Running the Custom Nginx Container

The custom Nginx container was started with a bind mount:

```bash
docker run --name nginx-custom -d -p 8080:80 -v /home/kevin/nginx-html:/usr/share/nginx/html:ro nginx:alpine
```

## Bind Mount Explanation

This bind mount was used:

```text
/home/kevin/nginx-html:/usr/share/nginx/html:ro
```

This means:

| Part | Meaning |
|------|---------|
| `/home/kevin/nginx-html` | Host directory on atlas |
| `/usr/share/nginx/html` | Nginx web root inside the container |
| `ro` | Read-only mount |

The container reads the static site files from the host directory and serves them through Nginx.

## Container Verification

The container was verified with:

```bash
docker ps --filter name=nginx-custom
```

Result:

```text
CONTAINER ID   IMAGE          STATUS         PORTS                                     NAMES
7636bf0d9f5b   nginx:alpine   Up 2 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   nginx-custom
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

## Content Verification

The custom page content was verified with:

```bash
curl http://localhost:8080 | grep "Cloud Operations Homelab"
```

Result:

```text
Cloud Operations Homelab
Cloud Operations Homelab
```

## Workstation Browser Test

The custom page was successfully reached from the Windows workstation at:

```text
http://192.168.1.191:8080
```

The Nginx logs showed a successful browser request from:

```text
192.168.1.192
```

with HTTP status:

```text
200
```

## Favicon Note

The browser requested:

```text
/favicon.ico
```

Nginx returned a `404` because no custom favicon exists yet.

This was expected behavior and not a service failure.

## Result

The custom Nginx static page was successfully served from a Docker container on atlas.

The service was reachable from both atlas and the Windows workstation.

## Current Status

Phase 4.5 is complete.

Next step: convert the Nginx service to Docker Compose.