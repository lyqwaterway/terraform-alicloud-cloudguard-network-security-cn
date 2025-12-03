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


**Submodules:**
* [`cluster`](https://registry.terraform.io/modules/lyqwaterway/cloudguard-network-security-cn/alicloud/latest/submodules/cluster) - Deploys CloudGuard High Availability solution into an existing VPC.
* [`cluster-master`](https://registry.terraform.io/modules/lyqwaterway/cloudguard-network-security-cn/alicloud/latest/submodules/cluster-master) Deploys CloudGuard High Availability solution into a new VPC.
* [`management`](https://registry.terraform.io/modules/lyqwaterway/cloudguard-network-security-cn/alicloud/latest/submodules/management) - Deploys CloudGuard Management solution into an existing VPC.
* [`management-master`](https://registry.terraform.io/modules/lyqwaterway/cloudguard-network-security-cn/alicloud/latest/submodules/management-master) - Deploys CloudGuard Management solution into a new VPC
* [`gateway`](https://registry.terraform.io/modules/lyqwaterway/cloudguard-network-security-cn/alicloud/latest/submodules/gateway) - Deploys CloudGuard Single Gateway solution into an existing VPC.
* [`gateway-master`](https://registry.terraform.io/modules/lyqwaterway/cloudguard-network-security-cn/alicloud/latest/submodules/gateway-master) - Deploys CloudGuard Single Gateway solution into a new VPC.

Internal Submodules -

* [`common`](https://registry.terraform.io/modules/lyqwaterway/cloudguard-network-security-cn/alicloud/latest/submodules/common) - Contains shared configurations and reusable components for all modules.

* [`cluster-ram-role`](https://registry.terraform.io/modules/lyqwaterway/cloudguard-network-security-cn/alicloud/latest/submodules/cluster-ram-role) - Creates Alicloud RAM Role for Cloud Management Extension (CME) on Security Management Server.

- [`vpc`](https://registry.terraform.io/modules/lyqwaterway/cloudguard-network-security-cn/alicloud/latest/submodules/vpc) - Simplifies Virtual Network and subnet configurations.

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
  version = "{chosen_version}"
  # Add the required inputs
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
