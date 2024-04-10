output "database_host" {
  description = "Endpoint of the RDS instance"
  value       = aws_db_instance.wordpress_db.endpoint
}
output "wordpress_db_security_group_id" {
  description = "Security group ID of the MySQL database"
  value       = aws_security_group.wordpress_db.id
}