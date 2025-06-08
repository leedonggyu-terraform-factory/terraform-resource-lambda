resource "random_string" "random" {

  length  = 7
  special = false

  keepers = {
    always_generate = "${timestamp()}"
  }
}

resource "null_resource" "build" {

  count = var.is_auto_deploy.is_enable ? 1 : 0

  provisioner "local-exec" {
    command = <<EOT
    GOOS=linux GOARCH=arm64 go build -o bootstrap main.go && zip bootstrap.${random_string.random.result}.zip bootstrap
    EOT
  }

  triggers = {
    always_run = "${timestamp()}"
  }

}
