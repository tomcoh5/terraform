resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  provisioner "local-exec" { # running command on localhost
    command = "echo ${aws_instance.example.private_ip} >> private_ips.txt"
  }
}

output "ip" { #output the ip 
  value = aws_instance.example.public_ip
}

