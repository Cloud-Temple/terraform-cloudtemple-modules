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

module "vm_4gb" {
  source = "../../../modules/iaas_opensource/vm"

  # Configuration de base de la VM
  vm_name   = "memory-test-4gb"
  vm_cpu    = 2
  vm_memory = 4  # 4 GB

  # Infrastructure
  sr           = "6b70b6c2-4c9c-45ac-b59c-38b5381fd67b"  # sr002-clu001-reks-az07-svc-data23
  network_name = "a572dbd1-a5f6-4a5b-87f0-597b9c67206d"  # REKS-LAN
  template_id  = "bedacb29-409d-4f59-819c-edbe18297cd6"  # ALT003

  # Configuration optionnelle
  disk_size        = 10  # 10 GB
  backup_policy_id = "c0ab054b-e392-4f5d-882b-4b75a33f79de"  # nobackup policy

  # Tags
  tags = {
    backup      = "nobackup"
    environment = "test"
    purpose     = "memory-test"
  }

  boot_order = ["Hard-Drive", "Network"]
}

module "vm_8gb" {
  source = "../../../modules/iaas_opensource/vm"

  # Configuration de base de la VM
  vm_name   = "memory-test-8gb"
  vm_cpu    = 2
  vm_memory = 8  # 8 GB

  # Infrastructure
  sr           = "6b70b6c2-4c9c-45ac-b59c-38b5381fd67b"  # sr002-clu001-reks-az07-svc-data23
  network_name = "a572dbd1-a5f6-4a5b-87f0-597b9c67206d"  # REKS-LAN
  template_id  = "bedacb29-409d-4f59-819c-edbe18297cd6"  # ALT003

  # Configuration optionnelle
  disk_size        = 10  # 10 GB
  backup_policy_id = "c0ab054b-e392-4f5d-882b-4b75a33f79de"  # nobackup policy

  # Tags
  tags = {
    backup      = "nobackup"
    environment = "test"
    purpose     = "memory-test"
  }

  boot_order = ["Hard-Drive", "Network"]
}
