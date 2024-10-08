provider "aws" {
region = var.region
assume_role {
   role_arn     = "arn:aws:iam::${var.account_id}:role/EngineeringAccountAccessRole"
   session_name = "${var.application}-Deploy"
}
default_tags {
   tags = {
     Project             = "CDP-Fundamentals"
     CostCenter          = "008"
     "map-migrated"      = "mig5TZY31HX9S"
     "team"              = "CDP"
     "CostCenter"        = "008"
     "ApplicationName"   = "CDP-Fundamentals-dev"
     "Criticality"       = "Medium"
     "BusinessUnitOwner" = "Michael Joel De Groot"
     "PO"                = "PR183181"
   }
}
}
module "s3_bucket" {
  source = "./modules/s3_bucket"
  bucket_name = var.bucket_name
}

module "rds_postgres" {
  source            = "./modules/rds_postgres"
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  db_instance_class = var.db_instance_class
}

module "ec2_instance" {
  source          = "./modules/ec2_instance"
  instance_type   = var.instance_type
  key_name        = var.key_name
  db_password     = var.db_password
  s3_bucket_name  = module.s3_bucket.bucket_name
  db_endpoint     = module.rds_postgres.db_endpoint
}
