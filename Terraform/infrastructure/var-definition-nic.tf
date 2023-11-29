variable "linux_agent1_vm_nic_name" {
  description = "The name of the bastion network interface"
  default     = "linux_agent1_vm_nic"  
}

variable "windows_agent1_vm_nic_name_name" {
  description = "The name of the network interface for Squid VM"
  default     = "windows_agent1_vm_nic"
}


variable "linux_agent1_ip_configuration_name" {
  default = "linux_agent1_ip_configuration"
}

variable "windows_agent1_ip_configuration_name" {
  default = "windows_agent1_ip_configuration"
}