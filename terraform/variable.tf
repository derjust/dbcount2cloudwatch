variable "access_key" {
	type = "string"
}

variable "secret_key" {
	type = "string"
}

variable "db_username" {
	type = "string"
	default = "sa"
}

resource "random_string" "db_password" {
  length = 16
  special = false
}

variable "region" {
	type = "string"
	default = "us-east-1"
}

variable "zone_1" {
	type = "string"
	default = "us-east-1f"
}

variable "zone_2" {
	type = "string"
	default = "us-east-1e"
}

