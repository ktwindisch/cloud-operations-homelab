# Metrics Inventory

## Purpose

This document tracks the metric areas that will be monitored during Phase 5.

The goal is to define what should be measured before installing monitoring tools.

## Host Metrics

| Metric Area | Example Signals | Why It Matters | Status |
|-------------|----------------|----------------|--------|
| CPU | Load average, CPU utilization, CPU frequency | Shows compute pressure | Available through Node Exporter |
| Memory | Used, available, cached, swap | Shows memory pressure | Available through Node Exporter |
| Disk | Filesystem usage and growth | Helps prevent full disk issues | Available through Node Exporter |
| Network | Interface traffic and reachability | Shows connectivity and traffic patterns | Available through Node Exporter |
| Uptime | System boot time and uptime behavior | Helps confirm stability | Available through Node Exporter |

## Service Metrics

| Service | Example Signals | Why It Matters | Status |
|---------|----------------|----------------|--------|
| Nginx | HTTP availability, response status | Confirms web service access | Complete |
| Docker | Running containers, restarts, resource usage | Confirms container service behavior | Complete |
| SSH | Service active state and reachability | Confirms remote administration access | Planned |

### Docker and Container Metrics

- `container_last_seen`
- `container_cpu_usage_seconds_total`
- `container_memory_working_set_bytes`
- `container_network_receive_bytes_total`
- `container_network_transmit_bytes_total`
- `container_fs_reads_bytes_total`
- `container_fs_writes_bytes_total`

### Nginx HTTP Availability Metrics

- `probe_success`
- `probe_http_status_code`
- `probe_duration_seconds`

### Verified PromQL Queries

cAdvisor target health:

```promql
up{job="cadvisor"}
```

Nginx container memory:

```promql
container_memory_working_set_bytes{name="nginx-compose"}
```

Nginx container CPU:

```promql
rate(container_cpu_usage_seconds_total{name="nginx-compose",cpu="total"}[5m]) * 100
```

Nginx HTTP probe success:

```promql
probe_success{job="blackbox_nginx"}
```

Nginx HTTP response status:

```promql
probe_http_status_code{job="blackbox_nginx"}
```

## Baseline Commands

The current manual baseline can be checked with:

```bash
uptime
free -h
df -h /
hostname -I
systemctl status ssh --no-pager
docker ps
docker compose ps
curl -I http://localhost:8080

## Current Status

Metrics have been identified.

A pre-monitoring baseline has been captured for atlas, SSH, Docker, Nginx, container resource usage, and listening ports.

Node Exporter is exposing Linux host metrics from atlas on port `9100`.

Prometheus is scraping Node Exporter and Prometheus itself.

Prometheus queries have been verified for host identity, uptime, CPU usage, memory usage, disk usage, target health, and scrape duration.

Grafana has not been installed yet.