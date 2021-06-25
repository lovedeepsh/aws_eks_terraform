variable "region" {
  type        = string
  description = "Default Region For Terraform"
}

variable "eks_iam_role_name" {
  type        = string
  description = "EKS Cluster IAM Role Name"
}

variable "eks_cluster_sg" {
  type        = string
  description = "EKS Cluster Security Group Name"
}

variable "workstation_ip" {
  type        = string
  description = "Local Workstation IP"
}

variable "vpc_name" {
  type        = string
  description = "VPC Name"
}

variable "eks_cluster_name" {
  type        = string
  description = "Name of the EKS Cluster"
}

variable "eks_worker_iam_role_name" {
  type        = string
  description = "EKS Cluster Worker IAM Role Name"
}

variable "eks_worker_instance_profile_name" {
  type        = string
  description = "EKS Cluster Worker IAM Instance Profile Name"
}

variable "eks_worker_cluster_sg" {
  type        = string
  description = "EKS Cluster Worker IAM Instance Profile Name"
}

variable "desired-capacity" {
  default     = 2
  type        = string
  description = "Autoscaling Desired node capacity"
}

variable "max-size" {
  default     = 2
  type        = string
  description = "Autoscaling maximum node capacity"
}

variable "min-size" {
  default     = 1
  type        = string
  description = "Autoscaling Minimum node capacity"
}

variable "ec2-key-pair" {
  default     = "deployer-key"
  type        = string
  description = "Key Pair Name"
}

variable "node-spot-instance-type" {
  type        = list(string)
  description = "Worker Node EC2 instance type"
  default     = ["t3a.medium", "t3.medium"] 
}

variable "node-capacity-type" {
  default     = "SPOT"
  type        = string
  description = "Worker Node EC2 instance type"
}

variable "backend_bucket_name" {
  type        = string
  description = "Bucket Name for terraform backend"
}