output "db_host_param_name" {
  value = aws_ssm_parameter.db_host.name
}

output "db_port_param_name" {
  value = aws_ssm_parameter.db_port.name
}

output "db_name_param_name" {
  value = aws_ssm_parameter.db_name.name
}

output "db_secret_name_param_name" {
  value = aws_ssm_parameter.db_secret_name.name
}