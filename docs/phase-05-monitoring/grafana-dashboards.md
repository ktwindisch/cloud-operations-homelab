# Grafana Monitoring Dashboards

## Purpose

This document records the Grafana dashboards created during Phase 5 of the Cloud Operations Homelab.

The dashboards provide visual monitoring for both the atlas host and the Docker-managed Nginx service.

## Atlas Host Overview

The Atlas Host Overview dashboard provides a high-level view of system health.

Panels include:

- CPU Usage
- Memory Usage
- Root Disk Usage
- System Uptime
- Monitoring Target Health

The Monitoring Target Health panel uses the Prometheus `up` metric to display the current status of:

- Prometheus
- Node Exporter
- cAdvisor
- Blackbox Exporter

During verification, all four targets returned a value of `1`.

## Docker and Nginx Service Overview

The Docker and Nginx Service Overview dashboard focuses on container behavior and HTTP service availability.

Panels include:

- Container CPU
- Container Memory
- Container Last Seen
- HTTP Availability
- HTTP Status Code
- HTTP Probe Duration

During verification, the dashboard showed approximately:

```text
Container CPU: 0.00%
Container Memory: 11.6 MiB
Container Last Seen: 1.0 second
HTTP Availability: 1
HTTP Status Code: 200
HTTP Probe Duration: approximately 2 ms
```

These values confirmed that the Nginx container was visible through cAdvisor and that the web service was responding successfully through Blackbox Exporter.

## Dashboard Exports

Both dashboards were exported from Grafana as V2 Resource JSON files for version control and reuse.

Repository locations:

```text
monitoring/grafana/dashboards/atlas-host-overview.json
monitoring/grafana/dashboards/docker-nginx-service-overview.json
```

The exports were configured for use with another Grafana instance.

## Monitoring Architecture

```text
Node Exporter ─┐
               │
cAdvisor ──────┼──> Prometheus ───> Grafana
               │
Blackbox ──────┘
```

The two dashboards separate host-level monitoring from service-level monitoring.

## Current Status

Phase 5.8 is complete.

Next step: define healthy, warning, and failure states.