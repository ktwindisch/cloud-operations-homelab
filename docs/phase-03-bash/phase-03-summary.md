# Phase 3 Summary: Bash Automation

## Status

Complete

## Purpose

Phase 3 introduced Bash automation to the Cloud Operations Homelab.

The goal was to move from manually running Linux commands on atlas to creating small, reusable scripts for operational tasks.

## What Was Built

| Script | Purpose | Status |
|--------|---------|--------|
| `system-health.sh` | Generate a basic system health report | Complete |
| `disk-check.sh` | Check root filesystem disk usage against a threshold | Complete |
| `memory-check.sh` | Check available memory against a threshold | Complete |
| `system-update.sh` | Assist with safe system update checks | Complete |
| `backup-home.sh` | Create and verify a timestamped backup archive | Complete |

## Key Skills Practiced

- Bash script structure
- Variables
- Command substitution
- Conditional logic
- Exit codes
- File permissions
- Linux command parsing
- Safe package maintenance
- Timestamped backup creation
- Archive verification
- Documentation of script behavior
- Git commits for meaningful work units

## Issues Encountered

### Wrong Folder Name

During `disk-check.sh`, an incorrect folder name was identified:

```text
automnation
```

The correct folder is:

```text
automation
```

The issue was corrected by placing the script in the proper folder.

### Windows Line Endings

Git warned that shell script line endings could be changed from LF to CRLF.

A `.gitattributes` file was added to keep shell scripts using Linux line endings:

```text
*.sh text eol=lf
```

### Pager Behavior

During the first test of `system-update.sh`, the list of available upgrades opened in a paged view.

The script was updated to use:

```bash
PAGER=cat apt list --upgradable
```

### Operator Typo

During `backup-home.sh` testing, the wrong filename was entered:

```bash
./back-home.sh
```

The correct command was:

```bash
./backup-home.sh
```

The initial error returned exit code `127`, which indicated the file was not found.

## Engineering Lessons

This phase reinforced that automation is not just about writing scripts.

It is also about:

- Testing scripts in the real environment
- Reading command output carefully
- Fixing workflow problems
- Documenting mistakes
- Avoiding unsafe automation
- Using exit codes intentionally
- Keeping scripts readable

## Result

Phase 3 successfully added Bash automation to atlas.

The homelab now includes reusable scripts for basic health checks, disk checks, memory checks, safe package update assistance, and backup creation.

## Next Phase

Phase 4 will focus on Docker Services.