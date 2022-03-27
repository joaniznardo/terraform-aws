# mysql - rds
resource "aws_db_instance" "nextcloud_mysql_instance" {
  allocated_storage      = 20
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.nextcloud_db_sg.id]
  #db_subnet_group_name = var.subnet_group
  db_subnet_group_name = aws_db_subnet_group.nextcloud_db_subnet_grp.id

  engine         = "mysql"
  instance_class = "db.t2.micro"
  db_name        = var.db_name
  username       = var.db_user
  password       = var.db_pass
}

# Security group for private subnet
resource "aws_security_group" "nextcloud_db_sg" {
  name        = "nextcloud db sg"
  description = "Allow traffic from Nextcloud app"

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    #cidr_blocks = [var.public_subnet_cidr]
    cidr_blocks = [var.nextcloud_cidr]
  }

  #vpc_id = var.vpc_id
  vpc_id = aws_vpc.nextcloud_vpc.id


  tags = {
    Name = "Nextcloud database security group"
  }
}
