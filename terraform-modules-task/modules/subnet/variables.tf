# ========================================
# modules/subnet/variables.tf
# ========================================
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    cidr_block              = string
    availability_zone       = string
    name                    = string
    map_public_ip_on_launch = bool
  }))
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}