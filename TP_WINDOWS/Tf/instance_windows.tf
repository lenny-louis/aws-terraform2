resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file("../Scripts/Instance_init_windows.sh")
}
 
 
resource "aws_instance" "win-example" {
  ami           = var.AMIS[var.region]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  user_data = data.template_file.userdata_win.rendered
  vpc_security_group_ids=["${aws_security_group.allow-all.id}"]
 
  tags = {
    Name = "Windows_Server"
  }
 
}
 
output "ip" {
 
value="${aws_instance.win-example.public_ip}"
 
}
