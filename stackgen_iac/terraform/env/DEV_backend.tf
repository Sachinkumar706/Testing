terraform {
  backend "s3" {
    bucket = "sachin-08062026"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}
