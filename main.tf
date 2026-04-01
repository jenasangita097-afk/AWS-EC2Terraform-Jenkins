provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ubuntu_servers" {
  count         = 2
  ami           = "ami-0dee22c13ea7a9a67"   
  instance_type = "t3.micro"

  tags = {
    Name = "ctc-${count.index + 1}"
  }
}

resource "aws_instance" "amazon_servers" {
  count         = 2
  ami           = "ami-0f58b397bc5c1f2e8"   # Amazon Linux (Mumbai)
  instance_type = "t3.micro"

  tags = {
    Name = "bbsr-${count.index + 1}"
  }
}
