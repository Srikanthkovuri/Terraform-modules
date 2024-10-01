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
  module "asgwithlb" {
  source = "../.."
  ami_info = {
    id       = "ami-0522ab6e1ddcc7055"
    username = "ubuntu"
  }
  template_details = {
    name                        = "nginx"
    instance_type               = "t2.micro"
    key_name                    = "my_pub_rsa"
    script_path                 = "installnginx.sh"
    security_group_ids          = ["sg-0f2ce0514e7ca1dfd"]
    associate_public_ip_address = true
  }
  scaling_details = {
    min_size   = 1
    max_size   = 2
    subnet_ids = ["subnet-0b1ae79b2a74e185c", "subnet-004ba1a0a0141afc9"]
  }
  lb_details = {
    type               = "application"
    internal           = false
    security_group_ids = ["sg-0f2ce0514e7ca1dfd"]
    subnet_ids         = ["subnet-0b1ae79b2a74e185c", "subnet-004ba1a0a0141afc9"]
    vpc_id             = "vpc-0f70433a662f10974"
    application_port   = 80
    port               = 80

  }
}
```

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.base](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_launch_template.base](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_lb.base](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.base](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.base](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_info"></a> [ami\_info](#input\_ami\_info) | n/a | <pre>object({<br/>      id = string<br/>      username = string<br/>    })</pre> | n/a | yes |
| <a name="input_lb_details"></a> [lb\_details](#input\_lb\_details) | n/a | <pre>object({<br/>    type = string<br/>    internal = bool<br/>    security_group_ids = list(string)<br/>    subnet_ids = list(string)<br/>    vpc_id = string<br/>    application_port = number<br/>    port = number<br/><br/>  })</pre> | n/a | yes |
| <a name="input_scaling_details"></a> [scaling\_details](#input\_scaling\_details) | n/a | <pre>object({<br/>    min_size = number<br/>    max_size = number<br/>    subnet_ids = list(string)<br/>  })</pre> | n/a | yes |
| <a name="input_template_details"></a> [template\_details](#input\_template\_details) | n/a | <pre>object({<br/>      name = string<br/>      instance_type = string<br/>      key_name = string<br/>      script_path = string<br/>      security_group_ids = list(string)<br/>      associate_public_ip_address = bool<br/><br/>    })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_launch_template_name"></a> [launch\_template\_name](#output\_launch\_template\_name) | n/a |
<!-- END_TF_DOCS -->