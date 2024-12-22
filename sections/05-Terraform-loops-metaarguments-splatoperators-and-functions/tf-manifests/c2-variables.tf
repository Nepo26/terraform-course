variable "aws_region" {
  description = "Region in which all resources will be deployed."
  type = string
  default = "us-east-1"
}


variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t3.micro"
}

variable "instance_key_pair" {
  description = "Instance Key pair to use for EC2 Instances"
  type = string
  default = "terraform-key1"
}

variable "instance_type_list" {
  description = "EC2 Instance type"
  type = list(string)
  default = [ "t3.micro" , "t3.small"]
}

variable "instance_type_map" {
  description = "EC2 Instance Type"
  type = map(string)
  default = {
    "dev" = "t3.micro",
    "qa" = "t3.small",
    "prod" = "t3.large"
  }
}
