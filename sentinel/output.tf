
output "s3_bucket_endpoint" {
  description = "The bucket endpoint"
  value       = aws_s3_bucket.s3_bucket.s3_bucket_endpoint
}

output "s3_bucket_endpoint_url" {
  description = "The bucket endpoint"
  value       = "https://${aws_s3_bucket.s3_bucket.s3_bucket_endpoint}/index.html"
}