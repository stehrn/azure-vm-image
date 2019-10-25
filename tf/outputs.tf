
output "azurerm_resource_group_name" {
  value = "${azurerm_resource_group.test.name}"
}

output "azurerm_resource_group_location" {
  value = "${azurerm_resource_group.test.location}"
}

output "shared_image_gallery_unique_name" {
  value = "${module.shared_image_gallery.shared_image_gallery_unique_name}"
}

output "shared_image_gallery_id" {
  value = "${module.shared_image_gallery.shared_image_gallery_id}"
}

output "shared_image_id" {
  value = "${module.shared_image_gallery.shared_image_id}"
}

