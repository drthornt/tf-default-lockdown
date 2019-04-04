variable "region" {
 default ="error"
}

variable "vpc_name" {
    default = "Default VPC"
}

provider "aws" {
  alias  = "${var.region}"
  region = "${var.region}"
}

resource "aws_default_vpc" "default" {
  provider = "aws.${var.region}"
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_security_group" "default_sg" {
  provider = "aws.${var.region}"
  vpc_id = "${aws_default_vpc.default.id}"
}

output default_vpc_id {
 value = "aws_default_vpc.default.id"
}
