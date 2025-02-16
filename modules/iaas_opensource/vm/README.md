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
  vm_memory = 2  # GB

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
| vm_memory | Memory size in GB (provider automatically adds 2MB overhead) | number | 2 | no |
| sr | Storage Repository ID | string | n/a | yes |
| network_name | Network ID | string | n/a | yes |
| template_id | VM Template ID | string | n/a | yes |
| disk_size | System disk size in GB | number | 30 | no |
| backup_policy_id | Backup Policy ID | string | n/a | yes |
| tags | Resource tags | map(string) | {} | no |
| auto_power_on | Automatically power on the VM | bool | true | no |
| secure_boot | Enable secure boot | bool | false | no |
| boot_order | Boot order for the VM (must contain 1 to 3 values) | list(string) | ["Hard-Drive"] | no |

## Outputs

| Name | Description |
|------|-------------|
| vm_id | The ID of the created VM |
| vm_name | The name of the created VM |

## Memory Configuration

The `vm_memory` variable specifies the amount of memory in GB. The module automatically compensates for the provider's 2MB overhead to ensure you get exactly the amount of memory specified. For example:

```hcl
vm_memory = 2  # Results in exactly 2.000000 GB
vm_memory = 4  # Results in exactly 4.000000 GB
```

This means that when you specify `vm_memory = 4`, the VM will have exactly 4GB of memory, making memory allocation straightforward and predictable.

Note: Internally, the module subtracts 2MB from the calculated value to compensate for the provider's automatic overhead.

## Boot Order Configuration

The `boot_order` variable allows you to specify the boot sequence for the VM. You can include up to three devices in the order they should be tried:

- `Hard-Drive`: Boot from the system disk
- `DVD-Drive`: Boot from CD/DVD
- `Network`: Network boot (PXE)

Example configurations:
```hcl
# Default: Boot from hard drive only
boot_order = ["Hard-Drive"]

# Boot from hard drive, fallback to network boot
boot_order = ["Hard-Drive", "Network"]

# Try network boot first, then hard drive
boot_order = ["Network", "Hard-Drive"]

# Full sequence with all options
boot_order = ["Hard-Drive", "DVD-Drive", "Network"]
```

For more examples, please refer to the [examples](../../../examples/iaas_opensource/vm) directory.
