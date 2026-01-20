# ========================================
# modules/route_table_association/outputs.tf
# ========================================
output "association_ids" {
  description = "Map of association IDs"
  value       = { for k, v in aws_route_table_association.this : k => v.id }
}