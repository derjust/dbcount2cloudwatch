resource "aws_db_subnet_group" "default" {
  subnet_ids = ["${aws_subnet.subnet1.id}", "${aws_subnet.subnet2.id}"]

  tags {
  }
}

resource "aws_db_instance" "testdb" {
  allocated_storage    = 10
  storage_type         = "standard"
  engine               = "mysql"
  engine_version       = "5.7"
  apply_immediately    = true
  auto_minor_version_upgrade = true
  iam_database_authentication_enabled = true
  db_subnet_group_name = "${aws_db_subnet_group.default.id}"
  instance_class       = "db.t2.micro"
  name                 = "testdb"
  username             = "${var.db_username}"
  password             = "${random_string.db_password.result}"
  parameter_group_name = "default.mysql5.7"
}

