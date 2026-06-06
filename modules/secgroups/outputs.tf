output "nextwork_devops_sg_id" {
    description = "The ID of the security group created for the EC2 instance"
    value       = aws_security_group.nextwork_devops_sg.id
}

output "security_group_id" {
    description = "The ID of the security group created for the EC2 instance"
    value       = aws_security_group.nextwork_devops_sg.id
}