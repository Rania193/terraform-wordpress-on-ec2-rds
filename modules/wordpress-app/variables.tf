variable "app_region" {
  description = "AWS region to deploy the application"
  type        = string
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
}

variable "key_pair_name" {
  type        = string
  description = "Name of the existing key pair for SSH access"
}

variable "admin_username" {
  type        = string
  description = "Username for the WordPress admin account"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Password for the WordPress admin account"
}
variable "wordpress_db_security_group_id" {
  description = "Security group ID of the MySQL database"
  type        = string
}
variable "db_name" {
  type = string
  description = "Name for accessing the database"
}
variable "wordpress_endpoint" {
  
}