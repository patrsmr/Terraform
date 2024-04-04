# variables.tf

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default = "192.170.0.0/20" # Default value provided, can be changed
}

variable "availability_zones" {
  description = "List of availability zones to use"
  default = ["us-east-1a", "us-east-1b", "us-east-1c"] # List of AZs, adjust as needed
}

