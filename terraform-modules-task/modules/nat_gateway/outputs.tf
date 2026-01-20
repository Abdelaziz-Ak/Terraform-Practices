# ========================================
# modules/nat_gateway/outputs.tf
# ========================================
output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.this.id
}

output "eip_id" {
  description = "Elastic IP ID"
  value       = aws_eip.this.id
}

output "eip_public_ip" {
  description = "Elastic IP public IP"
  value       = aws_eip.this.public_ip
}