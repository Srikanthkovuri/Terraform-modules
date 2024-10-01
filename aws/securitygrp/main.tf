
resource "aws_security_group" "sg-Ntier" {
  name        = var.security_group_info.name
  description = var.security_group_info.description
  vpc_id      = var.vpc_id
  tags = {
    Name = var.security_group_info.name
  }
}

# ingress/inbound rules

resource "aws_vpc_security_group_ingress_rule" "sg-Ntier" {
  count             = length(var.security_group_info.inbound_rules)
  security_group_id = aws_security_group.sg-Ntier.id
  ip_protocol       = var.security_group_info.inbound_rules[count.index].protocol
  cidr_ipv4         = var.security_group_info.inbound_rules[count.index].source
  from_port         = var.security_group_info.inbound_rules[count.index].port
  to_port           = var.security_group_info.inbound_rules[count.index].port
  description       = var.security_group_info.inbound_rules[count.index].description
  depends_on        = [aws_security_group.sg-Ntier]
}


resource "aws_vpc_security_group_egress_rule" "sg-Ntier" {
  security_group_id = aws_security_group.sg-Ntier.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
  depends_on        = [aws_security_group.sg-Ntier]
}