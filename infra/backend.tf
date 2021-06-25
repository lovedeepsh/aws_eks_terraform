terraform {
  backend "s3" {
    bucket = "tarunlovedeepterraform2"
    key = "vpc/terraform.tfstate"
    region = "us-east-2"
  }
}