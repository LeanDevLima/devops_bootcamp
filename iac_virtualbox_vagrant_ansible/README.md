# Infraestrutura como Código (IaC) com Vagrant e Ansible

## Sobre o Projeto
Este projeto demonstra a implementação de Infraestrutura como Código (IaC) utilizando Vagrant e Ansible para automatizar a criação e configuração de uma máquina virtual que hospeda o site "Mundo Invertido". O ambiente configura automaticamente um servidor Nginx que serve o conteúdo estático da aplicação, acessível via port forwarding na porta 8080 do host.

## Executando o Projeto
Para criar e provisionar a máquina virtual:
```bash
$ vagrant up
```
Acesse o site em: http://localhost:8080

Para destruir o ambiente quando terminar:
```bash
$ vagrant destroy
```

## Infraestrutura como Código (IaC)

- **Definição:** prática de gerenciar e provisionar infraestrutura por meio de arquivos declarativos, em vez de processos manuais.
- **Vantagem:** ambientes reprodutíveis, versionados e auditáveis.

## Vagrant

- **O que faz:** automatiza a criação e gerenciamento de **máquinas virtuais** para seu ambiente de desenvolvimento.
- **Boxes:** o Vagrant utiliza **"boxes"**, que são imagens base pré-configuradas de sistemas operacionais (como Ubuntu, CentOS etc.). A box é o ponto de partida para criar a VM.
- **Providers (Provedores):** quem **fornece** e executa a VM.
  - Ex.: `virtualbox`, `vmware_desktop`, `hyperv`.
- **Provisioners (Provisionadores):** quem **configura** a VM após a criação.
  - Ex.: `ansible`, `shell`, `chef`, `puppet`.

### Principais comandos do Vagrant:

```bash
$ vagrant init # Cria um arquivo Vagrantfile no diretório atual. Esse arquivo define como a máquina será configurada.

$ vagrant up # Cria e inicia a VM com base no Vagrantfile. Também baixa a box (caso necessário) e executa o provisionamento.

$ vagrant ssh # Abre uma conexão SSH para dentro da VM. Ideal para inspecionar ou testar configurações.

$ vagrant halt # Desliga a VM de forma segura (como um shutdown). O estado da máquina é mantido.

$ vagrant destroy # Remove a VM completamente, liberando recursos. Use com cuidado, pois todos os dados na VM serão perdidos.

$ vagrant reload # Reinicia a VM, aplicando quaisquer alterações feitas no Vagrantfile.

$ vagrant status # Mostra o estado atual da VM (se está rodando, parada, etc.).

$ vagrant provision # Executa novamente o provisionamento da VM em uma máquina virtual que já está em execução.

$ vagrant box list # Lista todas as boxes disponíveis no sistema.
```

### Exemplo de Vagrantfile:

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
```

## Ansible

- **O que faz:** ferramenta **agentless** de orquestração e configuração remota (via SSH/WinRM).
- **Playbooks:** conjuntos de “plays” que definem tarefas e estado desejado em YAML.
- **Módulos:** unidades de trabalho (e.g. `apt`, `copy`, `template`, `service`).
- **Idempotência:** o Ansible é projetado para ser idempotente, isso significa que, ao executar um playbook várias vezes, ele só aplicará as alterações necessárias para alcançar o estado desejado. Se o estado já estiver correto, nenhuma ação adicional será executada. Isso garante previsibilidade e segurança nas execuções repetidas.

### Exemplo básico de playbook (`playbook.yml`):

  ```yaml
  - hosts: all
    become: yes
    tasks:
      - name: Atualizar cache do apt
        apt:
          update_cache: yes

      - name: Instalar Nginx
        apt:
          name: nginx
          state: present

      - name: Copiar site estático
        copy:
          src: files/
          dest: /var/www/html
        notify:
          - Reiniciar Nginx

    handlers:
      - name: Reiniciar Nginx
        service:
          name: nginx
          state: restarted
  ```

## Saiba mais

- [Explorando módulos do Ansible](https://nerdexpert.com.br/explorando-modulos-do-ansible/)
- [Documentação dos módulos do Ansible](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html)
- [Documentação do Ansible](https://docs.ansible.com/ansible/latest/index.html)
- [Documentação do Vagrant](https://www.vagrantup.com/docs)
- [Documentação do VirtualBox](https://www.virtualbox.org/wiki/Documentation)
