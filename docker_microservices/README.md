# Microserviços com Docker, Chainguard e Segurança

## Sobre o Projeto

Este projeto demonstra a arquitetura de microserviços desacoplados, cada um responsável por uma funcionalidade específica, comunicando-se via HTTP em uma rede interna Docker. O foco está em boas práticas de segurança, uso de imagens minimalistas (Chainguard) e integração de ferramentas modernas para desenvolvimento e auditoria.

O sistema é composto por:
- **ms-pessoas-aleatorias**: API Python (FastAPI) para cadastro e sorteio de pessoas.
- **ms-saudacoes-aleatorias**: API Go (Gin) para cadastro e sorteio de saudações.
- **site-gerador-saudacoes**: Front-end HTML/Alpine.js/Tailwind que consome as duas APIs.

Todos os serviços rodam em containers Docker e se comunicam por uma rede interna isolada.

## Conceitos e Arquitetura

- **Microserviços**: Cada serviço é independente, podendo ser desenvolvido, testado e escalado separadamente. Isso facilita manutenção, deploy e evolução do sistema.
- **Comunicação via HTTP REST**: Os serviços trocam informações por meio de APIs REST, tornando a integração simples e padronizada.
- **Imagens Minimalistas e Segurança**: O uso de imagens Chainguard reduz a superfície de ataque e o tamanho dos containers, promovendo ambientes mais seguros e eficientes.
- **Persistência Local**: Cada serviço de backend utiliza um banco de dados SQLite local, simplificando o armazenamento sem necessidade de infraestrutura externa.
- **Ambientes Reprodutíveis**: Ferramentas como Devbox e direnv garantem que o ambiente de desenvolvimento seja consistente para todos os desenvolvedores.

## Tecnologias Utilizadas

- **FastAPI** (Python) e **Gin** (Go) para APIs rápidas e modernas.
- **Tailwind CSS** e **Alpine.js** para uma interface web responsiva e reativa.
- **Chainguard** para imagens de containers seguras e enxutas.
- **Trivy** e **Docker Scout** para auditoria e análise de segurança dos containers.
- **Docker Compose** para orquestração dos serviços.

## Segurança

- **Imagens minimalistas**: Menos pacotes, menos vulnerabilidades.
- **Escaneamento contínuo**: Uso de ferramentas como Trivy e Docker Scout para identificar vulnerabilidades antes do deploy.
- **Rede interna Docker**: Isolamento dos serviços, evitando exposição desnecessária ao host.

## Estrutura do Projeto

- `ms-pessoas-aleatorias/`: API de pessoas (Python/FastAPI)
- `ms-saudacoes-aleatorias/`: API de saudações (Go/Gin)
- `site-gerador-saudacoes/`: Front-end web
- `docker-compose.yaml`: Orquestração dos serviços

## Saiba mais

- Veja os READMEs de cada serviço para detalhes de endpoints, exemplos de uso e instruções específicas.
- Para detalhes aprofundados sobre Docker, consulte o repositório [learning_docker](https://github.com/lele-sf/learning_docker/blob/main/study_notes.md).
