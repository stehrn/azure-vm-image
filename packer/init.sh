#!/bin/sh
echo "Setting environment variables for Terraform"
export ARM_CLIENT_ID=your_appId
export ARM_CLIENT_SECRET=your_password
export ARM_TENANT_ID=your_tenant_id
export ARM_SUBSCRIPTION_ID=$(az account show --query id)