@echo off
REM #########################################################################################################################################################
REM ##################################        Checks to see if any parameters have been entered into the command line     ###################################
REM #########################################################################################################################################################
REM If %1 is a null value go to the Main MENU
REM Otherwise user wishes to perform quick copy and script will go to Command.
if "%1"=="" (
	If "%2"=="" (
		goto :Menu)
) Else (
goto :Command
)

REM #########################################################################################################################################################
REM ##################################              Main Menu     ###########################################################################################
REM #########################################################################################################################################################

REM Main Menu will be displayed to user if they decide not to use quick copy.
REM User has choice to either perform back up or to exit program.
REM Users selection will be placed in select variable which will then be used in an IF statement to determine which action the users requested.

:MENU

ECHO.
ECHO .......................................................
ECHO CHOOSE FROM AN OPTION BELOW
ECHO .......................................................
ECHO.
ECHO 1 - PERFORM A BACK UP
ECHO 2 - CREATE A BACKUP SCRIPT
ECHO 3 - HELP MENU
ECHO 4 - EXIT
ECHO.

set /p select=Please make your selection: 
IF %select%==1 goto BACKUP
IF %select%==2 goto SCRIPT
IF %select%==3 goto HELP
IF %select%==4 exit

REM #########################################################################################################################################################
REM ##################################        Running a back up     #########################################################################################
REM #########################################################################################################################################################



:BACKUP
echo.
echo File Back Up Wizard
echo.
set /p BackUpFile=Please enter the file you would like to back up: 
echo %BackUpFile%

set /p BackUpLocation=Please enter the back up location: 
echo %BackUpLocation%

IF NOT EXIST "%BackUpFile%" ( echo "file doesn't exist" & goto :MENU )

IF NOT EXIST "%BackUpLocation%" ( md %BackUpLocation% )

echo back up folder created

copy %BackUpFile% %BackUpLocation%
echo file copied
goto :MENU

REM #########################################################################################################################################################
REM ##################################        The Help Section     ##########################################################################################
REM #########################################################################################################################################################

:HELP

echo Welcome to the help section.
echo. 
echo Quick Copy
echo. 
echo To use the quick copy enter the program name into the command line and enter the file you wish to backup along with the folder.
echo The file and folder must be given in its full file name form.
echo The backup utility will then check the file to be backed up exists along with the folder.
echo If the folder does not exist then the back up utility will automatically create it.
echo Below is an example quick backup command line.
echo. 
echo Example backuputility.bat c:\file.txt c:\backupfolder\
echo. 
echo Menu Mode
echo. 
echo The menu mode offers users 2 backup options. They can choose to run a single backup or create a back up script to run multiple back ups.
echo. 
echo Single Backup Mode
echo.
echo When users enter the single back up mode they will be asked to enter a file to back up and a folder to back the file up to.
echo These should be given in their full file format adding in folders.
echo The back up utility will ensure that the file exists and that the folder also exists, if the folder does not exist the utility will create it.
echo If the file does not exist it will send a message and the user will be directed back to the main menu.
echo. 
echo Creating a back up script
echo.
echo When users wish to run a back up reguarly they are able to set up a back up script.
echo Users are prompted to enter the back up file and folder alongside where the back up script should be created and what it should be called.
echo It is important that users are extra careful when entering the file and folder as these values are not checked for integrity.
echo. 
goto MENU

REM #########################################################################################################################################################
REM ##################################        Creating a Back Up Script     #################################################################################
REM #########################################################################################################################################################

:SCRIPT

REM get where the user wants to store the file
set /p store=Where would you like to store the backup script:
REM get the backup files or folders
set /p backupfiles=What file or folder would you like the script to backup:
REM get where the user wants to backup the files too
set /p backuplocation=Where would you like the files to be backuped to:
REM get what the user wants to call the backup file. 
set /p scriptname=What would you like to call your script name:
REM Create file
echo copy %backupfiles% %backuplocation%>%store%\%scriptname%.bat
goto MENU

REM #########################################################################################################################################################
REM ##################################        Running a Quick Copy     ######################################################################################
REM #########################################################################################################################################################

REM Quick copy where user must input backup file and location into command line. 
REM Script will then check that they exist, if file does not exist it will error and user will be presented with main menu.
REM If folder does not exist the program will create the requested directory.
REM Once the copy has take place a message will be displayed to the user and the program will close

:Command

IF NOT EXIST "%1" ( echo "file doesn't exist" & goto :MENU )
IF NOT EXIST "%2" ( md %2 )

copy %1 %2
echo file copied
pause
