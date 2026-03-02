terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.21.0"
    }
  }
}

provider "google" {
  # Configuration options
  credentials = file(var.credentials)
  project     = var.project_id
  region      = var.region
}
resource "google_storage_bucket" "demo_bucket" {
  name          = var.gcs_bucket_name
  location      = var.Location
  storage_class = var.gcs_storage_class
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id                  = var.bq_dataset_name
  location                    = var.Location
  default_table_expiration_ms = 3600000
  delete_contents_on_destroy  = true
}