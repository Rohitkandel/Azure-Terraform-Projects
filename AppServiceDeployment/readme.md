
               ** App Service Deployment**
       

This project outlines a streamlined Azure web application deployment strategy. It begins by establishing a dedicated resource group and an App Service Plan to host the web application. Key to this approach is configuring "Prod" and "Stage" deployment slots within the Azure Web App. Different application versions are then deployed to these slots, allowing for thorough testing in the staging environment. Finally, a seamless slot swap promotes the new version to production with zero downtime, followed by validation to ensure everything functions as expected. This process enables agile, low-risk application updates.

                 ![Screenshot 2025-05-22 142047](https://github.com/user-attachments/assets/d210051a-16f7-4f98-b07e-69d2e6d1ff75)


Prerequisites
Terraform >= 1.3

Azure CLI installed

GitHub repository for source control

Azure Subscription with proper quota

Usage

Clone the Repository git clone https://github.com/Rohitkandel/Azure-Terraform-Projects/AppServiceDeployment.git

Initialize Terraform

terraform init

Plan the Deployment

terraform plan

Apply the Configuration

terraform apply --auto-approve

Verify Resources

After deployment, verify the resources in the Azure Portal.

Destroy Resources (Optional)

To remove all resources, run:

terraform destroy --auto-approve
