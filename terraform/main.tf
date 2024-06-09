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
}

resource "aws_lightsail_instance_public_ports" "my_instance_ports" {
  instance_name = aws_lightsail_instance.my_instance.name

  port_info {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidrs       = ["0.0.0.0/0"]
  }

  depends_on = [aws_lightsail_instance.my_instance]
}


output "instance_public_ip" {	
  value = resource.aws_lightsail_instance.my_instance.public_ip_address	
}
