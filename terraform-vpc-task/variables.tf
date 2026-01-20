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
  default = "10.42.1.0/24"
}

variable "public_subnet_b_cidr" {
  default = "10.42.2.0/24"
}

variable "private_subnet_a_cidr" {
  default = "10.42.3.0/24"
}

variable "private_subnet_b_cidr" {
  default = "10.42.4.0/24"
}

variable "az_a" {
  default = "eu-north-1a"
}

variable "az_b" {
  default = "eu-north-1b"
}
