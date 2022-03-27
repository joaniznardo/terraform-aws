################
# S3 datastore #
################

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to use as datastore"
  default = "joaniznardo-terraform-050"
}

variable "force_destroy" {
  description = "Destroy all objects so that the bucket can be destroyed without error. These objects are not recoverable"
  default = true
}

