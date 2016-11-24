#!/bin/bash

printf "Search rockyou.txt for a text string.\n\n"
printf "This is useful when testing passwords against possible brute force.\n\n"

printf "Checking for rockyou.txt please wait...\n\n"

if [ -a rockyou.txt ]; then
	printf "File found, continuing\n\n"
else
	read -p "Download it now? [y/N] " response
	if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
	then
		printf "\n"
		printf "Downloading, please wait...\n\n"
		wget http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2
		bzip2 -d rockyou.txt.bz2
	else
		printf "Cannot run without rockyou.txt, exiting.\n"
		exit
	fi
fi

read -p "Please enter a string: " query

result=$(cat rockyou.txt | grep -x $query)

if [ -z $result ]
then
	printf "\n"
	printf "No match found\n"
else
	printf "\n"
	printf "Match found\n"
fi
