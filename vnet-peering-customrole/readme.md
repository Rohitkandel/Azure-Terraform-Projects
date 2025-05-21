**Azure Infrastructure Deployment with Terraform**

**Overview**

This Terraform project provisions an Azure infrastructure consisting of two virtual networks (CoreServicesVnet and ManufacturingVnet), each with a subnet, two virtual machines (CoreServicesVM and ManufacturingVM), VNet peering for inter-network communication, and a Network Watcher for monitoring. The resources are deployed in a single resource group (az104-rg5) in the East US region.

**Prerequisites**

To deploy this infrastructure, ensure you have the following:
Terraform: Version 1.0 or later installed.
Azure CLI: Installed and authenticated with an Azure account.
Azure Subscription: An active subscription with sufficient permissions to create resource groups, virtual networks, virtual machines, and network watchers.
Service Principal (optional): Required if the user lacks permissions to register Azure Resource Providers.

**Project Structure**

![Azure Infrastructure Deployment with Terraform - visual selection](https://github.com/user-attachments/assets/d5dc0ff0-6dc1-4c9c-b023-f87401e8bc62)

**Resources Created**

![Azure Infrastructure Deployment with Terraform - visual selection (1)](https://github.com/user-attachments/assets/fd6a63e9-91df-439d-9f49-872c40193da1)


**Usage**

1. Clone the Repository
  git clone https://github.com/Rohitkandel/Azure-Terraform-Projects/tree/main/vnet-peering-customrole
  cd <repository-directory>

2. Initialize Terraform

    terraform init

3. Plan the Deployment
   
    terraform plan

4. Apply the Configuration
   
    terraform apply --auto-approve

5. Verify Resources

    After deployment, verify the resources in the Azure Portal under the az104-rg5 resource group.

6. Destroy Resources (Optional)

    To remove all resources, run:

      terraform destroy --auto-approve

**Security Notes**

The virtual machines use a hardcoded password (Password1234!). For production environments, replace this with a secure method (e.g., Azure Key Vault or SSH keys).
Password authentication is enabled for simplicity. Consider disabling it and using SSH keys for enhanced security.
Ensure your Azure credentials are securely managed and not exposed in the configuration.

**Future Improvements**

Add network security groups (NSGs) to restrict traffic.

Use variables and modules for better scalability and reusability.

Implement Azure Key Vault for secure storage of credentials.

Add monitoring and logging configurations for the virtual machines.
