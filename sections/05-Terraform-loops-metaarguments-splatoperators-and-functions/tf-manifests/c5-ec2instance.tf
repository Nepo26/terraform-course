resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux3.id
  user_data = file("${path.module}/app1-install.sh")

  # instance_type = var.instance_type_list[0]
  instance_type = var.instance_type_map.dev
  key_name      = var.instance_key_pair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  # for_each = toset(data.aws_availability_zones.my_azones.names)

  for_each = toset(local.azs_t3_micro)


  availability_zone = each.key
  tags = {
    "Name" = "for_each-Demo-${each.key}"
  }
}