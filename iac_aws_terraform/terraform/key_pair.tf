# Gera uma chave privada RSA de 4096 bits
resource "tls_private_key" "rsa_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

# Cria um par de chaves EC2 na AWS usando a chave privada gerada
resource "aws_key_pair" "ec2_key_pair" {
    key_name   = "ec2_instance_key" # Nome da chave que será criada na AWS
    public_key = tls_private_key.rsa_key.public_key_openssh
}

# Salva a chave privada em um arquivo local
resource "local_file" "private_key_pem" {
    content  = tls_private_key.rsa_key.private_key_pem
    filename = "${path.module}/ec2_instance_key.pem" # Caminho onde a chave privada será salva localmente

    # Permissões para o arquivo da chave privada (leitura e escrita apenas para o proprietário)
    file_permission = "0600" 
}

# Esse arquivo define a criação de um par de chaves para uso com instâncias EC2 na AWS.