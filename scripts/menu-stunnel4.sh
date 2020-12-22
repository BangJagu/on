#!/bin/bash

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

#--------------------------------------------
drop1="/etc/checker/drop_status"
stun="/etc/checker/stun_status"
openv="/etc/checker/open_status"
if [ -d /etc/checker ]; then
echo -ne ""
else 
mkdir /etc/checker
fi
#--------------------------------------------
# menu stunnel
menu-stunnel() {
clear
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $branco" MENU STUNNEL4"$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
if [ -d /etc/stunnel ] ; then
  echo -ne ""
  ps -C stunnel4 > /dev/null
    if [ $? = 0 ]; then
      echo -e $pretoCinza" STATUS:"$fim $verdeClaro"ON"$fim
      echo "STUNNEL4" > $stun # cria o arquivo pra verificar se está ativo no menu principal
      echo -e ""
      echo -e $branco" [1] PARAR"$fim
      echo -e $branco" [2] SAIR"$fim
      echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
      read -p " OPÇÃO [1-2] :" opcao
      case $opcao in
        1)
        stun_off
        exit
        ;;
        2)
        menu
        exit
        ;;
        *)
        echo -e $vermelhoClaro" OPÇÃO INVÁLIDA!"$fim
        sleep 3
        menu-stunnel
        exit
        ;;
        esac
      else
        echo -e $pretoCinza" STATUS:"$fim $vermelho"OFF"$fim
        echo -e ""
        echo -e "" > $stun # cria o arquivo pra verificar se está ativo no menu principal
        echo -e $branco" [1] ATIVAR"$fim
        echo -e $branco" [2] SAIR"$fim
        echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
        read -p " OPÇÃO [1-2] :" opcao2
        case $opcao2 in
          1)
          stun_on
          exit
          ;;
          2)
          menu
          exit
          ;;
          *)
          echo -e $vermelhoClaro" OPÇÃO INVÁLIDA!"$fim
          sleep 3
          menu-stunnel
          exit
          ;;
        esac
      fi
  else
    echo -e $vermelhoClaro" STUNNEL4 NÃO INSTALADO!"$fim
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    read -p " DESEJA INSTALAR? [s/n] :" opcao3
      if [ -z $opcao3 ]; then
      echo -e $amarelo" ESCOLHA UMA OPÇÃO!"$fim
      sleep 3
      menu-stunnel
      fi
      case $opcao3 in
        (s|S|y|Y)
        wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/stunnel.sh -O /bin/stunnel4 && chmod +x /bin/stunnel4 && bash /bin/stunnel4
        exit
        ;;
        (n|N)
        menu
        exit
        ;;
        *)
        echo -e $vermelhoClaro" OPÇÃO INVÁLIDA!"$fim
        sleep 3
        menu-stunnel
        exit
        ;;
      esac
fi
}
# fim menu

stun_on () {
clear
echo -e $amarelo" ATIVANDO STUNNEL..."$fim
sleep 3
clear
echo -e $amarelo" CONFIGURANDO O SSH..."$fim
sleep 3
clear
grep -v "^Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
echo "#Port 443" >> /etc/ssh/sshd_config
echo -e $amarelo" REINICIANDO SERVIÇOS..."$fim
sleep 3
clear
service squid3 stop
service ssh restart
service stunnel4 stop
service stunnel4 start
clear
echo -e $amarelo"SUNNEL ATIVADO!..."$fim
sleep 3
clear
menu-stunnel
exit
}

stun_off () {
clear
echo -e $amarelo" DESATIVANDO STUNNEL4"$fim
sleep 3
clear
# REATIVANDO A PORTA 443 NO SSH
grep -v "^#Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
echo "Port 443" >> /etc/ssh/sshd_config
# REINICIANDO SERVIÇOS
service ssh restart
service squid3 start
service stunnel4 stop
sleep 5
clear
echo -e $amarelo" STUNNEL DESATIVADO COM SUCESSO!"$fim
sleep 3
clear
menu-stunnel
exit
}
menu-stunnel




