terraform {
  required_providers {
    cloudtemple = {
      source  = "cloud-temple/cloudtemple"
      version = "0.15.2"
    }
  }
}

provider "cloudtemple" {
  address   = "shiva.cloud-temple.com"
  client_id = var.cloudtemple_client_id
  secret_id = var.cloudtemple_secret_id
}

module "vm" {
  source = "../../../modules/iaas_opensource/vm"

  # Basic VM Configuration
  vm_name   = "example-vm"
  vm_cpu    = 2
  vm_memory = 2048  # 2 GB

  # Infrastructure
  sr           = "6b70b6c2-4c9c-45ac-b59c-38b5381fd67b"  # sr002-clu001-reks-az07-svc-data23
  network_name = "a572dbd1-a5f6-4a5b-87f0-597b9c67206d"  # REKS-LAN
  template_id  = "bedacb29-409d-4f59-819c-edbe18297cd6"  # ALT003

  # Optional Configuration
  disk_size        = 50  # 50 GB
  backup_policy_id = "c0ab054b-e392-4f5d-882b-4b75a33f79de"  # nobackup policy

  # Tags
  tags = {
    environment = "development"
    project     = "example"
  }
}

# Output the created VM details
output "vm_id" {
  description = "The ID of the created VM"
  value       = module.vm.vm_id
}

output "vm_name" {
  description = "The name of the created VM"
  value       = module.vm.vm_name
}
