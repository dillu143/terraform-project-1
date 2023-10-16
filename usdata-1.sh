#!/bin/bash
sudo yum update -y
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo yum install -y git
sudo git clone https://github.com/anilkumar3577/food.git /var/www/html

