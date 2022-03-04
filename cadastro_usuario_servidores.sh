#!/bin/bash
SERVERS="192.168.100.2 192.168.100.3"
add_user(){
   count=0
   echo -ne "Informe nome do usuario\n"
   read NOME_USUA
   while [ -z "$NOME_USUA" ]; do
        echo -ne "Informe nome do usuario\n"
      read NOME_USUA
     done
   echo -ne "{FONTE}33[40;32mInforme a senha do usuario:\n{FONTE}33[m"
   read SENHA_USU
   while [ -z "$SENHA_USU" ]; do
        echo -ne "Informe a senha do usuario:\n"
      read SENHA_USU
     done
//adc
   $(adduser $NOME_USUA -p $SENHA_USU -g users && echo $NOME_USUA:$SENHA_USU | chpasswd)
   for servs in $SERVERS ;do
      ssh root@$servs "adduser $NOME_USUA"fu" -p $SENHA_USU -g users && echo $NOME_USUA"fu":$SENHA_USU | chpasswd && exit "
   done

   
//lock
lock_user(){
   count=0
   echo -ne "Informe nome do usuario"
   read NOME_USUA
   for servs in $SERVERS ;do
      ssh root@$servs "usermod -L $NOME_USUA && exit"
   done

   echo -e "Contas bloqueadas"
}
menu(){
	clear
	echo -ne " 1 - Adicionar usuario \n"
	echo -ne " 2 - Bloquear usuario \n"
	echo -ne " 3 - Sair \n"
	read OPCAO
	case $OPCAO_SEL in
   		1) add_user
  	 	;;
   		2) lock_user
   		;;
   		3) clear; exit 0;
   		;;
	*) 
   ;;
    esac
}


menu
