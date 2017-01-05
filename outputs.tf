output "instance_id" {
  value = "${aws_instance.ec2_instance.id}"
}

output "instance_availability_zone" {
  value = "${aws_instance.ec2_instance.availability_zone}"
}
