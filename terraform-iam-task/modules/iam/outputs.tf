output "user_arns" {
  description = "ARNs of created IAM users"
  value       = { for k, v in aws_iam_user.users : k => v.arn }
}

output "user_names" {
  description = "Names of created IAM users"
  value       = [for user in aws_iam_user.users : user.name]
}

output "developer_role_arn" {
  description = "ARN of the developer role"
  value       = aws_iam_role.developer.arn
}

output "developer_role_name" {
  description = "Name of the developer role"
  value       = aws_iam_role.developer.name
}

output "policy_arns" {
  description = "ARNs of created policies"
  value = var.create_policies ? {
    s3_read_write   = aws_iam_policy.s3_read_write[0].arn
    ec2_admin       = aws_iam_policy.ec2_admin[0].arn
    dynamodb_read   = aws_iam_policy.dynamodb_read[0].arn
    ecs_read_write  = aws_iam_policy.ecs_read_write[0].arn
    rds_read_write  = aws_iam_policy.rds_read_write[0].arn
  } : {}
}
