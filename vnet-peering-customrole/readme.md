Azure Infrastructure Deployment with Terraform

Overview

This Terraform project provisions an Azure infrastructure consisting of two virtual networks (CoreServicesVnet and ManufacturingVnet), each with a subnet, two virtual machines (CoreServicesVM and ManufacturingVM), VNet peering for inter-network communication, and a Network Watcher for monitoring. The resources are deployed in a single resource group (az104-rg5) in the East US region.

Prerequisites

To deploy this infrastructure, ensure you have the following:





Terraform: Version 1.0 or later installed.



Azure CLI: Installed and authenticated with an Azure account.



Azure Subscription: An active subscription with sufficient permissions to create resource groups, virtual networks, virtual machines, and network watchers.



Service Principal (optional): Required if the user lacks permissions to register Azure Resource Providers.

Project Structure

The Terraform configuration is organized into the following files:





provider.tf: Configures the Azure provider and specifies the required provider version.



network.tf: Defines the networking resources, including:





Resource group (az104-rg5)



Virtual networks (CoreServicesVnet and ManufacturingVnet)



Subnets (Core and Manufacturing)



VNet peering for bi-directional connectivity



Network Watcher for traffic monitoring



vm.tf: Defines two virtual machines with their respective network interfaces:





CoreServicesVM in the Core subnet



ManufacturingVM in the Manufacturing subnet

Resources Created





Resource Group: az104-rg5 in East US.



Virtual Networks:





CoreServicesVnet: Address space 10.0.0.0/16, with subnet Core (10.0.0.0/24).



ManufacturingVnet: Address space 172.16.0.0/16, with subnet Manufacturing (172.16.0.0/24).



VNet Peering: Bi-directional peering between CoreServicesVnet and ManufacturingVnet.



Virtual Machines:





CoreServicesVM: Ubuntu 22.04 LTS, Standard_DS1_v2, in the Core subnet, tagged as staging.



ManufacturingVM: Ubuntu 22.04 LTS, Standard_DS1_v2, in the Manufacturing subnet, tagged as dev.



Network Watcher: network-watcher for monitoring network traffic.

Usage

1. Clone the Repository

git clone <repository-url>
cd <repository-directory>

2. Initialize Terraform

Initialize the Terraform working directory to download the required providers.

terraform init

3. Plan the Deployment

Generate and review the execution plan to ensure the correct resources will be created.

terraform plan

4. Apply the Configuration

Deploy the infrastructure to Azure.

terraform apply

Confirm the prompt by typing yes.

5. Verify Resources

After deployment, verify the resources in the Azure Portal under the az104-rg5 resource group.

6. Destroy Resources (Optional)

To remove all resources, run:

terraform destroy

Confirm the prompt by typing yes.

Security Notes





The virtual machines use a hardcoded password (Password1234!). For production environments, replace this with a secure method (e.g., Azure Key Vault or SSH keys).



Password authentication is enabled for simplicity. Consider disabling it and using SSH keys for enhanced security.



Ensure your Azure credentials are securely managed and not exposed in the configuration.

Future Improvements





Add network security groups (NSGs) to restrict traffic.



Use variables and modules for better scalability and reusability.



Implement Azure Key Vault for secure storage of credentials.



Add monitoring and logging configurations for the virtual machines.