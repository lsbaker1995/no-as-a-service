resource "google_cloud_run_v2_service" "naas" {
  name     = "no-as-a-service"
  location = var.region

  template {
    containers {
      image = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.naas_repo.repository_id}/no-as-a-service:${var.image_tag}"

      ports {
        container_port = 3000
      }

      resources {
        limits = {
          cpu    = "1"
          memory = "512Mi"
        }
      }
    }

    scaling {
      min_instance_count = 0
      max_instance_count = 3
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

# Makes the service publicly accessible (no auth required)
resource "google_cloud_run_v2_service_iam_member" "public_access" {
  name     = google_cloud_run_v2_service.naas.name
  location = google_cloud_run_v2_service.naas.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}