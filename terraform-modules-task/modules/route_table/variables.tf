# ========================================
# modules/route_table/variables.tf
# ========================================
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "route_tables" {
  description = "Map of route tables to create"
  type = map(object({
    name = string
    routes = list(object({
      cidr_block     = string
      gateway_id     = optional(string)
      nat_gateway_id = optional(string)
    }))
  }))
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}