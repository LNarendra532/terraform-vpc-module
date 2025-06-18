

resource "aws_vpc_peering_connection" "default" {
  count       = var.is_peering_required ? 1 : 0
  peer_vpc_id = data.aws_vpc.default.id # Accptor
  vpc_id      = aws_vpc.main.id    # Requestor
#   auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }
  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = merge(
    var.vpc_peering_tags,
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-default"
    }
  )
   auto_accept = true
}


#PUBLIC_ROUTE
resource "aws_route" "public_peer" {
    count       = var.is_peering_required ? 1 : 0
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id  = aws_vpc_peering_connection.default[count.index].id # CONNECT TO peer vpc accptor

}

resource "aws_route" "private_peer" {
    count       = var.is_peering_required ? 1 : 0
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id   = aws_vpc_peering_connection.default[count.index].id # pcx-peer CONNECT TO peer vpc accptor

}

resource "aws_route" "database_peer" {
    count       = var.is_peering_required ? 1 : 0
  route_table_id         = aws_route_table.database.id
  destination_cidr_block = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id  = aws_vpc_peering_connection.default[count.index].id # pcx-peer  CONNECT TO peer vpc accptor
}

# must and should add peering the route in default VPC too

resource "aws_route" "default_peering" {
    count       = var.is_peering_required ? 1 : 0
  route_table_id         = data.aws_route_table.main.id
  destination_cidr_block = var.cidr_block
  vpc_peering_connection_id  = aws_vpc_peering_connection.default[count.index].id # pcx-peer CONNECT TO peer vpc accptor
}
