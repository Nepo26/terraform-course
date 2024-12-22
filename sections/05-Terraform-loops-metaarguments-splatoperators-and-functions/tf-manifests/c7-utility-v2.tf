data "aws_ec2_instance_type_offerings" "my_inst_type2" {
  for_each = toset(["us-east-1a", "us-east-1b", "us-east-1e"])
  filter {
    name = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name = "location"
    values = [each.key]
    # values = ["us-east-1e"]
  }

  location_type = "availability-zone"
}

output "output_v2_1" {
  value = [ for type in data.aws_ec2_instance_type_offerings.my_inst_type2: type.instance_types ]
}

output "output_v2_2" {
  value = { for az, details in data.aws_ec2_instance_type_offerings.my_inst_type2: az => details.instance_types }
}
