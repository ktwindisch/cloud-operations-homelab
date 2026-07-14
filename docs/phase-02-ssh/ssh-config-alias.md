# SSH Config Alias

## Purpose

This document records the setup and verification of an SSH config alias for atlas.

The goal was to simplify remote administration by replacing a longer SSH command with a short, repeatable alias.

## Starting State

After SSH key authentication was configured, atlas could be reached with:

`ssh -i ~/.ssh/atlas_ed25519 kevin@192.168.1.191`

This worked, but it required remembering:

- The private key path
- The username
- The server IP address

## SSH Config File

An SSH client config file was created on the Windows workstation at:

`~/.ssh/config`

This file allows common SSH connection details to be stored under a simple host alias.

## Config Entry

The following SSH config entry was added:

```sshconfig
Host atlas
    HostName 192.168.1.191
    User kevin
    IdentityFile ~/.ssh/atlas_ed25519
    IdentitiesOnly yes
```

## Config Explanation

| Setting | Purpose |
|--------|---------|
| `Host atlas` | Defines the shortcut name used when connecting |
| `HostName 192.168.1.191` | Specifies the server IP address |
| `User kevin` | Sets the login user |
| `IdentityFile ~/.ssh/atlas_ed25519` | Uses the dedicated SSH private key |
| `IdentitiesOnly yes` | Forces SSH to use the specified key |

## Alias Test

After saving the config file, the alias was tested with:

`ssh atlas`

The connection was successful.

The workstation prompted for the SSH key passphrase and then opened a remote shell session on atlas.

## Result

The SSH config alias worked successfully.

Remote administration can now be started with:

`ssh atlas`

## Meaning

This improves the administration workflow by making SSH access:

- Shorter
- Cleaner
- Easier to remember
- Less error-prone
- More similar to how engineers manage named hosts in real environments

## Status

SSH config alias is working.