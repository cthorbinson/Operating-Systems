@echo off
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
IF %select%==2 EXIT

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
