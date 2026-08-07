locals {
  common_tags = merge(var.tags, {
    NamePrefix = var.name_prefix
  })
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.name_prefix}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-db-subnet-group"
    Tier = "private"
  })
}