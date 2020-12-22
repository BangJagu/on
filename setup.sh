#!/bin/bash

###############EXEMPLO:#############
#Viva o Linux
#echo -e '\033[01;37mViva o \033[04;32mLinux\033[00;37m!!!'
#############################################
##CORES DE FONTES EM BOLD ,###################
##INSERIR A COR NO INÍCIO E FINALIZA COM FIM
##EXEMPLO:
## echo -e $amar"SEU_TEXTO_AQUI"$fim
#############################################
pret="\033[1;30m"
verm="\033[1;31m"
verd="\033[1;32m"
amar="\033[1;33m"
azul="\033[1;34m"
mag="\033[1;35m"
cian="\033[1;36m"
bra="\033[1;37m"
fim="\033[0;37m"
#############################################

clear

echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $bra" BEM VINDO AO SCRIPT SOUSA TIPS"$fim
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 2
echo ""
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $bra" ESTE SCRIPT FARÁ AS SEGUINTES ALTERAÇÕES:"$fim
sleep 1
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 1
echo -e $bra" ● CONFIGURAR O PROXY SQUID NAS PORTAS:"$fim
echo -e $bra"80, 3128, 8080 e 8799 PERMITIR AS,"$fim
echo -e $bra"CONEXÕES SSH DO SERVIDOR"$fim
sleep 2
echo -e $bra" ● CONFIGURAR O OPENSSH NAS PORTAS 22 e 443"$fim
sleep 2
echo -e $bra" ● INSTALAR UM MENU DE GERENCIAMENTO DE USUÁRIOS"$fim
sleep 2
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 2
echo ""
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
tput setaf 2 ; tput bold ; read -n 1 -s -p "APERTE QUALQUER TECLA PARA CONTINUAR..." ; echo "" ; echo "" ; tput sgr0
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo ""
IP=$(wget -qO- ipv4.icanhazip.com)
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
read -p "ESTÁ CORRETO O SEU IP? " -e -i $IP ipdovps
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
if [ -z "$ipdovps" ]
then
	echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
	echo -e $verm" PRECISA DIGITAR O IP DO SERVIDOR! "$fim
	echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
	exit 1
fi
if [ -f "/root/usuarios.db" ]
then
	echo ""
	echo -e $amar"ENCONTRAMOS UMA BASE DE DADOS ('usuarios.db')"$fim
	echo -e $amar"DESEJA MANTÊ-LA? (preservando o limite de conexões simultâneas dos usuários)"$fim
	echo -e $amar"OU CRIAR UMA NOVA?"$fim
	echo ""
	echo -e $verd"[1] MANTER BANCO DE DADOS"$fim
	echo -e $verd"[2] CRIAR UM NOVO BANCO DE DADOS"$fim
	echo ""
	read -p "OPÇÃO?: " -e -i 1 optiondb
else
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
fi
echo ""
read -p "ATIVAR COMPRESSÃO SSH (pode aumentar o consumo de RAM)? [s/n]) " -e -i n sshcompression
echo ""
echo -e $verd"AGUARDE...ISSO PODE DEMORAR ALGUNS MINUTOS..."$fim
echo ""
sleep 3

cp /etc/ssh/sshd_config /etc/ssh/sshbak

apt-get update -y >/dev/null 2>/dev/null
apt-get upgrade -y >/dev/null 2>/dev/null

apt-get install python-pip -y >/dev/null 2>/dev/null
pip install speedtest-cli >/dev/null 2>/dev/null
apt-get update >/dev/null 2>/dev/null
apt-get install -y python3-pip >/dev/null 2>/dev/null

