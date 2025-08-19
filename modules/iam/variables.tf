variable "role_name" {
    description = "IAM role name(It must include environemnt in the name)"
    type = string
}

variable "assume_role_principals" {
    description = "List of service principals allowed to assume the role"
    type = list(string)
    default = ["ec2.amazonaws.com"]  
}

variable "assume_role_actions" {
    description = "ACtions in the assume role policy"
    type = list(string)
    default = ["sts:AssumeRole"]
}

variable "managed_policy_arns" {
    description = "AWS managed or customer managed policy ARNs to attach"
    type = list(string)
    default = []
}

variable "inline_policies" {
    description = "Map of inline policy JSONvdocs keyed by policy name"
    type = map(string)
    default = {}
}

variable "permissions_boundary_arn" {
    description = "Optional permissions boundary ARN"
    type = string
    default = null
}

variable "path" {
    description = "Role path"
    type = string
    default = "/"
}

variable "create_instance_profile" {
    description = "Whther to create an instance profile bound to this role"
    type = bool
    default = true
}

variable "tags" {
    description = "Tags to apply to the role/profile"
    type = map(string)
    default = {}
}