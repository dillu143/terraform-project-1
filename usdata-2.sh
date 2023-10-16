#!/bin/bash
sudo yum install git -y 
sudo yum update -y
sudo yum install httpd -y
sudo systemctl restart httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo git clone https://github.com/anitha8242/ecomm.git /var/www/html/
