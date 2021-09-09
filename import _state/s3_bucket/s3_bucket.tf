# the local resource name is an existing name of provisioned resources

resource "aws_s3_bucket" "static-website" {
    bucket = "eedy-state-bucket"  # this will create tfstate file without the use of terraform import
    acl = "private"  # if this is not specify the default value in state file will be null
    force_destroy = true  # setting this to true will allow terraform to delete the resource
    
}

# use the below command to import the existing resource from cloud

# terraform import aws_s3_bucket.static-website <bucket unique name>

# terraform import aws_s3_bucket.static-website  eedy-state-bucket

# terraform import aws_s3_bucket.bucket eedy-state-bucket

