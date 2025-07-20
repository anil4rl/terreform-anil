resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow SSH and HTTP access"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with your IP for security
  } 
  egress {
    from_port   = 0 # from 0 t0 means all ports
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
        Name = "ec2_sg"
        createdby = "anilkumar"
    }
}

resource "aws_instance" "MyEC2" {
    count = length(var.instance_names)  # Create multiple instances based on the list
    ami           = var.image_id  # Amazon Linux 2 AMI for us-east-1
    instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t3.micro"      # Free-tier eligible
    key_name      = var.key_name                # Change to your actual key pair name

    vpc_security_group_ids = [aws_security_group.ec2_sg.id]

    tags = {
    Name = var.instance_names[count.index]  # Use the instance name from the list
    createdby = "anilkumar"
    }   
}