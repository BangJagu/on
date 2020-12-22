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

clear
# MENU1 (GERENCIAR USUARIOS)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo ""
echo -e $branco" GERENCIADOR DE USUARIOS"$fim
echo ""
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $amarelo" [1]"$fim $branco"CRIAR USUÁRIOS SSH"$fim
sleep 0.2
echo -e $amarelo" [2]"$fim $branco"CRIAR USUÁRIO TEMPORÁRIO"$fim
sleep 0.2
echo -e $amarelo" [3]"$fim $branco"CRIAR BKP USUÁRIOS"$fim
sleep 0.2
echo -e $amarelo" [4]"$fim $branco"ALTERAR DATA DO USUÁRIO"$fim
sleep 0.2
echo -e $amarelo" [5]"$fim $branco"ALTERAR LIMITE DE CONEXÕES"$fim
sleep 0.2
echo -e $amarelo" [6]"$fim $branco"MUDAR SENHA"$fim
sleep 0.2
echo -e $amarelo" [7]"$fim $branco"REMOVER USUÁRIOS VENCIDOS"$fim
sleep 0.2
echo -e $amarelo" [8]"$fim $branco"REMOVER USUÁRIO"$fim
sleep 0.2
echo -e $amarelo" [9]"$fim $branco"VOLTAR AO MENU PRINCIPAL"$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 0.2
echo ""

read -p " DIGITE SUA OPÇÃO: [1-9] " opcao
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $cinzaClaro" OPÇÃO ESCOLHIDA:"$fim $branco$opcao$fim

case $opcao in

1)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
criarusuario
;;
2)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
criarusuariotemporario
;;
3)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
userbkp
;;
4)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
mudardata
;;
5)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
alterarlimite
;;
6)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
alterarsenha
;;
7)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
expcleaner
;;
8)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
remover
;;
9)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
menu
;;
*)
echo -e $vermelhoClaro" OPÇÃO INVÁLIDA!!!"$fim
sleep 4
menu1
esac
