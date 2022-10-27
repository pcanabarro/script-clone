#!/bin/bash

PATH="../books-images"

convert_image() {

cd $PATH

if [ ! -d "/books-images/png/" ]
then
	mkdir png /books-images/
	echo "Directory created"
fi

for image in *.jpg
do
	local prefix=$(ls $image | awk -F. '{ print $1 }')
	convert $prefix.jpg png/$prefix.png
done
}

convert_image 2>error_logs.txt

if [ $? -eq 0 ]
then
	echo "All files converted"
else 
	echo "Error to convert"
fi
