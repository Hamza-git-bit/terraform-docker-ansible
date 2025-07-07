output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.my_ec2_instance.public_ip
}

output "instance_public_dns" {
  description = "The public DNS of the EC2 instance"
  value       = aws_instance.my_ec2_instance.public_dns
}

