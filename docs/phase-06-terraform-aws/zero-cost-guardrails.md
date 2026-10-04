# AWS Zero-Cost Guardrails

## Requirement

All AWS work performed during Phase 6 must remain at $0.00.

The AWS account is more than one year old. Introductory credits and time-limited Free Tier eligibility will not be assumed.

## Before Terraform Apply

Before running `terraform apply`:

1. Review every resource in the Terraform plan.
2. Verify current AWS pricing for every planned resource.
3. Confirm that no resource requires paid compute, storage, public IP addressing, data processing, or another chargeable dependency.
4. Do not apply the plan if any cost is uncertain.

## Prohibited by Default

The following resource categories must not be deployed unless a current account-specific review proves that they will cost $0:

- Compute instances
- Block storage
- Public IPv4 addresses
- NAT gateways
- Load balancers
- Managed databases
- Paid network endpoints
- Paid monitoring features
- Other metered managed services

These resources may still be represented in Terraform configuration for learning and validation without being applied.

## Teardown Rule

Any AWS resources created during Phase 6 must have a documented teardown procedure.

Terraform-managed resources should be removed with:

```text
terraform destroy