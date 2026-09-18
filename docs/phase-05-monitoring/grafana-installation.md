# Grafana Installation and Prometheus Integration

## Purpose

This document records the installation and verification of Grafana for Phase 5 of the Cloud Operations Homelab.

Grafana was added as the visualization layer for metrics already being collected by Prometheus.

## Installed Version

Grafana OSS version:

```text
13.2.2
```

## Service Verification

The Grafana service was verified with systemd.

```text
grafana-server: active
grafana-server: enabled
```

Grafana listens on:

```text
TCP 3000
```

The local login endpoint returned:

```text
HTTP 200
```

## Browser Access

Grafana was successfully accessed from the Windows workstation at:

```text
http://192.168.1.191:3000
```

## Prometheus Data Source

Prometheus was added as the Grafana data source using:

```text
http://localhost:9090
```

The Grafana Save & Test operation completed successfully.

## Grafana Explore Verification

Grafana Explore was used to verify live Prometheus metrics.

Verified queries included:

```promql
up
```

```promql
up{job="node_exporter"}
```

```promql
up{job="cadvisor"}
```

```promql
probe_success{job="blackbox_nginx"}
```

```promql
container_memory_working_set_bytes{name="nginx-compose"}
```

## Observed Results

All monitored Prometheus targets returned healthy results.

```text
node_exporter = 1
prometheus = 1
cadvisor = 1
blackbox_nginx = 1
```

The Nginx HTTP availability probe returned:

```text
probe_success = 1
```

Grafana also displayed live memory metrics for the Nginx container.

## Monitoring Flow

```text
Node Exporter ─┐
               │
cAdvisor ──────┼──> Prometheus ───> Grafana
               │
Blackbox ──────┘
```

Grafana now provides a visualization and exploration layer on top of the Prometheus monitoring stack.

## Current Status

Phase 5.7 is complete.

Next step: create monitoring dashboards in Grafana.