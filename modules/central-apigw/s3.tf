resource "aws_s3_bucket" "main" {
  bucket = "${var.name}-certs-${data.aws_caller_identity.current.account_id}"
  acl    = "private"

  tags = {
    Name = "${var.name}-certs-${data.aws_caller_identity.current.account_id}"
  }

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_object" "cert" {
  bucket = aws_s3_bucket.main.id
  key    = var.certificate_s3_key
  source = var.certificate_path

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5(var.certificate_path)
}

output "certid" {
  value = aws_s3_bucket_object.cert.id
}
