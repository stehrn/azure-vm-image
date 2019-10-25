
# Examples of creating Azure RHEL VM images on Azure

## Using Packer
For some background refer to [How to use Packer to create Linux virtual machine images in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/build-image-with-packer), and Packers [Azure Resource Manager Builder](https://www.packer.io/docs/builders/azure.html)

Packer json:
* [`rhel.json`](packer/rhel.json) - managed image deployment 
* [`rhel_shared_gallery.json`](packer/rhel_shared_gallery.json) - Azure [shared image gallery](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/shared-image-galleries) deployment 

In both cases json originated from [hashicorp azure examples](https://github.com/hashicorp/packer/blob/master/examples/azure/rhel.json)

Following Azure resources are provosisoned (via terraform):
* `azurerm_resource_group`
* `azurerm_shared_image_gallery`
* `azurerm_shared_image`

Steps: 
Packer json need needs env variables setting

```
az ad sp create-for-rbac --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"

{
  "client_id": "7680787f-8a5e-4fad-933f-1e2caead5dc5",
  "client_secret": "e2c2b4ab-2950-4d4f-a8b4-0d4491eb566b",
  "tenant_id": "8f612081-9635-4f0a-824a-24908b3be26a"
}
```
Set env variables referenced in json:
```
export ARM_CLIENT_ID=7680787f-8a5e-4fad-933f-1e2caead5dc5
export ARM_CLIENT_SECRET=e2c2b4ab-2950-4d4f-a8b4-0d4491eb566b
export ARM_TENANT_ID=8f612081-9635-4f0a-824a-24908b3be26a
export ARM_SSH_PASS=admin1234
export ARM_SUBSCRIPTION_ID=$(az account show --query id)
```

Provision Azure resources:
```
cd tf
terraform init
terraform apply
```

Trigger packer build:
```
./packer build packer/rhel.json
```
