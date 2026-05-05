resource "aws_vpc" "mi_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet_pulica" {
  vpc_id     = aws_vpc.mi_vpc.id
  cidr_block = var.subnet_publica_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "subred-publica"
  }
}

resource "aws_subnet" "subnet_privada" {
  vpc_id = aws_vpc.mi_vpc.id
  cidr_block = var.subnet_privada_cidr
  tags = {
    Name = "subred-privada"
  }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.mi_vpc.id
    tags = {
        Name = "mi-internet-gateway"
    }
}

resource "aws_route_table" "ruta_publica" {
    vpc_id = aws_vpc.mi_vpc.id
}

resource "aws_route" "internet_access" {
    route_table_id = aws_route_table.ruta_publica.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "publica" {
  subnet_id = aws_subnet.subnet_pulica.id
  route_table_id = aws_route_table.ruta_publica.id
}