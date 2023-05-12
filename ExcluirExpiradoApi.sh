#!/bin/sh
USER_LIST="$1"
Verifica a arquitetura do servidor
if [ "$(uname -m)" = "aarch64" ]; then
Servidor ARM
DELUSER_CMD="deluser"
else
Servidor não-ARM
DELUSER_CMD="userdel"
fi
Itera sobre a lista de usuários
for USER in $USER_LIST; do
Encerra todos os processos do usuário
pkill -u $USER
Remove o diretório home do usuário
rm -rf /home/$USER
Remove o usuário e seu diretório home
$DELUSER_CMD --remove-home $USER
done




















