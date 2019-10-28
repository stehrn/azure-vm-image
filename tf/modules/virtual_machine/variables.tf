variable "vm_resource_group" {
    description = "Resource group name into which your new virtual machine will go."
    default     = "vmResourceGroup"
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "tags" {}

variable "hostname" {
  description = "Used to form various names including the key vault, vm, and storage. Must be unique."
}

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = "10.0.0.0/24"
}

variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
  default     = "10.0.0.0/24"
}

variable "storage_account_tier" {
  description = "Defines the Tier of storage account to be created. Valid options are Standard and Premium."
  default     = "Standard"
}

variable "storage_replication_type" {
  description = "Defines the Replication Type to use for this storage account. Valid options include LRS, GRS etc."
  default     = "LRS"
}

variable "vm_size" {
  description = "Specifies the size of the virtual machine. This must be the same as the vm image from which you are copying."
  default     = "Standard_B1s"
}

variable "image_publisher" {
  description = "name of the publisher of the image (az vm image list)"
  default     = "Canonical"
}

variable "image_offer" {
  description = "the name of the offer (az vm image list)"
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "image sku to apply (az vm image list)"
  default     = "16.04-LTS"
}

variable "image_version" {
  description = "version of the image to apply (az vm image list)"
  default     = "latest"
}

variable "admin_username" {
  description = "administrator user name for the vm"
  default     = "vmadmin"
}

variable "admin_password" {
  description = "administrator password for the vm (recommended to disable password auth)"
}

variable "shared_image_resource_group" {
  description = "Name of shared image gallery resource group."
  default = "ImageResourceGroup"
}

variable "shared_image_gallery" {
  description = "Name of shared image gallery."
  default = "VMSharedImageGallery"
}

variable "shared_image_name" {
  description = "Name of shared image."
  default = "RedHatImage"
}

