resource "aws_ssm_parameter" "accesstoken" {
  count = var.docker_hub_access_token != "" ? 1 : 0

  name  = "${var.prefix}docker"
  type  = "SecureString"
  value = var.docker_hub_access_token
}
