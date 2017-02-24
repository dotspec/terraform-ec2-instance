variable "aws_region" { type = "string" }
variable "access_key" { type = "string" }
variable "secret_key" { type = "string" }
variable "ec2_instance_ami" { type = "string" }
variable "ec2_availability_zone" { type = "string" }
variable "ec2_instance_type" { type = "string" }
variable "ec2_key_name" { type = "string" }
variable "ec2_security_groups" { type = "list" }
variable "ec2_subnet_id" { type = "string" }
variable "ec2_source_dest_check" { default = true }
variable "ec2_termination_protection" { default = true }
variable "ec2_user_data" { type = "string" }

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "ec2_instance" {
  ami                     = "${var.ec2_instance_ami}"
  availability_zone       = "${var.ec2_availability_zone}"
  instance_type           = "${var.ec2_instance_type}"
  key_name                = "${var.ec2_key_name}"
  vpc_security_group_ids  = ["${var.ec2_security_groups}"]
  subnet_id               = "${var.ec2_subnet_id}"
  source_dest_check       = "${var.ec2_source_dest_check}"
  disable_api_termination = "${var.ec2_termination_protection}"
  user-data               = "${var.ec2_user_data}"
}
