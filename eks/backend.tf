terraform {
  backend "s3" {
    bucket = "tarunlovedeepterraform2"
    key = "istio_eks/terraform.tfstate"
    region = "us-east-2"
  }
}