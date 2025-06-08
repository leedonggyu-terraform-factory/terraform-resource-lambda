provider "aws" {
    region = "ap-northeast-2"
    assume_role {
      role_arn = "arn:aws:iam::182024812696:role/TerraformAssumedRole"
    }
}

module "lambda" {
    source = "../../"

    lambda_policy = {
        Version = "2012-10-17"
        Statement = [
            {
                Action = ["s3:*"]
                Effect = "Allow"
                Resource = "*"
            }
        ]
    }

    lambda_common_attr = {
        name = "hello-test",
        env = "dev"
    }

    lambda_runtime_attr = {
        runtime = "provided.al2"
        handler = "bootstrap"
        filename = "bootstrap.zip"
    }

    lambda_computing_attr = {
        timeout = 10
        memory = 128
        logging_format = "JSON"
        architecture = "arm64"
        environment = {
            REGION = "ap-northeast-2"
            NAME = "leedonggyu"
        }
    }

    is_auto_deploy = {
        is_enable = true
    }
}