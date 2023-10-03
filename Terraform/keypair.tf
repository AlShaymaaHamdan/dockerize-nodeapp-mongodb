
// To Generate Private Key
resource "tls_private_key" "tfproject" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


// Create Key Pair for Connecting EC2 via SSH
resource "aws_key_pair" "tfproject" {
  key_name   = "tfproject"
  public_key = tls_private_key.tfproject.public_key_openssh
}

# Save PEM file locally
resource "local_file" "tfproject" {
  content  = tls_private_key.tfproject.private_key_pem
  filename = "tfproject.pem"
}