# Terraform EC2-Instance

It's a module to create a single EC2 instance.  Not wildly useful but but might save you some time, or not.  Who knows in this crazy world.

# Usage

Throw a little somethin' like this together...

`module "ec2-instance" {
  source                = "github.com/dotspec/terraform-ec2-instance"
  aws_region            = "us-west-2"
  ec2_instance_ami      = "ami-6fed560e" #CoreOS Stable cause why not
  ec2_availability_zone = "us-west-2a"
  ec2_key_name          = "Your-EC2-Key"
  ec2_security_groups   = [ "sg-coolgroup1", "sg-coolgroup2" ]
  ec2_subnet_id         = "subnet-coolsubnet"
  ec2_instance_type     = "t2.micro"
}`

run a *terraform plan* and you're on your way to Instance-town.
