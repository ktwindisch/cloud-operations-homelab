output "aws_account_id" {
  description = "AWS account currently used by Terraform"
  value       = data.aws_caller_identity.current.account_id
  sensitive   = true
}

output "aws_region" {
  description = "AWS region configured for Terraform"
  value       = "us-east-2"
}