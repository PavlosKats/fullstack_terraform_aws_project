variable "name_prefix" {
  description = "Common prefix for naming resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

variable "app_port" {
  description = "Port used by the application"
  type        = number
  default     = 4000
}

variable "db_port" {
  description = "Port used by PostgreSQL"
  type        = number
  default     = 5432
}

variable "tags" {
  description = "Extra tags"
  type        = map(string)
  default     = {}
}