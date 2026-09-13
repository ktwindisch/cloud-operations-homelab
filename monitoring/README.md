# Monitoring

This folder contains monitoring and observability configuration for the Cloud Operations Homelab.

Phase 5 focuses on making atlas measurable.

The goal is to monitor host health, service availability, Docker behavior, and system trends using tools such as Prometheus, Node Exporter, and Grafana.

## Planned Components

| Component | Purpose | Status |
|-----------|---------|--------|
| Node Exporter | Expose Linux host metrics from atlas | Complete |
| Prometheus | Collect and query metrics | Complete |
| Grafana | Visualize metrics with dashboards | Planned |
| Docker monitoring | Track container state and service behavior | Planned |
| Nginx service checks | Verify web service availability | Planned |

## Current Status

Phase 5 monitoring structure has been created.

Node Exporter has been installed and verified on atlas.

Prometheus has been installed and verified on atlas.

Prometheus is collecting metrics from Node Exporter and from Prometheus itself.

Linux host metrics are available through Node Exporter at:

```text
http://localhost:9100/metrics