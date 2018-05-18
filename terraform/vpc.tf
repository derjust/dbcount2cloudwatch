resource "aws_vpc" "default" {
  cidr_block       = "10.0.0.0/16"
  enable_dns_hostnames = true

  instance_tenancy = "dedicated"

  tags {
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id            = "${aws_vpc.default.id}"
  availability_zone = "${var.zone_1}"
  cidr_block        = "${cidrsubnet(aws_vpc.default.cidr_block, 4, 1)}"
}

resource "aws_subnet" "subnet2" {
  vpc_id            = "${aws_vpc.default.id}"
  availability_zone = "${var.zone_2}"
  cidr_block        = "${cidrsubnet(aws_vpc.default.cidr_block, 4, 2)}"
}

