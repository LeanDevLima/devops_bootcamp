# Cria a instância EC2
resource "aws_instance" "web_server" {
    ami           = data.aws_ami.amazon_linux.id
    instance_type = "t2.micro"
    user_data     = base64encode(file("${path.module}/../user_data.sh"))
    key_name      = aws_key_pair.ec2_key_pair.key_name

    # Associa os grupos de segurança criados anteriormente à instância
    vpc_security_group_ids = [
        aws_security_group.http_SG.id,
        aws_security_group.ssh_SG.id,
        aws_security_group.egress_all_SG.id
    ]

    tags = {
        Name = "WebServerInstance"
    }
}

# Define a criação de uma instância EC2 na AWS.