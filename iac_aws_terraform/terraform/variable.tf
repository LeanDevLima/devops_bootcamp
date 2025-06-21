variable "my_public_ip" {
    type        = string
    description = "Public IP address for the Security Group SSH rule"
    # IP está armazenado no arquivo terraform.tfvars
}

# Define as variáveis que serão utilizadas no Terraform para parametrizar a infraestrutura.