output "s3_bucket_arn" {
  description = "The ARN of the bucket"
  value       = module.website.s3_bucket_arn
}

output "s3_bucket_name" {
  description = "The name of the bucket"
  value       = module.website.s3_bucket_name
}

output "s3_bucket_domain" {
  description = "The domain name of the bucket"
  value       = module.website.s3_bucket_domain
}

output "s3_bucket_endpoint" {
  description = "The bucket endpoint"
  value       = module.website.s3_bucket_endpoint
}