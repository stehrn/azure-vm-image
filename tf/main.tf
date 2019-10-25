# Configure the Azure Provider
provider "azurerm" {
  version = "=1.34.0"
}

resource "azurerm_resource_group" "test" {
  name     = "ImageResourceGroup"
  location = "${var.location}"
  tags     = "${var.tags}"
}

module "shared_image_gallery" {
  source = "./modules/shared_image_gallery"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
}