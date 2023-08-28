#! /usr/bin/env bash
#
#./scan-ip varrera um range de ip, mostrara host ativos por protocolo icmp de 0 a 255
#
#E-Mail:c4duS3curity@gmail.com
#Autor:c4du
#Manutencao:c4du
#------------------------------------------------------------------------------#
#./scan-ip usara a ferramenta nmap varrer o ranger de ip, mostrara
#host ativo neste ranger do 0 a 255 formatada
#
#Exemplo de uso:
#./scan-ip -h -v -r 192.168.0.0/24
#------------------------------------------------------------------------------#
#Historico
#V1.0 - 05-01-2023, Autor:c4du
#Menu do programa
#Versao
#Leitura da variavel reservada
#Chave flag
#Varredura ranger-ip
#Saida formatada
#
#------------------------------------------------------------------------------#
#Testado em: GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)
#------------------------------------------------------------------------------#
#-------------------------------------VARIAVEIS--------------------------------#
MENSAGEM="
  Modo de uso:
  ./$(basename $0) -h -v -r 192.168.0.0/24
  -h) - Ajuda
  -v) - Versao
  -r) - 192.168.0.0/24
"
VERSAO="1.0"
CHAVE_VARRER=0
#---------------------------------------------------------------#
#-------------------------------------TESTES-----------------------------------#
[ -z "$1" ] && echo "$MENSAGEM" && exit 0
[ ! -x "$(which nmap)" ] && sudo apt install nmap && exit 0 #nmap instalado
#---------------------------------------------------------------#
#-------------------------------------FUNCOES----------------------------------#
MENU()
{
  while test -n "$1"
  do
    case "$1" in
      -h) echo "$MENSAGEM" && exit 0  ;;
      -v) echo "$VERSAO"  && exit  0  ;;
      -r) CHAVE_VARRER=1              ;;
       *) break                       ;;
    esac
    shift
  done
}

VARRER()
{
  local range="$2"
  nmap -sP $range | grep for | cut -d " " -f 5
}
#---------------------------------------------------------------#
#-------------------------------------EXECUCAO---------------------------------#
MENU "$1"
[ $CHAVE_VARRER -eq 1 ] && VARRER "$1" "$2"
#---------------------------------------------------------------#
