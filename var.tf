################
# S3 datastore #
################

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to use as datastore"
  default     = "joaniznardo-terraform-050"
}

variable "force_destroy" {
  description = "Destroy all objects so that the bucket can be destroyed without error. These objects are not recoverable"
  default     = true
}

variable "s3_access_key" {
  description = "s3 access key no informada, doncs no s'informa quan accedim a s3 via rol an l'aplicació: Instance_Role"
  default     = ""
}

variable "s3_secret_key" {
  description = "s3 secret key no informada, doncs no s'informa quan accedim a s3 via rol an l'aplicació: Instance_Role"
  default     = ""
}


#################
# RDS datastore #
#################

variable "db_name" {
  description = "Database name"
  default     = "nextcloud_db"
}

variable "db_user" {
  description = "Database user"
  default     = "sqlgenius"
}

variable "db_pass" {
  description = "Database password"
  default     = "Abs0lutamenyytIns3gura!"
}

#############
# Instances #
#############

variable "instance_type" {
  description = "type of nextcloud instance"
  default     = "t2.micro"
}

variable "aws_region" {
  description = "Region where to deploy the Nextcloud application and the database"
  default     = "us-east-1"
}

variable "nextcloud_instance_type" {
  description = "Instance type for the Nextcloud application"
  default     = "t2.micro"
}

variable "nextcloud_key_name" {
  description = "SSH key name to associate to the Nextcloud app instance"
  #default = null
  default = "nextcloud"
}

variable "nextcloud_key_path" {
  description = "SSH key name to associate to the Nextcloud app instance"
  default     = "./nextcloud.pub"
}

variable "admin_user" {
  description = "Nextcloud admin user"
  default     = "admin_next"
}

variable "admin_pass" {
  description = "Nextcloud admin pass"
  default     = "MesIns3gura3ncara!"
}

variable "data_dir" {
  description = "Data folder for Nextcloud"
  default     = "/var/www/nextcloud/data"
}

###########
# Network #
###########

variable "vpc_cidr" {
  description = "CIDR of the VPC"
  default     = "10.0.0.0/16"
}

variable "nextcloud_cidr" {
  description = "CIDR of the public subnet"
  default     = "10.0.1.0/24"
}

variable "db_cidr" {
  description = "CIDR of the private subnet"
  default     = "10.0.2.0/24"
}



