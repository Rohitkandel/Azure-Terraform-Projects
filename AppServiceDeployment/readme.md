         Azure Web App Deployment with Terraform

This project outlines a streamlined Azure web application deployment strategy. It begins by establishing a dedicated resource group and an App Service Plan to host the web application. Key to this approach is configuring "Prod" and "Stage" deployment slots within the Azure Web App. Different application versions are then deployed to these slots, allowing for thorough testing in the staging environment. Finally, a seamless slot swap promotes the new version to production with zero downtime, followed by validation to ensure everything functions as expected. This process enables agile, low-risk application updates.

Prerequisites
Terraform >= 1.3

Azure CLI installed

GitHub repository for source control

Azure Subscription with proper quota

Usage

Clone the Repository git clone https://github.com/Rohitkandel/Azure-Terraform-Projects/tree/main/vnet-peering-customrole

Initialize Terraform

terraform init

Plan the Deployment

terraform plan

Apply the Configuration

terraform apply --auto-approve

Verify Resources

After deployment, verify the resources in the Azure Portal under the az104-rg5 resource group.

Destroy Resources (Optional)

To remove all resources, run:

terraform destroy --auto-approve