resource "aws_security_group" "allnodes-sg" {
  description = "Communication between all nodes in the cluster"
  vpc_id      = aws_vpc.cluster.id
  tags = {
    "Name"   = var.cluster-name
    "Label"  = "TF-EKS All Nodes Comms"
  }
}

resource "aws_security_group" "cluster-sg" {
  description = "Communication between the control plane and worker nodegroups"
  vpc_id      = aws_vpc.cluster.id
  tags = {
    "Name" = var.cluster-name
    "Label" = "TF-EKS Control Plane & all worker nodes comms"
  }
}


resource "aws_security_group" "sg-01f8ab6431763bcb6" {
  description = "EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."
  vpc_id      = aws_vpc.cluster.id
  tags = {
    "Name"  = format("eks-cluster-sg-%s",var.cluster-name)
    "kubernetes.io/cluster/${var.cluster-name}" = "owned"
    "Label"                            = "TF-EKS Control Plane + Managed node ENI's"
  }
}


/*Cluste_SG*/

resource "aws_security_group_rule" "eks-add-clustersg" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id
  security_group_id        = data.terraform_remote_state.net.outputs.cluster-sg
}

