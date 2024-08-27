locals {
  vpc_name = "${var.environment}-${var.vpc_name}"
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name               = local.vpc_name
  cidr               = var.cidr_range
  azs                = var.azs
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  enable_nat_gateway = true
  manage_default_network_acl = false

}

module "security" {
  source                  = "./modules/security"
  app_security_group_name = var.app_security_group_name
  alb_security_group_name = var.alb_security_group_name
  environment             = var.environment
  vpc_id                  = module.vpc.vpc_id
}

module "iam" {
  source              = "./modules/iam"
  ec2_iam_role_name   = var.ec2_iam_data.iam_role_name
  ec2_iam_policy_name = var.ec2_iam_data.iam_policy_name
}

module "launch_template" {
  source               = "./modules/launch_template"
  launch_template_name = var.launch_template_name
  ami_id               = var.ami_id
  environment          = var.environment
  key_name             = var.key_name
  security_group_id    = module.security.app_sg_id
  instance_type        = var.launch_template_instance_type
  iam_role_name        = module.iam.ec2_iam_role_name
  iam_instance_profile_name = var.iam_instance_profile_name
  user-data            = base64encode(file("./scripts/user-data.bash"))
}


module "target_group" {
  source = "./modules/target_group"

  vpc_id            = module.vpc.vpc_id
  environment       = var.environment
  target_group_name = var.target_group_name
}

module "load_balancer" {
  source = "./modules/load_balancer"

  environment              = var.environment
  load_balancer_name       = var.load_balancer_name
  load_balancer_sg_ids     = [module.security.alb_sg_id]
  load_balancer_subnet_ids = module.vpc.public_subnets
  target_group_arn         = module.target_group.target_group_arn

}

module "auto_scaling" {

  source = "./modules/auto_scaling"

  environment                   = var.environment
  auto_scaling_group_name       = var.auto_scaling_group_name
  auto_scaling_max_size         = 5
  auto_scaling_min_size         = 1
  auto_scaling_desired_capacity = 2
  launch_template_id            = module.launch_template.launch_template_id
  vpc_zone_identifier           = module.vpc.private_subnets
  load_balancer_name            = module.load_balancer.load_balancer_name
  target_group_arn              = module.target_group.target_group_arn
}


