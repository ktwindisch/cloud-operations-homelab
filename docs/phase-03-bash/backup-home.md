# Backup Home Script

## Purpose

The `backup-home.sh` script creates a timestamped backup archive from a safe test source directory on atlas.

This script was created as part of Phase 3 Bash Automation.

The goal is to practice basic backup automation without immediately backing up the full home directory.

## Script Location

```text
automation/backup-home.sh
```

## What the Script Does

The script performs the following actions:

1. Defines a safe test source directory
2. Defines a backup destination directory
3. Creates a timestamped backup filename
4. Creates the test source directory if it does not exist
5. Creates a test file if needed
6. Creates the backup destination directory
7. Creates a compressed `.tar.gz` archive
8. Verifies that the backup archive can be read
9. Prints backup details
10. Exits successfully if verification passes

## Source Directory

```text
/home/kevin/homelab-backup-source
```

## Backup Directory

```text
/home/kevin/homelab-backups
```

## Example Backup File

```text
/home/kevin/homelab-backups/home-backup-20260729-165934.tar.gz
```

## Commands Used

The script uses:

```bash
date
mkdir -p
tar -czf
tar -tzf
ls -lh
if
exit
echo
```

## Script Logic

The script first checks whether the source directory exists.

If the source directory does not exist, it creates the directory and adds a test `README.txt` file.

The script then creates the backup directory if needed.

After that, it creates a compressed `.tar.gz` archive using `tar`.

Finally, the script verifies the archive using `tar -tzf`.

## Test Environment

| Item | Value |
|------|-------|
| Server | atlas |
| Operating system | Ubuntu 26.04 LTS |
| Source directory | `/home/kevin/homelab-backup-source` |
| Backup directory | `/home/kevin/homelab-backups` |
| Test method | Script copied to atlas and executed locally |
| Access method | SSH using `ssh atlas` |

## Test Result

The script ran successfully on atlas.

Verified output included:

| Check | Result |
|------|--------|
| Source directory | Created |
| Test file | Created |
| Backup directory | Created |
| Backup archive | Created |
| Archive verification | Successful |
| Backup file size | 218 bytes |
| Status | Successful |

## Exit Codes

| Exit Code | Meaning |
|----------|---------|
| 0 | Backup completed and archive verification passed |
| 1 | Backup creation or archive verification failed |

## Troubleshooting Note

During initial testing, the script was accidentally run with the wrong filename:

```bash
./back-home.sh
```

This returned:

```text
No such file or directory
```

and exit code:

```text
127
```

The issue was corrected by running the actual script name:

```bash
./backup-home.sh
```

This was an operator command typo, not a script failure.

## Why This Matters

Backups are a basic operational responsibility.

This script creates a repeatable backup workflow and verifies that the archive can be read after creation.

It also creates a safe foundation for future backup improvements, such as logging, retention cleanup, scheduled execution, and remote backup destinations.

## Current Status

`backup-home.sh` has been created, tested on atlas, and verified successfully.