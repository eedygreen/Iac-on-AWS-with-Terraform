output "s3_bucket_arn" {
  description = "The ARN of the bucket"
  value       = module.s3_static_webiste.arn
}

output "s3_bucket_name" {
  description = "The name of the bucket"
  value       = module.s3_static_webiste.name
}

output "s3_bucket_domain" {
  description = "The domain name of the bucket"
  value       = module.s3_static_webiste.domain
}

output "s3_bucket_endpoint" {
  description = "The bucket endpoint"
  value       = module.s3_static_webiste.endpoint
}