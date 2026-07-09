# Network Plan

## Purpose

This document defines the initial network plan for atlas, the primary Ubuntu Server in the Cloud Operations Homelab project.

Because atlas will be managed remotely through SSH, network reliability is one of the most important parts of the setup.

## Network Overview

| Item | Value |
|------|-------|
| Server hostname | atlas |
| Hardware | Lenovo ThinkPad T530 |
| Network type | Wi-Fi |
| Primary access method | SSH |
| Primary workstation | Windows workstation |
| Initial IP assignment | DHCP |
| Long-term IP strategy | DHCP reservation on router |
| SSH port | 22 |

## Initial Network Strategy

atlas will connect to the home network using Wi-Fi.

During the Ubuntu Server installation, the server should connect to the home Wi-Fi network and receive an IP address from the router through DHCP.

The initial setup will use DHCP because it is simple and allows the router to assign an available IP address automatically.

After the server is installed and reachable, the preferred long-term strategy is to create a DHCP reservation on the router.

## Why DHCP Reservation

A DHCP reservation allows the router to always assign the same IP address to atlas.

This gives the server a consistent address without manually hardcoding network settings inside Ubuntu.

This approach keeps network management centralized on the router while still giving the server predictable connectivity.

## Planned Network Flow

| Source | Destination | Purpose |
|--------|-------------|---------|
| Windows workstation | atlas | SSH administration |
| atlas | Internet | Package updates and software installation |
| atlas | GitHub | Future repository access and automation |
| atlas | AWS | Future cloud infrastructure work |

## SSH Access Plan

The first SSH goal is simple:

Confirm that the Windows workstation can reach atlas over the local network.

Initial SSH connection example:

`ssh kevin@192.168.x.x`

Later, if local hostname resolution works, SSH may use:

`ssh kevin@atlas`

If hostname resolution does not work, IP-based SSH access will be used until local DNS or router configuration is improved.

## Wi-Fi Considerations

Using Wi-Fi is acceptable for this homelab, but it introduces some risks compared to Ethernet.

| Risk | Impact | Mitigation |
|------|--------|------------|
| Wi-Fi disconnects | SSH session may drop | Reconnect and verify network service |
| IP address changes | SSH target may change | Use router DHCP reservation |
| Weak signal | Server may be unreliable | Keep server near router if needed |
| Wi-Fi driver issue | Server may not connect | Use temporary Ethernet adapter if needed |
| Router reboot | Server may temporarily lose connectivity | Verify reconnect after router restart |

## Firewall Considerations

Firewall configuration will be handled after Ubuntu Server is installed.

Initial firewall goal:

- Allow SSH traffic
- Block unnecessary inbound connections
- Keep the server minimally exposed

UFW will be configured in a later phase after basic network and SSH access are confirmed.

## IP Address Plan

Initial IP address:

`To be assigned by DHCP during installation`

Planned long-term IP address:

`To be determined after router DHCP reservation`

The final reserved IP address will be documented after atlas successfully connects to the network.

## Verification Steps

After Ubuntu Server installation, verify network connectivity with the following checks:

1. Confirm atlas receives an IP address
2. Confirm atlas can reach the internet
3. Confirm atlas can resolve DNS names
4. Confirm the Windows workstation can ping atlas if allowed by the network
5. Confirm SSH connection from the Windows workstation
6. Record the assigned IP address
7. Configure DHCP reservation on the router if available

## Success Criteria

The network setup is successful when:

- atlas connects to the Wi-Fi network
- atlas receives an IP address
- atlas can reach the internet
- atlas can install package updates
- the Windows workstation can connect to atlas over SSH
- the assigned IP address is documented
- a long-term IP strategy is selected

## Security Notes

Wi-Fi passwords, router passwords, private keys, and secrets must not be committed to GitHub.

Any sensitive values should be stored locally and excluded from the repository.

## Future Improvements

Future network improvements may include:

- Router DHCP reservation
- Local DNS entry for atlas
- SSH key authentication
- UFW firewall rules
- fail2ban
- WireGuard VPN for secure remote access
- Ethernet connection if Wi-Fi becomes unreliable