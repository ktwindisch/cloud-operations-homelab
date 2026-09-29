# Phase 5 Monitoring and Observability Summary

## Overview

Phase 5 added monitoring and observability capabilities to the Cloud Operations Homelab.

The goal was to move beyond manually checking system health and create a monitoring stack capable of collecting, querying, visualizing, and interpreting host and service metrics.

## Monitoring Stack

The completed monitoring stack includes:

- Node Exporter for Linux host metrics
- Prometheus for metric collection and querying
- cAdvisor for Docker container metrics
- Blackbox Exporter for Nginx HTTP availability
- Grafana for visualization and dashboarding

## Host Monitoring

Node Exporter exposes Linux system metrics from atlas to Prometheus.

Verified host metrics include:

- CPU usage
- Memory usage
- Root filesystem usage
- System uptime
- Host identity
- Prometheus scrape health

## Container Monitoring

cAdvisor provides visibility into Docker container behavior.

The Nginx container can be monitored through metrics including:

- CPU usage
- Memory working set
- Network activity
- Filesystem activity
- Container freshness

Prometheus successfully collects these metrics from cAdvisor.

## Service Availability Monitoring

Blackbox Exporter probes the Nginx HTTP endpoint.

Verified service metrics include:

```text
probe_success = 1
probe_http_status_code = 200
```

This provides an important distinction between a container running and the application inside that container actually responding.

## Grafana

Grafana was installed on atlas and connected to Prometheus.

Grafana Explore was used to verify metrics from:

- Prometheus
- Node Exporter
- cAdvisor
- Blackbox Exporter

## Dashboards

Two Grafana dashboards were created.

### Atlas Host Overview

Panels include:

- CPU Usage
- Memory Usage
- Root Disk Usage
- System Uptime
- Monitoring Target Health

### Docker and Nginx Service Overview

Panels include:

- Container CPU
- Container Memory
- Container Last Seen
- HTTP Availability
- HTTP Status Code
- HTTP Probe Duration

Both dashboards were exported as JSON and stored in version control.

## Health States

Healthy, warning, and critical dashboard states were defined for metrics where operational thresholds were meaningful.

Thresholds were configured for:

- CPU usage
- Memory usage
- Root disk usage
- Prometheus target health
- Nginx container CPU
- Container freshness
- HTTP availability
- HTTP response status
- HTTP probe duration

System uptime and Nginx container memory remain informational because meaningful failure thresholds have not yet been established.

## Monitoring Architecture

```text
                   ┌─────────────────┐
                   │      atlas      │
                   │ Ubuntu Server   │
                   └────────┬────────┘
                            │
             ┌──────────────┼──────────────┐
             │              │              │
      Node Exporter      cAdvisor      Blackbox Exporter
       Host Metrics    Docker Metrics     HTTP Probes
             │              │              │
             └──────────────┼──────────────┘
                            │
                       Prometheus
                            │
                          Grafana
                            │
              ┌─────────────┴─────────────┐
              │                           │
       Atlas Host Overview       Docker and Nginx
                                 Service Overview
```

## Key Lessons

Phase 5 reinforced several monitoring and observability concepts:

- A running process or container does not guarantee application availability.
- Metrics collection and visualization serve different purposes.
- Prometheus provides a flexible query layer through PromQL.
- Grafana turns raw metrics into operational views.
- Health thresholds should have meaningful operational context rather than arbitrary values.
- Monitoring configuration and dashboard definitions can be stored in version control.

## Result

The Cloud Operations Homelab now has a functioning monitoring and observability stack covering Linux host health, Docker container behavior, and Nginx service availability.

Phase 5 is complete.

Release milestone: `v5.0.0`