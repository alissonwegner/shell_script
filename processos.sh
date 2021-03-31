#!/bin/bash

processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])
for pid in $processos
do
    echo $(ps -p $pid -o comm=)
done


#para salvar em um arquivo as informações
tamanho_processo=$(ps -p $pid -o size | grep [0-9])
echo -n $(date +%F,%H:%M:%S,) >> log/$nome_processo.log
echo "$(bc <<< "scale=2;$tamanho_processo/1024") MB" >> $nome_processo.log