module "vpc" {
    source = "../../modules/vpc"
    vpc_cidr             = var.vpc_cidr
    environment          = var.environment
    public_subnets = var.public_subnets_cidrs
    private_subnets = var.private_subnets_cidrs
    azs   = var.availability_zones  
}

module "security_groups" {
  source      = "../../modules/security_groups"
  name        = var.sg_name
  description = "Web Security Group"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = var.sg_ingress_rules
  egress_rules  = var.sg_egress_rules
  tags          = var.tags
}

module "iam" {
  source = "../../modules/iam"

  role_name             = "${var.environment}-ec2-role"
  managed_policy_arns   = var.iam_policy_arns    # Pass your list of policy ARNs here
  inline_policies       = {}                     # If any inline policies, pass as map
  permissions_boundary_arn = null
  path                  = "/"
  create_instance_profile = true

  tags = var.tags
}



module "ec2" {
  source = "../../modules/ec2"
  ami_id               = var.ami_id
  instances            = var.instances
  sg_id                = module.security_groups.web_sg_id
  iam_instance_profile = module.iam.instance_profile_name
  subnet_ids = {
    public  = module.vpc.public_subnet_ids
    private = module.vpc.private_subnet_ids
  }
  environment = var.environment
  tags        = var.tags
}
