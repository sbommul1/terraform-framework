resource "aws_instance" "this" {
  count = length(var.instances)

  ami                         = var.ami_id
  instance_type               = var.instances[count.index].instance_type
  subnet_id                   = var.launch_in == "public" ? var.subnet_ids.public[0] : var.subnet_ids.private[0]
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = var.launch_in == "public" ? true : false

  iam_instance_profile = var.iam_instance_profile

  tags = merge(
    {
      Name = "${var.environment}-ec2-${count.index + 1}"
    },
    var.tags
  )
}

