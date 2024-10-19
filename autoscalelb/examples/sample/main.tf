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