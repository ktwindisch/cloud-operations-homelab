# Phase 5 Plan: Monitoring and Observability

## Purpose

Phase 5 adds monitoring and observability to the Cloud Operations Homelab.

The goal is to make atlas measurable by collecting host, service, and container metrics.

By the end of this phase, atlas should have a working monitoring stack that can show system health, service availability, and basic operational trends.

## Planned Work

| Step | Task | Status |
|------|------|--------|
| 5.1 | Create Phase 5 monitoring structure and planning docs | Complete |
| 5.2 | Capture current monitoring baseline | Complete |
| 5.3 | Install and verify Node Exporter | Complete |
| 5.4 | Install and configure Prometheus | Not Started |
| 5.5 | Add atlas host metrics as a Prometheus target | Not Started |
| 5.6 | Monitor Docker and Nginx service behavior | Not Started |
| 5.7 | Install and configure Grafana | Not Started |
| 5.8 | Create monitoring dashboards | Not Started |
| 5.9 | Define healthy, warning, and failure states | Not Started |
| 5.10 | Update README, CHANGELOG, final summary, and tag `v5.0.0` | Not Started |

## Monitoring Targets

| Target | Purpose | Status |
|--------|---------|--------|
| atlas host | Monitor CPU, memory, disk, network, and uptime | Planned |
| Nginx Compose service | Monitor web service availability | Planned |
| Docker containers | Monitor running state, restarts, and resource behavior | Planned |

## Success Criteria

Phase 5 will be considered complete when:

- atlas host metrics are being exposed
- Prometheus is collecting metrics successfully
- Grafana can display monitoring dashboards
- the Nginx Docker service can be observed
- basic healthy, warning, and failure states are documented
- Phase 5 documentation is complete
- the repository is tagged as `v5.0.0`

## Current Status

Phase 5 monitoring planning structure has been created.

The current baseline for atlas, SSH, Docker, the Nginx Compose service, HTTP availability, and listening ports has been captured.

Node Exporter has been installed on atlas and verified on port `9100`.

Atlas is now exposing Linux host metrics through the `/metrics` endpoint.

Prometheus and Grafana have not been installed yet.

Next step: install and configure Prometheus.