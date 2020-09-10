variable "aws_access_key_id" {
  type        = string
  description = "The access key ID of the user to login to"
}

variable "aws_access_key" {
  type        = string
  description = "The access key of the user to login to"
}

variable "aws_region" {
  type        = string
  default     = "us-west-2"
  description = "The aws region to set as a secret, should be in the same region as the ecr repo deployment"
}

variable "aws_role_to_assume" {
  type        = string
  description = "The role to assume after logging in, should have access to the ECR repo"
}

variable "aws_ecr_repo" {
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

resource "github_actions_secret" "aws_region" {
  repository      = local.repository
  secret_name     = "AWS_REGION"
  plaintext_value = var.aws_region
}

resource "github_actions_secret" "aws_role_to_assume" {
  repository      = local.repository
  secret_name     = "AWS_ROLE_TO_ASSUME"
  plaintext_value = var.aws_role_to_assume
}

resource "github_actions_secret" "aws_ecr_repo" {
  repository      = local.repository
  secret_name     = "AWS_ECR_REPO"
  plaintext_value = var.aws_ecr_repo
}
