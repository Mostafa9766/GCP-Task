output "vpc-name" {
    value = google_compute_network.task-vpc.name
}

output "subnet1-name" {
  value = google_compute_subnetwork.subnet-1.name
}

output "subnet2-name" {
  value = google_compute_subnetwork.subnet-2.name
}
