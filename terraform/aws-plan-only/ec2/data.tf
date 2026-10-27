data "aws_vpc" "homelab" {
  filter {
    name   = "tag:Name"
    values = ["cloud-operations-homelab"]
  }
}

data "aws_subnet" "homelab_public" {
  filter {
    name   = "tag:Name"
    values = ["homelab-public-subnet"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.homelab.id]
  }
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-6.1-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}