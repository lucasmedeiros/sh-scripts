#!/bin/bash

num1=$1
num2=$2

if [ -z "$1" ]; then
  echo "Informe o primeiro número: "
  read num1
fi

if [ -z "$2" ]; then
  echo "Informe o segundo número:"
  read num2
fi

incremento=1

if [ $num1 -gt $num2 ]; then
  incremento=-$incremento
fi

contador=$num1
soma=$num2

while [ $contador -ne $num2 ]; do
  let soma=$soma+$contador
  let contador=$contador+$incremento
done

echo $soma