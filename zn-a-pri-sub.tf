#################################################private-subnet-1&2#######################################################

resource "aws_subnet" "pri_sub_1" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  cidr_block              = "10.0.2.0/24"
  tags = {
    Name = "pri-sub-1-zn-A"
  }
}

resource "aws_subnet" "pri_sub_2" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  cidr_block              = "10.0.3.0/24"
  tags = {
    Name = "pri-sub-2-zn-A"
  }
}



#################################################route-table-creation#################################



resource "aws_route_table" "pri_route" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "pri-rout-1&2-A"
  }
}

resource "aws_route_table_association" "pri_ass_1" {
  subnet_id      = aws_subnet.pri_sub_1.id
  route_table_id = aws_route_table.pri_route.id
}

resource "aws_route_table_association" "pri_ass_2" {
  subnet_id      = aws_subnet.pri_sub_2.id
  route_table_id = aws_route_table.pri_route.id
}

