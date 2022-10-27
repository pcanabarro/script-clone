#!/bin/bash

if [ ! -d logs ]
then
	mkdir logs
	echo "Directory created"
fi	

read_process() {

process=$(ps -e -o pid --sort -size | head -n 10 | grep [0-9])

for pid in $process
do
	process_name=$(ps -p $pid -o comm=)
	echo -n $(date +%F,%H:%M:%S) >> logs/$process_name.log
	process_size=$(ps -p $pid -o size | grep [0-9])
	echo "$(bc <<< "scale=2;$process_size/1024")MB" >> logs/$process_name.log
done
}

read_process

if [ $? -eq 0 ]
then
	echo "All files saved"
else
	echo "Error to save"
fi
