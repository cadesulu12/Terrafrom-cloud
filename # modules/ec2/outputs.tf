# Define outputs to expose important information
output "instance_public_ips" {
  value = module.ec2.instance_public_ips
}
