resource "aws_vpc" "nextwork-devops-vpc" {
  cidr_block = var.vpc_cidr #sets our cidr block for our vpc 
  enable_dns_support = true #enables dns resolution within the vpc 
  enable_dns_hostnames = true #allows instances launched within the vpc to have dns hostnames 

  tags = {
    Name = "Nextwork-DevOps-VPC"
  }
}

resource "aws_subnet" "public_sub_A" {
  vpc_id = aws_vpc.nextwork-devops-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet A"
  }
}

resource "aws_subnet" "public_sub_B" {
  vpc_id = aws_vpc.nextwork-devops-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet B"
  }
}


resource "aws_internet_gateway" "nextwork-devops-igw" {
  vpc_id = aws_vpc.nextwork-devops-vpc.id

  tags = { 
    Name = "Nextwork-DevOps IGW"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.nextwork-devops-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nextwork-devops-igw.id
  }

  tags = { 
    Name = "our public route table which makes our public subnets public by routing traffic to the internet gateway"
  }
}

resource "aws_route_table_association" "public_sub_a_assoc" {
  subnet_id = aws_subnet.public_sub_A.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_sub_b_assoc" {
  subnet_id = aws_subnet.public_sub_B.id
  route_table_id = aws_route_table.public_rt.id
}