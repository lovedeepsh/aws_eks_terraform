resource "aws_subnet" "Public_1a" {
  vpc_id     = aws_vpc.main_eks_istio.id
  cidr_block = var.pubsub_cidr_1a
  availability_zone = format("%sa", var.region)

  tags = {
    Name = var.pubsub_1a
    Type = "Public"
    Creator = "terraform"
  }
}

resource "aws_subnet" "Public_1b" {
  vpc_id     = aws_vpc.main_eks_istio.id
  cidr_block = var.pubsub_cidr_1b
  availability_zone = format("%sb", var.region)

  tags = {
    Name = var.pubsub_1b
    Type = "Public"
    Creator = "terraform"
  }
}

resource "aws_subnet" "Private_1a" {
  vpc_id     = aws_vpc.main_eks_istio.id
  cidr_block = var.privsub_cidr_1a
  availability_zone = format("%sa", var.region)

  tags = {
    Name = var.privsub_1a
    Type = "Private"
    Creator = "terraform"
  }
}

resource "aws_subnet" "Private_1b" {
  vpc_id     = aws_vpc.main_eks_istio.id
  cidr_block = var.privsub_cidr_1b
  availability_zone = format("%sb", var.region)

  tags = {
    Name = var.privsub_1b
    Type = "Private"
    Creator = "terraform"
  }
}
