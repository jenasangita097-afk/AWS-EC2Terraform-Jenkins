output "ubuntu_public_dns" {
  value = aws_instance.ubuntu_servers[*].public_dns
}

output "amazon_public_dns" {
  value = aws_instance.amazon_servers[*].public_dns
}

output "ubuntu_public_ips" {
  value = aws_instance.ubuntu_servers[*].public_ip
}

output "amazon_public_ips" {
  value = aws_instance.amazon_servers[*].public_ip
}
