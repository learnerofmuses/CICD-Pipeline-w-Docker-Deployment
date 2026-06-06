#ROOT MODULE: main.tf


module "ec2" {
    source = "./modules/ec2"
    key_name = var.key_name_id
    ami_id = var.ami_id
    instance_type = var.instance_type_id
    subnet_id = module.vpc.public_subnet_a_id
    security_group_id = module.secgroups.security_group_id
}

module "secgroups" {
    source = "./modules/secgroups"
    vpc_id = module.vpc.vpc_id
    my_ip_address = var.my_ip_address
}

module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr_block
}
