resource "aws_key_pair" "keyPair" {
  key_name   = "Key-pair"
  public_key = file("${path.module}/id_rsa.pub")
}