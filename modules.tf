module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = var.tags
}

module "eks_cluster" {
  source           = "./modules/cluster"
  project_name     = var.project_name
  cluster_version  = var.cluster_version
  tags             = var.tags
  public_subnet_1a = module.eks_network.pub_subnet_1a
  public_subnet_1b = module.eks_network.pub_subnet_1b
}

module "eks_managed_node_group" {
  source            = "./modules/managed-node-group"
  project_name      = var.project_name
  cluster_name      = module.eks_cluster.cluster_name
  private_subnet_1a = module.eks_network.priv_subnet_1a
  private_subnet_1b = module.eks_network.priv_subnet_1b
  tags              = var.tags
}

module "eks_aws_load_balancer_controller" {
  source       = "./modules/aws-load-balancer-controller"
  project_name = var.project_name
  tags         = var.tags
  oidc         = module.eks_cluster.oidc
  cluster_name = module.eks_cluster.cluster_name
}