rm /bin/addhost >/dev/null 2>/dev/null
rm /bin/ajuda >/dev/null 2>/dev/null
rm /bin/alterarlimite >/dev/null 2>/dev/null
rm /bin/alterarsenha >/dev/null 2>/dev/null
rm /bin/att >/dev/null 2>/dev/null
rm /bin/atualizar >/dev/null 2>/dev/null
rm /bin/badudp >/dev/null 2>/dev/null
rm /bin/badvpnmenu >/dev/null 2>/dev/null
rm /bin/banner >/dev/null 2>/dev/null
rm /bin/clearcache >/dev/null 2>/dev/null
rm /bin/criarusuario >/dev/null 2>/dev/null
rm /bin/criarusuariotemporario >/dev/null 2>/dev/null
rm /bin/delhost >/dev/null 2>/dev/null
rm /bin/dropbear.sh >/dev/null 2>/dev/null
rm /bin/expcleaner >/dev/null 2>/dev/null
rm /bin/limiteconexao >/dev/null 2>/dev/null
rm /bin/menu >/dev/null 2>/dev/null
rm /bin/menu-stunnel4 >/dev/null 2>/dev/null
rm /bin/menu1 >/dev/null 2>/dev/null
rm /bin/menu2 >/dev/null 2>/dev/null
rm /bin/menu3 >/dev/null 2>/dev/null
rm /bin/menudrop >/dev/null 2>/dev/null
rm /bin/mudardata >/dev/null 2>/dev/null
rm /bin/remover >/dev/null 2>/dev/null
rm /bin/setup.sh >/dev/null 2>/dev/null
rm /bin/socks >/dev/null 2>/dev/null
rm /bin/socks.py >/dev/null 2>/dev/null
rm /bin/speedtest.py >/dev/null 2>/dev/null
rm /bin/sshlimiter >/dev/null 2>/dev/null
rm /bin/sshmonitor >/dev/null 2>/dev/null
rm /bin/testeconexao >/dev/null 2>/dev/null
rm /bin/uinstall-script >/dev/null 2>/dev/null
rm /bin/userbkp >/dev/null 2>/dev/null
rm /bin/ver >/dev/null 2>/dev/null
rm /bin/ver1 >/dev/null 2>/dev/null

rm /root/ExpCleaner.sh /root/CriarUsuario.sh /root/sshlimiter.sh >/dev/null 2>/dev/null

apt-get install squid3 bc screen nano unzip dos2unix wget -y > /dev/null
apt-get install htop -y > /dev/null

killall apache2 1>/dev/null 2>/dev/null
apt-get purge apache2 -y 1>/dev/null 2>/dev/null
if [ -f "/usr/sbin/ufw" ] ; then
	ufw allow 443/tcp ; ufw allow 80/tcp ; ufw allow 3128/tcp ; ufw allow 8799/tcp ; ufw allow 8080/tcp
