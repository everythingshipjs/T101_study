data "aws_eks_cluster" "this" {
  name = module.eks.cluster_name
}

output "endpoint" {
  value = data.aws_eks_cluster.this.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = data.aws_eks_cluster.this.certificate_authority[0].data
}

# Only available on Kubernetes version 1.13 and 1.14 clusters created or upgraded on or after September 3, 2019.
output "identity-oidc-issuer" {
  value = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
}