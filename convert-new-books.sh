#!/bin/bash

convert_png() {
	
	local image_path=$1
	local prefix=$(ls $image_path | awk -F. '{ print $1 }')
	convert $prefix.jpg $prefix.png
}

find_file() {

	cd $1
	for file in *
	do
		local path_file=$(find $HOME/shell-1/new-books -name $file)
		if [ -d $path_file ]
		then
			find_file $path_file
		else
			convert_png $path_file
		fi
	done
}

find_file $HOME/shell-1/new-books 

if [ $? -eq 0 ]
then
	echo "All files converted"
else
	echo "Error to convert"
fi
