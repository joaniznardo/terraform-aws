################
# S3 datastore #
################

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to use as datastore"
}

variable "force_destroy" {
  description = "Destroy all objects so that the bucket can be destroyed without error. These objects are not recoverable"
}

variable "s3_access_key" {
  description = "s3 access key no informada, doncs no s'informa quan accedim a s3 via rol an l'aplicació: Instance_Role"
}

variable "s3_secret_key" {
  description = "s3 secret key no informada, doncs no s'informa quan accedim a s3 via rol an l'aplicació: Instance_Role"
}


#################
# RDS datastore #
#################

variable "db_name" {
  description = "Database name"
}

variable "db_user" {
  description = "Database user"
}

variable "db_pass" {
  description = "Database password"
}

#############
# Instances #
#############

variable "instance_type" {
  description = "type of nextcloud instance"
}

variable "aws_region" {
  description = "Region where to deploy the Nextcloud application and the database"
}

variable "nextcloud_instance_type" {
  description = "Instance type for the Nextcloud application"
}

variable "nextcloud_key_name" {
  description = "SSH key name to associate to the Nextcloud app instance"
}

variable "nextcloud_key_path" {
  description = "SSH key name to associate to the Nextcloud app instance"
}

variable "admin_user" {
  description = "Nextcloud admin user"
}

variable "admin_pass" {
  description = "Nextcloud admin pass"
}

variable "data_dir" {
  description = "Data folder for Nextcloud"
}

###########
# Network #
###########

variable "vpc_cidr" {
  description = "CIDR of the VPC"
}

variable "nextcloud_cidr" {
  description = "CIDR of the public subnet"
}

variable "db_cidr" {
  description = "CIDR of the private subnet"
}



