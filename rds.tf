resource "aws_db_subnet_group" "rds-subnet-group" {
  name       = "subnet-group"
  subnet_ids = ["${aws_subnet.pri_sub_2.id}" ,"${aws_subnet.pri_sub_4.id}" ]

  tags = {
    Name = "subnet group"
  }
}


resource "aws_db_instance" "db" {
  allocated_storage             = 20
  db_name                       = "mydb"
  engine                        = "mysql"
  engine_version                = "8.0.34"
  multi_az                      = false
  identifier                    = "rds-tf"
  instance_class                = "db.t2.medium"
  db_subnet_group_name          = aws_db_subnet_group.rds-subnet-group.name
  vpc_security_group_ids        = [aws_security_group.sg-2.id]
  skip_final_snapshot           = true
  username                      = "admin"
  password                      = "admin123"
}



resource "aws_security_group" "sg-2" {
  description = "Public internet access"
  vpc_id      = aws_vpc.vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "tf-sg2"
  }
}
