module "iam" {
  source = "./modules/iam"

  users           = var.iam_users
  role_name       = var.developer_role_name
  create_policies = true
}
