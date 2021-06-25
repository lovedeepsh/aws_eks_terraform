resource "aws_vpc_dhcp_options" "main_eks" {
  domain_name          = format("%s.compute.internal", var.region) #"ec2.internal"
  domain_name_servers  = ["AmazonProvidedDNS"]
  
  tags = {
    Name = var.dhcp_name
  }
}