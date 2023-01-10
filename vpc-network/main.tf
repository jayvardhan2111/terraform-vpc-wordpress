
resource "aws_vpc" "myVpc" {

  cidr_block           = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = {
    "Name" = var.vpc_name
  }

}


# Internet Gateway Setup 

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myVpc.id

  tags = {
    Name = var.igw_tag
  }
}


################################################################################
# Application subnet or PUBLIC SUBNET
################################################################################


resource "aws_subnet" "public_subnet_1" {

  vpc_id                  = aws_vpc.myVpc.id
  cidr_block              = var.public_subnets_cidr_1
  availability_zone       = data.aws_availability_zones.available_1.names[0]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = vpc.public_subnet_tag_1
  }
}
resource "aws_subnet" "public_subnet_2" {

  vpc_id                  = aws_vpc.myVpc.id
  cidr_block              = var.public_subnets_cidr_2
  availability_zone       = data.aws_availability_zones.available_1.names[1]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.public_subnet_tag_2
  }
}


################################################################################
# Database subnet or PRIVATE SUBNET
################################################################################

resource "aws_subnet" "database_subnet_1" {
  vpc_id                          = aws_vpc.myVPC.id
  cidr_block                      = var.database_subnets_cidr_1
  availability_zone               = data.aws_availability_zones.available_1.names[0]
  map_public_ip_on_launch         = false

  tags = {
    Name = var.database_subnet_tag_1
  }
}
resource "aws_subnet" "database_subnet_2" {
  vpc_id                          = aws_vpc.myVPC.id
  cidr_block                      = var.database_subnets_cidr_2
  availability_zone               = data.aws_availability_zones.available_1.names[1]
  map_public_ip_on_launch         = false

  tags = {
    Name = var.database_subnet_tag_2
  }
}