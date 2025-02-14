# Cloud Temple Terraform Modules

Collection of Terraform modules for Cloud Temple infrastructure management.

## Available Modules

### OpenIaaS
- [VM](modules/iaas_opensource/vm/README.md) - Manage OpenIaaS virtual machines

## Usage

Examples are available in the [examples](examples) directory.

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
