variable "region" {
  default = "eu-north-1"
}

variable "bucket_name" {
  default = "terraform-azak-bucket"
}

variable "dynamodb_table_name" {
  default = "terraform-state-locks"
}
