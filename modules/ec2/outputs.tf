output "nextwork_devops_instance_id" {
    description = "The ID of the EC2 instance"
    value       = aws_instance.nextwork_devops_instance.id
}

output "nextwork_devops_instance_public_ip" {
    description = "The public IP address of the EC2 instance"
    value       = aws_instance.nextwork_devops_instance.public_ip
}

