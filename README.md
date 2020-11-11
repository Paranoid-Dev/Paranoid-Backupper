# Paranoid-Backupper
Script that uses "wbAdmin", the default system backup tool for Windows, to make a System Backup, compresses and encrypts with 7zip, and then uploads to your cloud via Rclone

# How to use
Have 7z, Rclone on your PC, and configure Rclone

This script deletes the TEMP folder, then backups drive C to drive E, after making a copy of the old backup on E(which is deleted after the new backup is completed), and then uploads the resulting encrypted and compressed backup to Rclone "gdrive:System Backup"

Change drive names(including Rclone), TEMP folder path and the path to rclone.exe / 7z.exe in the script to your liking, and then run as administrator to backup and upload to cloud
