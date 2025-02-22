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
  description = "Memory size in GB (will be allocated exactly as specified)"
  type        = number
  default     = 2  # 2 GB

  validation {
    condition     = var.vm_memory >= 1
    error_message = "Memory must be at least 1 GB"
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

variable "boot_order" {
  description = "Boot order for the VM (must contain 1 to 3 values)"
  type        = list(string)
  default     = ["Hard-Drive"]  # Default to boot from hard drive
  
  validation {
    condition     = length(var.boot_order) >= 1 && length(var.boot_order) <= 3
    error_message = "Boot order must contain between 1 and 3 values"
  }
  
  validation {
    condition     = alltrue([for device in var.boot_order : contains(["Hard-Drive", "DVD-Drive", "Network"], device)])
    error_message = "Boot order devices must be one of: Hard-Drive, DVD-Drive, Network"
  }
}
