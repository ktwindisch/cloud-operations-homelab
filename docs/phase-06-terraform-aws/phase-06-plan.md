# Phase 6: Terraform and AWS Plan

## Purpose

Phase 6 introduces Infrastructure as Code using Terraform and AWS.

The goal is to design, validate, and selectively deploy AWS infrastructure while maintaining a strict zero-cost requirement.

The AWS account is more than one year old, so introductory credits and time-limited Free Tier benefits will not be assumed.

## Zero-Cost Requirement

Phase 6 must cost $0.00.

No AWS resource will be deployed until its current pricing has been verified.

Resources that normally incur compute, storage, networking, request, or processing charges will remain design-only or plan-only unless they can be conclusively verified as free for this account.

Any AWS infrastructure created during testing will be destroyed when it is no longer required.

AWS billing will be checked during the phase to confirm that the project remains at $0.00.

## Phase Tasks

| Step | Task | Status |
|------|------|--------|
| 6.1 | Create Phase 6 structure and zero-cost guardrails | Complete |
| 6.2 | Install and verify Terraform and AWS CLI | Complete |
| 6.3 | Configure AWS authentication securely | Not Started |
| 6.4 | Create the Terraform project foundation | Not Started |
| 6.5 | Design AWS networking and verify resource pricing | Not Started |
| 6.6 | Apply only infrastructure verified to cost $0 | Not Started |
| 6.7 | Build and validate plan-only configurations for chargeable infrastructure | Not Started |
| 6.8 | Destroy applied infrastructure and verify billing | Not Started |
| 6.9 | Compare AWS infrastructure design with atlas | Not Started |
| 6.10 | Final documentation and tag `v6.0.0` | Not Started |

## Core Terraform Workflow

```text
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy

Next step: configure AWS authentication securely.