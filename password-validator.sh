#!/bin/bash

#Entered User password
echo "Entered password is :  $1"

#Global variable to store password
password=$1

#Global variable to store password length
len="${#password}"

#Global variables to store color codes
green='\033[0;32m'
red='\033[0;31m'
clear='\033[0m'

function validatePassword()
{
#To check password length is greater than or equal to 10
if test $len -ge 10 ; then

	#To check password contains numbers
	 echo "$password" | grep -q [0-9]
		if test $? -eq 0; then

			#To check password contains capital alphabets
			echo "$password" | grep -q [A-Z]
				if test $? -eq -0; then

					#To check password contains small alphabets
					echo "$password" | grep -q [a-z]
						if test $? -eq 0; then					
							echo -e "${green}password length valid + contains number + captial + small alphabets ${clear}"
							echo "Exit code is : " $? 
							exit 0
						else
							echo -e  "${red}password lenght valid + contains number + capital BUT NO small alphabets ${clear}"
							exit 1
										
						fi
				else
					echo -e "${red} password length valid + contains number + BUT no capital alphabets ${clear}"
					exit 1
				fi
		else
			echo -e "${red}password length valid + BUT no numbers ${clear}"
			exit 1
			 
				
		fi
else
		echo -e "${red}password length is invalid, should be at least 10 ${clear}"
		exit 1
		
fi
}

#calling validatePassword function
validatePassword $password 

