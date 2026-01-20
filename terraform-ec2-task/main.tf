resource "aws_instance" "EC2-demo" {
  ami           = var.ami
  instance_type = var.instance_type
  

  tags = {
    Name        = var.instance_name
    ManagedBy  = "Terraform"
    Environment = "test"
    subnet_id = var.subnet_id
  }
}
