# ========================================
# modules/vpc/variables.tf
# ========================================
variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "name" {
  description = "Name tag for VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS support"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
