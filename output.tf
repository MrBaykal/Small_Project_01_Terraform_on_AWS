# output
output "ec2_public_ip" {
    description = "public ip of ec2"
    value = aws_instance.public_ip
  
}