variable "region" {
  description = "AWS Region"
}

variable "bucket_name" {
  description = "S3 Bucket Name"
}

variable "db_name" {
  description = "PostgreSQL Database Name"
}

variable "db_username" {
  description = "PostgreSQL Database Username"
}

variable "db_password" {
  description = "PostgreSQL Database Password"
}

variable "db_instance_class" {
  description = "RDS DB Instance Class"
}

variable "instance_type" {
  description = "EC2 Instance Type"
}

variable "key_name" {
  description = "Key Pair Name for SSH access"
}
variable "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  type        = string
}

variable "ssh_key_path" {
  description = "Path to the SSH private key"
  type        = string
}

variable "local_script_path" {
  description = "Path to the Python script on the local machine"
  type        = string
}

variable "script_name" {
  description = "Name of the Python script to run on EC2"
  type        = string
}

variable "account_id" {
  description = "The AWS account ID where the role resides"
  type        = string
}

variable "application" {
  description = "The name of the application for the session"
  type        = string
}