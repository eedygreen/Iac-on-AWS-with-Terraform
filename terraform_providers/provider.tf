# terraform provider block
terraform {
    # the required version of terraform must be same as terraform cli
   required_version = "~> 1.0.0"

   # the required_providers downloads all the plugins that is required and does not need required_version.
   # required_version is the terrraform cli which is independent on required_providers
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.3, < 3.4"
        }
        # use random provider
        random = {
            source = "hashicorp/random"
            version = "3.1.0"
    }
    }
/*
    backend "s3" {
        bucket = ""
        key = "value"
        region = "us-east-1" 
    }

   # experiments = [ example]

   # provider_meta "required_providers" {
   #    hashicorp = "3.10"      
   #}
*/
}