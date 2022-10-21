output "sub-priv1" {
  value = aws_subnet.subnet-p1.id
}


output "sub-priv2" {
  value = aws_subnet.subnet-p2.id
}

output "sub-priv3" {
  value = aws_subnet.subnet-p3.id
}

output "eks-vpc" {
  value = aws_vpc.cluster.id
}
output "eks-cidr" {
  value = aws_vpc.cluster.cidr_block
}

output "allnodes-sg" {
  value = aws_security_group.allnodes-sg.id
}


output "cluster-sg" {
  value = aws_security_group.cluster-sg.id
}

output "rtb-priv1" {
  value = aws_route_table.rtb-041267f0474c24068.id
}
