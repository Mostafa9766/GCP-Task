resource "google_compute_instance" "management-instance" {
  name         = "management-ce"
  machine_type = "e2-micro"
  zone         = var.zone
  allow_stopping_for_update = true
  depends_on = [
   google_service_account.gke_service_account
   , google_container_node_pool.node-pool
  ]
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      type = "pd-standard"
      size = 50
    }
  }
  network_interface {
    network = module.gcp-network.vpc-name
    subnetwork = module.gcp-network.subnet1-name
  }
  service_account {
        email = google_service_account.ce_service_account.email
        scopes = [ "cloud-platform" ] 
}
}