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
