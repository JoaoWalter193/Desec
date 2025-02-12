#!/bin/bash

if ["$1" == ""]
then
    echo "DIGITE O ENDEREÇO PARA FAZER O PARSING"
    echo "EXEMPLO: $0 http://google.com.br"
else
    wget $1 -O index.html
    clear
    grep href index.html | cut -d "/" -f3 | grep "\." | grep -v "<l" | cut -d '"' -f1 > sites.txt
    for url in $(cat sites.txt);
    do
	host $url;
    done
    rm index.html
    rm sites.txt
fi
