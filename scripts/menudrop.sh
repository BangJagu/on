#!/bin/bash
# menu dropbear, verifica se esta instalado,
#caso não esteja, faz a instalação e configuração
# Modificado por Elton Sousa | Powered by Sousa Tips

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
drop="/etc/default/dropbear"

# inicio menu
menudrop() {
  clear
  echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
  echo -e $branco" MENU DROPBEAR"$fim
  echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
if [ -e "$drop" ]; then
    echo -ne ""
    echo "DROPBEAR" > $drop1 # cria o arquivo pra verificar se está ativo no menu principal
    NUMBER=$(ps -x | grep -c "dropbear")
    if [ $NUMBER = "2" ]; then
        echo -e $pretoCinza" STATUS:"$fim $verdeClaro"ON"$fim
        echo -e ""
        echo -e $branco" [1] PARAR"$fim
        echo -e $branco" [2] SAIR"$fim
        echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
        read -p " OPÇÃO [1-2] :" opcao

        case $opcao in
            1)
            drop_off
            exit
            ;;
            2)
            menu
            exit
            ;;
            *)
            echo -e $vermelhoClaro" OPÇÃO INVÁLIDA!"$fim
            sleep 3
            menudrop
            exit
            ;;
        esac
    else
        echo -e $pretoCinza" STATUS:"$fim $vermelho"OFF"$fim
        echo -e ""
        echo "" > $drop1 # cria o arquivo pra verificar se está ativo no menu principal
        echo -e $branco" [1] ATIVAR"$fim
        echo -e $branco" [2] SAIR"$fim
        echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
        read -p " OPÇÃO [1-2] :" opcao2

        case $opcao2 in
            1)
            drop_on
            exit
            ;;
            2)
            menu
            exit
            ;;
            *)
            echo -e $vermelhoClaro" OPÇÃO INVÁLIDA!"$fim
            sleep 3
            menudrop
            exit
            ;;
        esac
    fi
else
    echo -e $vermelhoClaro" DROPBEAR NÃO INSTALADO!"$fim
    echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
    read -p " DESEJA INSTALAR? [s/n] :" opcao3
    if [ -z $opcao3 ]; then
      echo -e $amarelo" ESCOLHA UMA OPÇÃO!"$fim
      sleep 3
      menudrop
      fi
    case $opcao3 in
        (s|S|y|Y)
        dropbear_setup
        exit
        ;;
        (n|N)
        menu
        exit
        ;;
        *)
        echo -e $vermelhoClaro" OPÇÃO INVÁLIDA!"$fim
        sleep 3
        menudrop
        exit
        ;;
    esac
fi
}
# fim menudrop

# inicio setup
dropbear_setup() {

    apt-get update && apt-get install dropbear -y

    if [ -e "/etc/default/dropbear.bkp" ] ; then
        echo -ne ""
        else
        #echo "Criando Backup..."
        cp /etc/default/dropbear /etc/default/dropbear.bkp
    fi
    clear
    echo -e $branco" CONFIGURANDO DROPBEAR AGUARDE..."$fim
    sleep 3
    service dropbear stop
    sleep 5
    # CONFIGURANDO...
    echo "#Dropbear" > /etc/default/dropbear
    echo "NO_START=0" >> /etc/default/dropbear
    echo "DROPBEAR_PORT=443" >> /etc/default/dropbear
    echo 'DROPBEAR_EXTRA_ARGS="-p 80"' >> /etc/default/dropbear

    # DESATIVANDO A PORTA 443 NO SSH
    grep -v "^Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
    echo "#Port 443" >> /etc/ssh/sshd_config

    # REINICIANDO SERVIÇOS
    service squid3 stop
    service ssh restart
    service dropbear start
    service dropbear restart
    sleep 5
    clear
    echo -e $verdeClaro" DROPBEAR CONFIGURADO COM SUCESSO!"$fim
    sleep 3
menudrop
}
# fim setup_drop

# inicio ativar
drop_on() {

        if [ -f "/etc/default/dropbear.bkp" ]; then
            echo -ne ""
        else
            #echo "Criando Backup..."
            cp /etc/default/dropbear /etc/default/dropbear.bkp
        fi
    clear
    echo -e $branco" ATIVANDO DROPBEAR AGUARDE..."$fim
    sleep 3
    service dropbear stop
    sleep 5
    # CONFIGURANDO...
    echo "#Dropbear" > /etc/default/dropbear
    echo "NO_START=0" >> /etc/default/dropbear
    echo "DROPBEAR_PORT=443" >> /etc/default/dropbear
    echo 'DROPBEAR_EXTRA_ARGS="-p 80"' >> /etc/default/dropbear

    # DESATIVANDO A PORTA 443 NO SSH
    grep -v "^Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
    echo "#Port 443" >> /etc/ssh/sshd_config

    # REINICIANDO SERVIÇOS
    service squid3 stop
    service ssh restart
    service dropbear start
    service dropbear restart
    sleep 5
    clear
    echo -e $verdeClaro" DROPBEAR ATIVADO!"$fim
    sleep 3
    clear
    menudrop
    exit
}
# fim ativar

#desativar
drop_off() {

    clear
    echo -e $branco" AGUARDE UM INSTANTE..."$fim
    sleep 3
    service dropbear stop
    mv /etc/default/dropbear.bkp /etc/default/dropbear
    # ATIVANDO A PORTA 443 NO SSH
    grep -v "^#Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
    echo "Port 443" >> /etc/ssh/sshd_config
    # REINICIANDO SERVIÇOS
    service squid3 stop
    service ssh restart
    service dropbear stop
    clear
    echo -e $vermelhoClaro" DROPBEAR DESATIVADO!"$fim
    sleep 3
    clear
    menudrop
    exit
}
# fim desativar
clear
#chama a função
menudrop
exit
#está comentado apartir daqui
:<<'commit'
clear
echo "MENU DROPBEAR"
read -p "CONFIGURAR? [ s|n ] :" simnao
  if [ $simnao = "s" ]; then
    menudrop
  else
    menu
  fi
commit
#até aqui
