#!/bin/bash
##### Nome: Álisson Wegner Sousa
##### Matricula: 201812969
##### necessario instalação dialog
apt-get install dialog -y
ops1(){
        opcao2=$(dialog                                       \
            --stdout                                 \
            --title 'Opção'                          \
            --menu 'Escolha uma das opções abaixo:'  \
            0 0 0                                     \
            1  'HOST'           \
            2  'REDE'               \
            3  'SUB-REDE'   \
            4 'Retorna' \
            5 'sair')

        		
            case "$opcao2" in  
                '1')
                        host_ip=$(whiptail --title "opção" --inputbox "Informe o host" 10 60 3>&1 1>&2 2>&3)                     
                    resultado=$( nmap -sU --open -p161 $host_ip);                              
                  whiptail --title "Resultado" --msgbox "$resultado" 10 100

            
                ;;
                '2')
                    host_ip=$(whiptail --title "opção" --inputbox "Informe o IP" 10 60 3>&1 1>&2 2>&3)                     

                    resultado=$(nmap -sU --open -p161 $host_ip)
                    clear
                    echo "$resultado"
                    #whiptail --title "Resultado" --msgbox " $resultado " 10 100


                ;;
                '3')

                    mascara=$(whiptail --title "opção" --inputbox "informe uma mascara de rede" 10 60 3>&1 1>&2 2>&3)                     
                    host_ip=$(whiptail --title "opção" --inputbox "Informe o IP" 10 60 3>&1 1>&2 2>&3)                     
                    clear
                    nmap -sU --open -p161 $host_ip/$mascara
                
                ;;
                '4')
                main
                ;;
                '5')
                exit
                clear
            esac

}
ops2(){
    		host_ip=$(whiptail --title "opção" --inputbox "Informe o IP ou host" 10 60 3>&1 1>&2 2>&3) 
        oid_vm=$(whiptail --title "opção" --inputbox "Informe o OID" 10 60 3>&1 1>&2 2>&3) 

        #oid padrao exemplop 1.3.6.1.2.1.1.5.0
        
        
        versao=$(whiptail --title "opção" --inputbox "Informe a versão:(padrao v1)" 10 60 3>&1 1>&2 2>&3)
        comunidade=$(whiptail --title "opção" --inputbox "Qual a comunidade:(padrao public)" 10 60 public 3>&1 1>&2 2>&3)
        if [ $versao != 1 ] || [$versao != 2] || [$versao != 3]
        then
            versao=$("1");
        fi
        if [  $comunidade == "" ] 
        then
            comunidade=$("public");
            fi
        
       resultado=$(snmpget -v $versao -c $comunidade $host_ip $oid_vm |awk '{print $4}')



         whiptail --title "Resultado" --msgbox "$resultado" 10 50     
       main
}
ops3(){
        host_ip=$(whiptail --title "opção" --inputbox "Informe o IP ou host" 10 60 3>&1 1>&2 2>&3)
        clear
        snmpwalk -c public -v1 $host_ip;

}
main(){
opcao=$(dialog                                       \
   --stdout                                 \
   --title 'Opção'                          \
   --menu 'Escolha uma das opções abaixo:'  \
   0 0 0                                     \
   1       'Escanear host, sub-rede, rede'           \
   2     'Obter o valor de um OID de um host/dispositivo gerenciado'               \
   3  'Obter todos objetos gerenciados em um host/dispositivo gerenciado'   \
   4 'sair')
   i='0';
while true; do
    case "$opcao" in 

        '1') 
        ops1 
        ;;
        '2') 
        ops2 
        ;;
        '3') 
        ops3 
        ;;
        '4') 
        exit
        clear
    esac
done
}
main;
