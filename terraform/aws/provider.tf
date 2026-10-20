provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      Project   = "cloud-operations-homelab"
      ManagedBy = "terraform"
    }
  }
}