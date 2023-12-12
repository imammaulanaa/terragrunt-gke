output ca_certificate {
  value = module.gke.ca_certificate
  sensitive = true
}

output endpoint {
  value = module.gke.endpoint
  sensitive = true
}

output horizontal_pod_autoscaling_enabled {
  value = module.gke.horizontal_pod_autoscaling_enabled
}

output http_load_balancing_enabled {
  value = module.gke.http_load_balancing_enabled
}

output location {
  value = module.gke.location
}

output logging_service {
  value = module.gke.logging_service
}

output master_authorized_networks_config {
  value = module.gke.master_authorized_networks_config
}

output master_version {
  value = module.gke.master_version
}

output min_master_version {
  value = module.gke.min_master_version
}

output monitoring_service {
  value = module.gke.monitoring_service
}

output name {
  value = module.gke.name
}

output network_policy_enabled {
  value = module.gke.network_policy_enabled
}

output node_pools_names {
  value = module.gke.node_pools_names
}

output node_pools_versions {
  value = module.gke.node_pools_versions
}

output region {
  value = module.gke.region
}

output service_account {
  value = module.gke.service_account
}

output type {
  value = module.gke.type
}

output zones {
  value = module.gke.zones
}

output network_name {
  value = var.network_name[terraform.workspace]
}

output subnets_regions {
  value = var.region[terraform.workspace]
}

output subnets_names {
  value = var.sub_network_name[terraform.workspace]
}

output subnets_secondary_ranges_pods {
  value = var.secondary_range_pods[terraform.workspace]
}

output subnets_secondary_ranges_services {
  value = var.secondary_range_services[terraform.workspace]
}
