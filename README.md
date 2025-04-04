# rota42
A Rota42 é uma startup inovadora que está crescendo rápido, mas enfrenta um grande problema: sua aplicação está cheia de configurações manuais, cada desenvolvedor configura o ambiente de um jeito diferente e os erros em produção são frequentes.

O CTO da empresa, cansado de enfrentar falhas constantes e atrasos nos deployments, decidiu tomar uma atitude: "Vamos adotar Docker imediatamente!".

Mas a equipe de desenvolvimento e operações não está convencida. Muitos acreditam que containers são "complicados demais", outros dizem que vão perder dados, e os times de observabilidade e QA não sabem como monitorar ou testar essas aplicações.

É aqui que você entra em ação! Como um dos engenheiros da Rota42, sua missão é liderar a transformação e provar que containers podem ser simples, seguros e eficientes.

Vamos criar o script run_containers.sh de forma clara, didática e automatizada para que qualquer pessoa da equipe consiga rodá-lo sem esforço. Esse script será colocado no diretório 01-primeiro-container.

Aqui está o conteúdo completo do script com comentários explicativos:

bash

```
#!/bin/bash

# run_containers.sh
# Script para mostrar que rodar containers é simples com Docker

echo "🔄 Baixando a imagem do Nginx..."
docker pull nginx

echo "🚀 Iniciando o container com o nome 'meu-servidor'..."
docker run -d --name meu-servidor -p 8080:80 nginx

echo "✅ Container 'meu-servidor' em execução. Acesse em http://localhost:8080"
sleep 2

echo "📋 Listando containers em execução..."
docker ps

echo "🛑 Parando o container 'meu-servidor'..."
docker stop meu-servidor

echo "🧹 Removendo o container 'meu-servidor'..."
docker rm meu-servidor

echo "📋 Listando todos os containers (mesmo os parados)..."
docker ps -a

echo "🏁 Fim do script. Docker é simples, não é? 😉"
```
## Instruções de uso
1. Crie a estrutura de pastas no repositório:
```
mkdir -p 01-primeiro-container
cd 01-primeiro-container
```
2. Salve o script como `run_containers.sh`:

bash

```
nano run_containers.sh
# Cole o conteúdo acima e salve (CTRL+O, ENTER, CTRL+X)
```
3. Torne o script executável:

bash

```
chmod +x run_containers.sh
```

4. Execute o script:

bash

```
./run_containers.sh
```

# Deixando amigavel com makefile

## Aqui está o conteúdo completo do Makefile para o diretório 01-primeiro-container:

Makefile

```
# Makefile - Comandos simplificados para gerenciar o container Nginx

CONTAINER_NAME=meu-servidor
IMAGE_NAME=nginx
PORT=8080

.PHONY: start stop remove clean restart status logs

start:
	@echo "🔄 Baixando imagem $(IMAGE_NAME) se necessário e iniciando o container $(CONTAINER_NAME)..."
	@docker pull $(IMAGE_NAME)
	@docker run -d --name $(CONTAINER_NAME) -p $(PORT):80 $(IMAGE_NAME)
	@echo "✅ Container iniciado: http://localhost:$(PORT)"

stop:
	@echo "🛑 Parando o container $(CONTAINER_NAME)..."
	@docker stop $(CONTAINER_NAME)

remove:
	@echo "🧹 Removendo o container $(CONTAINER_NAME)..."
	@docker rm $(CONTAINER_NAME)

clean: stop remove
	@echo "🧼 Container parado e removido."

restart: clean start
	@echo "🔁 Container reiniciado."

status:
	@echo "📋 Status dos containers..."
	@docker ps -a | grep $(CONTAINER_NAME) || echo "Nenhum container chamado '$(CONTAINER_NAME)' encontrado."

logs:
	@echo "📜 Logs do container $(CONTAINER_NAME):"
	@docker logs -f $(CONTAINER_NAME)
```

## Comandos disponíveis:
- `make start`: Baixa a imagem (se necessário) e inicia o container.
- `make stop`: Para o container.
- `make remove`: Remove o container.
- `make clean`: Para e remove o container.
- `make restart`: Faz o clean e depois inicia novamente.
- `make status`: Mostra o status do container.
- `make logs`: Exibe os logs em tempo real.

## 📁 Estrutura do diretório 01-primeiro-container
```
01-primeiro-container/
├── Makefile
├── README.md
└── run_containers.sh
```

## ✅ run_containers.sh
bash

```
#!/bin/bash

# run_containers.sh
# Script para mostrar que rodar containers é simples com Docker

echo "🔄 Baixando a imagem do Nginx..."
docker pull nginx

echo "🚀 Iniciando o container com o nome 'meu-servidor'..."
docker run -d --name meu-servidor -p 8080:80 nginx

echo "✅ Container 'meu-servidor' em execução. Acesse em http://localhost:8080"
sleep 2

echo "📋 Listando containers em execução..."
docker ps

echo "🛑 Parando o container 'meu-servidor'..."
docker stop meu-servidor

echo "🧹 Removendo o container 'meu-servidor'..."
docker rm meu-servidor

echo "📋 Listando todos os containers (mesmo os parados)..."
docker ps -a

echo "🏁 Fim do script. Docker é simples, não é? 😉"
```

## ⚙️ Makefile
Makefile

```
# Makefile - Comandos simplificados para gerenciar o container Nginx

CONTAINER_NAME=meu-servidor
IMAGE_NAME=nginx
PORT=8080

.PHONY: start stop remove clean restart status logs

start:
	@echo "🔄 Baixando imagem $(IMAGE_NAME) se necessário e iniciando o container $(CONTAINER_NAME)..."
	@docker pull $(IMAGE_NAME)
	@docker run -d --name $(CONTAINER_NAME) -p $(PORT):80 $(IMAGE_NAME)
	@echo "✅ Container iniciado: http://localhost:$(PORT)"

stop:
	@echo "🛑 Parando o container $(CONTAINER_NAME)..."
	@docker stop $(CONTAINER_NAME)

remove:
	@echo "🧹 Removendo o container $(CONTAINER_NAME)..."
	@docker rm $(CONTAINER_NAME)

clean: stop remove
	@echo "🧼 Container parado e removido."

restart: clean start
	@echo "🔁 Container reiniciado."

status:
	@echo "📋 Status dos containers..."
	@docker ps -a | grep $(CONTAINER_NAME) || echo "Nenhum container chamado '$(CONTAINER_NAME)' encontrado."

logs:
	@echo "📜 Logs do container $(CONTAINER_NAME):"
	@docker logs -f $(CONTAINER_NAME)
```

## ⚙️ Usando o Makefile
### 📦 Iniciar o container
bash
```
make start
Acessível em: http://localhost:8080
```