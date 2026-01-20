# ========================================
# modules/route_table/main.tf
# ========================================
resource "aws_route_table" "this" {
  for_each = var.route_tables

  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = each.value.routes
    content {
      cidr_block     = route.value.cidr_block
      gateway_id     = lookup(route.value, "gateway_id", null)
      nat_gateway_id = lookup(route.value, "nat_gateway_id", null)
    }
  }

  tags = merge(
    var.tags,
    {
      Name = each.value.name
    }
  )
}