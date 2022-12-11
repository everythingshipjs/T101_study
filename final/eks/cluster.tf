module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "demo-cluster"
  cluster_version = "1.23"

  cluster_endpoint_public_access = true

  enable_irsa = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }
  # "vpc-1234556abcdef"
  vpc_id = data.terraform_remote_state.remote.outputs.vpc_id
  # ["subnet-abcde012", "subnet-bcde012a", "subnet-fghi345a"]
  subnet_ids = data.terraform_remote_state.remote.outputs.subnets_id
  # ["subnet-xyzde987", "subnet-slkjf456", "subnet-qeiru789"]
  control_plane_subnet_ids = data.terraform_remote_state.remote.outputs.subnets_id

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["t3.medium", "t3a.medium"]
  }

  eks_managed_node_groups = {
    #blue = {}
    green = {
      min_size     = 2
      max_size     = 10
      desired_size = 2

      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
    }
  }

  # # aws-auth configmap
  # manage_aws_auth_configmap = true

  # aws_auth_roles = [
  #   {
  #     rolearn  = "arn:aws:iam::66666666666:role/role1"
  #     username = "role1"
  #     groups   = ["system:masters"]
  #   },
  # ]

  # aws_auth_users = [
  #   {
  #     userarn  = "arn:aws:iam::66666666666:user/user1"
  #     username = "user1"
  #     groups   = ["system:masters"]
  #   },
  #   {
  #     userarn  = "arn:aws:iam::66666666666:user/user2"
  #     username = "user2"
  #     groups   = ["system:masters"]
  #   },
  # ]

  # aws_auth_accounts = [
  #   "777777777777",
  #   "888888888888",
  # ]

  tags = {
    Environment = "test"
    Terraform   = "true"
  }
}
