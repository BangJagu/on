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
# cria um bkp do sshd_config
clear
sshd_config_bak=$(cat /etc/ssh/sshd_config | grep -v "Banner")
echo "$sshd_config_bak" > /etc/ssh/sshd_config
echo "Banner /etc/bannerssh" >> /etc/ssh/sshd_config
service ssh restart 1>/dev/null 2>/dev/null
service sshd restart 1>/dev/null 2>/dev/null

# banner personalizado
FILE="/etc/bannerssh"

txt_font () {
echo ""
echo -ne $branco"DIGITE O TEXTO PARA O BANNER:"$fim; read ban_ner2
echo ""
echo -e $branco"ESCOLHA A COR PARA:"$fim $ban_ner2
echo -e $pretoCinza"-------------"$fim
echo -e $branco"[1]"$fim $verdeClaro"VERDE"$fim
echo -e $branco"[2]"$fim $vermelhoClaro"VERMELHO"$fim
echo -e $branco"[3]"$fim $azulClaro"AZUL"$fim
echo -e $branco"[4]"$fim $amarelo"AMARELO"$fim
echo -e $branco"[5]"$fim $purpleClaro"ROXO"$fim
echo -e $pretoCinza"-------------"$fim
echo -ne "OPÇÃO [1-5]:"; read ban_ner2_cor

if [ "$ban_ner2_cor" = "1" ]; then
echo '<h6><font color="green">' >> $FILE
a__a="1"
fi
if [ "$ban_ner2_cor" = "2" ]; then
echo '<h6><font color="red">' >> $FILE
a__a="1"
fi
if [ "$ban_ner2_cor" = "3" ]; then
echo '<h6><font color="blue">' >> $FILE
a__a="1"
fi
if [ "$ban_ner2_cor" = "4" ]; then
echo '<h6><font color="yellow">' >> $FILE
a__a="1"
fi
if [ "$ban_ner2_cor" = "5" ]; then
echo '<h6><font color="purple">' >> $FILE
a__a="1"
fi
if [ "$a__a" = "" ]; then
echo '<h6><font color="red">' >> $FILE
fi
unset a__a
echo "$ban_ner2" >> $FILE
echo "</h6></font>" >> $FILE
}

clear

echo -e $branco"MENSAGEN ATUAL:"$fim
echo ""
NUMBER=$(cat $FILE | wc -l)
if [ -z "$NUMBER" ]; then
  echo -e $amarelo"VOCÊ NÃO POSSUI NENHUMA MENSAGEM NO MOMENTO!"$fim
else
  echo -ne ""; cat $FILE
fi
echo ""
echo -ne $branco"DIGITE A MENSAGEM PRINCIPAL:"$fim; read BANNER
echo ""
if [ -z "$BANNER" ]; then
  echo -e $vermelhoClaro"VOCE NÃO DIGITOU NADA!"$fim
  sleep 5
  banner
else
echo -e $branco"ESCOLHA A COR PARA:"$fim $BANNER
echo -e $pretoCinza"-------------"$fim
echo -e $branco"[1]"$fim $verdeClaro"VERDE"$fim
echo -e $branco"[2]"$fim $vermelhoClaro"VERMELHO"$fim
echo -e $branco"[3]"$fim $azulClaro"AZUL"$fim
echo -e $branco"[4]"$fim $amarelo"AMARELO"$fim
echo -e $branco"[5]"$fim $purpleClaro"ROXO"$fim
echo -e $pretoCinza"-------------"$fim
echo -ne $amarelo" OPÇÃO [1-5]:"$fim; read ban_ner_cor
echo '<h1><font>=============================</font></h1>' > $FILE

if [ "$ban_ner_cor" = "1" ]; then
echo '<h1><font color="green">' >> $FILE
a__a="1"
fi
if [ "$ban_ner_cor" = "2" ]; then
echo '<h1><font color="red">' >> $FILE
a__a="1"
fi
if [ "$ban_ner_cor" = "3" ]; then
echo '<h1><font color="blue">' >> $FILE
a__a="1"
fi
if [ "$ban_ner_cor" = "4" ]; then
echo '<h1><font color="yellow">' >> $FILE
a__a="1"
fi
if [ "$ban_ner_cor" = "5" ]; then
echo '<h1><font color="purple">' >> $FILE
a__a="1"
fi
if [ "$a__a" = "" ]; then
echo '<h1><font color="blue">' >> $FILE
fi
unset a__a
echo "$BANNER" >> $FILE
echo '</font> </h3>' >> $FILE
echo '<h1><font>=============================</font></h1>' >> $FILE
while true; do
echo ""
echo -ne ""
read -p "DESEJA ADICIONAR MAIS TEXTOS? [ s | n ]: " sin_nao
if [[ "$sin_nao" = "s" || "$sin_nao" = "S" ]]; then
txt_font
fi
if [[ "$sin_nao" = "n" || "$sin_nao" = "N" ]]; then
break
fi
done
echo '<h1><font>=============================</font></h1>' >> $FILE
echo '</h8><font color="purple">POWERED BY SOUSA TIPS®</font></h8>' >> $FILE
echo '<h1><font>=============================</font></h1>' >> $FILE
if [ -e "$local2" ]; then
rm $local2  > /dev/null 2>&1
cp $local $local2 > /dev/null 2>&1
fi
echo -e "${cor[1]} =================================== ${cor[0]}"
  service ssh reload 1> /dev/null 2> /dev/null
  clear
  echo -e $branco" MENSAGEM ATUAL:"$fim; echo ""
  NUMBER=$(cat $FILE | wc -l)
  if [ -z "$NUMBER" ]; then
    echo -e $vermelhoClaro" VOCÊ NÃO POSSUI NENHUMA MENSAGEM NO MOMENTO!"$fim
  else
    echo -ne ""; cat $FILE
  fi
  echo ""
  echo -e $verdeClaro" MENSAGEM ALTERADA COM SUCESSO!"$fim
fi
echo ""
echo -ne $branco" APERTE ENTER PARA VOLTAR AO MENU..."$fim
read ENTER
menu
exit
