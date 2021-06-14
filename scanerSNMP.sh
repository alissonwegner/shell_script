#!/bin/bash
###scaner de rede obtendo todas maquinas que utilizam protocolo SNMP e obtendo hostname e OID
#author: Álisson Wegner Sousa
#email: alissonwegner@redes.ufsm.br


for I in $( sudo nmap -sU -p161 172.16.139.* | awk '{if ($1 == "Nmap")print $5}' | grep 1 );
do
        echo -n
        IP_ARRAY=(" ${I} ");
        echo "ip: $IP_ARRAY"
        HOSTNAME_ARRAY=$(snmpget -v 1 -c public $IP_ARRAY  1.3.6.1.2.1.1.5.0 |awk '{print $4}');
        echo "hostname: $HOSTNAME_ARRAY"
        OID_ARRAY=$(snmpget -v 1 -c public 172.16.139.14  1.3.6.1.2.1.1.2.0 |awk '{print $4}');
        echo "oid: $OID_ARRAY"
        echo "___________________________________________________"
        echo " ip: $IP_ARRAY hostname: $HOSTNAME_ARRAY OID: $OID_ARRAY" >> info.txt


done
