# Simple VM Example

This example demonstrates how to use the OpenIaaS VM module to create a simple virtual machine.

## Usage

1. Copy the terraform.tfvars.example file to terraform.tfvars:
```bash
cp terraform.tfvars.example terraform.tfvars
```

2. Update terraform.tfvars with your Cloud Temple credentials:
```hcl
cloudtemple_client_id = "your-client-id"
cloudtemple_secret_id = "your-secret-id"
```

3. Initialize Terraform:
```bash
terraform init
```

4. Review the plan:
```bash
terraform plan
```

5. Apply the configuration:
```bash
terraform apply
```

## Resources Created

This example creates:
- 1 virtual machine with 2 vCPUs and 2GB RAM
- 1 network adapter
- 1 system disk (50GB)

## Notes

- The VM is created with a backup policy
- Tags are applied for environment and project identification
- The VM is automatically powered on after creation
