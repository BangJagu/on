#!/bin/bash
:<<'STRING-DELIMITADORA'
database="/root/usuarios.db"
		echo $$ > /tmp/kids
		while true
		do
		tput setaf 7 ; tput setab 1 ; tput bold ; printf '%28s%s%-18s\n' "SSH Monitor"
		tput setaf 7 ; tput setab 1 ; printf '  %-30s%s\n' "Usuário" "Conexão/Limite " ; echo "" ; tput sgr0
			while read usline
			do
				user="$(echo $usline | cut -d' ' -f1)"
				s2ssh="$(echo $usline | cut -d' ' -f2)"
				if [ -z "$user" ] ; then
					echo "" > /dev/null
				else
					ps x | grep [[:space:]]$user[[:space:]] | grep -v grep | grep -v pts > /tmp/tmp8
					s1ssh="$(cat /tmp/tmp8 | wc -l)"
					tput setaf 3 ; tput bold ; printf '  %-35s%s\n' $user $s1ssh/$s2ssh; tput sgr0
				fi
			done < "$database"
			echo ""
			sleep 4
			#exit 1
		done
STRING-DELIMITADORA
# PARA VOLTAR O CÓDIGO ORIGINAL, EXCLUA A STRING DELIMITADORA

# NOVO MONITOR
#:<<'STRING-DELIMITADORA'
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

clear
while true; do

echo -e "\033[0;32m=========================================================\033[0;32m"
echo -e "\033[47;30m       USUÁRIOS            |          CONEXÕES          \033[0m"
echo -e "\033[0;32m=========================================================\033[0;32m"
        for usur in `awk -F : '$3 > 900 { print $1 }' /etc/passwd |grep -v "nobody" |grep -vi polkitd |grep -vi systemd-[a-z] |grep -vi systemd-[0-9]`; do
	usurnum=$(ps -u $usur |grep sshd |wc -l)
        echo -e "\033[1;33m    $(printf '%-42s%s' $usur $usurnum) \033[0m"
        echo -e "\033[0;32m=========================================================\033[0;32m"
        done
echo ""
echo "ENTER para voltar"
read -p " "
sleep 1s
menu
exit
done;
#STRING-DELIMITADORA
# PARA VOLTAR SÓ APAGAR