#!/bin/bash
clear
tput setaf 3 ; tput bold ; echo "Gerenciador Backup de Usuários" ; tput sgr0
echo "O que deseja fazer?"
echo ""
echo "1 - CRIAR BACKUP"
echo "2 - RESTAURAR BACKUP"
echo "3 - SAIR"
echo ""

read -p "Opção: " -e -i 3 opcao

if [[ "$opcao" = '1' ]]; then
	if [ -f "/root/usuarios.db" ]
	then
		echo ""
		echo "Criando backup..."
		echo ""
		tar cvf /root/backup.vps /root/usuarios.db /etc/shadow /etc/passwd /etc/group /etc/gshadow
		echo ""
		echo "Arquivo /root/backup.vps criado com sucesso."
		echo ""
		sleep 4
		menu
	else
		echo ""
		echo "Criando backup..."
		echo ""
		tar cvf /root/backup.vps /etc/shadow /etc/passwd /etc/group /etc/gshadow
		echo ""
		echo "Arquivo /root/backup.vps criado com sucesso."
		echo ""
		sleep 4
		menu
	fi
fi
if [[ "$opcao" = '2' ]]; then
	if [ -f "/root/backup.vps" ]
	then
		echo ""
		echo "Restaurando backup..."
		echo ""
		sleep 1
		cp /root/backup.vps /backup.vps
		cd /
		tar -xvf backup.vps
		rm /backup.vps
		echo ""
		echo "Usuários e senhas importados com sucesso."
		echo ""
		sleep 4
		menu
	else
		echo ""
		echo "O arquivo /root/backup.vps não foi encontrado!"
		echo "Ceritifique-se que ele esteja localizado no diretório /root/ com o nome backup.vps"
		echo ""
		sleep 4
		menu
	fi
fi
