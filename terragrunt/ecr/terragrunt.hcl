terraform {
  source = "git::ssh://git@github.com/cloudposse/terraform-aws-ecr.git?ref=6f0dbedb9055f23637e75b2e1cf0e66e606e5ec5"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name = "infra_interview"
}
