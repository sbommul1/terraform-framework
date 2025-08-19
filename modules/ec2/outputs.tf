output "ec2_ids" {
  description = "IDs of all EC2 instances"
  value       = [for i in aws_instance.this : i.id]
}

output "ec2_public_ips" {
  description = "Public IPs of all EC2 instances"
  value       = [for i in aws_instance.this : i.public_ip]
}