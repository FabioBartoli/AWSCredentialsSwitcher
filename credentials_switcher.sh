#!/bin/bash

while :
do

export File=~/.aws/credentials

function listCredentials() {
    cat $File | grep -F '[' | tr -d '[,]'
}

function setCredentials() {
    echo "Qual ambiente deve ser o default?"
    read environment
    if grep -q $environment]$ $File; then
        sed -i -e '/default/,+2d' $File
        echo "[default]" >> $File
        cat $File | grep $environment -A2 | grep -v $environment >> $File
        echo "Credential alterada!"
    else
        echo "Credential ERROR!!!"
    fi
}



printf "\n============Credential Switcher============== \
        \n\nEscolha a operação a ser realizada: \
        \n\nNº | CMD         | Descrição
        \n1. | list        | Lista credenciais
        \n2. | set         | Escolhe credencial default
        \n3. | exit        | Sair do programa
        \n\nDigite o número da opção ou seu comando\n\n"

read OPR
case $OPR in
1 | list)
	listCredentials;;
2 | set)
	setCredentials;;
3 | exit)
    echo "Obrigado por utilizar!"
    exit;;
	*)
	printf "\n===================\nOperação inválida inserida!!!\n===================\n"
	;;
esac
done