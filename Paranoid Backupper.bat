@echo off

rmdir C:\Users\<USER>\AppData\Local\Temp /s /q
mkdir C:\Users\<USER>\AppData\Local\Temp

echo temp deleted
echo Did you run as Admin?
set /p pswd=password: 

rename "E:\WindowsImageBackup" "WindowsImageBackup.old"
echo renamed old backup

echo running system backup..
wbAdmin start backup -backupTarget:E: -include:C: -allCritical -quiet
echo system backed up!

rmdir "E:\WindowsImageBackup.old" /s /q
echo removed old backup

echo zipping backup..
"PATH-TO-7z.exe" a "E:\System Backup\WindowsImageBackup.%date%.7z" "E:\WindowsImageBackup\" -p"%pswd%"
echo zipped backup!

echo uploading to gdrive..
"PATH-TO-rclone.exe" copy --update --verbose --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s --bwlimit 10M "E:\System Backup" "gdrive:System Backup"
echo uploaded!

rmdir "E:\System Backup" /s /q
echo removed zipped backup
echo backup completed!
pause
