output "dockerwebserver_ip" {
  value = aws_instance.dockerwebserver[0].public_ip
}