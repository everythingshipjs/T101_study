resource "aws_vpc" "this" {
  cidr_block           = "10.${var.cidr_numeral}.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.vpc_name}-vpc"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "igw-${var.vpc_name}"
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.${var.cidr_numeral}.${var.cidr_numeral_public[count.index]}.0/24"
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name    = "public${count.index}-${var.vpc_name}"
    Network = "Public"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}
