# Terraform Azure Infrastructure: VNet, ASG, and NSG

This repository contains Terraform configurations to deploy a secure Azure Virtual Network (VNet) with subnets, an Application Security Group (ASG), and a Network Security Group (NSG). The setup is designed for scalable, secure cloud infrastructure, ideal for hosting web applications or enterprise workloads.

## 📖 Project Overview
This project automates the deployment of:
- **Resource Group**: `rig5635`
- **Virtual Networks**:
  - `CoreServicesVnet` (10.20.0.0/16)
    - `SharedServicesSubnet` (10.20.10.0/24)
    - `DatabaseSubnet` (10.20.20.0/24)
  - `ManufacturingVnet` (10.30.0.0/16)
    - `SensorSubnet1` (10.30.20.0/24)
    - `SensorSubnet2` (10.30.21.0/24)
- **Application Security Group**: `asg-web` (groups web servers)
- **Network Security Group**: `myNSGSecure`
  - Inbound: Allows traffic from `asg-web` on ports 80 (HTTP) and 443 (HTTPS)
  - Outbound: Denies traffic to the Internet on port 8080

### 🎯 Purpose
This setup ensures secure network segmentation and access control, suitable for production environments requiring isolated subnets and controlled traffic (e.g., web apps with secure database access).

## 🚀 Setup Instructions
### Prerequisites
- Azure account with active subscription
- Terraform v1.5+ installed
- Azure CLI installed and authenticated (`az login`)
- Git installed

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Rohitkandel/Azure-Terraform-Projects.git
   cd Azure-Terraform-Projects/vnet-asg-nsg

2. **Initialize Terraform:**
   terraform init

3. **Plan and apply the configuration:**
   terraform plan
   terraform apply -auto-approve

**Outputs**
vnet_id: ID of CoreServicesVnet
nsg_id: ID of myNSGSecure

**🛠️ Files**
main.tf: Defines VNet, subnets, ASG, and NSG.
variables.tf: Configurable inputs (e.g., resource group name).
outputs.tf: Outputs for VNet and NSG IDs.
























