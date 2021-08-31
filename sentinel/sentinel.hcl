policy "check-version" {
    source  = "./chec-version.sentinel"
    enforcement_level = "hard-mandatory"
}

policy "restrict-s3-bucket" {
    source = "./restrcit-s3-bucket.sentinel"
    enforcement_level = "soft-mandatory"
}