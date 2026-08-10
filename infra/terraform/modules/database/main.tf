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

resource "aws_db_instance" "this" {
  identifier = "${var.name_prefix}-db"

  engine         = "postgres"
  instance_class = "db.t3.micro"

  allocated_storage     = 20
  storage_type          = "gp3"
  storage_encrypted     = true
  publicly_accessible   = false
  multi_az              = false
  skip_final_snapshot   = true
  deletion_protection   = false
  apply_immediately     = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [var.db_security_group_id]

  backup_retention_period = 7

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-db"
    Tier = "private"
  })
}