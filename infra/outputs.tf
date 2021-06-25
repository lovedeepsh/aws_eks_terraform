output "vpc_id" {
  value = aws_vpc.main_eks_istio.id
}

output "vpc_cidr" {
  value = aws_vpc.main_eks_istio.cidr_block
}