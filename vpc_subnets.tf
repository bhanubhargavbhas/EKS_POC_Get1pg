resource "aws_subnet" "subnet-p1" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[0]
  cidr_block                      = "10.0.1.0/24"
  map_public_ip_on_launch         = false
  tags = {
    "Name"                                        = "Private1"
    "kubernetes.io/cluster/${var.cluster-name}"            = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
    "workshop" = "subnet-p1"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}


resource "aws_subnet" "subnet-p2" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[1]
  cidr_block                      = "10.0.2.0/24"
  map_public_ip_on_launch         = false
  tags = {
    "Name"                                        = "Private2"
    "kubernetes.io/cluster/${var.cluster-name}"            = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
    "workshop" = "subnet-p2"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}


/* resource "aws_subnet" "subnet-p3" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[2]
  cidr_block                      = "10.0.3.0/24"
  map_public_ip_on_launch         = false
  tags = {
    "Name"                                        = "Private3"
    "kubernetes.io/cluster/${var.cluster-name}"            = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
    "workshop" = "subnet-p3"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
} */




resource "aws_subnet" "subnet-cicd-public1" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[2]
  cidr_block                      = "10.30.0.0/26"
  map_public_ip_on_launch         = false
  tags = {
    "Name"     = "cicd-public1"
    "workshop" = "cicd-public1"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}