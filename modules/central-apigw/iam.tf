resource "aws_iam_role" "main" {
  name = "${var.name}-role"

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy" "cloudwatch" {
  name = "default"
  role = aws_iam_role.main.id

  policy = data.aws_iam_policy_document.cw_policy.json

}
