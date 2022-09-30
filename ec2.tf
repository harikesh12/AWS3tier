resource "aws_instance" "web" {
  ami                         = "ami-026b57f3c383c2eec" # us-west-2
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.keyPair.key_name
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  subnet_id                   = aws_subnet.publicSubnet[count.index].id
  associate_public_ip_address = true
  count                       = 2

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip

    tags = {
      "Name" = "WebServer"
    }

  }
}

resource "aws_instance" "DBInstance" {
  ami                    = "ami-026b57f3c383c2eec"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.keyPair.key_name
  subnet_id              = aws_subnet.privateSubnet.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip

    tags = {
      "Name" = "DBerver"
    }


  }
}