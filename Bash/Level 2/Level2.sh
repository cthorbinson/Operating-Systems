if [ $# == "2" ]; then

        if [ -r $1 ]; then
        echo "File 1 exists"
		else
		echo "File does not exist"
        fi

			if [ -r $2 ]; then
			echo "Folder exists"
			cp $1 $2
			echo "Quick Copy Complete"
			else
			echo "Folder does not exist"
			mkdir $2
			cp $1 $2
			echo "Quick Copy Complete"
			fi


elif [ $# != "2" ]; then

selection=

until [ "$selection" = "1" ]; do

echo "== Main Menu =="
echo "1) Back Up"
echo "2) Create back up file"
echo "3) Exit"
read userinput

case $userinput in
1)
echo "==Back up Menu=="
echo "Enter a file to back up"
read backupfile
echo "Enter back up location"
read backuplocation

	if [ -r $backupfile ]; then
	echo "File 1 exists"
	else
	echo "File does not exist"
	fi

			if [ -r $backuplocation ]; then
				echo "Folder exists"
				cp $backupfile $backuplocation
				echo "File" $backupfile "has been backed up to location" $backuplocation "sucsesfully"
					else
						echo "Creating back up location"
						mkdir $backuplocation
						cp $backupfile $backuplocation
						echo "File" $backupfile "has been backed up to location" $backuplocation "sucsesfully"
			fi
;;
2)
echo "Option 2 selected"
;;
3)
echo "Exitting Program"
exit
;;
*)
echo "Unknown option"
;;
esac

fi
