#! /usr/bin/env bash
#
#./dns-reverse.sh resolvera IP por nome de dominio
#
#------------------------------------------------------------------#
#E-Mail:c4duS3curity@gmail.com
#Autor:c4du
#Manutencao:c4du
#-------------------------------------------------------------------#
#./dns-reverse.sh usara um laco de repeticao com um 
#intervalo de 255 respectivos host 
#
#Exemplo ./dns-reverse.sh -h -v -i
#-h - ajuda
#-v -versao
#-i - ip
#-------------------------------------------------------------------#
#Historico
#V1.0 - 04-01-2023, Autor:c4du
#Menu de ajuda
#Versao
#Instalar ferramenta host
#Executar range
#--------------------------------------------------------------------#
#Testado em:GNU bash, version 5.2.2(1)-release (x86_64-pc-linux-gnu)
#--------------------------------------------------------------------#
#-----------------------------------VARIAVEIS------------------------#
MENSAGEM="
  Modo de uso:
  $(basename $0) -h -v -i 192.168.0
  -h) - Ajuda
  -v) - Versao
  -i) - 192.168.0
"
VERSAO="1.0"
#-------------------------------------------------------#
#-----------------------------------TESTES---------------------------#
[ -z "$1" ] && echo "$MENSAGEM" && exit 0 
#-------------------------------------------------------#
#-----------------------------------FUNCOES--------------------------#
MENU()
{
  while test -n "$1"
  do
    case "$1" in
      -h) echo "$MENSAGEM" && exit 0 ;;
      -v) echo "$MENSAGE"  && exit 0 ;;
       *) break                      ;;
    esac
    shift
  done
}

VARRER()
{
  for hosts in $(seq 0 255); do
    echo -e "Varrendo host => $2.$hosts"
    host "$2.$hosts" | grep "=> has address"
  done
}
#-------------------------------------------------------#
#------------------------------------EXECUCAO------------------------#
MENU "$1"
VARRER "$1" "$2"

#-------------------------------------------------------#

