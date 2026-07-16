# Bash Automation Overview

## Purpose

Phase 3 introduces Bash automation for the Cloud Operations Homelab.

The goal is to move from manually running Linux commands to creating reusable scripts that support basic server administration.

## Why Bash Automation Matters

Linux administration often involves repeated tasks such as checking disk usage, reviewing memory, confirming service status, running updates, and collecting system information.

Bash scripts allow these tasks to be automated, documented, and repeated consistently.

## What This Phase Builds On

Phase 3 builds on the previous milestones:

| Phase | Foundation |
|-------|------------|
| Phase 1 | Ubuntu Server installed on atlas |
| Phase 2 | Remote SSH administration configured |

Because atlas can now be managed remotely using `ssh atlas`, it is ready for operational scripting.

## Skills Practiced

This phase will practice:

- Bash script structure
- Variables
- Conditionals
- Command substitution
- Exit codes
- Permissions
- File paths
- Basic logging
- Safe use of system commands
- Documentation of script behavior

## Planned Scripts

The initial scripts planned for this phase are:

- `system-health.sh`
- `disk-check.sh`
- `memory-check.sh`
- `system-update.sh`
- `backup-home.sh`

## Engineering Approach

Each script will follow the same process:

1. Define the problem
2. Write the first version
3. Run the script on atlas
4. Review the output
5. Improve the script
6. Document what it does
7. Commit the work to GitHub

## Current Status

Phase 3 planning has started.

No automation scripts have been completed yet.