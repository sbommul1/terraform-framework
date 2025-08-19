resource "aws_vpc" "this" {
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true 
    tags = merge(
        {
            Name = "${var.environment}-vpc"
        },
        var.tags
    )
}

resource "aws_subnet" "public" {
    count = length(var.public_subnets)
    vpc_id = aws_vpc.this.id
    cidr_block = var.public_subnets[count.index]
    availability_zone = element(var.azs, count.index)
    map_public_ip_on_launch = true
    tags = merge(
        {
            Name = "${var.environment}-public-subnet-${count.index + 1}"
        },
        var.tags
    )
}

resource "aws_subnet" "private" {
    count = length(var.private_subnets)
    vpc_id = aws_vpc.this.id
    cidr_block = var.private_subnets[count.index]
    availability_zone = element(var.azs, count.index)
    tags = merge(
        {
            Name = "${var.environment}-private-subnet-${count.index + 1}"
        },
        var.tags
    )
}


resource "aws_internet_gateway" "this" {
    vpc_id = aws_vpc.this.id
    tags = merge(
        {
            Name = "${var.environment}-igw"
        },
        var.tags
    )
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.this.id
    tags = merge(
        {
            Name = "${var.environment}-public-rt"
        },
        var.tags
    )
}

resource "aws_route" "public_internet_access" {
    route_table_id = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public" {
    count = length(aws_subnet.public)
    subnet_id = aws_subnet.public[count.index].id
    route_table_id = aws_route_table.public.id
}
