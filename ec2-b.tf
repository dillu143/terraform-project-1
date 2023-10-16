#################################EC2-creation############################

resource "aws_instance" "ec2-b" {
  ami                         = "ami-0bb4c991fa89d4b9b"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  availability_zone           = "us-east-1b"
  subnet_id                   = aws_subnet.pub_sub_2.id
  key_name                    = aws_key_pair.key_pair.id
  tags = {
    Name = "pub-zn-b"
  }
  vpc_security_group_ids = [aws_security_group.security.id]
  user_data              = file("usdata-2.sh")
}
