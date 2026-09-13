# Prometheus Installation

## Purpose

This document records the Prometheus installation and verification for Phase 5 Monitoring and Observability.

Prometheus was installed on atlas to collect metrics from Node Exporter and from Prometheus itself.

## Service Details

| Item | Value |
|------|-------|
| Server | atlas |
| Operating system | Ubuntu 26.04 LTS |
| Prometheus version | 3.14.0 |
| Promtool version | 3.14.0 |
| Install path | `/usr/local/bin/prometheus` |
| Promtool path | `/usr/local/bin/promtool` |
| Config path | `/etc/prometheus/prometheus.yml` |
| Data path | `/var/lib/prometheus` |
| Service user | `prometheus` |
| Service name | `prometheus` |
| Web UI | `http://192.168.1.191:9090` |
| Targets page | `http://192.168.1.191:9090/targets` |
| Port | 9090 |

## Repository Configuration

A copy of the Prometheus configuration is tracked in the repository at:

```text
monitoring/prometheus/prometheus.yml
```

## Prometheus Configuration

```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]

  - job_name: "node_exporter"
    static_configs:
      - targets: ["localhost:9100"]
```

## Scrape Targets

| Job | Target | Purpose |
|-----|--------|---------|
| `prometheus` | `localhost:9090` | Scrape Prometheus internal metrics |
| `node_exporter` | `localhost:9100` | Scrape atlas Linux host metrics |

## Version Verification

Commands:

```bash
prometheus --version
promtool --version
```

Results:

```text
prometheus, version 3.14.0
promtool, version 3.14.0
platform: linux/amd64
```

## Config Validation

Command:

```bash
promtool check config /etc/prometheus/prometheus.yml
```

Result:

```text
SUCCESS: /etc/prometheus/prometheus.yml is valid prometheus config file syntax
```

## Systemd Service State

Commands:

```bash
systemctl is-active prometheus
systemctl is-enabled prometheus
systemctl status prometheus --no-pager
```

Results:

```text
active
enabled
```

The service was running as:

```text
/usr/local/bin/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/var/lib/prometheus --web.listen-address=0.0.0.0:9090
```

## Port Verification

Command:

```bash
ss -tuln | grep ':9090'
```

Result:

```text
tcp   LISTEN 0      4096                                    *:9090            *:*
```

This confirmed that Prometheus was listening on port `9090`.

## Readiness Check

Command:

```bash
curl -s http://localhost:9090/-/ready
```

Result:

```text
Prometheus Server is Ready.
```

## Web UI Check

Command:

```bash
curl -s -o /dev/null -w "HTTP status: %{http_code}\n" http://localhost:9090/
```

Result:

```text
HTTP status: 302
```

This confirmed that the Prometheus web endpoint was responding.

## Targets API Verification

Command:

```bash
curl -s http://localhost:9090/api/v1/targets
```

The API confirmed both configured scrape targets were healthy.

Observed targets:

```text
job: node_exporter
health: up

job: prometheus
health: up
```

This confirmed that Prometheus was scraping both Node Exporter and Prometheus itself.

## Monitoring Ports After Prometheus Installation

Command:

```bash
ss -tuln | grep -E ':22|:8080|:9090|:9100|:3000' || true
```

Result:

```text
tcp   LISTEN 0      4096                              0.0.0.0:22        0.0.0.0:*
tcp   LISTEN 0      4096                              0.0.0.0:8080      0.0.0.0:*
tcp   LISTEN 0      4096                                    *:9100            *:*
tcp   LISTEN 0      4096                                    *:9090            *:*
```

Observed ports:

| Port | Purpose | Status |
|------|---------|--------|
| 22 | SSH | Listening |
| 8080 | Nginx Docker service | Listening |
| 9100 | Node Exporter | Listening |
| 9090 | Prometheus | Listening |
| 3000 | Grafana | Not listening yet |

## Prometheus 3.x Console Note

During installation, older Prometheus install instructions referenced these directories:

```text
consoles
console_libraries
```

Those directories were not present in the Prometheus 3.14.0 Linux AMD64 tarball used in this phase.

The Prometheus systemd service was created without console template flags.

Prometheus started successfully without those flags.

## Result

Prometheus was installed, configured, enabled, started, and verified successfully.

Prometheus is now collecting metrics from:

- Prometheus itself
- Node Exporter on atlas

## Current Status

Phase 5.4 is complete.

Next step: query host metrics from Prometheus and confirm atlas metrics are usable.