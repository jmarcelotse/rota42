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
