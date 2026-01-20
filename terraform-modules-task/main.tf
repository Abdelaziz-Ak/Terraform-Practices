# ========================================
# Root main.tf
# ========================================

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  cidr_block           = var.vpc_cidr
  name                 = "demo-vpc"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

# Internet Gateway Module
module "internet_gateway" {
  source = "./modules/internet_gateway"

  vpc_id = module.vpc.vpc_id
  name   = "demo-igw"
}

# Public Subnets Module
module "public_subnets" {
  source = "./modules/subnet"

  vpc_id = module.vpc.vpc_id
  subnets = {
    public_a = {
      cidr_block              = var.public_subnet_a_cidr
      availability_zone       = var.az_a
      name                    = "public-a"
      map_public_ip_on_launch = true
    }
    public_b = {
      cidr_block              = var.public_subnet_b_cidr
      availability_zone       = var.az_b
      name                    = "public-b"
      map_public_ip_on_launch = true
    }
  }
}

# Private Subnets Module
module "private_subnets" {
  source = "./modules/subnet"

  vpc_id = module.vpc.vpc_id
  subnets = {
    private_a = {
      cidr_block              = var.private_subnet_a_cidr
      availability_zone       = var.az_a
      name                    = "private-a"
      map_public_ip_on_launch = false
    }
    private_b = {
      cidr_block              = var.private_subnet_b_cidr
      availability_zone       = var.az_b
      name                    = "private-b"
      map_public_ip_on_launch = false
    }
  }
}

# NAT Gateway Module
module "nat_gateway" {
  source = "./modules/nat_gateway"

  subnet_id = module.public_subnets.subnet_ids["public_a"]
  name      = "demo-nat"
}

# Route Tables Module
module "route_tables" {
  source = "./modules/route_table"

  vpc_id = module.vpc.vpc_id
  route_tables = {
    public = {
      name = "public-rt"
      routes = [
        {
          cidr_block = "0.0.0.0/0"
          gateway_id = module.internet_gateway.igw_id
        }
      ]
    }
    private = {
      name = "private-rt"
      routes = [
        {
          cidr_block     = "0.0.0.0/0"
          nat_gateway_id = module.nat_gateway.nat_gateway_id
        }
      ]
    }
  }
}

# Route Table Associations Module
module "route_table_associations" {
  source = "./modules/route_table_association"

  associations = {
    public_a = {
      subnet_id      = module.public_subnets.subnet_ids["public_a"]
      route_table_id = module.route_tables.route_table_ids["public"]
    }
    public_b = {
      subnet_id      = module.public_subnets.subnet_ids["public_b"]
      route_table_id = module.route_tables.route_table_ids["public"]
    }
    private_a = {
      subnet_id      = module.private_subnets.subnet_ids["private_a"]
      route_table_id = module.route_tables.route_table_ids["private"]
    }
    private_b = {
      subnet_id      = module.private_subnets.subnet_ids["private_b"]
      route_table_id = module.route_tables.route_table_ids["private"]
    }
  }
}