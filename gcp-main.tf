resource "google_artifact_registry_repository" "hackathon-registry" {
  location = var.region
  repository_id = "hackathon-registry"
  description = "Imagens Docker"
  format = "DOCKER"
}
