# Generate a new SSH key pair locally
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Upload the public key to AWS
resource "aws_key_pair" "ec2_key" {
  key_name   = "terraform-ec2-key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

# My EC2 instance with Nginx installed on launch
resource "aws_instance" "EC2-demo" {
  # Machine's base image
  ami           = var.ami
  # Instance type like t3 micro since I'm using free tier account
  instance_type = var.instance_type
  # Assign the EC2 to a subnet
  subnet_id = var.subnet_id
  # Tie the security group to the created EC2
  vpc_security_group_ids = [aws_security_group.ec2-demo_sg.id]
  # Attach the created key pair to the EC2
  key_name      = aws_key_pair.ec2_key.key_name
  # Assign a public IP to the EC2 so you can SSH on it
  associate_public_ip_address = true
  

  # The EC2 shall be created after creating the sg and key pair since EC2 gonna use them
  # Terraform handles this automatically bec I referenced them in attributes so
  # So no need for depends_on here as EC2 will be created after the SG and key pair
  depends_on = [
    aws_security_group.ec2-demo_sg,
    aws_key_pair.ec2_key
  ]

  tags = {
    Name        = var.instance_name
    ManagedBy  = "Terraform"
    Environment = "test"
  }

  # User data script to install Nginx
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl enable nginx
              systemctl start nginx
              EOF
}

# Security Group allowing SSH + HTTP
resource "aws_security_group" "ec2-demo_sg" {
  name        = "terraform-ec2-demo-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-ec2-sg"
  }
}
