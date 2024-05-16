terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.42.0"
    }
  }
}

resource "aws_s3_bucket" "default" {
}

resource "aws_s3_object" "default" {
  bucket = aws_s3_bucket.default.id
  key    = "hello.txt"
  source = "hello.txt"
  etag = filemd5("hello.txt")
}

