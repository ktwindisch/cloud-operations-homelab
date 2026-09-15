# Docker and Nginx Monitoring

## Purpose

This document records container and HTTP service monitoring for Phase 5.

The goal was to extend monitoring beyond host-level metrics and observe the Docker-managed Nginx service directly.

## Monitoring Components

| Component | Purpose | Port |
|-----------|---------|------|
| cAdvisor | Docker container metrics | 8081 |
| Blackbox Exporter | HTTP availability probing | 9115 |
| Prometheus | Metric collection and querying | 9090 |
| Nginx | Monitored web service | 8080 |

## cAdvisor

cAdvisor was added to the existing Docker Compose project.

The service exposes container metrics on:

```text
http://localhost:8081/metrics
```

The root cAdvisor endpoint returned a temporary redirect:

```text
HTTP 307
```

Following the redirect returned:

```text
HTTP 200
```

The metrics endpoint returned:

```text
HTTP 200
```

## Nginx Container Detection

cAdvisor successfully detected the Nginx Compose container.

Observed container labels included:

```text
name="nginx-compose"
image="nginx:alpine"
container_label_com_docker_compose_service="nginx"
```

Available metrics included:

```text
container_cpu_usage_seconds_total
container_memory_working_set_bytes
container_network_receive_bytes_total
container_network_transmit_bytes_total
container_fs_reads_bytes_total
container_fs_writes_bytes_total
container_last_seen
```

## Prometheus cAdvisor Target

Prometheus was configured to scrape:

```text
localhost:8081
```

Query:

```promql
up{job="cadvisor"}
```

Result:

```text
1
```

This confirmed that Prometheus was successfully scraping cAdvisor.

## Nginx Memory Metric

Query:

```promql
container_memory_working_set_bytes{name="nginx-compose"}
```

A working-set value of approximately 11.3 MiB was observed during testing.

## Nginx CPU Metric

Query:

```promql
rate(container_cpu_usage_seconds_total{name="nginx-compose",cpu="total"}[5m]) * 100
```

Prometheus successfully returned a result series for the Nginx container.

Low CPU usage was expected because the static web service was mostly idle.

## Blackbox Exporter

Blackbox Exporter was added to monitor Nginx HTTP availability.

The exporter was configured with an HTTP 2xx probe module.

Prometheus sends the Nginx endpoint to Blackbox Exporter for testing:

```text
http://127.0.0.1:8080
```

## HTTP Availability Query

Query:

```promql
probe_success{job="blackbox_nginx"}
```

Result:

```text
1
```

This confirmed that the Nginx HTTP probe succeeded.

## HTTP Status Query

Query:

```promql
probe_http_status_code{job="blackbox_nginx"}
```

Result:

```text
200
```

This confirmed that the Nginx service returned HTTP 200.

## Monitoring Distinction

The following metrics answer different operational questions.

```promql
up{job="cadvisor"}
```

Confirms that Prometheus can scrape cAdvisor.

```promql
up{job="blackbox_nginx"}
```

Confirms that Prometheus can scrape the Blackbox Exporter probe.

```promql
probe_success{job="blackbox_nginx"}
```

Confirms that the actual Nginx HTTP endpoint responded successfully.

This distinction separates monitoring infrastructure health from application availability.

## Monitoring Flow

```text
atlas
├── Node Exporter
│   └── Linux host metrics
│
├── Docker
│   ├── nginx-compose
│   └── cAdvisor
│       └── container metrics
│
├── Blackbox Exporter
│   └── Nginx HTTP probe
│
└── Prometheus
    ├── prometheus
    ├── node_exporter
    ├── cadvisor
    └── blackbox_nginx
```

## Result

Docker container metrics and Nginx HTTP availability are now observable through Prometheus.

Phase 5 monitoring now covers both host-level and service-level behavior.

## Current Status

Phase 5.6 is complete.

Next step: install and configure Grafana.