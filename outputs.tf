output "assessment_environment_services_access_security_group" {
  description = "The security group allowing VPN users access to services running in the assessment environments."
  value       = aws_security_group.assessment_environment_services_access
}

output "instance_id" {
  description = "The ID corresponding to the OpenVPN server EC2 instance."
  value       = module.openvpn.id
}

output "security_group_id" {
  description = "The ID corresponding to the OpenVPN server security group."
  value       = module.openvpn.security_group_id
}
