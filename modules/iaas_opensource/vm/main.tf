# VM Creation
resource "cloudtemple_compute_iaas_opensource_virtual_machine" "vm" {
  name                = var.vm_name
  cpu                 = var.vm_cpu
  memory              = var.vm_memory * 1024 * 1024  # Convert MB to bytes
  template_id         = var.template_id
  auto_power_on       = var.auto_power_on
  power_state         = "on"
  secure_boot         = var.secure_boot
  backup_sla_policies = [var.backup_policy_id]

  tags = var.tags

  lifecycle {
    prevent_destroy = false
    ignore_changes  = [power_state]
  }
}

# Network Adapter
resource "cloudtemple_compute_iaas_opensource_network_adapter" "primary" {
  network_id         = var.network_name
  virtual_machine_id = cloudtemple_compute_iaas_opensource_virtual_machine.vm.id
}

# System Disk
resource "cloudtemple_compute_iaas_opensource_virtual_disk" "system" {
  mode                  = "RW"
  name                  = "osdisk"
  size                  = var.disk_size * 1024 * 1024 * 1024  # Convert GB to bytes
  storage_repository_id = var.sr
  virtual_machine_id    = cloudtemple_compute_iaas_opensource_virtual_machine.vm.id
}
