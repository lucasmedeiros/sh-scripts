#!/bin/bash

echo "Informe o nome:"
read nome

echo "Informe a idade:"
read idade

echo "Informe o CPF:"
read cpf

echo "Informe o endereço:"
read endereco

# Checa se 'nome' está vazio ou nulo.
if [ -z "$nome" -a "$nome"!=" " ]; then
  echo "Nome inválido!"
  exit
fi

# Checa se 'idade' está vazia ou nula.
if [ -z "$idade" -a "$idade"!=" " ]; then
  echo "Idade inválida!"
  exit
fi

# Checa se 'cpf' está vazio ou nulo.
if [ -z "$cpf" -a "$cpf"!=" " ]; then
  echo "CPF inválido!"
  exit
fi

# Checa se 'endereco' está vazio ou nulo.
if [ -z "$endereco" -a "$endereco"!=" " ]; then
  echo "Endereço inválido!"
  exit
fi

# Checa se o usuário já está cadastrado
arquivo_cadastrados="cadastrados.txt"
while IFS= read -r line
do
  IFS=';;' read -ra ADDR <<< "$line"
  if [ "${ADDR[4]}" == "$cpf" ]; then
    echo "Usuário já cadastrado!"
    exit
  fi
done < "$arquivo_cadastrados"

# Checa se o usuário está bloqueado
arquivo_bloqueados="cpf_bloqueados.txt"
while IFS= read -r line
do
  if [ "$line" == "$cpf" ]; then
    echo "Usuário bloqueado!"
    exit
  fi
done < "$arquivo_bloqueados"

# Se não foi apontado nenhum erro, então o usuário é cadastrado.
echo "$nome;;$idade;;$cpf;;$endereco" >> cadastrados.txt
echo "Usuário cadastrado!"