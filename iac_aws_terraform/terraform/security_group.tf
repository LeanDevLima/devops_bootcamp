# 1. Security Group para liberar a porta HTTP (80) para qualquer origem
resource "aws_security_group" "http_SG" {
    name        = "allow_http_SG"
    description = "Allow HTTP inbound traffic"

    ingress { # ingress = tráfego de entrada 
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_http"
    }
}

# 2. Security Group para liberar a porta 22 (SSH) para um IP específico
resource "aws_security_group" "ssh_SG" {
    name        = "allow_ssh_SG"
    description = "Allow SSH inbound traffic from a specific IP"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.my_public_ip]
    }

    tags = {
        Name = "allow_ssh"
    }
}

# 3. Security Group para liberar todo o tráfego de saída
resource "aws_security_group" "egress_all_SG" {
    name        = "allow_all_egress_SG"
    description = "Allow all outbound traffic"

    egress { # egress = tráfego de saída
        from_port   = 0
        to_port     = 0
        protocol    = "-1" # -1 significa todos os protocolos
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_all_egress"
    }
}

# Esse arquivo define a criação de grupos de segurança (Security Groups) na AWS para controlar o tráfego de entrada e saída das instâncias EC2.