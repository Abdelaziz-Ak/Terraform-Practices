# ========================================
# modules/nat_gateway/variables.tf
# ========================================
variable "subnet_id" {
  description = "Subnet ID for NAT Gateway"
  type        = string
}

variable "name" {
  description = "Name tag for NAT Gateway"
  type        = string
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}