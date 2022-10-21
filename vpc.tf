resource "aws_vpc" "cluster" {
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = "10.0.0.0/22"
  enable_classiclink               = false
  enable_classiclink_dns_support   = false
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"
  tags = {
    "Name" = var.cluster-name
  }
}

/* resource "aws_vpc_ipv4_cidr_block_association" "vpc-cidr-assoc" {
  cidr_block = "100.64.0.0/16"
  vpc_id     = aws_vpc.vpc-cluster.id

  timeouts {}
} */

resource "aws_eip" "eipalloc-052dd24eaa93ed064" {
  public_ipv4_pool = "amazon"
  tags             = {}
  vpc              = true

  timeouts {}
}

resource "aws_nat_gateway" "nat-cicd" {
  allocation_id = aws_eip.eipalloc-052dd24eaa93ed064.id
  subnet_id     = aws_subnet.subnet-cicd-public1.id
  tags = {
    "Name" = "ngw-eks-cicd"
  }
}

resource "aws_internet_gateway" "igw-02c295b01d50c9d3e" {
  tags = {
    "Name" = "igw-eks-cicd"
  }
  vpc_id = aws_vpc.cluster.id
}


data "aws_availability_zones" "az" {
  state = "available"
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_kms_key" "ekskey" {
 
  key_id=var.keyid
}