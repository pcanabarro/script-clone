#!/bin/bash

cd $HOME/shell-2

if [ -z $1 ]
then
	while [ -z $req ]
	do
	read -p "Choose a parameter (GET, POST, PUT or DELETE): " req
	upper=$(echo $req | awk '{ print toupper($1) }')
	done
else
	upper=$(echo $1 | awk '{ print toupper($1) }')
fi

case $upper in
	GET)
	cat apache.log | grep GET
	;;

	POST)
	cat apache.log | grep POST
	;;

	PUT)
	cat apache.log | grep PUT
	;;

	DELETE)
	cat apache.log | grep DELETE
	;;

	*)
	echo "Invalid Parameter"
esac
