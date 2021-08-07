# resource
# random name generator
resource "random_pet" "petname" {
    length = 5
    separator = "-"

}

resource "aws_s3_bucket" "lock-bucket" {
    bucket = random_pet.petname.id
    acl    = "public-read"
    tags = {
    Name        = "dependency_lock_bucket"
    Environment = "Dev"
  }
}