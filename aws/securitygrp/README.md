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
  module "websg" {
  source = "git::https://github.com/Srikanthkovuri/Terraform-modules.git//aws/securitygrp"
  vpc_id = module.vpc.id
  security_group_info = {
    name        = "nop"
    description = "security group for nop"
    inbound_rules = [{
      from_port   = "5000"
      ip_protocol = "tcp"
      to_port     = "5000"
      cidr_ipv4   = "0.0.0.0/0"
      description = "open tcp port"
      },
      {
        from_port   = "22"
        to_port     = "22"
        ip_protocol = "tcp"
        cidr_ipv4   = "0.0.0.0/0"
        description = "open ssh port"
      }

    ]
  }
}
```

## Resources

| Name | Type |
|------|------|
| [aws_security_group.sg-Ntier](https://github.com/Srikanthkovuri/Terraform-modules/blob/main/aws/securitygrp/main.tf) | resource |
| [aws_vpc_security_group_egress_rule.sg-Ntier](https://github.com/Srikanthkovuri/Terraform-modules/blob/main/aws/securitygrp/main.tf) | resource |
| [aws_vpc_security_group_ingress_rule.sg-Ntier](https://github.com/Srikanthkovuri/Terraform-modules/blob/main/aws/securitygrp/main.tf) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_security_group_info"></a> [security\_group\_info](#input\_security\_group\_info) | n/a | <pre>object({<br/>      name = string<br/>      description = string<br/>      inbound_rules = list(object({<br/>        ip_protocol = string<br/>        cidr_ipv4 = string<br/>        from_port = string<br/>        to_port = string<br/>        description = string<br/>      }))<br/><br/>    })</pre> | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | vpc id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->