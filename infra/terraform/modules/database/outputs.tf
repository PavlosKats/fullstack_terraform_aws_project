output "db_subnet_group_name" {
  value = aws_db_subnet_group.this.name
}

output "db_instance_endpoint" {
  value = aws_db_instance.this.address
}

output "db_instance_identifier" {
  value = aws_db_instance.this.identifier
}