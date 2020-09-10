terraform {
  source = "git::ssh://git@github.com/terraform-aws-modules/terraform-aws-iam.git//modules/iam-assumable-role?ref=fc5663586602fea13102c574304f89a1732c3aaa"
}

include {
  path = find_in_parent_folders()
}

dependency "ci_user" {
  config_path = "../../users/ecr-ci"
}

inputs = {
  trusted_role_arns = [
    dependency.ci_user.outputs.this_iam_user_arn,
  ]
  trusted_role_actions = [
    "sts:AssumeRole",
    "sts:TagSession"
  ]

  create_role = true

  role_name         = dependency.ci_user.outputs.this_iam_user_name
  role_requires_mfa = false

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser",
  ]
}
