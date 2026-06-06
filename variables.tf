#ROOT MODULE: variables.tf

variable "instance_type_id" {
    description = "The type of instance to use for the EC2 instance"
    type        = string
    default     = "t3.micro"
}

variable "ami_id" {
    description = "The ID of the AMI to use for the EC2 instance"
    type        = string
}

variable "key_name_id" {
    description = "The name of the key pair to use for the EC2 instance"
    type        = string
}

variable "my_ip_address" {
    description = "Your IP address in CIDR notation"
    type        = string
}

variable "vpc_cidr_block" {
    description = "The CIDR block for the VPC"
    type        = string
}