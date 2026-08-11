variable "name_prefix" {
  description = "Common prefix for naming resources"
  type        = string
}

variable "db_host" {
  description = "RDS endpoint host"
  type        = string
}

variable "db_port" {
  description = "database port"
  type        = number
  default     = 5432
}

variable "db_name" {
  description = "database name"
  type        = string
  default     = "tasktracker"
}

variable "db_secret_name" {
  description = "Secrets manager secret name for DB credentials"
  type        = string
}

variable "tags" {
  description = "Extra tags"
  type        = map(string)
  default     = {}
}