resource "aws_vpc" "main_eks_istio" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
    Type = "vpc"
    Creator = "terraform"
  }
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  vpc_id          = aws_vpc.main_eks_istio.id
  dhcp_options_id = aws_vpc_dhcp_options.main_eks.id
}
