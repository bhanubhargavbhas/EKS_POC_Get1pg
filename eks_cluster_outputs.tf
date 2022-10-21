output cluster-name {
  value=aws_eks_cluster.cluster.name
}

output cluster-sg {
  value=aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id
}

output ca {
  value=aws_eks_cluster.cluster.certificate_authority[0].data
}

output endpoint {
  value=aws_eks_cluster.cluster.endpoint
}

output oidc_provider_arn {
  value=aws_iam_openid_connect_provider.cluster.arn
}