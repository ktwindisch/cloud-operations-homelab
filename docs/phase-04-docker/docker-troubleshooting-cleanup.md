# Docker Troubleshooting and Cleanup

## Purpose

This document records basic Docker troubleshooting and cleanup commands used during Phase 4.

The goal was to inspect Docker state, review the running Compose-managed Nginx service, clean up safely, and confirm that the service remained available afterward.

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

## Docker State Commands

The current Docker state was reviewed with:

```bash
docker ps
docker ps -a
docker images
docker network ls
docker volume ls
```

## Running Container

The active container was:

```text
CONTAINER ID   IMAGE          STATUS          PORTS                                     NAMES
05fbaf183b7d   nginx:alpine   Up 19 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   nginx-compose
```

This confirmed that the Compose-managed Nginx service was running and exposing port `8080`.

## Images

Docker images on atlas included:

```text
hello-world:latest
nginx:alpine
```

The `nginx:alpine` image was in use by the running Compose service.

## Networks

Docker networks included:

```text
bridge
docker-nginx_default
host
none
```

The `docker-nginx_default` network was created by Docker Compose for the Nginx service.

## Volumes

No Docker volumes were listed.

The Nginx service uses a bind mount for static content instead of a named Docker volume.

## Container Inspection

The running container was inspected with:

```bash
docker inspect --format 'Status: {{.State.Status}}' nginx-compose
docker inspect --format 'Restart policy: {{.HostConfig.RestartPolicy.Name}}' nginx-compose
```

Results:

```text
Status: running
Restart policy: unless-stopped
```

This confirmed that the service was running and configured with the expected restart policy.

## Resource Usage

A resource usage snapshot was captured with:

```bash
docker stats nginx-compose --no-stream
```

Result:

```text
NAME            CPU %     MEM USAGE / LIMIT     MEM %     PIDS
nginx-compose   0.00%     12.12MiB / 14.82GiB   0.08%     5
```

This showed that the Nginx service was using very little CPU and memory.

## Stopped Container Check

Stopped containers were checked with:

```bash
docker ps -a --filter status=exited
```

No stopped containers were listed.

## Safe Cleanup

Stopped containers were safely pruned with:

```bash
docker container prune -f
```

Result:

```text
Total reclaimed space: 0B
```

This was expected because there were no stopped containers to remove.

## Cleanup Safety Note

Only stopped containers were pruned.

The following command was intentionally not used:

```bash
docker system prune -a
```

That command is more aggressive and can remove unused images and other Docker resources.

For this phase, stopped container cleanup was the safer operational choice.

## Post-Cleanup Verification

After cleanup, all containers were checked again:

```bash
docker ps -a
```

The running Compose service remained active:

```text
nginx-compose
0.0.0.0:8080->80/tcp
```

The Compose service was also checked with:

```bash
docker compose ps
```

Result:

```text
NAME            IMAGE          SERVICE   STATUS          PORTS
nginx-compose   nginx:alpine   nginx     Up              0.0.0.0:8080->80/tcp, [::]:8080->80/tcp
```

## HTTP Test After Cleanup

The service was tested after cleanup:

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

## Content Test After Cleanup

The custom page content was verified after cleanup:

```bash
curl http://localhost:8080 | grep "Cloud Operations Homelab"
```

Result:

```text
<title>Cloud Operations Homelab</title>
<h1>Cloud Operations Homelab</h1>
```

## Workstation Browser Test

The custom page continued to load from the Windows workstation after cleanup.

This confirmed that safe cleanup did not interrupt the running Compose service.

## Result

Docker state was inspected, the running Compose service was reviewed, stopped container cleanup was performed safely, and the Nginx service remained available afterward.

## Current Status

Phase 4.8 is complete.

Next step: complete the Phase 4 summary and tag the milestone.