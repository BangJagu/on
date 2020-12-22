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

arq="/bin/ver"
arq1="/bin/ver1"

mv -f $arq1 $arq

#############################################
clear
echo ""
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $vermelhoClaro" AGUARDE...."$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 5
clear
echo ""

#ATUALIZANDO SISTEMA

apt-get update >/dev/null 2>/dev/null
#apt-get upgrade -y >/dev/null 2>/dev/null

apt-get install bc >/dev/null 2>/dev/null
apt-get install python-pip -y >/dev/null 2>/dev/null
pip install speedtest-cli >/dev/null 2>/dev/null
apt-get update >/dev/null 2>/dev/null
apt-get install -y python3-pip >/dev/null 2>/dev/null

#cd /bin

#REMOVENDO ARQUIVOS
clear
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $vermelhoClaro"Removendo Arquivos..."$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 5
clear

#rm /bin/badudp >/dev/null 2>/dev/null
rm /bin/addhost >/dev/null 2>/dev/null
rm /bin/ajuda >/dev/null 2>/dev/null
rm /bin/alterarlimite >/dev/null 2>/dev/null
rm /bin/alterarsenha >/dev/null 2>/dev/null
rm /bin/att >/dev/null 2>/dev/null
rm /bin/atualizar >/dev/null 2>/dev/null
rm /bin/badvpn-remove >/dev/null 2>/dev/null
rm /bin/badvpn-setup >/dev/null 2>/dev/null
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
rm /bin/status01 >/dev/null 2>/dev/null
rm /bin/status02 >/dev/null 2>/dev/null
rm /bin/status03 >/dev/null 2>/dev/null
rm /bin/testeconexao >/dev/null 2>/dev/null
rm /bin/uinstall-script >/dev/null 2>/dev/null
rm /bin/userbkp >/dev/null 2>/dev/null
rm /etc/checker/*


rm /root/ExpCleaner.sh /root/CriarUsuario.sh /root/sshlimiter.sh >/dev/null 2>/dev/null

clear
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $vermelhoClaro"Arquivos Removidos!"$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 5
clear

#BAIXANDO SCRIPTS
clear
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $vermelhoClaro"Baixando novos arquivos..."$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 5
clear


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

rm /bin/setup.sh >/dev/null 2>/dev/null

clear
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $verdeClaro" DOWNLOAD CONCLUIDO!"$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 4
cd
sleep 2
clear

#REINICIANDO SQUID E SSH
# não reinicei o squid após download e att do menu!
:<<'NÃO_USAR_SQUID'
if [ ! -f "/etc/init.d/squid3" ]
	then
		service squid3 reload > /dev/null
	else
		/etc/init.d/squid3 reload > /dev/null
fi
NÃO_USAR_SQUID

if [ ! -f "/etc/init.d/ssh" ]
	then
		service ssh reload > /dev/null
	else
		/etc/init.d/ssh reload > /dev/null
fi

clear
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $verdeClaro" ATUALIZADO COM SUCESSO!"$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 5
clear
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $amarelo" Entrando no menu em:..."$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 1
echo ""
echo -e $verdeClaro"5....."$fim
sleep 1
echo -e $verdeClaro"4...."$fim
sleep 1
echo -e $verdeClaro"3..."$fim
sleep 1
echo -e $verdeClaro"2.."$fim
sleep 1
echo -e $verdeClaro"1."$fim
sleep 1
clear
exit1
menu
