variable "region" {
 default ="error"
}

variable "vpc name" {
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

output default_vpc_id {
 value = "aws_default_vpc.default.id"
}
