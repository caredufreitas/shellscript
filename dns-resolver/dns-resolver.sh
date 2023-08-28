#!/usr/bin/env bash
#
#./dns-resolver.sh - fara varredura de sub-dominios carregados em uma lista
#
#------------------------------------------------------------------------#
#Site:
#Autor: c4du
#Manutencao: c4du
#------------------------------------------------------------------------#
#./dns-resolver.sh usara comando host para resolver nomes de sub-dominios 
#carregado por uma lista com nomes de possiveis host
#
#Exemplo: ./dns-resolver.sh -h -v -d
#-h - ajuda
#-v - versao
#-d - dominio
#------------------------------------------------------------------------#
#Historico
#V1.0 - 03-01-2023, Autor, c4du
#Menu de ajuda
#Versao 
#Instalar pacote host
#Range no intervalo da lista
#------------------------------------------------------------------------#
#Testado em:GNU bash, version 5.2.2(1)-release (x86_64-pc-linux-gnu)
#------------------------------------------------------------------------#
#---------------------------VARIAVEIS-----------------------------#
MENSAGEM="
Modo de uso:
  $(basename $0) -h -v -d nome dominio
  -h)Ajuda do sistema
  -v)Versao do sistema
" 
VERSAO="1.0"
#-------------------------------------------------------#
#---------------------------TESTES--------------------------------#
[ -z $1 ] && echo "$MENSAGEM" && exit 0
[ ! -x "$(which host)" ] && sudo apt install host 1 > /dev/null 1>&2 #host intalado  
#-------------------------------------------------------#
#---------------------------FUNCOES-------------------------------#
Menu()
{
  while test -n "$1"
  do
    case "$1" in
      -h) echo "$MENSAGEM" && exit ;;
      -v) echo "$VERSAO"   && exit ;;
      -d) Varrer                   ;;
       *) break                    ;;
    esac
    shift
  done
}

Varrer()
{
  for url in $(cat dns.lst);do
    host $url.$1 | grep "has address"
  done
}
#-------------------------------------------------------#
#---------------------------EXECUCAO------------------------------#
Menu "$1"
#-------------------------------------------------------#
