# outputs.tf

output "public_subnet_id" {
  value = module.public_subnet.this_subnet_id
}

output "private_subnet_id" {
  value = module.private_subnet.this_subnet_id
}

