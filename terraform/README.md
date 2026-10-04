# Terraform

This directory contains Infrastructure as Code configuration for Phase 6 of the Cloud Operations Homelab.

## Purpose

Terraform will be used to design, validate, and selectively deploy AWS infrastructure.

The goal is to gain practical Infrastructure as Code experience while maintaining a strict zero-cost requirement.

## Zero-Cost Rule

AWS resources will not be deployed unless their current pricing has been reviewed and they can be verified to cost $0 for this project.

Chargeable infrastructure may still be represented in Terraform configuration for:

- Formatting
- Validation
- Planning
- Dependency review
- Architecture documentation

without running `terraform apply`.

## Planned Workflow

```text
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy