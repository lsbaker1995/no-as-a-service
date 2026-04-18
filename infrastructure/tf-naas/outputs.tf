output "cloud_run_url" {
  description = "Public URL of the deployed service"
  value       = google_cloud_run_v2_service.naas.uri
}

output "artifact_registry_url" {
  description = "Artifact Registry repository URL"
  value       = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.naas_repo.repository_id}"
}