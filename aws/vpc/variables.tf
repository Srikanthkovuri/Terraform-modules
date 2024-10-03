variable "vpc_config" {
  type = object({
    cidr_block = string
    tags       = map(string)
  })
  description = "Vpc_information"
}
variable "public_subnet_config" {
  type = list(object({
    cidr_block       = list(string)
    available_region = list(string)
    tags             = map(string)
  }))
  description = "public_subnets_configuration"
}
variable "private_subnet_config" {
  type = list(object({
    cidr_block       = list(string)
    available_region = list(string)
    tags             = map(string)
  }))
  description = "priate_subnets_configuration"
}