variable "name_prefix" {
  description = "Common prefix for naming resources"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for DB subnet group"
  type        = list(string)
}

variable "tags" {
  description = "Extra tags"
  type        = map(string)
  default     = {}
}