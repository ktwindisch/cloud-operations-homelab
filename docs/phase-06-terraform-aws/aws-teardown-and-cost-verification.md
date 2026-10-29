# AWS Teardown and Cost Verification

## Overview

Phase 6.8 completed the teardown and verification portion of the AWS Terraform lifecycle.

The goal was to remove all AWS infrastructure previously created by Terraform, verify that no managed networking resources remained, and confirm that the project continued to meet its strict zero-cost requirement.

## Destroy Planning

Before deleting infrastructure, Terraform generated a dedicated destroy plan.

The plan was reviewed before execution to confirm that only the previously created networking resources would be removed.

The expected destroy scope was:

```text
0 to add
0 to change
5 to destroy
```

The resources scheduled for removal were:

- VPC
- Subnet
- Internet Gateway
- Route table
- Route table association

## Terraform Destroy

The reviewed destroy plan was applied through Terraform.

All five previously created networking resources were removed.

The temporary saved destroy plan was deleted afterward and remained excluded from version control.

## Terraform State Verification

Terraform state was checked after teardown.

No managed AWS infrastructure resources remained.

The Terraform configuration files remain in the repository so the networking environment can be recreated later if needed.

## AWS Resource Verification

AWS CLI queries were used to check for leftover resources associated with the homelab.

The following were checked:

- VPC
- Subnet
- Internet Gateway
- Route table

All queries returned no matching resources.

This confirmed that the Terraform-managed networking environment had been removed from AWS.

## Billing Access

During cost verification, the IAM Identity Center administrative session initially could not access AWS Billing information.

The AWS account-level setting that allows IAM and federated identities to access billing information was disabled.

The root account was used only to enable this account-level billing access setting.

Afterward, billing information became available through the normal non-root administrative Identity Center session.

## Cost Verification

The AWS Billing and Cost Management dashboard was reviewed after teardown.

At the time of verification:

```text
Month-to-date cost: $0.00
Forecasted current-month cost: $0.00
Budget status: OK
Cost anomalies: None detected
```

The networking exercise therefore remained within the Phase 6 zero-cost requirement based on the billing information currently available.

## Infrastructure Lifecycle

Phase 6 has now demonstrated the full Terraform infrastructure lifecycle:

```text
Configure
→ Validate
→ Plan
→ Review
→ Apply
→ Verify
→ Destroy
→ Verify cleanup
→ Verify cost
```

## Result

All Terraform-managed AWS networking infrastructure was successfully destroyed.

No matching homelab networking resources remained in AWS after teardown.

Current AWS billing showed $0.00 month-to-date cost and a $0.00 forecast.

Phase 6.8 is complete.