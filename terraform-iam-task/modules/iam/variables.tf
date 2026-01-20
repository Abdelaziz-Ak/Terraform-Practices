variable "users" {
  description = "List of IAM users to create"
  type        = list(string)
}

variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "create_policies" {
  description = "Whether to create custom policies"
  type        = bool
}