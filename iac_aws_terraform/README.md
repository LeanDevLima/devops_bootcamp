# IAC com Terraform e AWS

## Sobre o Projeto
Este projeto demonstra a implementação de Infraestrutura como Código (IaC) utilizando `Terraform` e `AWS` para provisionar e configurar automaticamente um servidor web na nuvem. O ambiente configura uma instância EC2 com os security groups necessários e executa um script de inicialização que instala e configura o Ansible, que por sua vez é responsável pela instalação do Nginx e implantação do site estático. Esta abordagem combina as forças do `Terraform para provisionamento de infraestrutura` com o `Ansible para gerenciamento de configuração`.

## Executando o Projeto
Para criar e provisionar a infraestrutura na AWS:
```bash
$ terraform init
$ terraform apply
```
Acesse o site através da URL fornecida nos outputs do Terraform.

Para destruir a infraestrutura quando terminar:
```bash
$ terraform destroy
```

## Terraform
- **O que faz:** ferramenta de orquestração de infraestrutura que permite definir recursos em diversos provedores de nuvem usando uma linguagem declarativa.
- **HCL (HashiCorp Configuration Language):** linguagem `declarativa` utilizada para definir a infraestrutura.
- **Providers:** plugins que permitem o Terraform interagir com diferentes serviços (AWS, Azure, GCP, etc.).
- **Resources:** elementos da infraestrutura que serão gerenciados pelo Terraform (instâncias, redes, etc.).
- **State:** o Terraform mantém um `arquivo de estado` que mapeia as configurações para recursos do mundo real.
- **Variables e tfvars:** o Terraform permite parametrizar configurações usando variáveis que podem ser definidas em arquivos .tfvars para maior segurança e flexibilidade.
- **Data Sources:** permite buscar e utilizar informações de recursos existentes, como AMIs mais recentes.

### Principais comandos do Terraform:
```bash
$ terraform init # Inicializa o ambiente Terraform, baixando os providers e preparando o diretório de trabalho.

$ terraform validate # Verifica se a configuração está sintaticamente válida.

$ terraform plan # Cria um plano de execução, mostrando o que será feito sem realizar alterações.

$ terraform apply # Implementa as mudanças necessárias para atingir o estado desejado da configuração.

$ terraform destroy # Remove todos os recursos gerenciados pelo Terraform.
```

### Exemplo de arquivo Terraform (`main.tf`):
```hcl
# Definição do provider
provider "aws" {
  region = "us-east-1"
}

# Recurso de instância EC2
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  
  tags = {
    Name = "WebServer"
  }
}

# Output para exibir o IP público
output "instance_ip" {
  value = aws_instance.web_server.public_ip
}
```

## AWS (Amazon Web Services)
- **O que faz:** plataforma de serviços em nuvem que oferece infraestrutura computacional sob demanda.
- **EC2 (Elastic Compute Cloud):** serviço que fornece capacidade computacional redimensionável na nuvem.
- **Security Groups:** funcionam como firewalls virtuais que controlam o tráfego de entrada e saída das instâncias EC2.
- **Key Pairs:** pares de chaves usados para autenticação segura com instâncias EC2.
- **AMIs (Amazon Machine Images):** modelos pré-configurados que contêm o sistema operacional e software adicional.

## Saiba mais

- [Documentação do Terraform](https://developer.hashicorp.com/terraform)
- [Documentação do Provider AWS do Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Lista de Providers do Terraform](https://registry.terraform.io/browse/providers)
- [Documentação da AWS](https://docs.aws.amazon.com/pt_br/)

