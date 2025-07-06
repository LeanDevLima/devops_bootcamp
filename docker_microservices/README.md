# Microserviços com Docker, Chainguard e Segurança

## Sobre o Projeto

Este projeto demonstra a construção de um sistema de microserviços utilizando Docker Compose, com foco em boas práticas de segurança, uso de imagens minimalistas (Chainguard) e ferramentas modernas de desenvolvimento e auditoria.

O sistema é composto por:
- **ms-pessoas-aleatorias**: API Python (FastAPI) para cadastro e sorteio de pessoas.
- **ms-saudacoes-aleatorias**: API Go (Gin) para cadastro e sorteio de saudações.
- **site-gerador-saudacoes**: Front-end HTML/Alpine.js/Tailwind que consome as duas APIs.

Todos os serviços rodam em containers Docker e se comunicam por uma rede interna isolada.

---

## Tecnologias e Conceitos

- **Docker & Docker Compose**: Empacotamento, isolamento e orquestração dos serviços.
- **Imagens Chainguard**: Uso de imagens minimalistas e seguras (`cgr.dev/chainguard/python`, `cgr.dev/chainguard/go`, `cgr.dev/chainguard/nginx`) para reduzir a superfície de ataque e o tamanho dos containers.
- **FastAPI**: Framework moderno e performático para APIs Python.
- **Gin**: Framework web rápido e minimalista para Go.
- **SQLite & SQLAlchemy/GORM**: Bancos de dados leves e ORM para persistência local.
- **Tailwind CSS & Alpine.js**: UI moderna, responsiva e reativa sem dependências pesadas.
- **Devbox & direnv**: Ambientes de desenvolvimento reprodutíveis e automáticos.

---

## Segurança de Containers

- **Trivy**: Todos os containers são escaneados com [Trivy](https://github.com/aquasecurity/trivy) para detectar vulnerabilidades e segredos antes do deploy.
- **Docker Scout**: Utilizado para análise contínua de segurança e recomendações de boas práticas.
- **Imagens Minimalistas**: O uso de Chainguard reduz drasticamente o número de pacotes e possíveis vulnerabilidades.
- **Rede Docker Interna**: Os serviços só se comunicam entre si pela rede `backend`, isolando o tráfego do host.

---

## Como Executar

1. **Build das imagens** (ou use as já publicadas no Docker Hub):
   ```bash
   docker compose build
   ```
2. **Suba o sistema:**
   ```bash
   docker compose up
   ```
3. **Acesse o front-end:**  
   [http://localhost](http://localhost)

---

## Conceitos Demonstrados

- Microserviços desacoplados e independentes
- Comunicação via HTTP REST e rede Docker interna
- Imagens minimalistas e seguras
- Práticas de CI/CD e auditoria de segurança
- Deploy local reprodutível e fácil de testar

---

> Veja os READMEs de cada serviço para detalhes de endpoints, exemplos de uso e instruções específicas.