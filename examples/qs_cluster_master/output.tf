

output "vpc_id" {
  value = module.example_module.vpc_id
}
output "internal_rt_id" {
  value = module.example_module.internal_rt_id
}
output "vpc_cluster_vswitchs_ids_list" {
  value = module.example_module.vpc_cluster_vswitchs_ids_list
}
output "vpc_management_vswitchs_ids_list" {
  value = module.example_module.vpc_management_vswitchs_ids_list
}
output "vpc_private_vswitchs_ids_list" {
  value = module.example_module.vpc_private_vswitchs_ids_list
}
output "image_id" {
  value = module.example_module.image_id
}
output "cluster_primary_EIP" {
  value = module.example_module.cluster_primary_EIP
}
output "cluster_secondary_EIP" {
  value = module.example_module.cluster_secondary_EIP
}

output "member_a_instance_id" {
  value = module.example_module.member_a_instance_id
}
output "member_b_instance_id" {
  value = module.example_module.member_b_instance_id
}
output "member_a_instance_name" {
  value = module.example_module.member_a_instance_name
}
output "member_b_instance_name" {
  value = module.example_module.member_b_instance_name
}
output "permissive_sg_id" {
  value = module.example_module.permissive_sg_id
}
output "permissive_sg_name" {
  value = module.example_module.permissive_sg_name
}