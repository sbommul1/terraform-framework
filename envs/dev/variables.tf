variable "environment" {
  description = "Environment name (dev, qa, prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones to use"
  type        = list(string)
}

variable "sg_name" {
  type        = string
  description = "Name of the Security Group"
}

variable "sg_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "sg_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "tags" {
  type        = map(string)
  description = "Tags for the security group"
  default     = {}
}

variable "iam_policy_arns" {
  description = "List of IAM policy ARNs to attach to role"
  type        = list(string)
  default     = []
}


variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instances" {
  description = "List of EC2 instances to create"
  type = list(object({
    instance_type = string
  }))
}

variable "launch_in" {
  description = "Choose whether to launch instances in public or private subnet"
  type        = string
  default     = "public" # or "private"
}