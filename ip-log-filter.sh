#!/bin/bash

cd $HOME/shell-2

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]
then
	cat apache.log | egrep $1
	if [ $? -ne 0 ]
	then
		echo "Not Found"
	fi
else
	echo "Invalid Format"
fi

