variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instances" {
  description = "List of instance configs (type and subnet)"
  type = list(object({
    instance_type = string
  }))
}

variable "sg_id" {
  description = "Security Group ID for the EC2 instances"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to attach to EC2"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/qa/prod)"
  type        = string
}

variable "tags" {
  description = "Common tags for resources"
  type        = map(string)
}

variable "launch_in" {
  description = "Where to launch instances: public or private"
  type        = string
  default     = "public"
  validation {
    condition     = contains(["public", "private"], var.launch_in)
    error_message = "launch_in must be either 'public' or 'private'."
  }
}

variable "subnet_ids" {
  type = object({
    public  = list(string)
    private = list(string)
  })
}