fi
if [ -d "/etc/squid3/" ]
then
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/squid1.txt -O /tmp/sqd1
	echo "acl url3 dstdomain -i $ipdovps" > /tmp/sqd2
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/squid2.txt -O /tmp/sqd3
	cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 > /etc/squid3/squid.conf
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/payload.txt -O /etc/squid3/payload.txt
	echo " " >> /etc/squid3/payload.txt
	grep -v "^Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
	echo "Port 443" >> /etc/ssh/sshd_config
	grep -v "^PasswordAuthentication yes" /etc/ssh/sshd_config > /tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
	echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/addhost.sh -O /bin/addhost
	chmod +x /bin/addhost
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/alterarsenha.sh -O /bin/alterarsenha
	chmod +x /bin/alterarsenha
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/criarusuario2.sh -O /bin/criarusuario
	chmod +x /bin/criarusuario
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/delhost.sh -O /bin/delhost
	chmod +x /bin/delhost
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/expcleaner2.sh -O /bin/expcleaner
	chmod +x /bin/expcleaner
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/mudardata.sh -O /bin/mudardata
	chmod +x /bin/mudardata
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/remover.sh -O /bin/remover
	chmod +x /bin/remover
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/sshlimiter2.sh -O /bin/sshlimiter
	chmod +x /bin/sshlimiter
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/alterarlimite.sh -O /bin/alterarlimite
	chmod +x /bin/alterarlimite
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/ajuda.sh -O /bin/ajuda
	chmod +x /bin/ajuda
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/sshmonitor2.sh -O /bin/sshmonitor
	chmod +x /bin/sshmonitor
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/menu.sh -O /bin/menu
	chmod +x /bin/menu
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/menu1.sh -O /bin/menu1
	chmod +x /bin/menu1
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/menu2.sh -O /bin/menu2
	chmod +x /bin/menu2
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/menu3.sh -O /bin/menu3
	chmod +x /bin/menu3
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/atualizar.sh -O /bin/atualizar
	chmod +x /bin/atualizar
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/clearcache.sh -O /bin/clearcache
	chmod +x /bin/clearcache
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/userbkp.sh -O /bin/userbkp
	chmod +x /bin/userbkp
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/socks.py -O /bin/socks.py
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/socks -O /bin/socks
	chmod +x /bin/socks
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/setup.sh -O /bin/setup.sh
	chmod +x /bin/setup.sh
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/att.sh -O /bin/att
	chmod +x /bin/att
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/ver -O /bin/ver
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/ver1 -O /bin/ver1
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/testeconexao -O /bin/testeconexao
	chmod +x /bin/testeconexao
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/speedtest.py -O /bin/speedtest.py
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/uinstall-script -O /bin/uinstall-script
	chmod +x /bin/uinstall-script
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/limiteconexao -O /bin/limiteconexao
	chmod +x /bin/limiteconexao
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/banner.sh -O /bin/banner
	chmod +x /bin/banner
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/criarusuariotemporario.sh -O /bin/criarusuariotemporario
	chmod +x /bin/criarusuariotemporario
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/menudrop.sh -O /bin/menudrop
	chmod +x /bin/menudrop
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/menu-stunnel4.sh -O /bin/menu-stunnel4
	chmod +x /bin/menu-stunnel4
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/scripts/master/badvpnmenu.sh -O /bin/badvpnmenu
	chmod +x /bin/badvpnmenu

	if [ ! -f "/etc/init.d/squid3" ]
	then
		service squid3 reload > /dev/null
	else
		/etc/init.d/squid3 reload > /dev/null
	fi
	if [ ! -f "/etc/init.d/ssh" ]
	then
		service ssh reload > /dev/null
	else
		/etc/init.d/ssh reload > /dev/null
	fi
