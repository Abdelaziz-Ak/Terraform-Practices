# Create IAM Users
resource "aws_iam_user" "users" {
  for_each = toset(var.users)
  name     = each.value
  path     = "/"

  tags = {
    Name        = each.value
    Environment = "Development"
  }
}

# Create Developer Role
resource "aws_iam_role" "developer" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = [for user in aws_iam_user.users : user.arn]
        }
      }
    ]
  })

  tags = {
    Name = var.role_name
  }
}

# S3 Read/Write Policy
resource "aws_iam_policy" "s3_read_write" {
  count       = var.create_policies ? 1 : 0
  name        = "S3ReadWritePolicy"
  description = "Policy for S3 read and write access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ]
        Resource = [
          "arn:aws:s3:::*",
          "arn:aws:s3:::*/*"
        ]
      }
    ]
  })
}

# EC2 Admin Policy
resource "aws_iam_policy" "ec2_admin" {
  count       = var.create_policies ? 1 : 0
  name        = "EC2AdminPolicy"
  description = "Policy for EC2 admin access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "ec2:*"
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "elasticloadbalancing:*",
          "cloudwatch:*",
          "autoscaling:*"
        ]
        Resource = "*"
      }
    ]
  })
}

# DynamoDB Read Policy
resource "aws_iam_policy" "dynamodb_read" {
  count       = var.create_policies ? 1 : 0
  name        = "DynamoDBReadPolicy"
  description = "Policy for DynamoDB read access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:GetItem",
          "dynamodb:BatchGetItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:DescribeTable",
          "dynamodb:ListTables"
        ]
        Resource = "arn:aws:dynamodb:*:*:table/*"
      }
    ]
  })
}

# ECS Read/Write Policy (assuming you meant ECS, not ETS)
resource "aws_iam_policy" "ecs_read_write" {
  count       = var.create_policies ? 1 : 0
  name        = "ECSReadWritePolicy"
  description = "Policy for ECS read and write access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecs:*",
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      }
    ]
  })
}

# RDS Read/Write Policy
resource "aws_iam_policy" "rds_read_write" {
  count       = var.create_policies ? 1 : 0
  name        = "RDSReadWritePolicy"
  description = "Policy for RDS read and write access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "rds:Describe*",
          "rds:List*",
          "rds:CreateDBInstance",
          "rds:ModifyDBInstance",
          "rds:DeleteDBInstance",
          "rds:CreateDBSnapshot",
          "rds:DeleteDBSnapshot",
          "rds:RestoreDBInstanceFromDBSnapshot",
          "rds:AddTagsToResource",
          "rds:RemoveTagsFromResource"
        ]
        Resource = "*"
      }
    ]
  })
}

# Attach Policies to Role
resource "aws_iam_role_policy_attachment" "s3_attach" {
  count      = var.create_policies ? 1 : 0
  role       = aws_iam_role.developer.name
  policy_arn = aws_iam_policy.s3_read_write[0].arn
}

resource "aws_iam_role_policy_attachment" "ec2_attach" {
  count      = var.create_policies ? 1 : 0
  role       = aws_iam_role.developer.name
  policy_arn = aws_iam_policy.ec2_admin[0].arn
}

resource "aws_iam_role_policy_attachment" "dynamodb_attach" {
  count      = var.create_policies ? 1 : 0
  role       = aws_iam_role.developer.name
  policy_arn = aws_iam_policy.dynamodb_read[0].arn
}

resource "aws_iam_role_policy_attachment" "ecs_attach" {
  count      = var.create_policies ? 1 : 0
  role       = aws_iam_role.developer.name
  policy_arn = aws_iam_policy.ecs_read_write[0].arn
}

resource "aws_iam_role_policy_attachment" "rds_attach" {
  count      = var.create_policies ? 1 : 0
  role       = aws_iam_role.developer.name
  policy_arn = aws_iam_policy.rds_read_write[0].arn
}

# Allow users to assume the developer role
resource "aws_iam_user_policy" "assume_role" {
  for_each = aws_iam_user.users
  name     = "AssumeRolePolicy"
  user     = each.value.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "sts:AssumeRole"
        Resource = aws_iam_role.developer.arn
      }
    ]
  })
}
