
resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = "aws eks --region ${var.aws_region} update-kubeconfig --name ${module.eks.cluster_name}"
  }
  depends_on = [
    module.eks
  ]
}

resource "null_resource" "install_argocd" {
  provisioner "local-exec" {
    command = <<EOT
        kubectl create namespace argocd
        kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
        EOT
  }
  depends_on = [
    null_resource.kubectl
  ]
}