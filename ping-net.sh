#! /usr/bin/env bash
#./ping-net.sh enviara um pacote icmp para uma sequencia de 254 hots na rede.
#
#E-Mail: c4duS3curity@gmail.com
#Autor: c4du
#Manutencao: c4du
#-----------------------------------------------------------------------------#
# Este programa enviara pacote icmp para uma sequencia de 254 hosts na rede
#
#Modo de uso ./ping-net.sh -a -v -h [Ex: -h 192.168.0.] 
#-a) - Ajuda
#-v) - Versao
#-h) - host
#
#-----------------------------------------------------------------------------#
#Historico:
#V1.0 - 30/01/23, Autor c4du
#Menu
#Versao
#Captura parametro do cliente
#-----------------------------------------------------------------------------#
#Testado: 
# GNU bash, version 5.2.15(1)-release (x86_64-pc-linux-gnu)
#-----------------------------------------------------------------------------#
#-----------------------------VARIAVEIS---------------------------------------#
MENU="
 ./$(basename $0) -a -v -h 192.168.0
 -a) - Ajuda
 -v) - Versao
 -h) - IP Host
"
VERSAO="1.0"
CHAVE_PING=0
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
PADRAO="\e[0m"
DEL=:
#-----------------------------------------------------------#
#-----------------------------TESTES------------------------------------------#
[ -z "$1" ] && echo "$MENU" && exit 0
[ ! -x "$(which ping)" ] && sudo apt install ping && exit 0 #ping instalado
#-----------------------------------------------------------#
#------------------------------FUNCOES----------------------------------------#
Menu()
{
    while test -n "$1"
    do
        case "$1" in
          -a) echo "$MENU" && exit 0   ;;
          -v) echo "$VERSAO" && exit 0 ;;
          -h) CHAVE_PING=1             ;;
           *) break                    ;;
        esac
        shift
    done
}

PingNet()
{
    echo -e "${VERDE}Varrendo host....${PADRAO}"
    for host in $(seq 1 254);
    do
        ping -c 1 "$2.$host" > /dev/null
        if [ $? -eq 0 ]
        then
            echo -e "${VERDE}Host encontrado: $2.$host${PADRAO}"
        else
            echo -e "${VERMELHO}Falha ao Ping no host: $2.$host${PADRAO}"
       fi
    done
}
#-----------------------------------------------------------#
#------------------------------EXECUCAO---------------------------------------#
Menu "$1"
[ "$CHAVE_PING" -eq 1 ] && PingNet "$1" "$2"
#-----------------------------------------------------------#
