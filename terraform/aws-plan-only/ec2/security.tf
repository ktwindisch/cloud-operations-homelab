resource "aws_security_group" "ec2_plan_only" {
  name        = "homelab-ec2-plan-only"
  description = "Plan-only security group for EC2 design exercise"
  vpc_id      = data.aws_vpc.homelab.id

  tags = {
    Name = "homelab-ec2-plan-only"
  }
}