output "public_ip" {
  value = aws_eip.public_ip.public_ip
}
output "wordpress_security_group_id" {
  description = "Security group ID of the WordPress application"
  value       = aws_security_group.allow_ssh_http.id
}