#!/bin/bash

USR_EX=$1

# Encerra todos os processos do usuário
pkill -u $USR_EX

# Remove o diretório home do usuário
rm -rf /home/$USR_EX

# Remove o usuário e seu diretório home
userdel -r $USR_EX
