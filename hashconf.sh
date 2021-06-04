#!/bin/bash
##### Autor: Alisson Wegner
##### Email: alissonwegner@redes.ufsm.br
### script comparando hash de arquivos
hash=$(cat arqhash.txt)
#echo " hash $hash"
sha256=$( sha256sum arqmatr.txt.gpg | awk '{print $1}')
#echo " sha256 $sha256"
if ["$hash" == "$sha256"]; then
     echo " hash sao iguais "
        else
                echo "hash diferentes ouve modificação"
fi
~           
