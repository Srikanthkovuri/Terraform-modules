<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Examples
```terraform
  module "vpc" {
  source = "../.."
  vpc_config = {
    cidr_block           = "192.168.0.0/16"
    enable_dns_hostnames = true
    tags = {
      Name    = "simple-vpc"
      Purpose = "example"
    }
  }
  public_subnet_config = [{
    cidr_block = "192.168.0.0/24"
    az         = "ap-south-1a"
    tags = {
      Name = "public"
    }
  }]
  private_subnet_config = [{
    cidr_block = "192.168.1.0/24"
    az         = "ap-south-1a"
    tags = {
      Name = "private"
    }
    }

  ]
}
```
  

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.Ntier-igw](https://github.com/Srikanthkovuri/Terraform-modules/blob/main/aws/vpc/main.tf) | resource |
| [aws_route.internet](https://github.com/Srikanthkovuri/Terraform-modules/blob/main/aws/vpc/main.tf) | resource |
| [aws_route_table.private](https://github.com/Srikanthkovuri/Terraform-modules/blob/main/aws/vpc/main.tf) | resource |
| [aws_route_table.public](https://github.com/Srikanthkovuri/Terraform-modules/blob/main/aws/vpc/main.tf) | resource |
| [aws_route_table_association.private](https://github.com/Srikanthkovuri/Terraform-modules/blob/main/aws/vpc/main.tf) | resource |
| [aws_route_table_association.public](https://github.com/Srikanthkovuri/Terraform-modules/blob/main/aws/vpc/main.tf) | resource |
| [aws_subnet.private](https://github.com/Srikanthkovuri/Terraform-modules/blob/main/aws/vpc/main.tf) | resource |
| [aws_subnet.public](https://github.com/Srikanthkovuri/Terraform-modules/blob/main/aws/vpc/main.tf) | resource |
| [aws_vpc.Ntier](https://github.com/Srikanthkovuri/Terraform-modules/blob/main/aws/vpc/main.tf) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_subnet_config"></a> [private\_subnet\_config](#input\_private\_subnet\_config) | priate\_subnets\_configuration | <pre>list(object({<br/>    cidr_block       = string<br/>    available_region = string<br/>    tags             = map(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_public_subnet_config"></a> [public\_subnet\_config](#input\_public\_subnet\_config) | public\_subnets\_configuration | <pre>list(object({<br/>    cidr_block       = string<br/>    available_region = string<br/>    tags             = map(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | Vpc\_information | <pre>object({<br/>    cidr_block = string<br/>    tags       = map(string)<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_private_route_table_id"></a> [private\_route\_table\_id](#output\_private\_route\_table\_id) | n/a |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | n/a |
| <a name="output_public_route_table_id"></a> [public\_route\_table\_id](#output\_public\_route\_table\_id) | n/a |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | n/a |
<!-- END_TF_DOCS -->