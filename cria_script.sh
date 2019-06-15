#!/bin/bash

[ -e $1 ] && echo "Arquivo já existe!" || touch $1

chmod u+x $1