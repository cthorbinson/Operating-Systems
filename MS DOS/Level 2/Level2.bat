@echo off
REM If %1 is a null value go to the Main MENU
REM Otherwise user wishes to perform quick copy and script will go to Command.
If "%1"=="" (
goto MENU
) Else (
goto Command
) 

REM Quick copy where user must input backup file and location into command line. 
REM Script will then check that they exist, if file does not exist it will error and user will be presented with main menu.
REM If folder does not exist the program will create the requested directory.
REM Once the copy has take place the program will go to the Menu ***CHECK THIS IN ASSIGNMENT SPEC*****
:Command

IF NOT EXIST "%1" ( echo "file doesn't exist" & goto :MENU )
IF NOT EXIST "%2" ( md %2 )

copy %1 %2
echo file copied
goto :MENU

REM Main Menu will be displayed to user if they decide not to use quick copy or after they have performed quick copy.
REM User has choice to either perform back up or to exit program.
REM Users selection will be placed in select variable which will then be used in an IF statement to determine which action the users requested.

:MENU

ECHO.
ECHO .......................................................
ECHO PRESS 1 TO PERFORM A BACK UP TO 2 TO EXIT THE PROGRAM
ECHO .......................................................
ECHO.
ECHO 1 - PERFORM A BACK UP
ECHO 2 - EXIT
ECHO.

set /p select=Please make your selection: 
IF %select%==1 goto BACKUP
IF %select%==2 exit



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

Pause