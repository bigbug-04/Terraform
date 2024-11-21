provider "aws" {
region = "ap-south-1"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-03753afda9b8ba740"
instance_type = "t2.medium"
key_name = "my-key-pair"
vpc_security_group_ids = ["sg-09c40f4b27cd5dbf9"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["Dev", "Test", "Monitoring", "Ansible"]
}
