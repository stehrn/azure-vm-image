variable "location" {
    description = "The location/region where the image gallery is created. Changing this forces a new resource to be created."
}

variable "tags" {}

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

variable "identifier_publisher" {
  description = "Publisher."
  default     = "VMBuildPipeline"
}

variable "identifier_offer" {
  description = "Offer."
  default     = "ccoe"
}

variable "identifier_sku" {
  description = "Standard."
  default     = "Standard"
}