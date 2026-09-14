# Prometheus Query Verification

## Purpose

This document records Prometheus query verification for Phase 5 Monitoring and Observability.

The goal was to confirm that Prometheus can query metrics from atlas through Node Exporter and from Prometheus itself.

## Service Details

| Item | Value |
|------|-------|
| Server | atlas |
| Prometheus URL | `http://localhost:9090` |
| Prometheus browser URL | `http://192.168.1.191:9090` |
| Node Exporter target | `localhost:9100` |
| Prometheus target | `localhost:9090` |
| Phase | 5.5 |

## Target Health Query

Query:

```promql
up
```

Result:

```text
up{instance="localhost:9090", job="prometheus"} 1
up{instance="localhost:9100", job="node_exporter"} 1
```

This confirmed that both configured scrape targets were healthy.

## Node Exporter Target Query

Query:

```promql
up{job="node_exporter"}
```

This confirmed that the Node Exporter target was reachable and returning a value of `1`.

## Host Identity Query

Query:

```promql
node_uname_info
```

Result included:

```text
nodename="atlas"
sysname="Linux"
release="7.0.0-31-generic"
machine="x86_64"
```

This confirmed that Prometheus was receiving host identity metrics from atlas.

## Uptime Query

Query:

```promql
time() - node_boot_time_seconds
```

Result:

```text
2315.4660000801086
```

This confirmed that host uptime could be calculated from Prometheus using Node Exporter data.

## CPU Usage Query

Query:

```promql
(1 - avg(rate(node_cpu_seconds_total{mode="idle"}[5m]))) * 100
```

Result:

```text
2.0350877192982786
```

This showed low CPU activity at the time of testing.

## Memory Usage Query

Query:

```promql
(1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)) * 100
```

Result:

```text
4.459594615532303
```

This showed low memory usage at the time of testing.

## Root Disk Usage Query

Query:

```promql
100 - ((node_filesystem_avail_bytes{mountpoint="/",fstype!="rootfs"} * 100) / node_filesystem_size_bytes{mountpoint="/",fstype!="rootfs"})
```

Result:

```text
13.670847819882937
```

This confirmed that Prometheus could query root filesystem usage.

## Scrape Duration Query

Query:

```promql
scrape_duration_seconds
```

Results:

```text
scrape_duration_seconds{instance="localhost:9090", job="prometheus"} 0.014141722
scrape_duration_seconds{instance="localhost:9100", job="node_exporter"} 0.053445337
```

This confirmed that Prometheus was tracking scrape timing for both targets.

## Browser Query Verification

The Prometheus query page was tested from the Windows workstation:

```text
http://192.168.1.191:9090/query
```

The browser returned results for:

```promql
up
node_uname_info
time() - node_boot_time_seconds
(1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)) * 100
```

This confirmed that Prometheus queries worked from both the command line and the browser UI.

## Result

Prometheus successfully queried host metrics from atlas through Node Exporter.

Prometheus also queried its own internal scrape health metrics.

## Current Status

Phase 5.5 is complete.

Next step: monitor Docker and Nginx service behavior.