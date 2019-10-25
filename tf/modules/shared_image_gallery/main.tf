variable "location" {} 
variable "resource_group_name" {} 

resource "azurerm_shared_image_gallery" "test" {
  name                = "VMSharedImageGallery"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  description         = "Shared Virtual Machine images."
}

resource "azurerm_shared_image" "test" {
  name                = "RedHatImage"
  gallery_name        = "${azurerm_shared_image_gallery.test.name}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  os_type             = "Linux"

  identifier {
    publisher = "VMBuildPipeline"
    offer     = "ccoe"
    sku       = "Standard"
  }
}

