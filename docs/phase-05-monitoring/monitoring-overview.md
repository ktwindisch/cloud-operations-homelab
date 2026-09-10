# Monitoring Overview

## Purpose

This document explains the monitoring approach for the Cloud Operations Homelab.

Phase 5 moves the project from running services to observing services.

The goal is to answer basic operational questions about atlas.

## Questions Monitoring Should Answer

Monitoring should help answer:

- Is atlas online?
- Is the Nginx Docker service running?
- Is the server under CPU pressure?
- Is memory usage healthy?
- Is disk usage growing?
- Is network traffic visible?
- Are containers restarting unexpectedly?
- Can service behavior be reviewed over time?

## Planned Monitoring Stack

| Tool | Role |
|------|------|
| Node Exporter | Exposes Linux host metrics |
| Prometheus | Collects and stores metrics |
| Grafana | Displays dashboards |
| Docker commands | Provides container state and troubleshooting data |

## Initial Scope

The first version of monitoring will focus on:

- host CPU
- host memory
- disk usage
- network activity
- uptime
- Docker service state
- Nginx service availability

## Out of Scope for Initial Phase

The following items are not part of the initial monitoring build:

- Kubernetes monitoring
- cloud-hosted monitoring
- production alerting
- paid monitoring platforms
- complex distributed tracing

These may be added later after the local monitoring foundation is stable.

## Current Status

Monitoring planning has started.

No monitoring agents or dashboards have been installed yet.