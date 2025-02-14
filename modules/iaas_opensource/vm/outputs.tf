# VM Outputs
output "vm_id" {
  description = "The ID of the created VM"
  value       = cloudtemple_compute_iaas_opensource_virtual_machine.vm.id
}

output "vm_name" {
  description = "The name of the created VM"
  value       = cloudtemple_compute_iaas_opensource_virtual_machine.vm.name
}
