resource "aws_security_group" "allow everything"{
    name = "allow everything"
    description = "allow the port everyhting from port 22"

    ingress {
    description = "allow everything from port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_everything"
  }

resource "aws_instance" "terraform" {

    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_everything.id]

    tags = {
        Name = "terraform"
    }
}

}