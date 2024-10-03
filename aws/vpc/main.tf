# create vpc as Ntier_vpc
resource "aws_vpc" "Ntier" {

  cidr_block = var.vpc_config.cidr_block
  tags       = var.vpc_config.tags

}
# create public subnets
resource "aws_subnet" "public" {
  # count function determines length of the varibale
  count             = local.public_sub_count > 0 ? local.public_sub_count : 0
  cidr_block        = var.public_subnet_config[count.index].cidr_block
  availability_zone = var.public_subnet_config[count.index].available_region
  vpc_id            = aws_vpc.Ntier.id
  tags              = var.public_subnet_config[count.index].tags
  depends_on        = [aws_vpc.Ntier]

}
# create private subnets
resource "aws_subnet" "private" {
  count             = local.private_sub_count > 0 ? local.private_sub_count : 0
  cidr_block        = var.private_subnet_config[count.index].cidr_block
  availability_zone = var.private_subnet_config[count.index].available_region
  vpc_id            = aws_vpc.Ntier.id
  tags              = var.private_subnet_config[count.index].tags
  depends_on        = [aws_vpc.Ntier]

}
# create an internet gateway to access internet
resource "aws_internet_gateway" "Ntier-igw" {
  count  = local.public_sub_count > 0 ? 1 : 0
  vpc_id = aws_vpc.Ntier.id
  tags = {
    Name = "Ntier_igw"
  }
  depends_on = [aws_vpc.Ntier]

}
# create a public route-table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.Ntier.id
  tags = {
    Name = "public"
  }
  depends_on = [aws_vpc.Ntier]
}
# subnets assosciation to route-table
resource "aws_route_table_association" "public" {
  route_table_id = aws_route_table.public.id
  count          = local.public_sub_count
  subnet_id      = aws_subnet.public[count.index].id
}
# create a private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.Ntier.id
  tags = {
    Name = "private"
  }
  depends_on = [aws_vpc.Ntier]
}
# subnets assosciation to route-table private
resource "aws_route_table_association" "private" {
  route_table_id = aws_route_table.private.id
  count          = local.private_sub_count
  subnet_id      = aws_subnet.private[count.index].id

}
resource "aws_route" "internet" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.Ntier-igw[0].id
  destination_cidr_block = local.cidr_block
}