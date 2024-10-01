variable "vpc_id" {
  description = "vpc id"
  type = string
}
variable "security_group_info" {
    type = object({
      name = string
      inbound_rules = list(object({
        ip_protocol = string
        cidr_ipv4 = string
        from_port = string
        to_port = string
        description = string
      }))

    })
  
}