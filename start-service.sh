#! /usr/bin/env bash
# start-service.sh - inicia o servico do cliente na entrada,
# mostra o seu identificador de processo, mostra porta em execusao.
#
# Site: c4duS3curity@gmail.com
# Autor: c4du
# Manutencao: c4du
#------------------------------------------------------------------#
# Historico: iniciara o servido digitado pelo cliente, mostrara seu 
# numero de processo no gerenciador de tarefas, mostrara porta de
# servico em execusao.
#
# Exemplos:
# $ ./start-service.sh -h -v start-service
# Neste exemplo mostra ajuda do programa, versao do programa,
# reiniciar o servico do sistema inserido pelo usuario, mostrara
# seu identificador de processo, porta em execucao.
# 
#-------------------------------------------------------------------#
#Historico
#v1.0 31\01\23, Autor: c4du
#Menu
#Versao
#Entrada nome do servico para restart.
#Identificador do processo.
#Porta em execucao
#-------------------------------------------------------------------#
#Testado: GNU bash, version 5.2.15(1)-release (x86_64-pc-linux-gnu)
#
#--------------------------------VARIAVEIS---------------------------#
MENU="
    $( basename $0 ) -h -v start-service [Ex:Apache2]
    -h)- Ajuda
    -v)- Versao
    -s)- Start-service
"
VERSAO="1.0"
CHAVE_INICIAR=0
VERDE="\033[32;1m"
PADRAO="\e[0m"
#-----------------------------------------------------#
#--------------------------------TESTES------------------------------#
[ -z "$1" ] && echo "$MENU" && exit 0
#-----------------------------------------------------#
#--------------------------------FUNCOES-----------------------------#
while test -n "$1"
do
    case "$1" in
        -h) echo "$MENU" && exit 0                       ;;
        -v) echo "$VERSAO" && exit 0                     ;;
        -s) CHAVE_INICIAR=1                              ;;
         *) break                                        ;;
    esac
    shift
done

Iniciar(){
 local nome="$1"
 sudo service $nome restart
 echo -e "${VERDE}SERVICOS ATIVOS ...${PADRAO}"
 ps aux | grep $nome
 echo -e "${VERDE}PORTAS EXECUTADAS ...${PADRAO}"
 sudo netstat -lntp
}
#------------------------------------------------------#
#---------------------------------EXECUCAO---------------------------#
[ $CHAVE_INICIAR -eq 1 ] && Iniciar "$1"
#------------------------------------------------------#
