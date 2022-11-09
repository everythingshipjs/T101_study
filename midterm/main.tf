module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["one", "two", "three"])

  name = "instance-${each.key}"

  ami                    = "ami-0e9bfdb247cc8de84"
  instance_type          = "t2.micro"
  key_name               = "rimankorea"
  monitoring             = true
  vpc_security_group_ids = ["sg-0d6f1de841e545d94"]
  subnet_id              = "subnet-09db5d01780430dc6"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
