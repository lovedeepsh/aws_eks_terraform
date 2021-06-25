resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = var.eks_cluster_name
  node_group_name = "${var.eks_cluster_name}-default-node-group"
  node_role_arn   = aws_iam_role.eks_worker_iam_role.arn
  subnet_ids      = data.aws_subnet_ids.private.ids
  scaling_config {
    desired_size = var.desired-capacity
    max_size     = var.max-size
    min_size     = var.min-size
  }
  remote_access {
    ec2_ssh_key     = var.ec2-key-pair
  }

  instance_types = var.node-spot-instance-type
  capacity_type = var.node-capacity-type
  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_eks_cluster.eks_cluster,
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy
  ]
  tags = {
    Name = "${var.eks_cluster_name}-default-node-group"
  }
}