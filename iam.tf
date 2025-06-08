######################################## IAM ########################################
data "aws_iam_policy_document" "lambda_default_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name               = "${var.lambda_common_attr.name}-${var.lambda_common_attr.env}-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_default_policy_document.json
}

resource "aws_iam_policy" "lambda_policy" {
  name = "${var.lambda_common_attr.name}-${var.lambda_common_attr.env}-default-access-lambda-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvent"]
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_custom_policy" {
  name   = "${var.lambda_common_attr.name}-${var.lambda_common_attr.env}-custom-access-lambda-policy"
  policy = jsonencode(var.lambda_policy)

}

resource "aws_iam_role_policy_attachment" "policy_attach" {
  for_each = {
    for k, v in [aws_iam_policy.lambda_policy, aws_iam_policy.lambda_custom_policy] : k => v
  }

  role       = aws_iam_role.lambda_role.name
  policy_arn = each.value.arn
}
