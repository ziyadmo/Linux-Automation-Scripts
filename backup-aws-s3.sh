#!/bin/bash

time=$(date +%m-%d-%y_%H_%M_%S)
backup_file=/home/ubuntu/backup/bash
dest=/home/ubuntu/backup
filename=file-backup-$time.tar.gz
LOG_FILE="/home/ubuntu/backup/logfile.log"
S3_BUCKET="s3-new-bash"
FILE_TO_UPLOUD="$dest/$filename"
if ! command -v aws &> /dev/null
then
        echo "AWS CLI is not installed. please install it first. "
        exit 2
fi

if [ $? -ne 2 ]
then
 if [ -f $filename ]
 then
        echo "Error file $filename already exists!" | tee -a "$LOG_FILE"
 else
        tar -czvf "$dest/$filename" "$backup_file"
        echo
        echo "Backup complated successfuly. Backup file: $dest/$filename" | tee -a "$LOG_FILE"
	echo
	aws s3 cp "$FILE_TO_UPLOUD" "s3://S3_BUCKET/"
 fi
fi

if [ $? -eq 0 ]
then
	echo
	echo " File Uploaded successfuly to the S3  bucket: $S3_BUCKET	"
else
	echo "File upload to S3 failed"
fi	
