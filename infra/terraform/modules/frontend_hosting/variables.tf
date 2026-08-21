variable "name_prefix" {
  description = "Common prefix for naming resources"
  type        = string
}

variable "tags" {
  description = "Extra tags"
  type        = map(string)
  default     = {}
}