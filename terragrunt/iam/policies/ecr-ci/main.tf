variable "user" {
  description = "The user to attach the EC2ContainerRegistryPowerUser policy to"
  type        = string
}

resource "aws_iam_user_policy_attachment" "ecr-ci" {
  user       = var.user
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}
