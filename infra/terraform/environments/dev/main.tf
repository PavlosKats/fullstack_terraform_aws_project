
locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

output "environment_name" {
  description = "Current Terraform environment name."
  value       = var.environment
}

output "aws_region" {
  description = "AWS region configured for this environment."
  value       = var.aws_region
}

output "name_prefix" {
  description = "Common naming prefix for resources."
  value       = local.name_prefix
}

module "network" {
  source               = "../../modules/network"
  name_prefix          = local.name_prefix
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

module "security" {
  source = "../../modules/security"

  name_prefix = local.name_prefix
  vpc_id      = module.network.vpc_id

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

module "database" {
  source = "../../modules/database"

  name_prefix        = local.name_prefix
  private_subnet_ids = module.network.private_subnet_ids

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

module "secrets" {
  source = "../../modules/secrets"

  name_prefix = local.name_prefix

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}

output "alb_security_group_id" {
  value = module.security.alb_security_group_id
}

output "app_security_group_id" {
  value = module.security.app_security_group_id
}

output "db_security_group_id" {
  value = module.security.db_security_group_id
}

output "db_subnet_group_name" {
  value = module.database.db_subnet_group_name
}

output "db_secret_arn" {
  value = module.secrets.db_secret_arn
}

output "db_secret_name" {
  value = module.secrets.db_secret_name
}