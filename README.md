<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.lambda_custom_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.lambda_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.lambda_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [null_resource.build](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_iam_policy_document.lambda_default_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_is_auto_deploy"></a> [is\_auto\_deploy](#input\_is\_auto\_deploy) | lambda 함수 자동 배포 여부입니다. | <pre>object({<br/>    is_enable = bool<br/>  })</pre> | <pre>{<br/>  "is_enable": true<br/>}</pre> | no |
| <a name="input_lambda_common_attr"></a> [lambda\_common\_attr](#input\_lambda\_common\_attr) | lambda 함수에 추가되는 공통 속성입니다. | <pre>object({<br/>    name = string<br/>    env  = string<br/>  })</pre> | <pre>{<br/>  "env": "dev",<br/>  "name": "default"<br/>}</pre> | no |
| <a name="input_lambda_computing_attr"></a> [lambda\_computing\_attr](#input\_lambda\_computing\_attr) | lambda 함수에 추가되는 컴퓨팅 속성입니다. | <pre>object({<br/>    timeout        = number<br/>    memory         = number<br/>    logging_format = string<br/>    architecture   = string<br/>    environment    = map(string)<br/>  })</pre> | <pre>{<br/>  "architecture": "arm64",<br/>  "environment": {<br/>    "NAME": "leedonggyu",<br/>    "REGION": "ap-northeast-2"<br/>  },<br/>  "logging_format": "JSON",<br/>  "memory": 128,<br/>  "timeout": 10<br/>}</pre> | no |
| <a name="input_lambda_policy"></a> [lambda\_policy](#input\_lambda\_policy) | lambda 함수에 추가되는 정책입니다. | <pre>object({<br/>    Version = string<br/>    Statement = list(object({<br/>      Effect   = string<br/>      Action   = list(string)<br/>      Resource = string<br/>    }))<br/>  })</pre> | <pre>{<br/>  "Statement": [<br/>    {<br/>      "Action": [<br/>        "s3:*"<br/>      ],<br/>      "Effect": "Allow",<br/>      "Resource": "*"<br/>    }<br/>  ],<br/>  "Version": "2012-10-17"<br/>}</pre> | no |
| <a name="input_lambda_runtime_attr"></a> [lambda\_runtime\_attr](#input\_lambda\_runtime\_attr) | lambda 함수에 추가되는 런타임 속성입니다. | <pre>object({<br/>    runtime  = string<br/>    handler  = string<br/>    filename = string<br/>  })</pre> | <pre>{<br/>  "filename": "bootstrap.zip",<br/>  "handler": "bootstrap",<br/>  "runtime": "provided.al2"<br/>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
