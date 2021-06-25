#### Creating Route Table For Public & Private

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_eks_istio.id

  tags = {
    Name = var.public_rt_name
    Creator = "terraform"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main_eks_istio.id

  tags = {
    Name = var.private_rt_name
    Creator = "terraform"
  }
}


#### Creating Routes For IGW & NAT

resource "aws_route" "igw_r" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "nat" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

#### Creating Route Table Association For Public & Private Subnets

resource "aws_route_table_association" "public_rt_ass_1a" {
  subnet_id      = aws_subnet.Public_1a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_ass_1b" {
  subnet_id      = aws_subnet.Public_1b.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt_ass_1a" {
  subnet_id      = aws_subnet.Private_1a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_ass_1b" {
  subnet_id      = aws_subnet.Private_1b.id
  route_table_id = aws_route_table.private_rt.id
}
