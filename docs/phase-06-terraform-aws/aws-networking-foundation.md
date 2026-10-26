# AWS Networking Foundation

## Overview

Phase 6 established the first real AWS infrastructure managed by Terraform.

The goal was to build a basic networking foundation while maintaining the project's strict zero-cost requirement.

The deployment included only AWS networking resources that had been reviewed before deployment.

## Infrastructure

Terraform created:

- VPC
- Subnet
- Internet Gateway
- Route table
- Route table association

The VPC uses:

```text
10.20.0.0/16
```

The subnet uses:

```text
10.20.1.0/24
```

The subnet was created in an available Availability Zone in the configured AWS region.

## Public IPv4 Protection

Automatic public IPv4 assignment was disabled on the subnet:

```text
map_public_ip_on_launch = false
```

This prevents resources launched into the subnet from automatically receiving public IPv4 addresses.

No Elastic IP addresses were created.

## Excluded Resources

The deployment intentionally did not include:

- EC2 instances
- NAT Gateways
- Elastic IP addresses
- EBS volumes
- Load balancers
- Paid VPC endpoints

These exclusions support the Phase 6 zero-cost requirement.

## Restricted Terraform Access

Terraform was executed using a dedicated IAM Identity Center permission set with restricted networking permissions.

The Terraform role was separate from the administrative role used for AWS account management.

This allowed the infrastructure deployment to follow least-privilege access principles.

## Terraform Plan

Before deployment, Terraform generated the following plan:

```text
Plan: 5 to add, 0 to change, 0 to destroy.
```

The plan was reviewed before deployment.

A saved Terraform plan was then generated and applied.

## Terraform Apply

The saved plan was applied with:

```text
terraform apply tfplan
```

Terraform successfully created all five planned networking resources.

Result:

```text
Apply complete! Resources: 5 added, 0 changed, 0 destroyed.
```

## State Verification

Terraform state was inspected after deployment.

The managed infrastructure included:

```text
aws_internet_gateway.homelab
aws_route_table.public
aws_route_table_association.public
aws_subnet.public
aws_vpc.homelab
```

Terraform data sources were also present for AWS identity and Availability Zone discovery.

Terraform state files remained excluded from Git.

## Drift Verification

A second Terraform plan was generated after deployment.

Terraform reported:

```text
No changes. Your infrastructure matches the configuration.
```

This confirmed that the deployed AWS infrastructure matched the Terraform configuration and no unexpected drift was detected.

## Result

The Cloud Operations Homelab now has its first AWS infrastructure managed through Terraform.

The networking foundation was created through a controlled workflow:

```text
Terraform configuration
→ Format
→ Validate
→ Plan
→ Cost review
→ Security review
→ Saved plan
→ Apply
→ State verification
→ Drift check
```

No compute resources or other intentionally excluded paid infrastructure were deployed.