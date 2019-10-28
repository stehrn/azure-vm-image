# variable "resource_group_name" {} 

# data "azurerm_resource_group" "test" {
#    name     = "${var.resource_group}"
#    location = "${var.location}"
# }

resource "azurerm_resource_group" "test" {
  name     = "${var.vm_resource_group}"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "test" {
    name                = "${var.hostname}vnet"
    location            = "${var.location}"
    address_space       = ["${var.address_space}"]
    resource_group_name = "${azurerm_resource_group.test.name}"
}

resource "azurerm_subnet" "test" {
   name                 = "${var.hostname}subnet"
   virtual_network_name = "${azurerm_virtual_network.test.name}"
   resource_group_name  = "${azurerm_resource_group.test.name}"
   address_prefix       = "${var.subnet_prefix}"
}

resource "azurerm_network_interface" "test" {
  name                = "nic"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = "${azurerm_subnet.test.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_storage_account" "test" {
  name                     = "${lower(var.hostname)}stor"
  resource_group_name      = "${azurerm_resource_group.test.name}"
  location                 = "${azurerm_resource_group.test.location}"
  account_tier             = "${var.storage_account_tier}"
  account_replication_type = "${var.storage_replication_type}"
}

data "azurerm_shared_image" "test" {
  name                = "${var.shared_image_name}"
  gallery_name        = "${var.shared_image_gallery}"
  resource_group_name = "${var.shared_image_resource_group}"
}

resource "azurerm_virtual_machine" "test" {
  name                  = "${var.hostname}"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.test.name}"
  vm_size               = "${var.vm_size}"
  network_interface_ids = ["${azurerm_network_interface.test.id}"]

  storage_image_reference {
    id = "${data.azurerm_shared_image.test.id}"
  }

  storage_os_disk {
    name          = "${var.hostname}osdisk"
    create_option = "FromImage"
    disk_size_gb  = "30"
  }

  os_profile {
    computer_name  = "${var.hostname}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}