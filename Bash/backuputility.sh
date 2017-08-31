#!/bin/bash

#First IF statment checks if users have entered 2 extra parameters to command line.
if [ $# == "2" ]; then

#Initiates the variable quick copy that will be used to ensure both file and folder exists.
quickcopy=0

		#Checks that the file exists it will incriment quick copy by 1.
        if [ -r $1 ]; then
        echo "File 1 exists"
		let quickcopy++
        fi

			#Checks that the folder entered exists and will incriment quick copy by 1.
			#If the folder does not exist it will create the folder using the entered parameter and then incriment quick copy by 1.
			if [ -r $2 ]; then
			let quickcopy++
			else
			mkdir $2
			let quickcopy++
			fi
				
				#If both file and folder exists then quick copy will be equal to 2 and the program will perform a copy command.
				#Once the copy is complete the program will message out a sucsess message to the user and terminate. 
				#If quick copy does not equal to 2 then an incorrect parameter has been entered and a message will be displayed to the user. 
				if [ "$quickcopy" = "2" ]; then
				cp $1 $2
				echo "Quick Copy Complete"
				else
				echo "Incorrect file parameters entered"
				fi

#Otherwise continue to Main Menu function.
else

#loop is initated to begin a while loop to allow the program to return to the main menu once an operation has been completed. 
#While the vaiable loop is equal to 0 the program will continue to display the menu.

loop=0
while [ "$loop" = "0" ]; do

#Displays the Main Menu to the user and asks them to make a choice, their choice will be stored in the variable input.

echo "=============================="
echo "=======Back Up Utility========"
echo "=============================="
echo ""
echo "Please select an option from the list below:"
echo "1) Run a back up"
echo "2) Create backup Script"
echo "3) Help!"
echo "4) Exit"
read input

#The result of input is fed into the case statement which will determine which part of the program the users wishes to use. 

case $input in
1) 

#The backup section displaying a menu to the user prompting them to input a file to backup and the backup location.
echo "=============================="
echo "=======Run a Back Up=========="
echo "=============================="
echo ""
echo "Please enter the file you wish to back up:"
read backupfile
echo "Please enter where you would like the file to be backed up:"
read backuplocation

#Initiates the variable value that will be used to ensure both file and folder exists.
value=0

	#If statment to check that the file exists. 
	#If the file exists it will incriment value by 1.
	#If the file does not exist it will display a message to the user that the file does not exist. 
	if [ -e $backupfile ]; then
	let value++
	fi

		#Checks that the backup location exists.
		#If the file exists it will add 1 to value.
		#If not it will create the back up folder and add 1 to value. 
		if [ -e $backuplocation ]; then
		let value++
		else
		if [ "$value" = "1" ]; then
		mkdir $backuplocation
		let value++
		fi
		fi

			#Checks that value is equal to 2 so both file and folder exist. 
			#When value is equal to 2 the program will copy the file to the backup location.
			#Once copied the program will display a message to the user.
			#If the value is not equal to 2 the program will display a message to the user and go back to the Main Menu.
			if [ "$value" = "2" ]; then
			cp $backupfile $backuplocation
			echo "File" $backupfile "has been backed up to location" $backuplocation "sucsesfully"
			else
			echo "Incorrect file entered."
			fi

;;   
   
2) 

#Program asks user to enter several values such as file to back up, back up location, 
#where they would like to store their backup script and name of the backup script.
#Those variables will then be placed into variables.
echo "=============================="
echo "====Create Backup Script======"
echo "=============================="
echo ""
echo "Enter the file you would like backed up:"
read backupscriptfile
echo "Enter where you would like the filed backed up to:"
read backupscriptlocation
echo "Enter where you would like the backup script stored and its name (e.g. /home/pi/backup):"
read backupscriptstore


	#This section of code will output the back up details into a scipt file and will change the permissions so it can be read by any user. 
	#Once sucsesful a message will be displayed to the user. 
	echo cp $backupscriptfile $backupscriptlocation > $backupscriptstore.sh
	chmod 777 $backupscriptstore.sh
	echo "The back up script has been sucsesfully created"

;;

3)

echo "=============================="
echo "============Help=============="
echo "=============================="
echo ""
echo "Welcome to the help section."
echo ""
echo "Quick Copy"
echo ""
echo "To use the quick copy enter the program name into the command line and enter the file you wish to backup along with the folder."
echo "The file and folder must be given in its full file name form."
echo "The backup utility will then check the file to be backed up exists along with the folder."
echo "If the folder does not exist then the back up utility will automatically create it."
echo "Below is an example quick backup command line."
echo ""
echo "Example ./backuputility /home/user1/file.txt /home.user1/backupfolder"
echo ""
echo "Menu Mode"
echo ""
echo "The menu mode offers users 2 backup options. They can choose to run a single backup or create a back up script to run multiple back ups."
echo ""
echo "Single Backup Mode"
echo ""
echo "When users enter the single back up mode they will be asked to enter a file to back up and a folder to back the file up to."
echo "These should be given in their full file format adding in folders."
echo "The back up utility will ensure that the file exists and that the folder also exists, if the folder does not exist the utility will create it."
echo "If the file does not exist it will send a message and the user will be directed back to the main menu."
echo ""
echo "Creating a back up script"
echo ""
echo "When users wish to run a back up reguarly they are able to set up a back up script."
echo "Users are prompted to enter the back up file and folder alongside where the back up script should be created and what it should be called."
echo "It is important that users are extra careful when entering the file and folder as these values are not checked for integrity."
echo ""

;;


4) echo "Exiting"; sleep 2; loop=1 ;;
#The exit option will display a message to the user, sleep the message so it appears on screen for a few seconds then change the value.
#of loop to 1 so it will exit the loop.


esac
done
fi