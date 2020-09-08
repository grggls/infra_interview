terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-vpc.git?ref=v2.24.0"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name = "interview"

  cidr = "10.1.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
  private_subnets = ["10.1.0.0/19", "10.1.32.0/19", "10.1.64.0/19", "10.1.96.0/19"]
  public_subnets  = ["10.1.128.0/19", "10.1.160.0/19", "10.1.192.0/19", "10.1.224.0/19"]

  enable_dns_support   = true
  enable_dns_hostnames = true

  enable_nat_gateway = true
  single_nat_gateway = false

  tags = {
    "environment" = "interview"
  }

  private_subnet_tags = {
    "scope" = "private"
  }

  public_subnet_tags = {
    "scope" = "public"
  }
}
