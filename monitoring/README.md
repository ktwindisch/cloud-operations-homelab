# Monitoring

This folder contains monitoring and observability configuration for the Cloud Operations Homelab.

Phase 5 focuses on making atlas measurable.

The goal is to monitor host health, service availability, Docker behavior, and system trends using tools such as Prometheus, Node Exporter, and Grafana.

## Planned Components

| Component | Purpose | Status |
|-----------|---------|--------|
| Node Exporter | Expose Linux host metrics from atlas | Complete |
| Prometheus | Collect and query metrics | Complete |
| Grafana | Visualize metrics with dashboards | Complete |
| Docker monitoring | Track container state and service behavior | Complete |
| Nginx service checks | Verify web service availability | Complete |

## Current Status

Phase 5 monitoring structure has been created.

Node Exporter has been installed and verified on atlas.

Prometheus has been installed and verified on atlas.

Prometheus is collecting metrics from Node Exporter, Prometheus, and cAdvisor.

cAdvisor is collecting Docker container metrics for the Nginx service.

Blackbox Exporter is probing Nginx HTTP availability.

Verified service monitoring includes:

- Nginx container CPU and memory metrics
- Docker container visibility through cAdvisor
- Nginx HTTP probe success
- Nginx HTTP 200 response status

Grafana has been installed and verified on atlas.

Grafana is connected to Prometheus as its data source.

Grafana Explore successfully returned metrics from Node Exporter, cAdvisor, Blackbox Exporter, and Prometheus.

Two Grafana dashboards have been created and verified:

- Atlas Host Overview
- Docker and Nginx Service Overview

The dashboard definitions were exported as JSON and stored under:

```text
monitoring/grafana/dashboards/
```

Healthy, warning, and critical dashboard states have been defined for host and service metrics.

CPU, memory, disk usage, container freshness, HTTP availability, HTTP response status, and probe duration now have operational context in Grafana.

System uptime and Nginx container memory remain informational because meaningful failure thresholds have not been established for those metrics.

Phase 5.9 is complete.

Next step: update README, CHANGELOG, final summary, and tag `v5.0.0`.
