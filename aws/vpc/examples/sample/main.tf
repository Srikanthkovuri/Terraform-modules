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
    cidr_block = ["192.168.0.0/24"]
    availability_zone         = ["ap-south-1a"]
    tags = {
      Name = "public"
    }
  }]
  private_subnet_config = [{
    cidr_block = ["192.168.1.0/24"]
    availability_zone         = ["ap-south-1a"]
    tags = {
      Name = "private"
    }
    }

  ]


}