# provider "aws" {
#   region = "us-east-1"
# }
resource "tls_private_key" "pv_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "ssh_key" {
  key_name = "wordpress-key-pair"

  public_key = tls_private_key.pv_key.public_key_openssh
}

module "wordpress-app" {
  source         = "../modules/wordpress-app"
  ami            = "ami-0a699202e5027c10d"
  instance_type  = "t3.small"
  app_region     = "us-east-1"
  admin_username = "wordpress_user"
  admin_password = "wordpress_password"
  db_name        = "wordpress"
  #database_name = "database1"
  key_pair_name                  = aws_key_pair.ssh_key.key_name
  wordpress_db_security_group_id = module.mysql-db.wordpress_db_security_group_id
  wordpress_endpoint = module.mysql-db.database_host
}
module "mysql-db" {
  source = "../modules/mysql-db"

  db_name                     = "wordpress"
  db_username                 = "wordpress_user"
  db_password                 = "wordpress_password"
  db_instance_class           = "db.t3.micro"
  wordpress_security_group_id = module.wordpress-app.wordpress_security_group_id
}
output "public_ip" {
  value = module.wordpress-app.public_ip
}
output "database_host" {
  value = module.mysql-db.database_host

}
