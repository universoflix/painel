#!/bin/bash

USER_LIST="$1"

# Itera sobre a lista de usuários
for USER in $USER_LIST; do
  # Encerra todos os processos do usuário
  pkill -u $USER

  # Remove o diretório home do usuário
  rm -rf /home/$USER

  # Remove o usuário e seu diretório home
  userdel -r $USER
done
