resource "google_artifact_registry_repository" "hackathon-registry" {
  location = var.region
  repository_id = "hackathon-registry"
  description = "Imagens Docker"
  format = "DOCKER"
}

resource "google_sql_database" "database" {
  name     = "hackathon-database"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_database_instance" "instance" {
  name             = "hackathon-database-instance"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}

resource "google_sql_user" "users" {
  name     = "hackathon-database-user"
  instance = google_sql_database_instance.main.name
  host     = "hackathon-database.com"
  password = "hackathon-database-123"
}
