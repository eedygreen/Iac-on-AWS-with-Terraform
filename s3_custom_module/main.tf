# Create S3 Bucket

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"PublicReadGetObject",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject","s3:GetObjectVersion"],
      "Resource":[
          "arn:aws:s3:::${var.bucket_name}/*"
          ]
    }
  ]
}        
EOF

  website {
    index_document = "index.html"
    error_document = "error.html" # optional, add if applicable
  }

  tags          = var.bucket_tags
  force_destroy = true # To allow terraform destroy, but be caution of production use case of force_destroy. Set it to false or don't add it. 

}
