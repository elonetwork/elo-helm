variable "linux_agent1_vm_name" {
  description = "The name of the bastion virtual machine"
  default     = "linux_agent1_vm_name-vm" 
}

variable "admin_username" {
  description = "The username for the admin user"
  default     = "adminuser"  # Replace with your default value
}

variable "windows_agent1_vm_name" {
  description = "The name of the bastion virtual machine"
  default     = "windows_agent1_vm_name-vm" 
}
