#!/bin/sh

USER_LIST="$1"

# Verifica a arquitetura do servidor
if [ "$(uname -m)" = "aarch64" ]; then
  # Servidor ARM
  PKILL_CMD="pkill"
  USERDEL_CMD="userdel"
else
  # Servidor não-ARM
  PKILL_CMD="/usr/bin/pkill"
  USERDEL_CMD="/usr/sbin/userdel"
fi

# Itera sobre a lista de usuários
for USER in $USER_LIST; do
  # Encerra todos os processos do usuário
  $PKILL_CMD -u $USER

  # Remove o diretório home do usuário
  rm -rf $HOME/$USER

  # Remove o usuário e seu diretório home
  $USERDEL_CMD -r $USER
done