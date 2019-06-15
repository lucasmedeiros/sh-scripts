#!/bin/bash

dominio=$1

if [ -z "$1" ]; then
  echo "Informe o domínio:"
  read dominio
fi

ip=`dig +short $dominio`
echo "O IP do domínio $dominio é: $ip"

if ping -q -c 1 -W 1 $dominio >/dev/null; then
  echo "Existe conectividade com o servidor."
else
  echo "Não existe conectividade com o servidor."
fi