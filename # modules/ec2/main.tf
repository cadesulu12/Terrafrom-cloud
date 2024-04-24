# modules/ec2/main.tf

variable "vpc_id" {}
variable "subnet_ids" {}
variable "instance_count" {}

resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = "ami-0c55b159cbfafe1f0"  
  instance_type = "t2.micro"  
  subnet_id     = var.subnet_ids[0]  
  key_name      = "ACME-keypair-name"  
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name  

  tags = {
    Name = "acme-instance-${count.index}"
  }
}
