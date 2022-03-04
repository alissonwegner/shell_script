#!/bin/bash
uso_cpu='0'
while :
do
	atual=$(top -bn1 | grep load | awk '{printf "%2.f", $(NF-2)}')
	
	if [[ ${atual} -gt ${uso_cpu} ]] 
	then 
		echo DATA ATUAL: >> cpu.txt
		date +%T-/%d/%m/%Y >> cpu.txt
		echo uso de cpu acima de 80% >>cpu.txt
		processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])
		for pid in $processos
			do
        		echo $(ps -p $pid -o comm=)>> cpu.txt
			done
	echo "final"
	fi
	sleep 2
done
