# Monitoring Health Thresholds

## Purpose

This document records the healthy, warning, and critical states defined for the Cloud Operations Homelab monitoring dashboards.

The thresholds are intended for this homelab environment and provide visual operational context in Grafana.

These thresholds are dashboard indicators and are not currently configured as automated alert rules.

## Atlas Host Overview

### CPU Usage

| State | Threshold |
|-------|-----------|
| Healthy | Below 70% |
| Warning | 70% to 85% |
| Critical | Above 85% |

Grafana colors:

```text
Base: Green
70: Yellow
85: Red
```

### Memory Usage

| State | Threshold |
|-------|-----------|
| Healthy | Below 70% |
| Warning | 70% to 85% |
| Critical | Above 85% |

Grafana colors:

```text
Base: Green
70: Yellow
85: Red
```

### Root Disk Usage

| State | Threshold |
|-------|-----------|
| Healthy | Below 70% |
| Warning | 70% to 85% |
| Critical | Above 85% |

Grafana colors:

```text
Base: Green
70: Yellow
85: Red
```

### Monitoring Target Health

Prometheus target health uses value mappings.

```text
1 = UP
0 = DOWN
```

Visual states:

```text
UP = Green
DOWN = Red
```

### System Uptime

System uptime remains informational.

A recently restarted server may have a low uptime without indicating a failure, so no warning or critical thresholds were assigned.

## Docker and Nginx Service Overview

### Nginx Container CPU

| State | Threshold |
|-------|-----------|
| Healthy | Below 70% |
| Warning | 70% to 85% |
| Critical | Above 85% |

Grafana colors:

```text
Base: Green
70: Yellow
85: Red
```

### Nginx Container Memory

Container memory remains informational.

The Nginx container does not currently have a defined memory limit, so a meaningful warning or critical threshold has not been assigned.

### Container Last Seen

This metric measures how recently cAdvisor observed the Nginx container.

| State | Threshold |
|-------|-----------|
| Healthy | Below 30 seconds |
| Warning | 30 to 60 seconds |
| Critical | Above 60 seconds |

Grafana colors:

```text
Base: Green
30: Yellow
60: Red
```

### Nginx HTTP Availability

Blackbox Exporter probe success uses value mappings.

```text
1 = UP
0 = DOWN
```

Visual states:

```text
UP = Green
DOWN = Red
```

### Nginx HTTP Status Code

HTTP response codes are mapped into operational states.

| Response | State |
|----------|-------|
| 200 | OK |
| 300-399 | Redirect |
| 400-599 | Error |

Grafana colors:

```text
200 = Green
300-399 = Yellow
400-599 = Red
```

### HTTP Probe Duration

| State | Threshold |
|-------|-----------|
| Healthy | Below 100 ms |
| Warning | 100 to 500 ms |
| Critical | Above 500 ms |

Grafana colors:

```text
Base: Green
100: Yellow
500: Red
```

## Result

The Grafana dashboards now provide visual health context in addition to displaying raw metrics.

Host health, container behavior, monitoring target status, and Nginx HTTP availability can now be interpreted as healthy, warning, or critical conditions.

Phase 5.9 is complete.

Next step: finalize Phase 5 documentation, update the project summary, and prepare the Phase 5 release.