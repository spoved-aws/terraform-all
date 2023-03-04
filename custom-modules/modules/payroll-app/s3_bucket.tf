resource "aws_s3_bucket" "payroll_data" {
    bucket = "${var.app_region}-${var.bucket}"
    tags = var.s3-tags
}

resource "aws_s3_bucket" "statefile_s3" {
    bucket = "statefile-s3-${var.app_region}-${var.s3-statefile-tags.app}"
    tags = var.s3-statefile-tags
}

resource "aws_s3_bucket_versioning" "versioning_enabled_for_statefile" {
  bucket = "${aws_s3_bucket.statefile_s3.id}"
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "new_app_dir" {
  bucket = aws_s3_bucket.statefile_s3.id
  key    = "${var.app_region}_${var.s3-statefile-tags.Name}/"

  content = ""
  etag    = ""
}