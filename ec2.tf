# Launch an EC2 instance in the public subnet
resource "aws_instance" "public_instance" {
  ami                    = "ami-08635203447d68380" # Updated AMI ID
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id] # Use the security group ID
  key_name               = aws_key_pair.ssh_key.key_name
  associate_public_ip_address = true
  user_data = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install nginx -y
sudo service nginx start
EOF

  tags = {
    Name = "Public Instance"
  }
}

# Launch an EC2 instance in the private subnet
resource "aws_instance" "private_instance" {
  ami                    = "ami-08635203447d68380" # Updated AMI ID
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id] # Use the security group ID
  key_name               = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "Private Instance"
  }
}
