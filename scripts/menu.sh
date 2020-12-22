#!/bin/bash

##CORES DE FONTES,###################
##INSERIR A COR NO INÍCIO E FINALIZA COM FIM
##EXEMPLO:
## echo -e $amarelo"SEU_TEXTO_AQUI"$fim
#############################################
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
fim="\033[0;37m"
#############################################
#baixa o ver1 pra fazer a verificação
clear

rm /bin/ver1 > /dev/null 2> /dev/null

wget -c -P /bin https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/ver1 > /dev/null 2> /dev/null

cd /bin

arq="/bin/ver"
arq1="/bin/ver1"
equal=$(diff -q $arq $arq1)
ver=$(cat $arq)

clear
#MENU PRINCIPAL
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
apt-get install figlet -y >/dev/null
tput setaf 3; tput bold; figlet -f slant Script SSH; tput sgr0
echo -e $purpleClaro$ver$fim | xargs echo -ne $branco"                                          VER.:"$fim; echo ""
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 0.2
echo -e $amarelo" Powered by | Sousa Tips ®"$fim
sso=$(cat -n /etc/issue |grep 1 |cut -d' ' -f6,7,8 |sed 's/1//' |sed 's/      //')
echo -e $vermelhoClaro" Seu sistema:"$fim$cyan $sso$fim
#######VERIFICAÇÃO DE ATUALIZAÇÃO####################
if [ "$equal" = "" ]; then
  echo -ne ""
  #echo -e $branco" NÃO EXISTEM ATUALIZAÇÕES DISPONÍVEIS!"$fim
else
  echo -e $amarelo" EXISTEM ATUALIZAÇÕES DISPONÍVEIS!"$fim
  #mv -f $arq1 $arq
fi
#######FIM DE ATUALIZAÇÃO############################
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $cyan"                                     USUÁRIOS ON:"$fim $verdeClaro$(ps x | grep hd | grep -v root | grep priv |wc -l)$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 0.2

# inicio verifica arquivos diretorios
#-------------------------------------------
drop1="/etc/checker/drop_status"
stun="/etc/checker/stun_status"
openv="/etc/checker/open_status"
sock="/etc/checker/sock_status"
#-------------------------------------------
if [ -d /etc/checker ]; then
  echo -ne ""
  else 
  mkdir /etc/checker
fi
#-------------------------------------------
if [ -e $drop1 ]; then
  echo -ne ""
  else
  touch $drop1
fi
#-------------------------------------------
if [ -e $stun ]; then
  echo -ne ""
  else
  touch $stun
fi
#-------------------------------------------
if [ -e $openv ]; then
  echo -ne ""
  else
  touch $openv
fi
#-------------------------------------------
if [ -e $sock ]; then
  echo -ne ""
  else
  touch $sock
fi
#-------------------------------------------
# fim verifica arquivos diretorios
result=$(cat $drop1)
if [ -z $result ]; then
  echo -ne ""
  else
  echo -e $pretoCinza" SERVIÇO ATIVO NO MOMENTO:"$fim $amarelo$result$fim
  echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
fi
#-------------------------------------------
result1=$(cat $stun)
if [ -z $result1 ]; then
  echo -ne ""
  else
  echo -e $pretoCinza" SERVIÇO ATIVO NO MOMENTO:"$fim $amarelo$result1$fim
  echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
fi
#-------------------------------------------
ps -C openvpn > /dev/null # verifica se o servico openvpn esta ativo ou não
if [ $? = 0 ] ; then
        echo -e "OPENVPN" > $openv
else
        echo -e "" > $openv
fi
result2=$(cat $openv)
if [ -z $result2 ]; then
  echo -ne ""
  else
  echo -e $pretoCinza" SERVIÇO ATIVO NO MOMENTO:"$fim $amarelo$result2$fim
  echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
fi
#-------------------------------------------
result3=$(cat $sock)
if [ -z $result3 ]; then
  echo -ne ""
  else
  echo -e $pretoCinza" SERVIÇO ATIVO NO MOMENTO:"$fim $amarelo$result3$fim
  echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
fi
#-------------------------------------------
# MENU
echo -e $amarelo" [1]"$fim $branco"APLICAR ATUALIZAÇÕES"$fim
sleep 0.2
echo -e $amarelo" [2]"$fim $branco"GERENCIAR USUÁRIOS SSH"$fim
sleep 0.2
echo -e $amarelo" [3]"$fim $branco"SERVIÇOS"$fim
sleep 0.2
echo -e $amarelo" [4]"$fim $branco"FERRAMENTAS"$fim
sleep 0.2
echo -e $amarelo" [5]"$fim $branco"SAIR"$fim
sleep 0.2
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 0.2
read -p " DIGITE SUA OPÇÃO: [1-5] " opcao
echo -e $cinzaClaro" OPÇÃO ESCOLHIDA:"$fim $branco$opcao$fim

case $opcao in

  1)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    echo -e $amarelo"AGUARDE..."$fim
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    sleep 2
    atualizar
    ;;
  2)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    menu1
    ;;
    3)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    menu2
    ;;
  4)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    menu3
    ;;
  5)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    echo -e $branco"Saindo..."$fim
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    sleep 4
    clear
    exit
    ;;
  *)
    echo -e $vermelhoClaro"OPÇÃO INVÁLIDA!!!"$fim
    sleep 4
    menu
esac
