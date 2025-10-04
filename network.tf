# Subredes en la Zona de Disponibilidad "us-east-1a"
resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.myd_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true 

  tags = {
    Name = "Proyecto-MYD-Public-Subnet-A"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.myd_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Proyecto-MYD-Private-Subnet-A"
  }
}

# Subredes en la Zona de Disponibilidad "us-east-1b"
resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.myd_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Proyecto-MYD-Public-Subnet-B"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.myd_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Proyecto-MYD-Private-Subnet-B"
  }
}


# 1. Creamos la "puerta de salida" a internet para nuestra VPC.
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myd_vpc.id

  tags = {
    Name = "Proyecto-MYD-GW"
  }
}

# 2. Creamos una "tabla de rutas" o GPS para las subredes públicas.
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.myd_vpc.id


  route {
    cidr_block =  "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Proyecto-MYD-Public-RT"
  }
}

resource "aws_route_table_association" "public_a_assoc" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_b_assoc" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_rt.id
}