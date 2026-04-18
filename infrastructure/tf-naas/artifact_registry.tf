resource "google_artifact_registry_repository" "naas_repo" {
  location      = var.region
  repository_id = "naas-repo"
  format        = "DOCKER"
  description   = "Docker image for No as a Service"
}