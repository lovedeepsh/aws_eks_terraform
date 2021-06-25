resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_eks_istio.id

  tags = {
    Name = var.igw_name
    Creator = "terraform"
  }
}

