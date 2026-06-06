variable  "vpc_id" {
    description = "The ID of the VPC where the security group will be created"
    type        = string
}

variable "my_ip_address" {
    description = "Your IP address in CIDR notation (e.g., 192.168.1.0/24)"
    type        = string
}
