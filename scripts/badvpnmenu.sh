#!/bin/bash
# script BadVPN, verifica se está instalado, caso não esteja, faz o download e a instalacao,
# tudo de forma automática!
# Powered by Elton Sousa

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

BADVPN="/home/BadVPN"
UDP="/bin/badudp"

# menu
badvpnmenu() {
    clear
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    echo -e $branco" BADVPN MENU"$fim
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
if [ -f "$UDP" ]; then
    echo -ne ""
    NUMBER=$(ps -x | grep -c "badvpn-udpgw")
    if [ $NUMBER = "2" ]; then
        echo -e $pretoCinza" STATUS: "$fim$verdeClaro"ON"$fim
        echo -e ""
        echo -e $branco" [1] PARAR"$fim
        echo -e $branco" [2] DESINSTALAR"$fim
        echo -e $branco" [3] SAIR"$fim
        echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
        read -p "OPÇÃO [1-3]: " opcao
        case $opcao in
            1)
                clear
                pkill -f badudp
                sleep 3
                badvpnmenu
                exit
                ;;
            2)
                clear
                badvpn-remove
                exit
                ;;
            3)
                clear
                menu
                exit
                ;;
            *)
                clear
                badvpnmenu
                exit
                ;;
        esac
    else
        echo -e $pretoCinza" STATUS:"$fim$vermelho"OFF"$fim
        echo -e ""
        echo -e $branco" [1] ATIVAR"$fim
        echo -e $branco" [2] DESINSTALAR"$fim
        echo -e $branco" [3] SAIR"$fim
        echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
        read -p "OPÇÃO [1-3]: " opcao2
        case $opcao2 in

            1)
                clear
                screen -dmS screen badudp
                sleep 3
                badvpnmenu
                exit
                ;;
            2)
                clear
                badvpn-remove
                exit
                ;;
            3)
                clear
                menu
                exit
                ;;
            *)
                clear
                badvpnmenu
                exit
                ;;
        esac
    fi
    else
        echo -e $fim$vermelhoClaro" BADVPNN NÃO INSTALADO!"$fim
        echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
        read -p " DESEJA INSTALAR? [s/n]: " opcao3
        if [ -z $opcao3 ]; then
          echo -e $amarelo" ESCOLHA UMA OPÇÃO!"$fim
          sleep 3
          badvpnmenu
         fi
        case $opcao3 in
            (s|S|y|Y)
                badvpn-setup #setup badudp
                exit
                ;;
            (n|N)
                clear
                menu
                exit
                ;;
            *)
                clear
                echo -e $vermelhoClaro" OPÇÃO INVÁLIDA!"$fim
                sleep 3
                badvpnmenu #menu
                exit
                ;;
        esac
fi
}

# setup
badvpn-setup() {
    if [ -f "$UDP" ]; then
        clear
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    echo -e $amarelo" BADVPN STATUS: "$fim$verdeClaro"INSTALADO!"$fim
        sleep 3
        badvpnmenu
        exit
    else
    clear
        echo -e $verdeClaro" ATUALIZANDO REPOSITÓRIOS..."$fim
        apt-get update 1> /dev/null 2> /dev/null
        apt-get upgrade -y 1> /dev/null 2> /dev/null
    clear
        echo -e $verdeClaro" AGUARDE UM INSTANTE..."$fim
        apt-get install build-essential -y 1> /dev/null 2> /dev/null
    apt-get install gcc -y 1> /dev/null 2> /dev/null
    apt-get install g++ -y 1> /dev/null 2> /dev/null
    apt-get install make -y 1> /dev/null 2> /dev/null
    clear
    echo -e $verdeClaro" SÓ MAIS UM POUCO..."$fim
    mkdir $BADVPN
    cd $BADVPN
    clear
    echo -e $verdeClaro" ISSO PODE DEMORAR MUITO... AGUARDE!..."$fim
        wget -q --no-check-certificate http://www.cmake.org/files/v2.8/cmake-2.8.12.tar.gz 1> /dev/null 2> /dev/null
    wget -q --no-check-certificate https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/badvpn/badvpn-1.999.128.tar.bz2 1> /dev/null 2> /dev/null
    tar xvzf cmake-2.8.12.tar.gz 1> /dev/null 2> /dev/null
    tar xf badvpn-1.999.128.tar.bz2 1> /dev/null 2> /dev/null
    clear
    echo -e $verdeClaro" INSTALANDO RECURSOS..."$fim
    cd $BADVPN/cmake-2.8.12
    ./bootstrap --prefix=/usr 1> /dev/null 2> /dev/null
    make 1> /dev/null 2> /dev/null
    make install 1> /dev/null 2> /dev/null
    cd $BADVPN/badvpn-1.999.128
    cmake -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1 1> /dev/null 2> /dev/null
    make install 1> /dev/null 2> /dev/null
    clear
    echo -e $verdeClaro" CONFIGURANDO..."$fim
    echo "#!/bin/bash
badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 512 --max-connections-for-client 8" > $UDP
    chmod a+x $UDP
    clear
    echo -e $verdeClaro" BADUDP INSTALADO COM SUCESSO!!!"$fim
    fi
echo -e $amarelo" APERTE A TECLA ENTER PARA VOLTAR AO MENU..."$fim
read ENTER
badvpnmenu
exit
}

# remove
badvpn-remove() {
    if [ ! -f "$UDP" ]; then
  echo ""
  echo -e $vermelhoClaro" VOCÊ NÃO POSSUI O BADVPN INSTALADO!"$fim
  sleep 3
  badvpnmenu
  exit
else
  clear
  echo -e $verdeClaro" DESINSTALANDO BADVPN..."$fim
  sleep 3
  rm -rf $BADVPN
  rm -rf $UDP
  sleep 3
  clear
  echo -e $verdeClaro" BADVPN DESINSTALADO COM SUCESSO!"$fim
  sleep 3
  menu
  exit
fi
echo -e $verdeClaro" APERTE A TECLA ENTER PARA VOLTAR AO MENU..."$fim
read ENTER
badvpnmenu
exit
}

# menu badvpn
clear

badvpnmenu
exit
