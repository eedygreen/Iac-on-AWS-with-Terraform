# create S3 bucket from the custom module published to Terraform cloud

module "website" {
  source  = "app.terraform.io/website-modules/website/module"
  version = "1.0.4"
  s3_bucket_name = var.bucket_name
  s3_tags  = var.bucket_tags
  aws_region = var.aws_region
}
/* # this configuration is not required when cli login is configured.
   # For Security and best practices, do not hard code the value 
   # use terraform login
credentials "app.terraform.io" {
    # valid user API token:
    token = "DO Not Hard Code the Access Token"
  }

  */