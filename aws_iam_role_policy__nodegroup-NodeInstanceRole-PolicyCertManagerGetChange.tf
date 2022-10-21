resource "aws_iam_role_policy" "eks-nodegroup-ng-ma-NodeInstanceRole-1GFKA1037E1XO__eks-nodegroup-ng-maneksami2-PolicyCertManagerGetChange" {
  name = "eks-nodegroup-ng-maneksami2-PolicyCertManagerGetChange"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "route53:GetChange",
          ]
          Effect   = "Allow"
          Resource = "arn:aws:route53:::change/*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-1GFKA1037E1XO.id
}
