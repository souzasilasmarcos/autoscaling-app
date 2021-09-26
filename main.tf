provider "aws" {
  region  = "sa-east-1"
  profile = "devops.noob"
}

resource "aws_s3_bucket" "aws-codedeploy-sa-east-1-002" {
  bucket = "aws-codedeploy-sa-east-1-202109112314"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
    Owner       = "Lasmarco_dev"
    UpdatedAt   = "2021-09-11"
  }
}
