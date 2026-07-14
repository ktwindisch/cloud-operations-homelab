# SSH Key Setup

## Purpose

This document records the setup and verification of SSH key-based authentication from the Windows workstation to atlas.

SSH key authentication is an important step in moving from basic password-based remote access toward a more secure and repeatable server administration workflow.

## Starting State

Before this phase, remote SSH access was already working with password authentication.

Initial SSH connection format:

`ssh kevin@192.168.1.191`

This worked, but it required typing the server IP address and authenticating with the server password.

## Existing SSH Directory Check

The Windows workstation SSH directory was checked with:

`ls -la ~/.ssh`

Initial result:

| File | Purpose |
|------|---------|
| `known_hosts` | Stored trusted SSH host fingerprints |
| `known_hosts.old` | Previous known hosts backup |

No SSH key pair existed yet for atlas.

## SSH Key Created

A dedicated SSH key pair was created for atlas using:

`ssh-keygen -t ed25519 -C "kevin@atlas-homelab" -f ~/.ssh/atlas_ed25519`

## Key Files

The following key files were created on the Windows workstation:

| File | Purpose |
|------|---------|
| `~/.ssh/atlas_ed25519` | Private key |
| `~/.ssh/atlas_ed25519.pub` | Public key |

## Security Notes

The private key must never be shared or committed to GitHub.

The public key was copied to atlas and added to the `authorized_keys` file for the `kevin` user.

A passphrase was used for the SSH private key, which adds protection if the private key is ever exposed.

## Public Key Installation

The public key was copied from the Windows workstation to atlas and added to:

`/home/kevin/.ssh/authorized_keys`

The server-side SSH directory and authorized keys file were configured with appropriate permissions:

| Path | Permission |
|------|------------|
| `/home/kevin/.ssh` | `700` |
| `/home/kevin/.ssh/authorized_keys` | `600` |

## Key-Based Login Test

Key-based SSH login was tested with:

`ssh -i ~/.ssh/atlas_ed25519 kevin@192.168.1.191`

## Result

The login was successful.

The workstation prompted for the SSH key passphrase and then connected to atlas.

The server displayed the Ubuntu login banner and opened a shell session as:

`kevin@atlas:~$`

## Meaning

This confirmed that:

- The SSH key pair was created successfully
- The public key was installed on atlas
- atlas accepted key-based authentication
- The Windows workstation could authenticate without using the server account password directly
- SSH access is now more secure and repeatable than the original password-only workflow

## Status

SSH key authentication is working.