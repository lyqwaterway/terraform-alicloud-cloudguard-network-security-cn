![GitHub Wachers](https://img.shields.io/github/watchers/lyqwaterway/terraform-alicloud-cloudguard-network-security-cn)
![GitHub Release](https://img.shields.io/github/v/release/lyqwaterway/terraform-alicloud-cloudguard-network-security-cn)
![GitHub Commits Since Last Commit](https://img.shields.io/github/commits-since/lyqwaterway/terraform-alicloud-cloudguard-network-security-cn/latest/master)
![GitHub Last Commit](https://img.shields.io/github/last-commit/lyqwaterway/terraform-alicloud-cloudguard-network-security-cn/master)
![GitHub Repo Size](https://img.shields.io/github/repo-size/lyqwaterway/terraform-alicloud-cloudguard-network-security-cn)
![GitHub Downloads](https://img.shields.io/github/downloads/lyqwaterway/terraform-alicloud-cloudguard-network-security-cn/total)

# Terraform Modules for CloudGuard Network Security (CGNS) - Alicloud


## Introduction
This repository provides a structured set of Terraform modules for deploying Check Point CloudGuard Network Security in Alicloud. These modules automate the creation of Virtual Networks, Security Gateways, High-Availability architectures, and more, enabling secure and scalable cloud deployments.

## Repository Structure
`Submodules:` Contains modular, reusable, production-grade Terraform components, each with its own documentation.

***

## Note
- Make sure your region and zone are supporting the gateway instance types in **modules/common/instance_type/main.tf**
  [Alicloud Instance_By_Region](https://ecs-buy.aliyun.com/instanceTypes/?spm=a2c63.p38356.879954.139.1eeb2d44eZQw2m#/instanceTypeByRegion)
- terraform destroy will throw an error that the plugin crashed.


## Configuration

- Best practice is to configure credentials in the Environment variables - [Alicloud provider](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
```
Configure environment variables in Linux:

$ export ALICLOUD_ACCESS_KEY=anaccesskey
$ export ALICLOUD_SECRET_KEY=asecretkey
$ export ALICLOUD_REGION=cn-beijing

Configure envrionment variables in Windows:
  set ALICLOUD_ACCESS_KEY=anaccesskey
  set ALICLOUD_SECRET_KEY=asecretkey
  set ALICLOUD_REGION=cn-beijing
```

## Usage
Add the required module in your Terraform configuration file (`main.tf`) to deploy resources. For example:

```hcl
module "example_module" {
  source  = "lyqwaterway/cloudguard-network-security-cn/alicloud//modules/{module_name}"
  version = "1.0.0"
  vpc_cidr = var.vpc_cidr
  cluster_vswitchs_map = var.cluster_vswitchs_map
  management_vswitchs_map = var.management_vswitchs_map
  private_vswitchs_map = var.private_vswitchs_map
  vswitchs_bit_length = var.vswitchs_bit_length


  // --- ECS Instance Configuration ---
  key_name = var.key_name
  gateway_name = var.gateway_name
  gateway_instance_type = var.gateway_instance_type
  allocate_and_associate_eip = var.allocate_and_associate_eip
  volume_size = var.volume_size
  disk_category = var.disk_category
  ram_role_name = var.ram_role_name
  instance_tags = var.instance_tags

  // --- Check Point Settings ---
  gateway_version = var.gateway_version
  admin_shell = var.admin_shell
  gateway_SICKey = var.gateway_SICKey
  gateway_password_hash = var.gateway_password_hash

  // --- Advanced Settings ---
  management_ip_address = var.management_ip_address
  resources_tag_name = var.resources_tag_name
  gateway_hostname = var.gateway_hostname
  allow_upload_download = var.allow_upload_download
  gateway_bootstrap_script = var.gateway_bootstrap_script
  primary_ntp = var.primary_ntp
  secondary_ntp = var.secondary_ntp
}
```
---

- Fill all variables in the cluster-master/**terraform.tfvars** file with proper values (see below for variables descriptions).
- From a command line initialize the Terraform configuration directory:
    ```
    terraform init
   ```
- Prepare vpc and subnet in the deployment :
     ```
    terraform apply -target==module.example_module.alicloud_route_table.private_vswitch_r
    ```
- - Create an execution plan:
    ```
    terraform plan
    ```
- Create or modify the whole deployment:
     ```
    terraform apply
    ```
