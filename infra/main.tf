
resource "aws_s3_bucket" "homework_bucket" {
  bucket = "github-actions-homework-demo-2026-unique"

  tags = {
    Environment = "Homework"
  }
}

resource "aws_s3_bucket_public_access_block" "homework_bucket_access" {
  bucket = aws_s3_bucket.homework_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "homework_bucket_versioning" {
  bucket = aws_s3_bucket.homework_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
