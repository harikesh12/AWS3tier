resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    "name" = "route"
  }

}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.publicSubnet[count.index].id
  route_table_id = aws_route_table.rt.id
  count          = 2
}

# added nat gateway in route table of private subnet
resource "aws_route_table" "privateRt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ng.id
  }

  tags = {
    "name" = "Privateroute"
  }

}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.privateSubnet.id
  route_table_id = aws_route_table.privateRt.id
}