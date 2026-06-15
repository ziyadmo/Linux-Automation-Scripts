#!/bin/bash

CVS_FILE="employee.csv"

if [ "$UID" -ne 0 ]
then
	echo "This script must be run as root."	
	exit 1
fi

if [ ! -f $CVS_FILE ]
then
	echo "CVS file not found: $CVS_FILE "
	exit 1
fi
while IFS=, read -r username full_name
do
	password=$(openssl rand -base64 12 )
	useradd -m -c "$full_name" "$username"
	echo "$username:$password" | chpasswd

	chage -d 0 "$username"
	echo "User created: $username" 
	echo "Full Name: $full_name"
	echo "Random password: $password"
	echo "---------------------------"
	
	echo $username,$password >> out,txt
done < $CVS_FILE

echo "User creation complated!. "

