#! /usr/bin/env bash
#
#./dns-zozne-transfer.sh resolvera o nome do servidor dns de um nome de dominio
#executara a transferencia de zona 
# 
#E-Mail:c4duS3curity@gmail.com
#Autor:c4du
#Manutencao:c4du
#
#-------------------------------------------------------------------------------------------#
#./dns-zone-transfer usara a ferramenta host para resolver nome do servidor de DNS de um
#dominio, transferir de zona este servidor
#
#Exemplo: ./dns-zone-transfer.sh -h -v -d nome-dominio
#-h - mostra ajuda do sistema
#-v - mostra versao do sistema
#-d - entrada para nome-dominio
#-------------------------------------------------------------------------------------------#
#Historico: V1.0
#-Menu ajuda
#Instalar ferramenta host
#Resolver nome de DNS
#Trasferir zona
#
#------------------------------------------------------------------------------------------#
#Testado em: GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)
#------------------------------------------------------------------------------------------#
#--------------------------------------VARIAVEIS-------------------------------------------#
MENSAGEM="
  Modo de uso:
  $(basename $0) -h -v -d nome-dominio
  -h) - Ajuda
  -v) - Versao
  -d) - Nome-Dominio
"
VERSAO="1.0"
#------------------------------------------------------------------#
#--------------------------------------TESTES----------------------------------------------#
[ -z "$1" ] && echo "$MENSAGEM" && exit 0
#------------------------------------------------------------------#
#---------------------------------------FUNCOES--------------------------------------------#
MENU()
{
  while test -n "$1"
  do
    case "$1" in
      -h) echo "$MENSAGEM" && exit 0 ;;
      -v) echo "$VERSAO" && exit 0   ;;
       *) break                      ;;
    esac
    shift
  done
}

VARRER()
{
  for server in $(host -t ns "$2" | cut -d "" -f 4); do
    host -l "$2 $server"
  done
}
#------------------------------------------------------------------#
#----------------------------------------EXECUCAO------------------------------------------#
MENU "$1"
VARRER "$1" "$2"
#------------------------------------------------------------------#
