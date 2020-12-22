#!/bin/bash

#criarusuariotemporario

mkdir /etc/usuariosteste 1>/dev/null 2>/dev/null
echo -e "   Usuarios teste"
for testus in $(ls /etc/usuariosteste |sort |sed 's/.sh//g')
do
echo "$testus"
done
printf "\n"
printf "NOME DO USUARIO TEMPORARIO: "; read nome
printf "SENHA: "; read pass
echo -e "\nUse s = segundos, m = minutos, h = horas e d = dias EX: 14s ."
printf "TEMPO QUE O USUARIO $nome IRÁ EXPIRAR: ";read tempoin
tempo=$(echo "$tempoin" |sed 's/ //g')
useradd -M -s /bin/false $nome
(echo $pass;echo $pass) |passwd $nome 1>/dev/null 2>/dev/null
echo "#!/bin/bash
sleep $tempo
kill"' $(ps -u '"$nome |awk '{print"' $1'"}') 1>/dev/null 2>/dev/null
userdel --force $nome
rm -rf /etc/usuariosteste/$nome.sh
exit" > /etc/usuariosteste/$nome.sh
echo -e "USUARIO: $nome
SENHA: $pass
VALIDADE: $tempo\n
O USUARIO SERÁ EXCLUÍDO E DESCONECTADO APÓS O PERÍODO DETERMINADO!."
bash /etc/usuariosteste/$nome.sh &
exit
