terraform {
  backend "s3" {
    bucket         = "terraform-sbommul1-state"   # your bucket name
    key            = "envs/dev/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}