# ========================================
# modules/subnet/outputs.tf
# ========================================
output "subnet_ids" {
  description = "Map of subnet IDs"
  value       = { for k, v in aws_subnet.this : k => v.id }
}

output "subnet_arns" {
  description = "Map of subnet ARNs"
  value       = { for k, v in aws_subnet.this : k => v.arn }
}