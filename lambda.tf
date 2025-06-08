
resource "aws_lambda_function" "function" {
  function_name = "${lookup(var.lambda_common_attr, "name")}-${lookup(var.lambda_common_attr, "env")}-function"
  role          = aws_iam_role.lambda_role.arn

  runtime  = lookup(var.lambda_runtime_attr, "runtime")
  handler  = lookup(var.lambda_runtime_attr, "handler")
  filename = "bootstrap.${random_string.random.result}.zip"

  ## computing
  timeout       = lookup(var.lambda_computing_attr, "timeout")
  memory_size   = lookup(var.lambda_computing_attr, "memory")
  architectures = [lookup(var.lambda_computing_attr, "architecture")]

  ## environment
  environment {
    variables = lookup(var.lambda_computing_attr, "environment")
  }

  #   vpc_config {

  #   }

  tags = var.lambda_common_attr

  depends_on = [random_string.random]

}
