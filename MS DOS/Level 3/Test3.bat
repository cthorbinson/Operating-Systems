@echo off
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
pause