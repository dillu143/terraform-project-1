#################################################private-subnet-1&2#######################################################

resource "aws_subnet" "pri_sub_3" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false
  cidr_block              = "10.0.5.0/24"
  tags = {
    Name = "pub-sub-1-zn-B"
  }
}

resource "aws_subnet" "pri_sub_4" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false
  cidr_block              = "10.0.6.0/24"
  tags = {
    Name = "pri-sub-2-zn-B"
  }
}



###################################################Assocation#########################
resource "aws_route_table" "pri_route_2" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "pri-rout-1&2-B"
  }
}

resource "aws_route_table_association" "pri_ass_3" {
  subnet_id      = aws_subnet.pri_sub_3.id
  route_table_id = aws_route_table.pri_route_2.id
}

resource "aws_route_table_association" "pri_ass_4" {
  subnet_id      = aws_subnet.pri_sub_4.id
  route_table_id = aws_route_table.pri_route_2.id
}
