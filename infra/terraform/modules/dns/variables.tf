variable "domain_name" {
  type        = string
  description = "Root domain managed by Route 53."
}

variable "api_record_name" {
  type        = string
  description = "API hostname label."
  default     = "api"
}

variable "certificate_validation_name" {
  type        = string
  description = "ACM DNS validation record name."
}

variable "certificate_validation_value" {
  type        = string
  description = "ACM DNS validation record value."
}

variable "alb_dns_name" {
  type        = string
  description = "Application Load Balancer DNS name."
}

variable "alb_zone_id" {
  type        = string
  description = "Application Load Balancer Route 53 zone ID."
}

variable "tags" {
  type        = map(string)
  description = "Extra resource tags."
  default     = {}
}