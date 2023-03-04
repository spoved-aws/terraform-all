module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["one", "two", "three"])

  name = "instance-${each.key}"

  ami                    = "ami-0ccdcd39fd69d0352"
  instance_type          = "t2.micro"
  #key_name               = "user1"
  #monitoring             = true
  #vpc_security_group_ids = ["sg-12345678"]
  #subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev---kanu"
    Owner = "kanu-owners"

  }
}


module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "web-server-newww"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = "vpc-046a1db2487881c2a"

  ingress_cidr_blocks = ["10.10.0.0/16"]
}


