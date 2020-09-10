terraform {
  source = "./"
}

dependency "ecr_ci_user" {
  config_path = "../iam/users/ecr-ci"
}

dependency "ecr_ci_repo" {
  config_path = "../ecr"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  aws_access_key_id = dependency.ecr_ci_user.outputs.this_iam_access_key_id
  aws_access_key    = dependency.ecr_ci_user.outputs.this_iam_access_key_secret
  aws_ecr_url       = dependency.ecr_ci_repo.outputs.repository_url
  github_token      = get_env("GITHUB_TOKEN", "")
  github_owner      = get_env("GITHUB_OWNER", "")
}
