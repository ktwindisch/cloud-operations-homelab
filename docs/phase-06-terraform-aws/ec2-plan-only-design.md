# EC2 Plan-Only Design

## Overview

Phase 6.7 explored how an EC2 workload could be represented with Terraform without deploying chargeable infrastructure.

The project has a strict zero-cost requirement, so the EC2 configuration was intentionally limited to Terraform initialization, formatting, validation, data discovery, and planning.

No EC2 instance or EBS volume was created.

## Separation from Live Infrastructure

The plan-only configuration is stored separately from the Terraform configuration that manages the live AWS networking environment.

```text
terraform/aws/
```

contains the live zero-cost networking infrastructure.

```text
terraform/aws-plan-only/ec2/
```

contains hypothetical infrastructure that must not be applied.

This separation reduces the risk of accidentally deploying chargeable resources as part of the live Terraform configuration.

## Existing Infrastructure Discovery

Terraform used data sources to locate:

- The existing homelab VPC
- The existing homelab subnet
- A current Amazon Linux 2023 AMI

These data sources allowed the EC2 design to reference real AWS infrastructure without modifying it.

## Planned EC2 Configuration

The hypothetical instance configuration included:

- Amazon Linux 2023
- t3.micro instance type
- Existing homelab subnet
- Dedicated security group
- No public IPv4 address
- Encrypted root volume
- 8 GiB gp3 root volume
- Delete-on-termination enabled
- IMDSv2 required

The instance was configured with:

```text
associate_public_ip_address = false
```

The instance metadata service was configured to require session tokens.

## Security Group

A dedicated security group was included in the design.

No inbound access rules were defined.

The security group exists only as part of the plan-only configuration and was not created in AWS.

## Terraform Plan

Terraform successfully generated the hypothetical infrastructure plan.

Result:

```text
Plan: 2 to add, 0 to change, 0 to destroy.
```

The proposed resources were:

```text
aws_security_group.ec2_plan_only
aws_instance.homelab_plan_only
```

The existing live networking infrastructure showed no changes.

## Cost Decision

The EC2 configuration was intentionally not applied.

The project does not assume Free Tier eligibility or promotional credits.

The proposed EC2 instance and EBS storage could create AWS charges if deployed, so the configuration remains a design and planning exercise only.

## Result

Phase 6 demonstrated that Terraform can model compute infrastructure, discover existing AWS resources, validate the configuration, and produce an implementation plan without deploying chargeable resources.

No `terraform apply` was performed from the plan-only EC2 directory.

The Phase 6 zero-cost requirement remains in effect.