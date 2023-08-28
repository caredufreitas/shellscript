#! /usr/bin/env bash
#
#./analyze-port.sh fara a varredura de um IP atraves da conexao TCP mostrara
#a flag correspondente a porta inserida
#
#E-Mail:c4duS3curity@gmail.com
#Autor:c4du
#Manutencao:c4du
#--------------------------------------------------------------------------#
#./analyze-port usara a ferramenta hping3 atraves do protocolo TCP requesicao ao
#host na rede, obtendo a flag do servico, SYN, SYN/ACK, ACK, FIN, RST
#
#Modo de uso
#sudo ./portas.sh -h -v -e 80 192.168.0.0
#-h) - Ajuda
#-v) - Versao
#-e) - 80 192.168.0.0
#---------------------------------------------------------------------------#
#Historico
#V1.0 - 05-01-2023, Autor:c4du
#Menu 
#Chave flag
#Funcao de varredura
#
#---------------------------------------------------------------------------#
#Testato em: GNU bash, version 5.2.2(1)-release (x86_64-pc-linux-gnu)
#---------------------------------------------------------------------------#
#-------------------------------VARIAVEIS-----------------------------------#
MENSAGEM="
  Modo de uso:
  ./$(basename $0) -h -v -e 80 192.168.0.0
  -h) - Ajuda
  -v) - Versao
  -e) - 80 192.168.0.0
"

VERSAO="1.0"
CHAVE_VARRER=0
#------------------------------------------------------------#
#-------------------------------TESTES--------------------------------------#
[ -z "$1" ] && echo "$MENSAGEM" && exit 0
[ ! -x "$(which hping3)" ] && sudo apt install hping3 && exit 0 #hping3 instalado
#------------------------------------------------------------#
#--------------------------------FUNCOES------------------------------------#
MENU()
{
  while test -n "$1"
  do
    case "$1" in
      -h) echo "$MENSAGEM" && exit 0 ;;
      -v) echo "$VERSAO" && exit 0   ;;
      -e)CHAVE_VARRER=1              ;;
       *) break                      ;;
    esac
    shift
  done
}

VARRER()
{
 local porta="$2"
 local hosts="$3"
 hping3 --syn -p $porta $hosts
}
#------------------------------------------------------------#
#--------------------------------EXECUCAO-----------------------------------#
MENU "$1"
[ "$CHAVE_VARRER" -eq 1 ] && VARRER "$1" "$2" "$3"
#---------------------------------------------------------------------------#
