output "vpc_id" {
    description = "vpc_id"
    value = module.vpc.vpc_id  
}

output "public_subnet_ids" {
    description = "public_subnet_ids"
    value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
    description = "private_subnet_ids"
    value = module.vpc.private_subnet_ids
  
}

output "web_sg_id" {
  description = "ID of the web security group"
  value       = module.security_groups.web_sg_id
}


output "ec2_instance_ids" {
  description = "IDs of EC2 instances in dev"
  value       = module.ec2.ec2_ids
}

output "ec2_public_ips" {
  description = "Public IPs of EC2 instances in dev"
  value       = module.ec2.ec2_public_ips
}

output "ec2_id_to_public_ip" {
  description = "Map of instance ID to public IP"
  value       = { for idx, id in module.ec2.ec2_ids : id => module.ec2.ec2_public_ips[idx] }
}

output "ec2_name_to_public_ip" {
  description = "Map of Name tag to public IP"
  value       = { for idx, ip in module.ec2.ec2_public_ips : "${var.environment}-ec2-${idx + 1}" => ip }
}