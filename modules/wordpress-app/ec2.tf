

resource "aws_instance" "wordpress-app" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  tags = {
    Name = "wordpress-app-${var.app_region}"
  }

  user_data = <<-EOF

            #!/bin/bash

            # Update package repositories
            amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2

            # Install required packages
            yum install -y httpd mariadb-server php php-mysqlnd

            # Download WordPress
            wget https://wordpress.org/latest.tar.gz
            tar -xzf latest.tar.gz
            mv wordpress /var/www/html/

            # Configure Apache
            cat << ApacheEOF > /etc/httpd/conf.d/wordpress.conf
            <VirtualHost *:80>
                DocumentRoot /var/www/html/wordpress
                <Directory /var/www/html/wordpress>
                    Require all granted
                </Directory>
            </VirtualHost>
            ApacheEOF
            # Start Apache
            systemctl start httpd
            systemctl enable httpd
            systemctl enable httpd
            systemctl enable mariadb

            # Set up WordPress configuration
            cd /var/www/html/wordpress
            cp wp-config-sample.php wp-config.php
            sed -i "s/database_name_here/${var.db_name}/g" wp-config.php
            sed -i "s/username_here/${var.admin_username}/g" wp-config.php
            sed -i "s/password_here/${var.admin_password}/g" wp-config.php
            sed -i "s/localhost/${var.wordpress_endpoint}/g" wp-config.php

            # Restart Apache
            systemctl restart httpd


  EOF
}
 

