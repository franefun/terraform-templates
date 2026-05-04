provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "mi-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "mi-vpc"
  }
}

resource "aws_internet_gateway" "mi-igw" {
  vpc_id = aws_vpc.mi-vpc.id
  tags = {
    Name = "mi-igw"
  }
}

resource "aws_route_table" "mi-rt" {
  vpc_id = aws_vpc.mi-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mi-igw.id
  }
  tags = {
    Name = "mi-rt"
  }
}

resource "aws_route_table_association" "mi-rta" {
  subnet_id      = aws_subnet.mi-subnet.id
  route_table_id = aws_route_table.mi-rt.id
}

resource "aws_security_group" "gs-ec2" {
  name        = "security-group-ec2"
  vpc_id      = aws_vpc.mi-vpc.id
  description = "Security group for ec2 instance"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "mi-subnet" {
  vpc_id                  = aws_vpc.mi-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    Name = "mi-subnet"
  }
}

resource "aws_instance" "mi-instancia" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.mi-subnet.id
  key_name               = "vockey"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.gs-ec2.id]

  tags = {
    Name = "learn-terraform"
  }
}