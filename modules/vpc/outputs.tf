output "vpc_id" {
    value = aws_vpc.nextwork-devops-vpc.id
}

output "public_subnet_a_id" {
    value = aws_subnet.public_sub_A.id
}

output "public_subnet_b_id" {
    value = aws_subnet.public_sub_B.id
}

output "internet_gateway_id" {
    value = aws_internet_gateway.nextwork-devops-igw.id
}

