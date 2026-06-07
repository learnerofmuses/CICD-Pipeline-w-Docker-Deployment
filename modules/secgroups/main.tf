resource "aws_security_group" "nextwork_devops_sg" {
    name        = "nextwork-devops-sg"
    description = "Security group for NextWork DevOps instance"
    vpc_id = var.vpc_id

    tags = {
    name = "Nextwork-DevOps-VPC"
  }

    ingress { 
        description = "allows inbound ssh traffic from my IP address"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.my_ip_address]
    }
    ingress {
        description = "allows inbound traffic from our docker application"
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress { 
        description = "allows all outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}