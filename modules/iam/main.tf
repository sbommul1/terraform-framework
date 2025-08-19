data "aws_iam_policy_document" "assume_role" {
    statement {
      effect = "Allow"
      actions = var.assume_role_actions

      principals {
        type = "Service"
        identifiers = var.assume_role_principals
      }
    }
}

resource "aws_iam_role" "this" {
    name = var.role_name
    path = var.path
    assume_role_policy = data.aws_iam_policy_document.assume_role.json
    permissions_boundary = var.permissions_boundary_arn
    tags = var.tags
}

resource "aws_iam_policy_attachment" "managed" {
  for_each   = toset(var.managed_policy_arns)
  name       = "${aws_iam_role.this.name}-${replace(each.key, "[:/]", "-")}" # unique name
  roles      = [aws_iam_role.this.name]
  policy_arn = each.key
}

resource "aws_iam_role_policy" "inline" {
    for_each = var.inline_policies
    name = each.key
    role = aws_iam_role.this.id
    policy = each.value
}

resource "aws_iam_instance_profile" "this" {
    count = var.create_instance_profile ? 1:0
    name = "${var.role_name}-instance-profile"
    role = aws_iam_role.this.name
    tags = var.tags
}