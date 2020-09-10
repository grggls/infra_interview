terraform {
  source = "./"
}

dependency "ecr_ci_user" {
  config_path = "../../users/ecr-ci"
}

inputs = {
  user = dependency.ecr_ci_user.outputs.this_iam_user_name
}