fi
if [ -d "/etc/squid/" ]
then
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/squid1.txt -O /tmp/sqd1
	echo "acl url3 dstdomain -i $ipdovps" > /tmp/sqd2
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/squid.txt -O /tmp/sqd3
	cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 > /etc/squid/squid.conf
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/payload.txt -O /etc/squid/payload.txt
	echo " " >> /etc/squid/payload.txt
	grep -v "^Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
	echo "Port 443" >> /etc/ssh/sshd_config
	grep -v "^PasswordAuthentication yes" /etc/ssh/sshd_config > /tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
	echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/2/addhost.sh -O /bin/addhost
	chmod +x /bin/addhost
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/alterarsenha.sh -O /bin/alterarsenha
	chmod +x /bin/alterarsenha
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/criarusuario2.sh -O /bin/criarusuario
	chmod +x /bin/criarusuario
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/2/delhost.sh -O /bin/delhost
	chmod +x /bin/delhost
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/expcleaner2.sh -O /bin/expcleaner
	chmod +x /bin/expcleaner
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/mudardata.sh -O /bin/mudardata
	chmod +x /bin/mudardata
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/remover.sh -O /bin/remover
	chmod +x /bin/remover
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/sshlimiter2.sh -O /bin/sshlimiter
	chmod +x /bin/sshlimiter
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/alterarlimite.sh -O /bin/alterarlimite
	chmod +x /bin/alterarlimite
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/ajuda.sh -O /bin/ajuda
	chmod +x /bin/ajuda
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/sshmonitor2.sh -O /bin/sshmonitor
	chmod +x /bin/sshmonitor
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/menu.sh -O /bin/menu
	chmod +x /bin/menu
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/menu1.sh -O /bin/menu1
	chmod +x /bin/menu1
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/menu2.sh -O /bin/menu2
	chmod +x /bin/menu2
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/menu3.sh -O /bin/menu3
	chmod +x /bin/menu3
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/atualizar.sh -O /bin/atualizar
	chmod +x /bin/atualizar
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/clearcache.sh -O /bin/clearcache
	chmod +x /bin/clearcache
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/userbkp.sh -O /bin/userbkp
	chmod +x /bin/userbkp
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/socks.py -O /bin/socks.py
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/socks -O /bin/socks
	chmod +x /bin/socks
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/setup.sh -O /bin/setup.sh
	chmod +x /bin/setup.sh
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/att.sh -O /bin/att
	chmod +x /bin/att
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/ver -O /bin/ver
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/ver1 -O /bin/ver1
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/testeconexao -O /bin/testeconexao
	chmod +x /bin/testeconexao
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/speedtest.py -O /bin/speedtest.py
	chmod +x /bin/speedtest.py
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/uinstall-script -O /bin/uinstall-script
	chmod +x /bin/uinstall-script
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/limiteconexao -O /bin/limiteconexao
	chmod +x /bin/limiteconexao
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/banner.sh -O /bin/banner
	chmod +x /bin/banner
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/criarusuariotemporario.sh -O /bin/criarusuariotemporario
	chmod +x /bin/criarusuariotemporario
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/menudrop.sh -O /bin/menudrop
	chmod +x /bin/menudrop
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/menu-stunnel4.sh -O /bin/menu-stunnel4
    chmod +x /bin/menu-stunnel4
	wget https://raw.githubusercontent.com/Leonn34/scriptsousatips/master/scripts/badvpnmenu.sh -O /bin/badvpnmenu
	chmod +x /bin/badvpnmenu

	if [ ! -f "/etc/init.d/squid" ]
	then
		service squid reload > /dev/null
	else
		/etc/init.d/squid reload > /dev/null
	fi
	if [ ! -f "/etc/init.d/ssh" ]
	then
		service ssh reload > /dev/null
	else
		/etc/init.d/ssh reload > /dev/null
	fi
fi
rm /bin/setup.sh
clear
echo ""
echo -e $verd"PROXY SQUID RODANDO NAS PORTAS: 80, 3128, 8080 e 8799"$fim
echo -e $verd"OPENSSH RODANDO NAS PORTAS: 22 e 443"$fim
echo -e $verd"PARA ENTRAR NO MENU, DIGITE O COMANDO: menu"$fim
echo -e $verd"OBRIGADO POR INSTALAR O SCRIPT!"$fim
echo ""
sleep 7
echo -e $bra"ENTRANDO NO MENU EM..."$fim
sleep 1
echo ""
echo -e $verd"5"$fim
sleep 1
echo -e $verd"4"$fim
sleep 1
echo -e $verd"3"$fim
sleep 1
echo -e $verd"2"$fim
sleep 1
echo -e $verd"1"$fim
clear
menu

if [[ "$optiondb" = '2' ]]; then
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
fi
if [[ "$sshcompression" = 's' ]]; then
	grep -v "^Compression yes" /etc/ssh/sshd_config > /tmp/sshcp && mv /tmp/sshcp /etc/ssh/sshd_config
	echo "Compression yes" >> /etc/ssh/sshd_config
fi
if [[ "$sshcompression" = 'n' ]]; then
	grep -v "^Compression yes" /etc/ssh/sshd_config > /tmp/sshcp && mv /tmp/sshcp /etc/ssh/sshd_config
fi
exit 1
