variable "vpc_cidr" {
    description = "CIDR block for VPC"
    type = string
}

variable "environment" {
    description = "Environment name (dev/qa/prod)"
    type = string
}

variable "public_subnets" {
    description = "CIDR for public subnet"
    type = list
}   

variable "private_subnets" {
    description = "CIDR for private subnet"
    type = list
}
  
variable "azs" {
    description = "Availability zones"
    type = list
}


variable "tags" {
    description = "Additional Tags"
    type = map(string)
    default = {}
}
