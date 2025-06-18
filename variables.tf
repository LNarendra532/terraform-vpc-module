variable "project" {
  type = string

}

variable "environment" {
  type = string

}
variable "cidr_block" {
  default = "10.0.0.0/16"

}

variable "public_subnet_cidrs" {
  type = list(any)

}
variable "private_subnet_cidrs" {
  type = list(any)

}
variable "database_subnet_cidrs" {
  type = list(any)

}
variable "aws_nat_gateway_tags" {
  type    = map(string)
  default = {}
}


variable "public_subnet_tags" {
  type    = map(string)
  default = {}
}


variable "private_subnet_tags" { #optional
  type    = map(string)
  default = {}
}


variable "database_subnet_tags" { #optional
  type    = map(string)
  default = {}
}

variable "public_route_table_tags" { #optional
  type    = map(string)
  default = {}
}
variable "private_route_table_tags" { #optional
  type    = map(string)
  default = {}
}
variable "databse_route_table_tags" { #optional
  type    = map(string)
  default = {}
}

variable "nat_gatway_tags" {
  type = map(string)
  default = {

  }

}


variable "is_peering_required" {

  default = false

}

variable "vpc_peering_tags" {
  type    = map(string)
  default = {}

}


