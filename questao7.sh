#!/bin/bash

arquivo=$1

if [ -z "$1" ]; then
  echo "Informe o arquivo:"
  read arquivo
fi

[ -f $arquivo ] && echo "Arquivo já existe!" || touch $arquivo

chmod 555 $arquivo