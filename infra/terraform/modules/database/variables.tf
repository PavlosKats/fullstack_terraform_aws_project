variable "name_prefix" {
  description = "Common prefix for naming resources"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "db_security_group_id" {
  description = "Security group ID for the database"
  type        = string
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "tasktracker"
}

variable "db_username" {
  description = "Master username for the database"
  type        = string
  default     = "tasktracker_admin"
}

variable "db_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Extra tags"
  type        = map(string)
  default     = {}
}