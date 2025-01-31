variable "containers" {
  type        = map(list(string))
  description = "Containers to clone including tags"
}

variable "docker_hub_username" {
  type        = string
  description = "Docker Hub username"
}

variable "account_id" {
  type        = string
  description = "AWS account ID (default to caller ID)"
  default     = null
}

variable "build_commands" {
  type        = map(list(string))
  description = "This allows you to add additional lines to the Dockerfile before pushing to ECR"
  default     = {}
}

variable "cloudwatch_log_group_name" {
  type        = string
  description = "Name of the Cloudwatch log group to create."
  default     = ""
}

variable "cloudwatch_log_stream_name" {
  type        = string
  description = "Name of the Cloudwatch log stream to create."
  default     = ""
}

variable "codebuild_build_timeout" {
  description = "Number of minutes, from 5 to 480 (8 hours), to wait until timing out the build."
  type        = number
  default     = 480
}

variable "codebuild_compute_config" {
  description = "Map of CodeBuild compute configuration"
  type = object({
    compute_type = optional(string, "BUILD_GENERAL1_SMALL")
    image        = optional(string, "aws/codebuild/standard:7.0")
    type         = optional(string, "LINUX_CONTAINER")
  })
  default = {}
}

variable "codebuild_project_name" {
  type        = string
  description = "Name of the CodeBuild project"
  default     = ""
}

variable "create_iam_role" {
  type        = bool
  description = "Whether to create the IAM role or now"
  default     = true
}

variable "docker_hub_access_token" {
  type        = string
  description = "Docker Hub access token (public repo read only access)"
  default     = ""
}

variable "docker_hub_access_token_secret_arn" {
  type        = string
  description = "Secrets Manager secret ARN that contains Docker Hub access token (public repo read only access)"
  default     = ""
}

variable "docker_hub_access_token_secret_kms_arn" {
  type        = string
  description = "KMS key ARN used to decrypt Docker Hub access token secret"
  default     = ""
}

variable "iam_role_name" {
  type        = string
  description = "Name of the IAM role to create"
  default     = ""
}

variable "namespace" {
  type        = string
  description = "Prefix to add before all pulled containers to prevent conflicts"
  default     = "ecsclone"
}

variable "prefix" {
  type        = string
  description = "Prefix to add to all resources"
  default     = "ecs-clone-"
}

variable "profile" {
  type        = string
  description = "AWS profile to use"
  default     = null
}

variable "region" {
  type        = string
  description = "AWS region (default to caller region)"
  default     = null
}

variable "ecr_repo_policies" {
  type        = map(string)
  description = "JSON ECR policies to add to one or more repos"
  default     = {}
}
