# Elastic IP for the EC2 Instance
resource "aws_eip" "public_ip" {
  #depends_on = [aws_instance.wordpress-app]
}

resource "aws_eip_association" "app_server_association" {
  depends_on = [aws_eip.public_ip, aws_instance.wordpress-app]

  allocation_id = aws_eip.public_ip.id
  instance_id   = aws_instance.wordpress-app.id
}