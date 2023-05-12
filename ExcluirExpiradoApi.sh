#!/bin/bash

# Verifica se o script está sendo executado como root
if [[ $EUID -ne 0 ]]; then
   echo "Este script deve ser executado como root" 
   exit 1
fi

# Verifica se o argumento foi fornecido
if [ -z "$1" ]; then
    echo "Por favor, forneça uma lista de usuários para remover"
    exit 1
fi

# Verifica a arquitetura do servidor
if [ "$(uname -m)" = "aarch64" ]; then
  # Servidor ARM
  DELUSER_CMD="deluser"
else
  # Servidor não-ARM
  DELUSER_CMD="userdel"
fi

# Itera sobre a lista de usuários
while read -r USER; do
  # Encerra todos os processos do usuário
  pkill -u $USER

  # Remove o diretório home do usuário
  rm -rf /home/$USER

  # Remove o usuário e seu diretório home
  $DELUSER_CMD --remove-home $USER
done < "$1"

echo "Usuários removidos com sucesso"









