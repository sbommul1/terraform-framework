output "role" {
    description = "IAM Role name"
    value = aws_iam_role.this.name
}

output "name" {
    description = "IAM Role ARN"
    value = aws_iam_role.this.arn
}

output "instance_profile_name" {
    description = "Instance profile name"
    value = var.create_instance_profile ? aws_iam_instance_profile.this[0].name : null
}

output "instance_profile_arn" {
    description = "Instance profile arn"
    value = var.create_instance_profile ? aws_iam_instance_profile.this[0].arn : null
}