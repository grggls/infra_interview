terraform {
  source = "git::ssh://git@github.com/terraform-aws-modules/terraform-aws-iam.git//modules/iam-user?ref=5410119115c58526c722d327b546daab13963b8e"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name = "ecr-ci"

  create_iam_user_login_profile = false
  create_iam_access_key         = true
}
