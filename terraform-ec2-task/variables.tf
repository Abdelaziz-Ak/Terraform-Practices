variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "eu-north-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "terraform-ec2-demo"
}

variable "subnet_id" {
  default = "subnet-0a83b7b7c84c3b34a"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  default = "ami-0fa91bc90632c73c9"
  type = string
}
