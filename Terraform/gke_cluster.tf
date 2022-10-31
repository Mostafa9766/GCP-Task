resource "google_container_cluster" "private-cluster" {
  name                     = "cluster-1"
  network                  = var.vpc-name
  location                 =  var.zone
  subnetwork               = var.subnet2-name
  remove_default_node_pool = true
  initial_node_count       = 1 
  #node_locations = [
  #  var.zone
  #]
    depends_on = [
    module.gcp-network
  ]
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.subnet1-cidr
      display_name = "management-cidr"
    }
  }
  ip_allocation_policy {
  }
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

}

resource "google_container_node_pool" "node-pool" {
  name       = "node-pool"
  cluster    = google_container_cluster.private-cluster.id
  location       = google_container_cluster.private-cluster.location
  node_count = 2

  node_config {
    preemptible  = true
    machine_type = "e2-micro"
    disk_size_gb = 30

    service_account = google_service_account.gke_service_account.email
     oauth_scopes = [
      "storage-ro",
      "logging-write",
      "monitoring"
    ]
  }
   upgrade_settings {
    max_surge       = 1
    max_unavailable = 0
  }
}