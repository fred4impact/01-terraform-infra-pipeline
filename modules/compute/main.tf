# Data source for latest Ubuntu AMI
data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

# Data source for availability zones
data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_instance" "name" {
  ami                    = data.aws_ami.ubuntu_ami.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  user_data              = file("${path.module}/software.sh")
  availability_zone      = data.aws_availability_zones.azs.names[0]
  key_name               = var.key_pair_name

  tags = {
    Name = var.instance_name
  }
}
