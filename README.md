# Cloud Temple Terraform Modules

Collection of Terraform modules for Cloud Temple infrastructure management.

## Available Modules

### OpenIaaS
- [VM](modules/iaas_opensource/vm/README.md) - Manage OpenIaaS virtual machines

## Installation

To use a module from this repository in your Terraform configuration:

```hcl
module "vm" {
  source = "github.com/Cloud-Temple/terraform-cloudtemple-modules//modules/iaas_opensource/vm"
  
  # Module configuration
  vm_name   = "example-vm"
  vm_cpu    = 2
  vm_memory = 2048
  # ... other configuration ...
}
```

Note: The double slash (//) in the source URL is required to specify a subdirectory within the repository.

## Usage

Complete examples are available in the [examples](examples) directory. Each module has its own documentation and examples showing specific use cases.

## Requirements

- Terraform >= 1.7
- Cloud Temple Provider >= 0.15.2

## Provider Configuration

```hcl
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
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Authors

- Cloud Temple Team
