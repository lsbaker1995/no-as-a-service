variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "image_tag" {
  description = "Docker image tag to deploy (git SHA)"
  type        = string
  default     = "latest"
}