variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "iam_users" {
  description = "List of IAM users to create"
  type        = list(string)
  default = [
    "developer1",
    "developer2",
    "developer3",
    "developer4",
    "developer5",
    "developer6"
  ]
}

variable "developer_role_name" {
  description = "Name of the developer role"
  type        = string
  default     = "DeveloperRole"
}