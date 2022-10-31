
# service account for private instance to access cluster
resource "google_service_account" "ce_service_account" {
  account_id   = "compute-engine-sa"
}
# add role to instance service account 
resource "google_project_iam_binding" "ce_role" {
  project = var.project-id
  role    = "roles/container.admin" 
  members = [
    "serviceAccount:${google_service_account.ce_service_account.email}"
  ]
}

# service account for gke cluster
resource "google_service_account" "gke_service_account" {
  account_id   = "gke-sa"
}
# add role to gke service account 
resource "google_project_iam_binding" "gke_role" {
  project = var.project-id
  role    = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.gke_service_account.email}"
  ]
}

# service account for GCR
resource "google_service_account" "GCR_SA" {
  account_id   = "gcr-sa"
  display_name = "GCR Service Account"
}
resource "google_project_iam_binding" "GCR-RB" {
  project = var.project-id
  role    = "roles/storage.admin"
  members = [ "serviceAccount:${google_service_account.GCR_SA.email}"
  ]
}