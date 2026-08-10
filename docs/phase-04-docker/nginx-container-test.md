# Nginx Container Test

## Purpose

This document records the first Nginx container test on atlas.

The goal was to run a lightweight web service container, expose it over a host port, and confirm that it could be reached from the Windows workstation.

## Container Details

| Item | Value |
|------|-------|
| Server | atlas |
| Image | `nginx:alpine` |
| Container name | `nginx-test` |
| Host port | 8080 |
| Container port | 80 |
| Access URL | `http://192.168.1.191:8080` |

## Command Used

```bash
docker run --name nginx-test -d -p 8080:80 nginx:alpine
```

## Port Mapping

The container was started with this port mapping:

```text
0.0.0.0:8080->80/tcp
[::]:8080->80/tcp
```

This means port `8080` on atlas forwards traffic to port `80` inside the Nginx container.

## Container Verification

The container was verified with:

```bash
docker ps --filter name=nginx-test
```

Result:

```text
CONTAINER ID   IMAGE          STATUS         PORTS                                     NAMES
d00ed9c48023   nginx:alpine   Up 5 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   nginx-test
```

## Local Curl Test

The service was tested locally from atlas:

```bash
curl -I http://localhost:8080
```

Result:

```text
HTTP/1.1 200 OK
Server: nginx/1.31.3
Content-Type: text/html
Content-Length: 896
```

## Workstation Browser Test

The Nginx welcome page was successfully reached from the Windows workstation at:

```text
http://192.168.1.191:8080
```

This confirmed that the containerized service was reachable across the local network.

## IP Address Notes

The atlas IP address was confirmed with:

```bash
hostname -I
```

Relevant IPv4 addresses:

```text
192.168.1.191
172.17.0.1
```

`192.168.1.191` is the LAN address used by the Windows workstation.

`172.17.0.1` is the Docker bridge network address.

## Logs Reviewed

Nginx logs were reviewed with:

```bash
docker logs nginx-test --tail 20
```

The logs showed successful requests from:

```text
172.17.0.1
192.168.1.192
192.168.1.191
```

The `192.168.1.192` entry confirmed browser access from the Windows workstation.

## Favicon Note

The browser requested:

```text
/favicon.ico
```

Nginx returned a `404` for that file because the default Nginx container does not include a custom favicon.

This was expected behavior and not a container failure.

## Result

The Nginx container started successfully, exposed port `8080`, returned `HTTP/1.1 200 OK`, and was reachable from the Windows workstation.

## Current Status

The Nginx test container is working.

Phase 4.4 is complete.