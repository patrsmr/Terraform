# main.tf

# Import the necessary modules
module "subnets_cidr" {
  source = "hashicorp/subnets/cidr"
  version = "0.25.0"

  vpc_cidr_block = var.vpc_cidr_block
  availability_zones = var.availability_zones
}

module "public_subnet" {
  source = "terraform-aws-modules/subnet/aws"
  version = "0.25.0"

  vpc_id     = aws_vpc.main.id
  cidr_block = module.subnets_cidr.public_subnet_cidr_blocks[0]
  availability_zone = var.availability_zones[0] # Choose an AZ dynamically

  tags = {
    Name = module.label.id
  }
}

module "private_subnet" {
  source = "terraform-aws-modules/subnet/aws"
  version = "0.25.0"

  vpc_id     = aws_vpc.main.id
  cidr_block = module.subnets_cidr.private_subnet_cidr_blocks[0]
  availability_zone = var.availability_zones[0] # Choose an AZ dynamically

  tags = {
    Name = module.label.id
  }
}

# Output the subnet IDs for reference
output "public_subnet_id" {
  value = module.public_subnet.this_subnet_id
}

output "private_subnet_id" {
  value = module.private_subnet.this_subnet_id
}

