resource "aws_s3_bucket" "pullapprove_storage_bucket" {
  bucket = "pullapprove-storage${var.aws_bucket_suffix}"
  acl    = "private"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }

  lifecycle_rule {
    id = "reports"
    prefix = "reports/"
    enabled = true
    expiration {
      days = 60
    }
  }
}
