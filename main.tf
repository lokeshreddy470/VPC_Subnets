# Internet VPC
resource "aws_vpc" "terraform_vpc" {
    cidr_block = "${var.cidr_vpc}"
    instance_tenancy = "default"
    tags {
        Name = "VPC"
    }
}


# Subnets
resource "aws_subnet" "subnet1" {
    vpc_id = "${aws_vpc.terraform_vpc.id}"
    cidr_block = "${var.subnet1}"
    availability_zone = "us-east-1a"

    tags {
        Name = "subnet-1"
    }
}
resource "aws_subnet" "subnet2" {
    vpc_id = "${aws_vpc.terraform_vpc.id}"
    cidr_block = "${var.subnet2}"
    availability_zone = "us-east-1b"

    tags {
        Name = "subnet-2"
    }
}
resource "aws_subnet" "subnet3" {
    vpc_id = "${aws_vpc.terraform_vpc.id}"
    cidr_block = "${var.subnet3}"
    availability_zone = "us-east-1c"

    tags {
        Name = "subnet-3"
    }
}
resource "aws_subnet" "subnet4" {
    vpc_id = "${aws_vpc.terraform_vpc.id}"
    cidr_block = "${var.subnet4}"
    availability_zone = "us-east-1d"

    tags {
        Name = "subnet-4"
    }
}

resource "aws_internet_gateway" "terraform-igw" {
    vpc_id = "${aws_vpc.terraform_vpc.id}"

    tags {
        Name = "terraform-igw"
    }
}

# route tables
resource "aws_route_table" "public_route" {
    vpc_id = "${aws_vpc.terraform_vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.terraform_vpc-gw.id}"
    }

    tags {
        Name = "Main_route_1"
    }
}

# route associations public
#resource "aws_route_table_association" "subnet_association1" {
#    subnet_id = "${aws_subnet.subnet1.id}"
#    route_table_id = "${aws_route_table.public_route.id}"
#}
#resource "aws_route_table_association" "subnet_association2" {
#    subnet_id = "${aws_subnet.subnet2.id}"
#    route_table_id = "${aws_route_table.public_route.id}"
#}
#resource "aws_route_table_association" "subnet_association3" {
#    subnet_id = "${aws_subnet.subnet3.id}"
#    route_table_id = "${aws_route_table.public_route.id}"
#}
