terraform {
  backend "s3" {
    bucket = "tarunlovedeepterraform2"
    key = "flux_eks/terraform.tfstate"
    region = "us-east-2"
  }
}