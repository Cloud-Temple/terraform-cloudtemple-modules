# Memory Test Example

This example creates two VMs with different memory sizes to test memory conversion:
- VM 1: 4 GB (4096 MB)
- VM 2: 8 GB (8192 MB)

## Purpose

This test helps verify the memory conversion formula in the VM module by:
1. Creating VMs with different memory sizes
2. Observing the actual memory values in bytes expected by the provider
3. Validating if the conversion formula and offset are correct for different memory sizes

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

The plan output will show the memory values in bytes that the provider expects. We can use these values to verify and adjust the memory conversion formula in the module if needed.

5. Clean up:
```bash
terraform destroy
```

## Expected Results

We expect to see:
- 4 GB VM: Memory value in bytes
- 8 GB VM: Memory value in bytes

This will help determine if the current formula:
```hcl
memory = var.vm_memory * 1024 * 1024 + 2072576
```
is correct for all memory sizes or needs adjustment.
