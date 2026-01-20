# ========================================
# modules/internet_gateway/variables.tf
# ========================================
variable "vpc_id" {
  description = "VPC ID to attach IGW"
  type        = string
}

variable "name" {
  description = "Name tag for IGW"
  type        = string
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}