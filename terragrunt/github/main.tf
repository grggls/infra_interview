variable "aws_access_key_id" {
  type        = string
  description = "The access key ID of the user to login to"
}

variable "aws_access_key" {
  type        = string
  description = "The access key of the user to login to"
}

variable "aws_ecr_url" {
  type        = string
  description = "The ECR repo to push images to"
}

locals {
  repository = "infra_interview"
}

data "github_actions_public_key" "infra_interview" {
  repository = local.repository
}

resource "github_actions_secret" "aws_access_key_id" {
  repository      = local.repository
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = var.aws_access_key_id
}

resource "github_actions_secret" "aws_access_key" {
  repository      = local.repository
  secret_name     = "AWS_ACCESS_KEY"
  plaintext_value = var.aws_access_key
}

resource "github_actions_secret" "aws_ecr_url" {
  repository      = local.repository
  secret_name     = "AWS_ECR_URL"
  plaintext_value = var.aws_ecr_url
}
