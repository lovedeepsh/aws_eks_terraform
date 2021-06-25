data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    region = var.region
    bucket = var.backend_bucket_name
    key    = "vpc/terraform.tfstate"
  }
}

data "terraform_remote_state" "eks_cluster" {
  backend = "s3"
  config = {
    region = var.region
    bucket = var.backend_bucket_name
    key    = "istio_eks/terraform.tfstate"
  }
}

data "aws_secretsmanager_secret_version" "git_ssh" {
  secret_id = "ref/github_ssh"
}

data "aws_eks_cluster_auth" "eks-demo-cluster-auth" {
  name = data.terraform_remote_state.eks_cluster.outputs.eks_cluster_name
}