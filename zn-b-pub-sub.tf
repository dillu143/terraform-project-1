##Public-subnet-zone-A

resource "aws_subnet" "pub_sub_2" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  cidr_block              = "10.0.4.0/24"
  tags = {
    Name = "pub-sub-2-zn-B"
  }
}

resource "aws_route_table" "pub_route_2" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "pub-route-2-zn-B"
  }
}
resource "aws_route_table_association" "pub_ass_2" {
  subnet_id      = aws_subnet.pub_sub_2.id
  route_table_id = aws_route_table.pub_route_2.id
}


