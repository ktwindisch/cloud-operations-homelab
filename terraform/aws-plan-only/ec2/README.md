# EC2 Plan-Only Infrastructure

This Terraform configuration is for planning and learning only.

Do not run `terraform apply` from this directory.

The configuration includes AWS resources that would incur charges if created, including:

- EC2 compute
- EBS storage

The AWS account is not assumed to have Free Tier eligibility or promotional credits.

This configuration exists to demonstrate:

- EC2 Infrastructure as Code
- AMI discovery
- Security group design
- Private subnet placement
- EBS configuration
- Terraform validation
- Terraform planning
- Cost-aware infrastructure review

The Phase 6 zero-cost requirement prohibits applying this configuration.