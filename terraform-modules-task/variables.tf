# ========================================
# Root variables.tf
# ========================================
variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.42.0.0/16"
}

variable "public_subnet_a_cidr" {
  description = "Public subnet A CIDR"
  type        = string
  default     = "10.42.1.0/24"
}

variable "public_subnet_b_cidr" {
  description = "Public subnet B CIDR"
  type        = string
  default     = "10.42.2.0/24"
}

variable "private_subnet_a_cidr" {
  description = "Private subnet A CIDR"
  type        = string
  default     = "10.42.3.0/24"
}

variable "private_subnet_b_cidr" {
  description = "Private subnet B CIDR"
  type        = string
  default     = "10.42.4.0/24"
}

variable "az_a" {
  description = "Availability Zone A"
  type        = string
  default     = "eu-north-1a"
}

variable "az_b" {
  description = "Availability Zone B"
  type        = string
  default     = "eu-north-1b"
}
