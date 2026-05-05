resource "aws_instance" "mi-ec2" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  tags = {
    Name = "ec2-franefun"
  }
}
