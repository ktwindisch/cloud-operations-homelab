# File Transfer Verification

## Purpose

This document records file transfer testing between the Windows workstation and atlas.

File transfer is important because remote server administration often requires moving scripts, configuration files, logs, backups, and deployment artifacts between systems.

## Tools Tested

| Tool | Status |
|------|--------|
| `scp` | Working |
| `rsync` | Deferred from Windows workstation |
| `rsync` on atlas | Installed |

## SCP Test: Workstation to atlas

A test file was created on the Windows workstation:

`scp-test.txt`

The file was copied to atlas using:

`scp scp-test.txt atlas:~`

The file was then verified on atlas with:

`ls -l scp-test.txt`

`cat scp-test.txt`

## Workstation to atlas Result

The file transfer was successful.

The test file arrived in the `kevin` user home directory on atlas.

## SCP Test: atlas to Workstation

A test file was created on atlas:

`atlas-to-workstation-test.txt`

The file was copied back to the Windows workstation using:

`scp atlas:~/atlas-to-workstation-test.txt .`

The file was then verified on the Windows workstation with:

`ls -l atlas-to-workstation-test.txt`

`cat atlas-to-workstation-test.txt`

## atlas to Workstation Result

The file transfer was successful.

This confirmed that files can be copied in both directions between the Windows workstation and atlas.

## SCP Verification Summary

| Direction | Command Type | Status |
|----------|--------------|--------|
| Workstation to atlas | `scp local-file atlas:~` | Successful |
| atlas to Workstation | `scp atlas:~/remote-file .` | Successful |

## rsync Check

`rsync` was checked on both systems.

Result:

| System | rsync Status |
|--------|--------------|
| Windows Git Bash | Not installed |
| atlas | Installed |

## rsync Decision

`rsync` testing was deferred because the Windows Git Bash environment does not currently include `rsync`.

Rather than installing additional tooling immediately, this limitation was documented.

Future options include:

- Installing rsync-compatible tooling on Windows
- Using WSL as the Linux-based workstation environment
- Testing rsync from another Linux machine
- Revisiting rsync during the Bash automation or backup phase

## Meaning

This testing confirmed that basic file movement between the workstation and atlas is working.

It also identified a workstation tooling limitation for rsync, which has been documented for future improvement.

## Result

SCP file transfer is working in both directions.

rsync is available on atlas but not currently available from the Windows Git Bash environment.

## Status

File transfer verification is complete for SCP.

rsync testing is deferred.