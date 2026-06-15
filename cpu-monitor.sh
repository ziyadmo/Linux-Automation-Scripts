#!/bin/bash

THRESHOLD=80

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - 80}' | cut -d. -f1)

DATE=$(date "+Y%-%m-%d %H:%M:%S")

echo "Current CPU Usage: $cpu_usage%"

if [ "$cpu_usage" -ge "$THRESHOLD" ]
then	
	echo "Warning High Cpu usage detected! ($cpu_usage%)"	
	echo "$DATE Warning High Cpu usage detected! is at $cpu_usage%" >> cpu_alerts.log
else
	echo "Cpu Usage is normal."
fi	
			
