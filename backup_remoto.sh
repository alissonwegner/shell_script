#!/bin/bash
export DEST=/backup/src_dest
export ORI=/home/marta/src_ori
backup_total(){
	data=$(date +%d-%m-%Y-%T)
	tar -cvpzf /home/alisson/backup$data.tar.gz $ORI
        scp -r /home/alisson/backup.tar.gz alisson@192.168.100.2:$DEST
}



backup_total

