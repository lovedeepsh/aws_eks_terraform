resource "aws_security_group" "eks_bastion_sg" {
  name        = "bastion_sg"
  description = "Security group for bastion in the cluster"
  vpc_id      = aws_vpc.main_eks_istio.id

  ingress {
    description = "Allow node to communicate with all IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Creator = "terraform"
  }
}

resource "aws_instance" "bastion" {
  ami           = var.AMIS[var.region]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_subnet.Public_1b.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.eks_bastion_sg.id]

  tags = {
    Creator = "terraform"
  }
}

