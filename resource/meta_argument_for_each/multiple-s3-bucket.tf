# Create S3 Bucket with meta argument for_each

resource "aws_s3_bucket" "feed-bucket" {
  for_each = {
    "dev"   = "api-feed-bucket"
    "ops"   = "api-feed-bucket"
    "stage" = "api-feed-bucket"
    "prod"  = "api-feed-bucket"
  }
  bucket = "${each.key}-${each.value}"
  acl    = "private"
  tags = {
    bucketname  = "${each.key}-${each.value}"
    Environment = each.key
    eachvalue   = each.value
  }
}