# Node Exporter Installation

## Purpose

This document records the Node Exporter installation and verification for Phase 5 Monitoring and Observability.

Node Exporter was installed on atlas to expose Linux host metrics for Prometheus.

## Service Details

| Item | Value |
|------|-------|
| Server | atlas |
| Operating system | Ubuntu 26.04 LTS |
| Exporter | Node Exporter |
| Version | 1.12.1 |
| Install path | `/usr/local/bin/node_exporter` |
| Service user | `node_exporter` |
| Service name | `node_exporter` |
| Metrics endpoint | `http://localhost:9100/metrics` |
| Port | 9100 |

## Version Verification

Command:

```bash
/usr/local/bin/node_exporter --version
```

Result:

```text
node_exporter, version 1.12.1
platform: linux/amd64
```

## Systemd Service State

Commands:

```bash
systemctl is-active node_exporter
systemctl is-enabled node_exporter
systemctl status node_exporter --no-pager
```

Results:

```text
active
enabled
```

The service was running as:

```text
/usr/local/bin/node_exporter
```

## Service Resource Usage

The systemd status output showed low resource usage:

```text
Memory: 7.2M
Tasks: 5
```

## Port Verification

Command:

```bash
ss -tuln | grep ':9100'
```

Result:

```text
tcp   LISTEN 0      4096                                    *:9100            *:*
```

This confirmed that Node Exporter was listening on port `9100`.

## Metrics Endpoint Verification

Command:

```bash
curl -I http://localhost:9100/metrics
```

Result:

```text
HTTP/1.1 200 OK
Content-Type: text/plain; version=0.0.4; charset=utf-8; escaping=underscores
```

This confirmed that the metrics endpoint was reachable.

## Metrics Snapshot

A metrics snapshot was saved with:

```bash
curl -s http://localhost:9100/metrics -o /tmp/node-exporter-metrics.txt
```

The first metrics lines showed Go runtime metrics:

```text
go_gc_duration_seconds
go_gc_gogc_percent
go_gc_gomemlimit_bytes
go_goroutines
go_info
```

## Node Metrics Verification

Node-specific metrics were verified with:

```bash
grep '^node_' /tmp/node-exporter-metrics.txt | head -n 20
```

Example metrics included:

```text
node_arp_entries
node_boot_time_seconds
node_context_switches_total
node_cpu_core_throttles_total
node_cpu_frequency_avg_hertz
```

This confirmed that Linux host metrics were being exposed.

## Monitoring Ports After Installation

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
tcp   LISTEN 0      4096                                    *:9100            *:*
```

Observed ports:

| Port | Purpose | Status |
|------|---------|--------|
| 22 | SSH | Listening |
| 8080 | Nginx Docker service | Listening |
| 9100 | Node Exporter | Listening |
| 9090 | Prometheus | Not listening yet |
| 3000 | Grafana | Not listening yet |

## Broken Pipe Note

During an earlier metrics test, output was piped directly from `curl` into `head`.

That caused `curl` to stop writing when `head` closed the pipe after the first 20 lines.

Node Exporter logged broken pipe messages from that test.

This was not a Node Exporter failure because:

- the service remained active
- the service remained enabled
- port `9100` was listening
- `/metrics` returned `HTTP/1.1 200 OK`
- `node_*` metrics were visible

## Result

Node Exporter was installed, enabled, started, and verified successfully.

Atlas is now exposing Linux host metrics on port `9100`.

## Current Status

Phase 5.3 is complete.

Next step: install and configure Prometheus.