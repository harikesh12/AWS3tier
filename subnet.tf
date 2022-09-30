resource "aws_subnet" "publicSubnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.cidr[count.index]
  availability_zone = var.az[count.index]
  count             = 2

  tags = {
    Name = "PunlicSubnet"
  }
}

resource "aws_subnet" "privateSubnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "privateSubnet"
  }
}

# data "aws_subnet" "data" {
#   filter {
#     name   = "VPC-ID"
#     values = [aws_vpc.vpc.id]
#   }

# }
