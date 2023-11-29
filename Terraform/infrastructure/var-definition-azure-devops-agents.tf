variable "linux_agent_vm_name" {
  description = "The name of the bastion virtual machine"
  default     = "linux-agent" 
}

variable "admin_username" {
  description = "The username for the admin user"
  default     = "adminuser"  # Replace with your default value
}

variable "windows_agent_vm_name" {
  description = "The name of the bastion virtual machine"
  default     = "windows-agent" 
}
