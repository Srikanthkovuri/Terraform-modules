# Helps in reusable 
locals {
  public_sub_count  = length(var.public_subnet_config)
  private_sub_count = length(var.private_subnet_config)
  cidr_block        = "0.0.0.0/0"
}