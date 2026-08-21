locals {
  common_tags = merge(var.tags, {
    NamePrefix = var.name_prefix
  })
}

resource "aws_secretsmanager_secret" "db_credentials" {
  name        = "${var.name_prefix}/db/credentials"
  description = "Database credentials for task tracker (${var.name_prefix})"

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-db-credentials"
  })
}