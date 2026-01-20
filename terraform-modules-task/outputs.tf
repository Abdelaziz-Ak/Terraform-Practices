# ========================================
# Root outputs.tf
# ========================================
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = module.internet_gateway.igw_id
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = module.nat_gateway.nat_gateway_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.public_subnets.subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.private_subnets.subnet_ids
}

output "route_table_ids" {
  description = "Route table IDs"
  value       = module.route_tables.route_table_ids
}