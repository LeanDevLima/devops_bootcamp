# Bloco para exibir o IP público da instância após a criação
output "instance_public_ip" {
    description = "EC2 instance public IP"
    value       = aws_instance.web_server.public_ip
}

output "website_url" {
    description = "Provisioned website URL"
    value       = "http://${aws_instance.web_server.public_ip}"
}

# Define as saídas que serão exibidas após a criação da infraestrutura.