resource "aws_nat_gateway" "ng" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.publicSubnet[0].id

  tags = {
    "name" = "NAT GW"
  }

  # to ensure proper ordering it is recommended that to add an explicity dependency on internet gateway for the VPC
  depends_on = [aws_internet_gateway.ig]
}