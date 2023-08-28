#!/usr/bin/env bash
# ./impressao.h - inciar uma impressao no scaner
# extensao padrao pdf, armazenar no diretorio atual de execucao do script
#
# E-Mail:c4duS3curity@gmail.com
# Autor:c4du
# Manutencao:c4du
#
#-------------------------------------------------------------------------------#
# ./impressao.sh usara a biblioteca sane para funcao do scanner de impressao
# saida da extensao em pdf.
#
# Exemplo: ./impressao.sh -h -v -n
# -h, mostrara ajuda do sistema.
# -v, mostrara versao do sistema.
# -n, inserir com o parametro nome para arquivo.pdf
#
#-------------------------------------------------------------------------------#
#
# Historico:
# v 1.0 - 28-07-2022, Autor, c4du.
# Menu de ajuda, instalar sane pacotes impressora epson,
# printer-driver-escpr sane, imprimir arquivo.pdf
#
#-------------------------------------------------------------------------------#
# Testado em: GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)
#-------------------------------------------------------------------------------#
#----------------------------VARIAVEIS------------------------------------------#
MENSAGEM="
  Modo de USO:
  $(basename $0) -h -v -n nome
  -h) Ajuda do Sistema
  -v) Versao do sistema
"
VERSAO="1.0"
#----------------------------------------------------------#
#----------------------------TESTES---------------------------------------------#
[ -z $1 ] && echo "$MENSAGEM" && exit 0
[ ! -x "$(which sane)" ] && sudo apt install sane 1 > /dev/null 1>&2 #sane instalado.
#----------------------------------------------------------#
#----------------------------FUNCOES--------------------------------------------#
Menu()
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

Scanear()
{
  echo "Scaneando.. $1 $2.pdf"
  scanimage --device-name=epson2 --format=pdf --mode Color --preview=yes --resolution 600 -pv -o "$2".pdf
}
# browser default
Vizualizar()
{
  echo "Visualizando.. $1 $2.pdf"
  google-chrome "$2".pdf
}
#-----------------------------------------------------------#
#-----------------------------EXECUCAO------------------------------------------#
Menu "$1"
Scanear "$1" "$2"
Vizualizar "$1" "$2"
#-----------------------------------------------------------#
