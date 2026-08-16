variable "name_prefix" {
  description = "Common prefix for naming resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for ALB/target group"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for ALB and ECS tasks (low-cost mode)"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group ID for ALB"
  type        = string
}

variable "app_security_group_id" {
  description = "Security group ID for ECS app tasks"
  type        = string
}

variable "backend_image_tag" {
  description = "Tag to deploy from ECR"
  type        = string
  default     = "v1"
}

variable "container_port" {
  description = "Backend container port"
  type        = number
  default     = 4000
}

variable "desired_count" {
  description = "Desired ECS task count"
  type        = number
  default     = 1
}

variable "db_host" {
  description = "Database host endpoint"
  type        = string
}

variable "db_port" {
  description = "Database port"
  type        = number
  default     = 5432
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "tasktracker"
}

variable "db_user" {
  description = "Database username"
  type        = string
  default     = "tasktracker_admin"
}

variable "db_secret_arn" {
  description = "Secrets Manager ARN containing DB credentials JSON"
  type        = string
}

variable "tags" {
  description = "Extra tags"
  type        = map(string)
  default     = {}
}