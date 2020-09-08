
terraform {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-rds.git?ref=b68b797d9e01136157bd3bc0339731b85549fc6e"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "postgres_password" {
  config_path = "../postgres-password"
}

inputs = {
  identifier = "interview"

  engine            = "postgres"
  engine_version    = "12.2"
  instance_class    = "db.t2.small"
  allocated_storage = 5
  storage_encrypted = false
  multi_az          = true

  name     = "interview"
  username = "postgres"

  password = dependency.postgres_password.outputs.password
  port     = 5432

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  backup_retention_period = 0

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  subnet_ids                = dependency.vpc.outputs.private_subnets
  family                    = "postgres12"
  major_engine_version      = "12"
  final_snapshot_identifier = "interview"
  deletion_protection       = false
}
