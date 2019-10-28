resource "azurerm_resource_group" "test" {
  name     = "${var.shared_image_resource_group}"
  location = "${var.location}"
  tags     = "${var.tags}"
}
resource "azurerm_shared_image_gallery" "test" {
  name                = "${var.shared_image_gallery}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  location            = "${var.location}"
  description         = "Shared Virtual Machine images."
}

resource "azurerm_shared_image" "test" {
  name                = "${var.shared_image_name}"
  gallery_name        = "${azurerm_shared_image_gallery.test.name}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  location            = "${var.location}"
  os_type             = "Linux"

  identifier {
    publisher = "${var.identifier_publisher}"
    offer     = "${var.identifier_offer}"
    sku       = "${var.identifier_sku}"
  }
}

