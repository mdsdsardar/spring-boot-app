provider "aws" {
  region = "ap-south-1"
}

resource "aws_lightsail_instance" "my_instance" {
  name              = "saad-lightsail-instance"
  availability_zone = "ap-south-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "micro_3_1"

  user_data = file("${path.module}/launch-script.sh")

  tags = {
    Name = "MyLightsailInstance"
  }
