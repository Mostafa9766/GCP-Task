#----management subnet-----
resource "google_compute_subnetwork" "subnet-1" {
  name          = var.subnet1-name
  ip_cidr_range = var.subnet1-cidr
  region        = var.region
  private_ip_google_access = true
  network       = google_compute_network.task-vpc.id
}


#----restricted subnet-----
resource "google_compute_subnetwork" "subnet-2" {
  name                     = var.subnet2-name
  ip_cidr_range            = var.subnet2-cidr
  region                   = var.region
    private_ip_google_access = true
  network                  = google_compute_network.task-vpc.id
}