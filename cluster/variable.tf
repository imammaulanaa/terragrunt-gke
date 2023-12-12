variable "project_id" {
  description = "The project ID to host the cluster in"
  type        = map(string)
  default = {
    prov = "project-prov"
  }
}

variable "environment_code" {
  description = "Code Convention for Environment"
  type        = map(string)
  default = {
    prov = "p"
  }
}

variable "region" {
  description = "The region of the resources"
  type        = map(string)
  default = {
    prov = "asia-southeast2"
  }
}

variable "zone" {
  description = "The zone of the resources"
  type        = map(list(string))
  default = {
    prov = ["asia-southeast2-a"]
  }
}

variable "network_project_id" {
  description = "The network project ID to host the cluster in"
  type        = map(string)
  default = {
    prov = "network-project"
  }
}

variable "network_name" {
  description = "Network Shared Private Network"
  type        = map(string)
  default = {
    prov = "vpc-network"
  }
}

variable "sub_network_name" {
  description = "Network Shared Private SubNetwork"
  type        = map(string)
  default = {
    prov = "subnetwork"
  }
}

variable "secondary_range_pods" {
  description = "range pods IP"
  type        = map(string)
  default = {
    prov = "sub-range-1"
  }
}

variable "secondary_range_services" {
  description = "range services IP"
  type        = map(string)
  default = {
    prov = "sub-range-2"
  }
}

variable "node_pools" {
  description = "List of maps containing node pools"
  type        = map(list(map(string)))
  default = {
    prov = [
      {
        name          = "prov-pool"
        machine_type  = "n2-standard-2"
        min_count     = 1
        max_count     = 3
        disk_size_gb  = 20
        disk_type     = "pd-balanced"
        image_type    = "COS_CONTAINERD"
        auto_repair   = true
        auto_upgrade  = true
        preemptible   = false
        node_metadata = "GKE_METADATA"
      },
    ]
  }
}

variable "node_pools_metadata" {
  description = "Map of maps containing node metadata by node-pool name"
  type        = map(map(string))
  default = {
    all = {
      prov   = "gke"
      use = "terragrunt"
    }

    app = {
      component = "app"
    }
  }
}

variable "node_pools_tags" {
  description = "Map of lists containing node network tags by node-pool name"
  type        = map(list(string))
  default = {
    all = ["gke"]

    app = [
      "app",
    ]
  }
}

variable "node_pools_oauth_scopes" {
  description = "Map of lists containing node oauth scopes by node-pool name"
  type        = map(list(string))
  default = {
    all = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

variable "master_ipv4_cidr_block" {
  description = "master_ipv4_cidr_block"
  type        = map(string)
  default = {
    prov = "10.10.10.0/22"
  }
}

