#!/bin/bash

username=$1

if [ -z "$1" ]; then
  echo "Informe o nome de usuário:"
  read username
fi

if id "$username" >/dev/null 2>&1; then
  echo "Usuário já existe!"
  echo "PID: $$"
  echo "GID: `id -g $username`"
else
  sudo useradd $username
fi