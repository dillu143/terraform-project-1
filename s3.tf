resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-dilip-143"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
