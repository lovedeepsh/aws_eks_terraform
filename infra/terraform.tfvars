region = "us-east-2"

## VPC Details
vpc_name = "main_eks_istio"
vpc_cidr = "10.1.0.0/16"
dhcp_name = "main_eks"
## Subnet Details
pubsub_1a = "Public_1a"
pubsub_cidr_1a = "10.1.1.0/24"
pubsub_1b = "Public_1b"
pubsub_cidr_1b = "10.1.2.0/24"
privsub_1a = "Private_1a"
privsub_cidr_1a = "10.1.3.0/24"
privsub_1b = "Private_1b"
privsub_cidr_1b = "10.1.4.0/24"

## Other Components
igw_name = "igw"
nat_eip_name = "nat_eip"
nat_name = "nat"


## Route Table
public_rt_name = "public_rt"
private_rt_name = "private_rt"

