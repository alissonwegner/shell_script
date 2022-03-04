#!/bin/bash

echo -e "==========================================================="
echo -e "Relatorio da Maquina:$(hostname)";
echo -e "Data/Hora: $(date +%c%Z%t%Y)";
echo -e "==========================================================="


echo -e "UID $(id- u)"
echo -e " Total usado no /home/alisson:$(df -h /home/alisson | awk '{print $4}')"
echo -e "Ultimo Login"
last


