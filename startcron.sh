#!/bin/sh

if [ -e /repo/cronjob/cronjob.list ];
then
	crontab /repo/cronjob/cronjob.list
	crontab -l
	crond -f -d 8 -l 8
else
	echo Could not find file /repo/cronjob/cronjob.list
fi
