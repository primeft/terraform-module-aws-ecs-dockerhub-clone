
locals {
  command_parts = [
    "aws codebuild start-build",
    var.profile != null ? "--profile ${var.profile}" : "",
    "--project-name ${aws_codebuild_project.main.name}",
    "--region ${local.region}",
    "> /dev/null",
  ]

  command = join(" ", local.command_parts)
}

resource "null_resource" "init" {
  triggers = {
    containers     = local.repolist
    name           = aws_codebuild_project.main.name
    build_commands = jsonencode(local.buildstrings)
    command        = local.command
  }

  provisioner "local-exec" {
    command = local.command
  }
}
