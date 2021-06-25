resource "aws_s3_bucket" "backend_bucket" {
  bucket = var.backend_bucket_name
  acl    = "private"
  force_destroy = true

  tags = {
    Name        = var.backend_bucket_name
    Creator     = "terraform"
  }
}