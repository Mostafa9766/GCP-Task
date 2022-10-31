resource "google_compute_network" "task-vpc" {
  project                 = var.project-id
  name                    = var.vpc-name
  auto_create_subnetworks = false
}