# ========================================
# modules/route_table_association/variables.tf
# ========================================
variable "associations" {
  description = "Map of route table associations"
  type = map(object({
    subnet_id      = string
    route_table_id = string
  }))
}