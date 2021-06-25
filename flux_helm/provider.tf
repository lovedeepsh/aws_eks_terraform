provider "aws" {
  region              = var.region
}

provider "kubernetes" {
  host                   = data.terraform_remote_state.eks_cluster.outputs.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(data.terraform_remote_state.eks_cluster.outputs.eks_cluster_certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks-demo-cluster-auth.token
}

#provider "kubernetes" {
#  config_path    = "~/.kube/config"
#  config_context = "my-context"
#}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.eks_cluster.outputs.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(data.terraform_remote_state.eks_cluster.outputs.eks_cluster_certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.eks-demo-cluster-auth.token
  }
}