# Terraform-Practices

This repository is a collection of Terraform practice exercises focused on provisioning and managing AWS infrastructure. Each subdirectory contains Terraform configurations for specific tasks, demonstrating various aspects of Infrastructure as Code (IaC) using Terraform.

## Repository Structure

- **terraform-test/**: Test configurations and examples, for validating Terraform setups or learning purposes.

- **terraform-aws-install.sh**: A shell script for installing AWS so Terraform can work on your environment.

- **terraform-backend/**: Configurations for setting up a Terraform backend, typically for remote state management (e.g., using S3 and DynamoDB).

- **terraform-ec2-task/**: Terraform code to provision an AWS EC2 instance, including variables for AMI, instance type, and tags.

- **terraform-ec2-task2/**: Another EC2 provisioning task, it's an extension of the first EC2 task for: generating SSH key pair, installing Nginx on it, creating a new Security Group allowing SSH + HTTP and tying the created EC2 to it.

- **terraform-vpc-task/**: VPC setup including subnets (public and private), internet gateway, NAT gateway, route tables, and associations.
  -**Note that:** **vpc-task** depends on the backend created from **terraform-backend** task, so you must apply the backend first then this **vpc-task**.

- **terraform-modules-task/**: A collection of reusable Terraform modules for AWS VPC components, including:
  - Internet Gateway
  - NAT Gateway
  - Route Table
  - Route Table Association
  - Subnet
  - VPC
 
- **terraform-iam-task/**: Configurations for creating IAM users, roles, and policies using a custom IAM module.

## Prerequisites

1. Ensure you have Terraform installed (refer to `terraform-install.sh` if needed).
2. Ensure you have AWS CLI installed (refere to `terraform-aws-install.sh` if needed) configured with appropriate credentials.

## Getting Started

1. Navigate to any subdirectory and initialize Terraform: `terraform init`
2. Review and customize variables in `variables.tf` as needed.
3. Plan the deployment: `terraform plan`
4. Apply the configuration: `terraform apply`



## Notes

These configurations are for educational and practice purposes.
