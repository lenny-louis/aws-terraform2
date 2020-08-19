resource "aws_security_group" "reseau_interne" {
   name = "reseau_interne"
   vpc_id = aws_vpc.vpc_example.id
   # en entrée
   # autorise communication avec mariadb
   ingress { 
     from_port = "0"
     to_port   = "65535"
     protocol  = "all"
     cidr_blocks = [ "192.168.77.20/0" ]
   }

   # wordpress
   ingress {
     from_port = "0"
     to_port   = "65535"
     protocol  = "all"
     cidr_blocks = [ "192.168.77.10/0" ]
   }


  # autorise ssh de partout
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # autorise http de partout
  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # autorise icmp (ping)
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "serveur-wordpress" {
  # Ubuntu 18.04 fournie par AWS
  ami                         = "ami-0bcc094591f354be2"
  instance_type               = "t2.micro"
  key_name                    = "tfkeypair1"
  vpc_security_group_ids      = [aws_security_group.sg_serveur-wordpress.id]
  subnet_id                   = aws_subnet.subnet_example.id
  private_ip                  = "192.168.77.10"
  associate_public_ip_address = "true"
  user_data                   = file("../Scripts/instance_init_wordpress.sh")
  tags = {
    Name = "serveur-wordpress"
  }
}

output "serveur-wordpress_ip" {
  value = "${aws_instance.serveur-wordpress.*.public_ip}"
}


resource "aws_instance" "serveur-mariadb" {
  # Ubuntu 18.04 fournie par AWS
  ami                         = "ami-0bcc094591f354be2"
  instance_type               = "t2.micro"
  key_name                    = "tfkeypair1"
  vpc_security_group_ids      = [aws_security_group.sg_serveur-mariadb.id]
  subnet_id                   = aws_subnet.subnet_example.id
  private_ip                  = "192.168.77.20"
  associate_public_ip_address = "true"
  user_data                   = file("../Scripts/instance_init_mariadb.sh")
  tags = {
    Name = "serveur-mariadb"
  }
}

output "serveur-mariadb_ip" {
  value = "${aws_instance.serveur-mariadb.*.public_ip}"
}

