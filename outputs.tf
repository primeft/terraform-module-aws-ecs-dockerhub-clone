output "iam_role_arn" {
  description = "The ARN of the IAM role"
  value       = aws_iam_role.main.arn
}

output "project_arn" {
  description = "The ARN of the CodeBuild project"
  value       = aws_codebuild_project.main.arn
}

output "image_base_url" {
  description = "The base URL for your ECR images from Docker Hub"
  value       = "${local.account_id}.dkr.ecr.${local.region}.amazonaws.com/${var.namespace}/"
}
