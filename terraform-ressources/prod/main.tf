provider "aws" {
  region = var.AWS_REGION
}

module "ec2_prod" {
  count        = 2
  source       = "../modules/ec2module"
  instancetype = var.instancetype
  env_tag      = var.server_prod[count.index]
  sg_name      = var.sg_prod[count.index]
  host          = var.host_prod[count.index]

}

terraform {
  backend "s3" {
    bucket = "terraform-backend-abdoul"
    key    = "./env_prod.tfstate"
    region = "us-east-1"

  }
}