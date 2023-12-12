// Terraform File for Provisioning GKE
// Documentation: https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest/submodules/private-cluster-update-variant

terraform {
  backend "gcs" {}
}

provider "google" {
  project         = var.project_id[terraform.workspace]
  request_timeout = "40m"
}

locals {
  private_gke_name                   = "prov-simple-gke"
  private_gke_identity_namespace     = "enabled"
  private_gke_node_metadata          = "GKE_METADATA"
  private_gke_release_channel        = "STABLE"
  private_gke_maintenance_start_time = "18:00"

}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster-update-variant"
  project_id                 = var.project_id[terraform.workspace]
  name                       = local.private_gke_name
  region                     = var.region[terraform.workspace]
  zones                      = var.zone[terraform.workspace]
  network                    = var.network_name[terraform.workspace]
  network_project_id         = var.network_project_id[terraform.workspace]
  subnetwork                 = var.sub_network_name[terraform.workspace]
  ip_range_pods              = var.secondary_range_pods[terraform.workspace]
  ip_range_services          = var.secondary_range_services[terraform.workspace]
  identity_namespace         = local.private_gke_identity_namespace
  add_cluster_firewall_rules = true
  enable_private_nodes       = true
  remove_default_node_pool   = true
  http_load_balancing        = true
  horizontal_pod_autoscaling = true
  enable_private_endpoint    = true
  network_policy             = true
  master_authorized_networks = local.private_gke_master_authorized_networks
  cluster_autoscaling        = local.private_gke_cluster_autoscaling
  firewall_inbound_ports     = local.private_gke_firewall_inbound_ports
  release_channel            = local.private_gke_release_channel
  master_ipv4_cidr_block     = var.master_ipv4_cidr_block[terraform.workspace]
  maintenance_start_time     = local.private_gke_maintenance_start_time

  node_metadata             = local.private_gke_node_metadata
  node_pools                = var.node_pools[terraform.workspace]
  node_pools_oauth_scopes   = var.node_pools_oauth_scopes
  node_pools_metadata       = var.node_pools_metadata
  node_pools_tags           = var.node_pools_tags
  default_max_pods_per_node = 60

  node_pools_labels = {
    all = {
      environment = terraform.workspace
    }
  }
}
