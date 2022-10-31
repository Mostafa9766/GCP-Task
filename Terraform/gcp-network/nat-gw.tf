resource "google_compute_router" "nat-router" {
  name    = "router-1"
  network = google_compute_network.task-vpc.id
  region  = google_compute_subnetwork.subnet-1.region
}

resource "google_compute_router_nat" "nat-1" {
  name                               = "nat-1"
  router                             = google_compute_router.nat-router.name
  region                             = google_compute_router.nat-router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name = google_compute_subnetwork.subnet-1.name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}