output "S3_arn" {
  description = "ARN of the S3 Bucket"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "S3_name" {
  description = "The Name of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.id
}

output "S3_domain" {
  description = "The domain Name of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.website_domain
}

output "S3_endpoint" {
  description = "The endpoint of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.website_endpoint
}

# for any error refer to the below link
# https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest?tab=outputs
