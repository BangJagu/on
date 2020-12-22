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
#============================================
# MENU3 OPCAO 4 (FERRAMENTAS)
# CHECAR SERVICO ATIVO
#============================================
# inicio verifica arquivos diretorios
#-------------------------------------------
udp_on_off="/etc/checker/udp_status1"
#-------------------------------------------
if [ -e $udp_on_off ]; then
  echo -ne ""
  else
  touch $udp_on_off
fi
#-------------------------------------------
result_udp=$(cat $udp_on_off)
ps -C badudp > /dev/null
if [ $? = 0 ] ; then
        echo -e $verdeClaro"ATIVADO"$fim > $udp_on_off
else
        echo -e $vermelhoClaro"DESATIVADO"$fim > $udp_on_off
fi
#=============================================
ps -C sshlimiter > /dev/null

if [ $? = 0 ] ; then
    echo -ne ""
    clear
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    echo -e $branco" FERRAMENTAS"$fim
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    echo -e $amarelo" [1]"$fim $branco"VERIFICAR PORTAS UTILIZADAS"$fim
    sleep 0.2
    echo -e $amarelo" [2]"$fim $branco"MOSTRAR NUMERO DE CONEXÕES"$fim
    sleep 0.2
    echo -e $amarelo" [3]"$fim $branco"LIMITAR CONEXÕES "$fim$branco"["$fim$vermelhoClaro"PARAR"$fim$branco"]"$fim $pretoCinza"STATUS: "$fim$verdeClaro"ATIVADO"$fim
    sleep 0.2
    echo -e $amarelo" [4]"$fim $branco"ADD HOSTS"$fim
    sleep 0.2
    echo -e $amarelo" [5]"$fim $branco"APAGAR HOSTS"$fim
    sleep 0.2
    echo -e $amarelo" [6]"$fim $branco"LIMPAR CACHÊ"$fim
    sleep 0.2
    echo -e $amarelo" [7]"$fim $branco"ATIVAR BADUDP"$fim $pretoCinza"STATUS: "$fim$result_udp
    sleep 0.2
    echo -e $amarelo" [8]"$fim $branco"TESTE DE VELOCIDADE"$fim
    sleep 0.2
    echo -e $amarelo" [9]"$fim $branco"DESINSTALAR O SCRIPT"$fim
    sleep 0.2
    echo -e $amarelo" [10]"$fim $branco"EDITAR O BANNER"$fim
    sleep 0.2
    echo -e $amarelo" [11]"$fim $branco"VOLTAR AO MENU PRINCIPAL"$fim
    sleep 0.2
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    sleep 0.2
    echo ""

    read -p " DIGITE SUA OPÇÃO: [1-11] " opcao
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    echo -e $cinzaClaro" OPÇÃO ESCOLHIDA:"$fim $branco$opcao$fim

case $opcao in

    1)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    netstat -ntpl
    #voltar ao menu opcional
    echo ""
    echo "ENTER para voltar"
    read -p " "
    sleep 1s
    menu3
    ;;
    2)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    sshmonitor
    ;;
    3)
    clear
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    echo -e $vermelhoClaro" DESATIVANDO..."$fim
    sleep 3
    pkill -f sshlimiter
    echo -e $vermelhoClaro" DESATIVADO COM SUCESSO"$fim
    sleep 3
    menu3
    ;;
    4)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    addhost
    ;;
    5)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    delhost
    ;;
    6)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    clearcache
    ;;
    7)
    clear
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    badvpnmenu
    ;;
    8)
    clear
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    echo -e $amarelo" TESTANDO VELOCIDADE DO SERVIDOR..."$fim
    sleep 2
    clear
    testeconexao
    ;;
    9)
    clear
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    sleep 2
    clear
    uinstall-script
    ;;
    10)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    banner
    ;;
    11)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    menu
    ;;
    *)
    clear
    echo -e $vermelhoClaro" OPÇÃO INVÁLIDA!!!"$fim
    sleep 4
    menu3
esac

else
    echo -ne ""
    #echo -e $vermelhoClaro"DESATIVADO"$fim > /tmp/statussshlimiter
    clear
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    echo -e $branco" FERRAMENTAS"$fim
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    echo -e $amarelo" [1]"$fim $branco"VERIFICAR PORTAS UTILIZADAS"$fim
    sleep 0.2
    echo -e $amarelo" [2]"$fim $branco"MOSTRAR NUMERO DE CONEXÕES"$fim
    sleep 0.2
    echo -e $amarelo" [3]"$fim $branco"LIMITAR CONEXÕES "$fim$branco"["$fim$verdeClaro"INICIAR"$fim$branco"]"$fim $pretoCinza"STATUS: "$fim$vermelho"DESATIVADO"$fim
    sleep 0.2
    echo -e $amarelo" [4]"$fim $branco"ADD HOSTS"$fim
    sleep 0.2
    echo -e $amarelo" [5]"$fim $branco"APAGAR HOSTS"$fim
    sleep 0.2
    echo -e $amarelo" [6]"$fim $branco"LIMPAR CACHÊ"$fim
    sleep 0.2
    echo -e $amarelo" [7]"$fim $branco"ATIVAR BADUDP"$fim $pretoCinza"STATUS: "$fim$result_udp
    sleep 0.2
    echo -e $amarelo" [8]"$fim $branco"TESTE DE VELOCIDADE"$fim
    sleep 0.2
    echo -e $amarelo" [9]"$fim $branco"DESINSTALAR O SCRIPT"$fim
    sleep 0.2
    echo -e $amarelo" [10]"$fim $branco"EDITAR O BANNER"$fim
    sleep 0.2
    echo -e $amarelo" [11]"$fim $branco"VOLTAR AO MENU PRINCIPAL"$fim
    sleep 0.2
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    sleep 0.2
    echo ""

    read -p " DIGITE SUA OPÇÃO: [1-11] " opcao
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    echo -e $cinzaClaro" OPÇÃO ESCOLHIDA:"$fim $branco$opcao$fim

case $opcao in

    1)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    netstat -ntpl
    #voltar ao menu opcional
    echo ""
    echo " ENTER para voltar"
    read -p " "
    sleep 1s
    menu3
    ;;
    2)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    sshmonitor
    ;;
    3)
    clear
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    echo -e $branco" INICIANDO SSHLIMITER..."$fim
    sleep 3
    screen -dmS screen sshlimiter
    echo -e $verdeClaro" SSHLIMITER ATIVADO!"$fim
    sleep 3
    menu3
    ;;
    4)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    addhost
    ;;
    5)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    delhost
    ;;
    6)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    clearcache
    ;;
    7)
    clear
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    badvpnmenu
    ;;
    8)
    clear
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    echo -e $amarelo" TESTANDO VELOCIDADE DO SERVIDOR..."$fim
    sleep 2
    clear
    testeconexao
    ;;
    9)
    clear
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    sleep 2
    clear
    uinstall-script
    ;;
    10)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    banner
    ;;
    11)
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    menu
    ;;
    *)
    echo -e $vermelhoClaro" OPÇÃO INVÁLIDA!!!"$fim
    sleep 4
    menu3
esac
fi

