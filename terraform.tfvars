################
# S3 datastore #
################
 "s3_bucket_name" = "joaniznardo-terraform-050"
 "force_destroy" = true
 "s3_access_key" = "" 
 "s3_secret_key" = ""
#################
# RDS datastore #
#################
 "db_name" = "nextcloud_db"
 "db_user" = "sqlgenius"
 "db_pass" = "Abs0lutamenyytIns3gura!"
#############
# Instances #
#############
 "instance_type" = "t2.micro"
 "aws_region" = "us-east-1"
 "nextcloud_instance_type" = "t2.micro"
 "nextcloud_key_name" = "nextcloud"
 "nextcloud_key_path" = "./nextcloud.pub"
 "admin_user" = "admin_next"
 "admin_pass" = "MesIns3gura3ncara!"
 "data_dir" = "/var/www/nextcloud/data"
###########
# Network #
###########
 "vpc_cidr" = "10.0.0.0/16"
 "nextcloud_cidr" = "10.0.1.0/24"
 "db_cidr" = "10.0.2.0/24"
