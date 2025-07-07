provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "my_ec2_instance" {
  ami                    = "ami-0dc0ac921efee9f9d" # ✅ Ubuntu 22.04 LTS for eu-west-1
  instance_type          = "t2.micro"
  key_name               = "new-hamza-key" # ✅ Your actual key pair name
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io ansible
              systemctl enable docker
              systemctl start docker
              usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "terraform-ansible-docker"
  }
}

