provider "aws" {
  region = "us-gov-west-1"
}

variable "aws_region"                 { default = "us-gov-west-1" }
variable "ec2_instance_ami"           { }
variable "ec2_availability_zone"      { }
variable "ec2_instance_type"          { }
variable "ec2_key_name"               { }
variable "ec2_security_groups"        { }
variable "ec2_subnet_id"              { }
variable "ec2_source_dest_check"      { default = true }
variable "ec2_termination_protection" { default = true }

resource "aws_instance" "ec2_instance" {
  ami                     = "${var.ec2_instance_ami}"
  availability_zone       = "${var.ec2_availability_zone}"
  instance_type           = "${var.ec2_instance_type}"
  key_name                = "${var.ec2_key_name}"
  vpc_security_group_ids  = ["${var.ec2_security_groups}"]
  subnet_id               = "${var.ec2_subnet_id}"
  source_dest_check       = "${var.ec2_source_dest_check}"
  disable_api_termination = "${var.ec2_termination_protection}"
}
output "instance_id" {
  value = "${aws_instance.ec2_instance.id}"
}
output "instance_availability_zone" {
  value = "${var.ec2_availability_zone}"
}
