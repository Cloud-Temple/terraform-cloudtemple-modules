# Basic VM Configuration
variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "vm_cpu" {
  description = "Number of CPUs"
  type        = number
  default     = 2

  validation {
    condition     = var.vm_cpu > 0
    error_message = "CPU count must be greater than 0"
  }
}

variable "vm_memory" {
  description = "Memory size in MB"
  type        = number
  default     = 2048

  validation {
    condition     = var.vm_memory >= 1024
    error_message = "Memory must be at least 1024 MB"
  }
}

# Infrastructure
variable "sr" {
  description = "Storage Repository ID"
  type        = string
}

variable "network_name" {
  description = "Network ID"
  type        = string
}

variable "template_id" {
  description = "VM Template ID"
  type        = string
}

# Optional Configuration
variable "disk_size" {
  description = "System disk size in GB"
  type        = number
  default     = 30

  validation {
    condition     = var.disk_size >= 10
    error_message = "Disk size must be at least 10 GB"
  }
}

variable "backup_policy_id" {
  description = "Backup Policy ID"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

variable "auto_power_on" {
  description = "Automatically power on the VM"
  type        = bool
  default     = true
}

variable "secure_boot" {
  description = "Enable secure boot"
  type        = bool
  default     = false
}
