provider "alicloud" {}
module "example_module" {
  source  = "lyqwaterway/cloudguard-network-security-cn/alicloud//modules/cluster-master"
  version = "0.0.1"
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
