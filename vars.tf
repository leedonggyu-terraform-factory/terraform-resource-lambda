variable "lambda_policy" {
  description = "lambda 함수에 추가되는 정책입니다."

  type = object({
    Version = string
    Statement = list(object({
      Effect   = string
      Action   = list(string)
      Resource = string
    }))
  })

  default = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:*"]
        Resource = "*"
      }
    ]
  }
}

variable "lambda_common_attr" {
  description = "lambda 함수에 추가되는 공통 속성입니다."

  type = object({
    name = string
    env  = string
  })

  default = {
    name = "default"
    env  = "dev"
  }
}

variable "lambda_runtime_attr" {
  description = "lambda 함수에 추가되는 런타임 속성입니다."

  type = object({
    runtime  = string
    handler  = string
    filename = string
  })

  default = {
    runtime  = "provided.al2"
    handler  = "bootstrap"
    filename = "bootstrap.zip"

  }
}

variable "lambda_computing_attr" {
  description = "lambda 함수에 추가되는 컴퓨팅 속성입니다."

  type = object({
    timeout        = number
    memory         = number
    logging_format = string
    architecture   = string
    environment    = map(string)
  })

  default = {
    timeout        = 10
    memory         = 128
    logging_format = "JSON"
    architecture   = "arm64"
    environment = {
      REGION = "ap-northeast-2"
      NAME   = "leedonggyu"
    }
  }
}

# variable "lambda_network_attr" {
#   description = "lambda 함수에 추가되는 네트워크 속성입니다."

#   default = {
#     vpc_id    = ""
#     subnet_id = ""
#   }
# }

variable "is_auto_deploy" {
  description = "lambda 함수 자동 배포 여부입니다."

  type = object({
    is_enable = bool
  })

  default = {
    is_enable = true
  }
}
