module "vpc" {
  source          = "../../modules/vpc"
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  env             = var.env
  tags            = var.tags
}

module "alb" {
  source     = "../../modules/alb"
  subnet_ids = module.vpc.public_subnet_ids
  vpc_id     = module.vpc.vpc_id
  env        = var.env
  tags       = var.tags
}

module "ec2_asg" {
  source            = "../../modules/ec2_asg"
  ami_id            = var.ami_id
  key_name          = var.key_name
  subnet_ids        = module.vpc.public_subnet_ids
  target_group_arns = [module.alb.target_group_arn]
  env               = var.env
  tags              = var.tags
}
