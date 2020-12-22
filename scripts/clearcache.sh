#!/bin/bash

tput setaf 3 ; tput bold ; echo "LIMPADOR DE SWAP" ; tput sgr0
echo ""

corPadrao="\033[0m"
preto="\033[0;30m"
vermelho="\033[0;31m"
verde="\033[0;32m"
marrom="\033[0;33m"
azul="\033[0;34m"
purple="\033[0;35m"
cyan="\033[0;36m"
cinzaClaro="\033[0;37m"
pretoCinza="\033[1;30m"
vermelhoClaro="\033[1;31m"
verdeClaro="\033[1;32m"
amarelo="\033[1;33m"
azulClaro="\033[1;34m"
purpleClaro="\033[1;35m"
cyanClaro="\033[1;36m"
branco="\033[1;37m"

cat -n /etc/issue |grep 1 |cut -d' ' -f6,7,8 |sed 's/1//' |sed 's/      //' > /etc/so
echo -e "\033[1;31mPARA LIMPAR O CACHE DE UM ENTER!\033[0m"
read -p "" ip


echo "Limpando o Cache e Swap..."
echo 3 > /proc/sys/vm/drop_caches
sysctl -w vm.drop_caches=3
swapoff -a && swapon -a
clear

service ssh restart & service squid3 restart
clear

echo -e "\033[01;31mLimpeza do Cache e Swap concluida\033[0m"
sleep 5
menu
