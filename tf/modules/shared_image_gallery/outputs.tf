output "shared_image_gallery_resource_group_name" {
  value = "${azurerm_resource_group.test.name}"
}

output "shared_image_gallery_resource_group_location" {
  value = "${azurerm_resource_group.test.location}"
}

output "shared_image_gallery_unique_name" {
  value = "${azurerm_shared_image_gallery.test.unique_name}"
  description = "The Unique Name for this Shared Image Gallery."
}

output "shared_image_gallery_id" {
  value = "${azurerm_shared_image_gallery.test.id}"
  description = "The ID of the Shared Image Gallery."
}

output "shared_image_id" {
  value = "${azurerm_shared_image.test.id}"
  description = "The ID of the Shared Image."
}