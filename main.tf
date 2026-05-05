provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modulos/vpc"
  cidr_block = "10.0.0.0/16"
  vpc_name = "vpc-franefun"
  subnet_publica_cidr = "10.0.1.0/24"
  subnet_privada_cidr = "10.0.2.0/24"

}


module "ec2" {
  source = "./modulos/ec2"
  ami_id = "ami-0eb38b817b93460ac"
  instance_type = "t2.micro"
  subnet_id = module.vpc.subnet_publica_id
}


output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_id" {
  value = module.ec2.ec2_id
}


