module "gcp-network" {
    source = "./gcp-network"
    project-id=var.project-id
    region = var.region
    vpc-name = var.vpc-name
    subnet1-name = var.subnet1-name
    subnet1-cidr = var.subnet1-cidr
    subnet2-name = var.subnet2-name
    subnet2-cidr = var.subnet2-cidr
}
