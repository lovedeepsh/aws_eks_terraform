# workers
resource "aws_security_group" "eks_worker_cluster_sg" {
  name        = var.eks_worker_cluster_sg
  description = "Security group for all nodes in the cluster"
  vpc_id      = data.terraform_remote_state.infra.outputs.vpc_id

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

resource "aws_security_group_rule" "eks-worker-cluster-ingress-self" {
  description              = "Allow node to communicate with each other"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.eks_worker_cluster_sg.id
  cidr_blocks              = ["10.1.3.0/24", "10.1.4.0/24"]
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "eks-worker-cluster-ingress-cluster" {
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
  from_port                = 1025
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_worker_cluster_sg.id
  cidr_blocks              = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24", "10.1.4.0/24"]
  to_port                  = 65535
  type                     = "ingress"
}