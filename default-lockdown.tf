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

resources "aws_default_security_group" "default_sg" {
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output default_vpc_id {
 value = "aws_default_vpc.default.id"
}
