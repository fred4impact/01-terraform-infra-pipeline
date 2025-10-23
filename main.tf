# S3 Bucket
module "s3" {
  source      = "./modules/s3"
  bucket_name = "gitaction-bilarn-bucket-001"
}


# module "network" {
#   source         = "./modules/network"
#   resource_name  = "staging"
#   environment    = "dev"
#   vpc_cidr_block = "10.0.0.0/16"
#   azs            = ["us-east-1a", "us-east-1b"]
#   vpc_name       = "bilarn-vpc"
# }

# module "compute" {
#   source        = "./modules/compute"
#   instance_type = "t2.micro"
#   instance_name = "Web Server"
#   subnet_id     = module.network.public_subnet_ids[0]
#   security_group_ids = [
#     module.ssh_security_group.security_group_id,
#     module.http_security_group.security_group_id
#   ]
#   key_pair_name = "ec2-aws-key"
# }


# # SSH Security Group
# module "ssh_security_group" {
#   source      = "./modules/security-groups"
#   name        = "ssh-sg"
#   description = "Security group for SSH access"
#   vpc_id      = module.network.vpc_id
#   from_port   = 22
#   to_port     = 22
#   protocol    = "tcp"
#   cidr_blocks = ["0.0.0.0/0"]
# }

# # HTTP Security Group
# module "http_security_group" {
#   source      = "./modules/security-groups"
#   name        = "http-sg"
#   description = "Security group for HTTP access"
#   vpc_id      = module.network.vpc_id
#   from_port   = 80
#   to_port     = 80
#   protocol    = "tcp"
#   cidr_blocks = ["0.0.0.0/0"]
# }
