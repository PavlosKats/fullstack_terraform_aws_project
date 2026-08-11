locals {
  common_tags = merge(var.tags, {
    NamePrefix = var.name_prefix
  })
}

resource "aws_ssm_parameter" "db_host" {
    name = "/${var.name_prefix}/db/host"
    type = "String"
    value = var.db_host

    tags = merge(local.common_tags, {
        Name = "${var.name_prefix}-db-host"
    })
}

resource "aws_ssm_parameter" "db_port" {
    name = "/${var.name_prefix}/db/port"
    type = "String"
    value = tostring(var.db_port)

    tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-db-port"
    })
}

resource "aws_ssm_parameter" "db_name" {
    name = "/${var.name_prefix}/db/name"
    type = "String"
    value = var.db_name

    tags = merge(local.common_tags, {
        Name = "${var.name_prefix}-db-name"
    })
}

resource "aws_ssm_parameter" "db_secret_name" {
    name = "/${var.name_prefix}/db/secret-name"
    type = "String"
    value = var.db_secret_name

    tags = merge(local.common_tags,{
        Name = "${var.name_prefix}-db-secret-name"
    })
}

