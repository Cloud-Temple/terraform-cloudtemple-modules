# Provider Authentication
variable "cloudtemple_client_id" {
  description = "Cloud Temple Client ID"
  type        = string
}

variable "cloudtemple_secret_id" {
  description = "Cloud Temple Secret ID"
  type        = string
  sensitive   = true
}
