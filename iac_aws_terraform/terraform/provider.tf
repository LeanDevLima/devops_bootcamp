terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
  region = "us-west-2"
}

# Opcional: define o provedor que será usado para criar a infraestrutura na nuvem