resource "aws_eip" "nat_eip" {
  vpc   = true
  tags = {
    Name = var.nat_eip_name
    Creator = "terraform"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.Public_1a.id

  tags = {
    Name = var.nat_name
    Creator = "terraform"
  }
}


