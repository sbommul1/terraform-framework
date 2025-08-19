output "vpc_id" {
    description = "VPC ID"
    value = aws_vpc.this.id
}

output "public_subnet_ids" {
    description = "ID's of public subnet_ids"
    value = aws_subnet.public[*].id  
}

output "private_subnet_ids" {
    description = "ID's of private subnet_ids"
    value = aws_subnet.private[*].id
}