# Infra technical - Scripting & Deployments 

# Objective

Deploy the `client` and `server` application with Terraform in AWS.

# Pre-Conditions

- Given temporary credentials to access the interview AWS account by the interviewer over a secure channel

# Requirements

NOTE: The Postgres RDS cluster, Redis instance and the VPC is already created. See the `postgres`, `redis` and `vpc` 
Terragrunt deployments.

- Deploy the `server` and `client` containers using container orchestration of choice.
- Server and client must be operational, configured to communicate with their dependent services.
- HCL2 Terraform configuration written to deploy and manage updates for these services.
    - Preferable to use open source modules with a flat hierarchy
    - The use of writing a custom module can also be done

# Bonuses

- When performing version updates, how would you get Terraform to wait on deployment signals?
- How would you manage a flat hierarchy of module deployments?
- How could you make deployment simpler by using docker-compose with AWS?
