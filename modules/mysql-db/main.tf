resource "aws_db_instance" "wordpress_db" {
  engine         = "mysql"
  engine_version = "5.7"
  instance_class = var.db_instance_class
  skip_final_snapshot = true
  db_name     = var.db_name
  username = var.db_username
  password = var.db_password

  allocated_storage   = 20
  storage_type        = "gp2"
  vpc_security_group_ids = [aws_security_group.wordpress_db.id]

  tags = {
    Name = "WordPress DB"
  }
}

resource "aws_security_group" "wordpress_db" {
  name_prefix = "wordpress-db-"

#   ingress {
#     from_port       = 3306
#     to_port         = 3306
#     protocol        = "tcp"
#     security_groups = [var.wordpress_security_group_id]
#   }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group_rule" "wordpress_sg" {
  type = "ingress"
  from_port = 3306
  to_port         = 3306
  protocol        = "tcp"
  security_group_id = var.wordpress_security_group_id
  source_security_group_id = aws_security_group.wordpress_db.id
}