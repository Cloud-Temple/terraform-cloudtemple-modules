# OpenIaaS VM Module

This Terraform module provisions and manages virtual machines on Cloud Temple OpenIaaS platform.

## Features

- Create and manage OpenIaaS virtual machines
- Configure CPU, memory, and disk size
- Attach network adapters
- Apply backup policies
- Manage VM tags

## Usage

```hcl
module "vm" {
  source = "github.com/Cloud-Temple/terraform-cloudtemple-modules//modules/iaas_opensource/vm"

  vm_name   = "example-vm"
  vm_cpu    = 2
  vm_memory = 2048  # MB

  # Infrastructure
  sr           = "sr-id"           # Storage Repository ID
  network_name = "network-id"      # Network ID
  template_id  = "template-id"     # VM Template ID

  # Optional configuration
  disk_size        = 50  # GB
  backup_policy_id = "backup-policy-id"

  # Tags
  tags = {
    environment = "production"
    project     = "example"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.7 |
| cloudtemple | >= 0.15.2 |

## Providers

| Name | Version |
|------|---------|
| cloudtemple | >= 0.15.2 |

## Resources

| Name | Type |
|------|------|
| cloudtemple_compute_iaas_opensource_virtual_machine | resource |
| cloudtemple_compute_iaas_opensource_network_adapter | resource |
| cloudtemple_compute_iaas_opensource_virtual_disk | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vm_name | Name of the virtual machine | string | n/a | yes |
| vm_cpu | Number of CPUs | number | 2 | no |
| vm_memory | Memory size in MB | number | 2048 | no |
| sr | Storage Repository ID | string | n/a | yes |
| network_name | Network ID | string | n/a | yes |
| template_id | VM Template ID | string | n/a | yes |
| disk_size | System disk size in GB | number | 30 | no |
| backup_policy_id | Backup Policy ID | string | n/a | yes |
| tags | Resource tags | map(string) | {} | no |
| auto_power_on | Automatically power on the VM | bool | true | no |
| secure_boot | Enable secure boot | bool | false | no |
| boot_order | Boot order for the VM (must contain 1 to 3 values from: disk, cdrom, network) | list(string) | ["disk"] | no |

## Outputs

| Name | Description |
|------|-------------|
| vm_id | The ID of the created VM |
| vm_name | The name of the created VM |

## Examples

### Basic Usage

```hcl
module "vm" {
  source = "github.com/Cloud-Temple/terraform-cloudtemple-modules//modules/iaas_opensource/vm"

  vm_name   = "example-vm"
  vm_cpu    = 2
  vm_memory = 2048

  sr           = "6b70b6c2-4c9c-45ac-b59c-38b5381fd67b"
  network_name = "a572dbd1-a5f6-4a5b-87f0-597b9c67206d"
  template_id  = "cfe69ef1-696f-4324-a775-65ba7cd6f678"

  disk_size        = 50
  backup_policy_id = "c0ab054b-e392-4f5d-882b-4b75a33f79de"

  tags = {
    environment = "development"
    project     = "example"
  }

  # Optional: Configure boot order
  boot_order = ["disk", "network"]  # Boot from disk first, then try network boot
}
```

### Boot Order Configuration

The `boot_order` variable allows you to specify the boot sequence for the VM. You can include up to three devices in the order they should be tried:

- `disk`: Boot from the system disk
- `cdrom`: Boot from CD/DVD
- `network`: Network boot (PXE)

Example configurations:
```hcl
# Default: Boot from disk only
boot_order = ["disk"]

# Boot from disk, fallback to network boot
boot_order = ["disk", "network"]

# Try network boot first, then disk
boot_order = ["network", "disk"]

# Full sequence with all options
boot_order = ["disk", "cdrom", "network"]
```

For more examples, please refer to the [examples](../../../examples/iaas_opensource/vm) directory.
