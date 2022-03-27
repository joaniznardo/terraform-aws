# RDS
output "db_endpoint" {
  value = aws_db_instance.nextcloud_mysql_instance.endpoint
}

output "db_name" {
  value = aws_db_instance.nextcloud_mysql_instance.name
}

output "public_ip" {
  value = aws_eip.ip.public_ip
}

output "public_dns" {
  value = aws_eip.ip.public_dns
}
