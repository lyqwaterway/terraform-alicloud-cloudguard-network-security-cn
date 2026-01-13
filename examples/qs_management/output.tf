output "Deployment" {
  value = "Finalizing configuration may take up to 20 minutes after deployment is finished"
}

output "management_instance_id" {
  value = module.example_module.management_instance_id
}

output "management_instance_name" {
  value = module.example_module.management_instance_name
}
output "management_instance_tags" {
  value = module.example_module.management_instance_tags
}
output "management_public_ip" {
  value = module.example_module.management_public_ip
}