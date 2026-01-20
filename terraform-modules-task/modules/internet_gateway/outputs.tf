#========================================
# modules/internet_gateway/outputs.tf
# ========================================
output "igw_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.this.id
}