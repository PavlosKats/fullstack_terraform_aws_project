output "backend_ecr_repository_name" {
  value = aws_ecr_repository.backend.name
}

output "backend_ecr_repository_url" {
  value = aws_ecr_repository.backend.repository_url
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.this.name
}

output "ecs_service_name" {
  value = aws_ecs_service.backend.name
}

output "alb_dns_name" {
  value = aws_lb.backend.dns_name
}

output "alb_zone_id" {
  value = aws_lb.backend.zone_id
}

output "backend_certificate_arn" {
  value = aws_acm_certificate.backend.arn
}

output "backend_certificate_validation_name" {
  value = one(aws_acm_certificate.backend.domain_validation_options).resource_record_name
}

output "backend_certificate_validation_value" {
  value = one(aws_acm_certificate.backend.domain_validation_options).resource_record_value
}