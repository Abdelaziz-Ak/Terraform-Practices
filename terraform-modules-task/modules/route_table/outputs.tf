# ========================================
# modules/route_table/outputs.tf
# ========================================
output "route_table_ids" {
  description = "Map of route table IDs"
  value       = { for k, v in aws_route_table.this : k => v.id }
}