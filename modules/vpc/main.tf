# modules/vpc/main.tf

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16" 

  tags = {
    Name = "acme-vpc"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"  
  availability_zone       = "us-east-1a"   
  map_public_ip_on_launch = false

  tags = {
    Name = "acme-private-subnet"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnet_ids" {
  value = [aws_subnet.private.id]
}
