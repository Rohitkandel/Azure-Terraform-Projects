# Terraform Azure Infrastructure

This repository contains Terraform configurations for deploying an **Azure Virtual Network (VNet)** setup with subnets, **Application Security Group (ASG)**, and **Network Security Group (NSG)**.

## 🔹 Infrastructure Overview
- **Resource Group:** `rig5635`
- **VNets:**
  - `CoreServicesVnet` (`10.20.0.0/16`)
    - `SharedServicesSubnet` (`10.20.10.0/24`)
    - `DatabaseSubnet` (`10.20.20.0/24`)
  - `ManufacturingVnet` (`10.30.0.0/16`)
    - `SensorSubnet1` (`10.30.20.0/24`)
    - `SensorSubnet2` (`10.30.21.0/24`)
- **ASG:** `asg-web`
- **NSG:** `myNSGSecure`
  - **Inbound Rule:** Allow traffic from `asg-web` on **ports 80, 443**
  - **Outbound Rule:** Deny traffic to the **Internet** on **port 8080**

## 🔹 Setup Instructions
1. Clone this repository:
   git clone https://github.com/reponame/repository.git
   cd repository

2. Initialize Terraform:
   terraform init

3. Plan and apply the configuration:
   terraform plan
   terraform apply -auto-approve