##############################################################################
# Sensitive Account Variables
##############################################################################

variable ibmcloud_api_key {
    description = "IBM Cloud IAM API Key"
    default = "crn:v1:bluemix:public:kms:us-south:a/d756a6aef0ed4d18ad43aa70cfef033d:d5a52477-5ce8-47f1-99fe-ebd689c22001:key:06f926a6-4c43-4ebd-843a-b923d8fdd5cc"
}

variable resource_group {
    default = "landing-zone"
}

variable ibm_region {
    description = "IBM Cloud region where all resources will be deployed"
    default     = "us-south"
}

##############################################################################



##############################################################################
# Network Variables
##############################################################################

variable public_vlan_ids {
  default     = "2851976"

}

variable private_vlan_ids {
  default     = "2851978"
}


variable zones {
  description = "List of cluster zones The first will be for the master, any additional will be for worker pools"
  default     = "dal13"

}

##############################################################################


##############################################################################
# Cluster Variables
##############################################################################

variable cluster_name {
  description = "Name of openshift cluster to be created"
  default     = "classic-cluster"
}

variable kube_version {
  description = "Kube version to use for the cluster. use `ibmcloud ks versions` to see a list of available versions"
  default     = "1.15.10"
}

variable default_pool_size {
  description = "Default pool size for cluster"
  default     = 1  
}

variable hardware {
  description = "Hardware type for cluster, shared or dedicated"
  default     = "shared"
}

variable machine_type {
  description = "hardware type for cluster"
  default     = "b2c.4x16"
}

variable private_only {
  description = "Provision cluster workers on private only"
  default     = false
}

##############################################################################
