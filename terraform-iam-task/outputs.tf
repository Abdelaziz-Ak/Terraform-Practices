output "iam_users" {
  description = "Created IAM users"
  value       = module.iam.user_names
}

output "developer_role" {
  description = "Developer role ARN"
  value       = module.iam.developer_role_arn
}

output "policies" {
  description = "Created policy ARNs"
  value       = module.iam.policy_arns
}