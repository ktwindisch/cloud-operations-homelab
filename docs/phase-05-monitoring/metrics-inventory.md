# Metrics Inventory

## Purpose

This document tracks the metric areas that will be monitored during Phase 5.

The goal is to define what should be measured before installing monitoring tools.

## Host Metrics

| Metric Area | Example Signals | Why It Matters | Status |
|-------------|----------------|----------------|--------|
| CPU | Load average, CPU utilization | Shows compute pressure | Planned |
| Memory | Used, available, cached, swap | Shows memory pressure | Planned |
| Disk | Filesystem usage and growth | Helps prevent full disk issues | Planned |
| Network | Interface traffic and reachability | Shows connectivity and traffic patterns | Planned |
| Uptime | System uptime and reboot behavior | Helps confirm stability | Planned |

## Service Metrics

| Service | Example Signals | Why It Matters | Status |
|---------|----------------|----------------|--------|
| Nginx | HTTP availability, response status | Confirms web service access | Planned |
| Docker | Running containers, restarts, resource usage | Confirms container service behavior | Planned |
| SSH | Service active state and reachability | Confirms remote administration access | Planned |

## Baseline Commands

The current manual baseline can be checked with:

```bash
uptime
free -h
df -h /
hostname -I
systemctl status ssh --no-pager
docker ps
docker compose ps
curl -I http://localhost:8080

## Current Status

Metrics have been identified.

A pre-monitoring baseline has been captured for atlas, SSH, Docker, Nginx, container resource usage, and listening ports.

No metrics are being collected by Prometheus yet.