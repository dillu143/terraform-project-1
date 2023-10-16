##Public-subnet-zone-A

resource "aws_subnet" "pub_sub_1" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  cidr_block              = "10.0.1.0/24"
  tags = {
    Name = "pub-ser-1-zn-A"
  }
}

resource "aws_route_table" "pub_route" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "pub-route-1-zn-A"
  }
}
resource "aws_route_table_association" "pub_ass" {
  subnet_id      = aws_subnet.pub_sub_1.id
  route_table_id = aws_route_table.pub_route.id
}

