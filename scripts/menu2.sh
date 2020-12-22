#!/bin/bash

#############################################
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
# inicio verifica arquivos diretorios
#-------------------------------------------
drop_on_off="/etc/checker/drop_status1"
stun_on_off="/etc/checker/stun_status1"
openv_on_off="/etc/checker/open_status1"
sock_on_off="/etc/checker/sock_status1"
#-------------------------------------------
if [ -d /etc/checker ]; then
  echo -ne ""
  else
  mkdir /etc/checker
fi
#-------------------------------------------
if [ -e $drop_on_off ]; then
  echo -ne ""
  else
  touch $drop_on_off
fi
#-------------------------------------------
if [ -e $stun_on_off ]; then
  echo -ne ""
  else
  touch $stun_on_off
fi
#-------------------------------------------
if [ -e $openv_on_off ]; then
  echo -ne ""
  else
  touch $openv_on_off
fi
#-------------------------------------------
if [ -e $sock_on_off ]; then
  echo -ne ""
  else
  touch $sock_on_off
fi
clear
#checar serviços
#=====================================================
result_drop=$(cat $drop_on_off)
ps -C dropbear > /dev/null
if [ $? = 0 ]; then
echo -e $verdeClaro"ATIVADO"$fim > $drop_on_off
else
echo -e $vermelhoClaro"DESATIVADO"$fim > $drop_on_off
fi
#=====================================================
result_stun=$(cat $stun_on_off)
ps -C stunnel4 > /dev/null
if [ $? = 0 ]; then
echo -e $verdeClaro"ATIVADO"$fim > $stun_on_off
else
echo -e $vermelhoClaro"DESATIVADO"$fim > $stun_on_off
fi
#=====================================================
result_sock=$(cat $sock_on_off)
ps -C "python socks.py" > /dev/null
if [ $? = 0 ]; then
echo -e $verdeClaro"ATIVADO"$fim > $sock_on_off
else
echo -e $vermelhoClaro"DESATIVADO"$fim > $sock_on_off
fi
#=====================================================
 # MENU2 OPCAO 3 (SERVIÇOS)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo ""
echo -e $branco" GERENCIADOR DE SERVIÇOS"$fim
echo ""
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $amarelo" [1]"$fim $branco"STUNNEL4"$fim $pretoCinza"STATUS: "$fim$result_stun
sleep 0.2
echo -e $amarelo" [2]"$fim $branco"SOCKS5"$fim $pretoCinza"STATUS: "$fim$result_sock
sleep 0.2
echo -e $amarelo" [3]"$fim $branco"DROPBEAR"$fim $pretoCinza"STATUS: "$fim$result_drop
sleep 0.2
echo -e $amarelo" [4]"$fim $branco"VOLTAR AO MENU PRINCIPAL"$fim
sleep 0.2
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 0.2
echo ""

read -p " DIGITE SUA OPÇÃO: [1-4] " opcao
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $cinzaClaro" OPÇÃO ESCOLHIDA:"$fim $branco$opcao$fim

case $opcao in

1)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
menu-stunnel4
;;
2)
clear
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $amarelo" Para que o SOCKS funcione corretamente,"$fim
echo -e $amarelo" Comente a porta a ser utilizada no squid.conf"$fim
echo -e $branco" Ex.: Vou usar a porta 80!"$fim
echo -e $branco" Edite o arquivo com o seguinte comando:"$fim
echo -e $branco" nano /etc/squid3/squid.conf"$fim
echo ""
echo -e $vermelhoClaro"#"$fim$verdeClaro"http_port 80"$fim
echo -e $verdeClaro"http_port 3128"$fim
echo -e $verdeClaro"http_port 8080"$fim
echo -e $verdeClaro"http_port 8799"$fim
echo ""
echo -e $amarelo"Depois reinicie:"$fim $branco"service squid3 restart"$fim
echo ""
read -p "Continuar? [ s/n ]: " opsn
  case $opsn in
    (s|S)
    socks
    ;;
    *)
    menu2
    exit
  esac
;;
3)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
menudrop
exit
;;
4)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
menu
exit
;;
*)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $vermelhoClaro"OPÇÃO INVÁLIDA!!!"$fim
sleep 4
menu2
exit
esac
