# Baseline Monitoring Snapshot

## Purpose

This document records the baseline state of atlas before installing monitoring tools.

The goal is to capture host, service, Docker, and Nginx status before adding Node Exporter, Prometheus, or Grafana.

This gives Phase 5 a clear before-monitoring snapshot.

## Snapshot Time

| Item | Value |
|------|-------|
| Timestamp | Fri Sep 11 13:13:29 UTC 2026 |
| Phase | Phase 5.2 |
| Server | atlas |
| User | kevin |

## Host Identity

| Item | Value |
|------|-------|
| Hostname | atlas |
| Operating system | Ubuntu 26.04 LTS |
| Kernel | Linux 7.0.0-31-generic |
| Architecture | x86-64 |
| Hardware vendor | Lenovo |
| Hardware model | ThinkPad T530 |
| Chassis | laptop |

## Uptime and Load

Command:

```bash
uptime
```

Result:

```text
13:13:29 up 4 min,  2 users,  load average: 0.08, 0.24, 0.13
```

The system had recently booted and was under very low load.

## Memory Baseline

Command:

```bash
free -h
```

Result:

```text
               total        used        free      shared  buff/cache   available
Mem:            14Gi       610Mi        13Gi       9.6Mi       764Mi        14Gi
Swap:          4.0Gi          0B       4.0Gi
```

Memory was healthy at baseline.

Swap usage was `0B`.

## Disk Baseline

Command:

```bash
df -h /
```

Result:

```text
Filesystem                         Size  Used Avail Use% Mounted on
/dev/mapper/ubuntu--vg-ubuntu--lv   98G  8.1G   85G   9% /
```

Root disk usage was low at `9%`.

## Block Devices

Command:

```bash
lsblk
```

Result:

```text
NAME                      MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda                         8:0    0 238.5G  0 disk
├─sda1                      8:1    0     1M  0 part
├─sda2                      8:2    0     2G  0 part /boot
└─sda3                      8:3    0 236.5G  0 part
  └─ubuntu--vg-ubuntu--lv 252:0    0   100G  0 lvm  /
sr0                        11:0    1  1024M  0 rom
```

## IP Address Baseline

Command:

```bash
hostname -I
```

Relevant addresses:

```text
192.168.1.191
172.18.0.1
172.17.0.1
```

Notes:

| Address | Purpose |
|---------|---------|
| `192.168.1.191` | atlas LAN address |
| `172.18.0.1` | Docker Compose bridge network address |
| `172.17.0.1` | default Docker bridge address |

## SSH Service Baseline

Commands:

```bash
systemctl is-active ssh
systemctl is-enabled ssh
systemctl status ssh --no-pager
```

Results:

```text
active
disabled
```

The SSH service was active and running.

The service unit showed:

```text
TriggeredBy: ssh.socket
```

This means SSH is active through socket-based behavior.

SSH was listening on:

```text
0.0.0.0 port 22
:: port 22
```

A public key login from the Windows workstation was also recorded:

```text
Accepted publickey for kevin from 192.168.1.192
```

## Docker Version Baseline

Commands:

```bash
docker --version
docker compose version
```

Results:

```text
Docker version 29.7.2, build a7dcaa6
Docker Compose version v5.4.0
```

## Docker Service Baseline

Commands:

```bash
systemctl is-active docker
systemctl is-enabled docker
systemctl status docker --no-pager
```

Results:

```text
active
enabled
```

Docker was active and enabled.

Docker was also proxying traffic for the Nginx service on port `8080`.

## Running Docker Containers

Command:

```bash
docker ps
```

Result:

```text
CONTAINER ID   IMAGE          STATUS         PORTS                                     NAMES
05fbaf183b7d   nginx:alpine   Up 2 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   nginx-compose
```

The Nginx Compose container was running and exposing port `8080`.

## Docker Images

Command:

```bash
docker images
```

Images present:

```text
hello-world:latest
nginx:alpine
```

The `nginx:alpine` image was in use.

## Docker Networks

Command:

```bash
docker network ls
```

Networks present:

```text
bridge
docker-nginx_default
host
none
```

The `docker-nginx_default` network was created by Docker Compose for the Nginx service.

## Nginx Compose Service Baseline

Commands:

```bash
cd ~/docker-nginx
docker compose ps
```

Result:

```text
NAME            IMAGE          SERVICE   STATUS         PORTS
nginx-compose   nginx:alpine   nginx     Up 2 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp
```

The Compose-managed Nginx service was running successfully.

## Nginx HTTP Baseline

Command:

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

The Nginx service returned a successful HTTP response.

## Nginx Content Baseline

Command:

```bash
curl http://localhost:8080 | grep "Cloud Operations Homelab"
```

Result:

```text
<title>Cloud Operations Homelab</title>
<h1>Cloud Operations Homelab</h1>
```

The custom Cloud Operations Homelab page was being served correctly.

## Nginx Container Resource Snapshot

Command:

```bash
docker stats nginx-compose --no-stream
```

Result:

```text
CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O         PIDS
05fbaf183b7d   nginx-compose   0.00%     12.16MiB / 14.82GiB   0.08%     2.52kB / 3.96kB   14.9MB / 8.19kB   5
```

At baseline, the Nginx container was using very little CPU and memory.

## Listening Ports Baseline

Command:

```bash
ss -tuln | grep -E ':22|:8080|:9090|:9100|:3000' || true
```

Result:

```text
tcp   LISTEN 0      4096                              0.0.0.0:8080      0.0.0.0:*
tcp   LISTEN 0      4096                              0.0.0.0:22        0.0.0.0:*
tcp   LISTEN 0      4096                                 [::]:8080         [::]:*
tcp   LISTEN 0      4096                                 [::]:22           [::]:*
```

Observed listening ports:

| Port | Purpose | Status |
|------|---------|--------|
| 22 | SSH | Listening |
| 8080 | Nginx Docker service | Listening |
| 9090 | Prometheus | Not listening |
| 9100 | Node Exporter | Not listening |
| 3000 | Grafana | Not listening |

This confirms that the monitoring stack was not installed yet at the time of baseline capture.

## Baseline Summary

At the start of Phase 5.2:

- atlas was online
- SSH was active and reachable
- Docker was active and enabled
- the Nginx Compose service was running
- the custom static page returned `HTTP/1.1 200 OK`
- Docker container resource usage was low
- ports `22` and `8080` were listening
- monitoring ports `9090`, `9100`, and `3000` were not listening yet

## Result

The current monitoring baseline was captured successfully before installing Node Exporter, Prometheus, or Grafana.

## Current Status

Phase 5.2 is complete.

Next step: install and verify Node Exporter.