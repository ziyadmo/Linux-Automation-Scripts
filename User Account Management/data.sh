#!/bin/bash

read -p "Enter your username: " user
read -p "Enter your full_name: " name
INFO=$user,$name

read -p "Please, Confirm that you have entered the correct information. Is everything correct? [y/n]" input

case $input in
	N | n)
		exit
		;;
	Y | y)
		echo $INFO >> employee.csv
		;;
	*)
		exit
		;;
	
esac

echo "Your data has been stored successfully"




