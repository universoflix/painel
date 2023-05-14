#!/bin/sh

USER_LIST="$1"

# Verifica a arquitetura do servidor
if [ "$(uname -m)" = "aarch64" ]; then
  # Servidor ARM
  PKILL_CMD="pkill"
else
  # Servidor não-ARM
  PKILL_CMD="/usr/bin/pkill"
fi

# Itera sobre a lista de usuários
for USER in $USER_LIST; do
  # Encerra todos os processos do usuário
  $PKILL_CMD -u $USER

  # Remove o usuário
  userdel $USER
done
