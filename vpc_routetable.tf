resource "aws_route_table" "rtb-041267f0474c24068" {
  propagating_vgws = []
  route = [
    {
      carrier_gateway_id         = ""
      cidr_block                 = "0.0.0.0/0"
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = null
      ipv6_cidr_block            = null
      local_gateway_id           = ""
      nat_gateway_id             = aws_nat_gateway.nat-cicd.id
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_peering_connection_id  = ""
      vpc_endpoint_id            = ""
      core_network_arn = ""
    },
  ]
  tags = {
    "Name" = "RTB_VPC_EKS_AP-SOUTH-1A"
  }
  vpc_id = aws_vpc.cluster.id
}

resource "aws_route_table_association" "rtbassoc-029eb518ff8c1739a" {
  route_table_id = aws_route_table.rtb-041267f0474c24068.id
  subnet_id      = [aws_subnet.subnet-p1.id, aws_subnet.subnet-p2.id,aws_subnet.subnet-p3.id]
}



/* resource "aws_route_table" "rtb-0102c621469c344cd" {
  propagating_vgws = []
  route            = [
    {
      carrier_gateway_id         = ""
      cidr_block                 = "0.0.0.0/0"
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = null
      ipv6_cidr_block            = null
      local_gateway_id           = ""
      nat_gateway_id             = aws_nat_gateway.nat-cicd.id
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_peering_connection_id  = ""
      vpc_endpoint_id            = ""
      core_network_arn = ""
    },
  ]
  tags = {
    "Name" = "eks-cluster/PrivateRouteTableEUWEST1B"

  }
  vpc_id = aws_vpc.cluster.id
} */

/*Public Route table association*/

resource "aws_route_table" "rtb-0c9df3106b9e1bca9" {
  propagating_vgws = []
  route = [
    {
      carrier_gateway_id         = ""
      cidr_block                 = "0.0.0.0/0"
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = aws_internet_gateway.igw-02c295b01d50c9d3e.id
      instance_id                = null
      ipv6_cidr_block            = null
      local_gateway_id           = ""
      nat_gateway_id             = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_peering_connection_id  = ""
      vpc_endpoint_id            = ""
      core_network_arn = ""
    },
  ]
  tags   = {}
  vpc_id = aws_vpc.cluster.id
}


/* Main Routetable for Cluster VPC */

resource "aws_route_table" "rtb-0329e787bbafcb2c4" {
  propagating_vgws = []
  route            = []
  tags = {
    "Name" = format("eks-%s-cluster/IsolatedRouteTable",var.cluster-name)
  }
  vpc_id = aws_vpc.cluster.id
}