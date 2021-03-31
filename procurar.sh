#!/bin/bash
# funcao usada para procurar arquivos nas pastas
for arquivo in *
do
    local caminho_arquivo=$(find ~/Downloads/imagens-novos-livros -name $arquivo)
done