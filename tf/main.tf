# Configure the Azure Provider
provider "azurerm" {
  version = "=1.34.0"
}

module "shared_image_gallery" {
  source = "./modules/shared_image_gallery"
  location = "${var.location}"
  tags = "${var.tags}"
}

# module "virtual_machine" {
#   source = "./modules/virtual_machine"
#   location = "${var.location}"
#   tags = "${var.tags}"
#   vm_resource_group = "${var.vm_resource_group}"
#   hostname = "${var.hostname}"
#   admin_password = "${var.admin_password}"
# }