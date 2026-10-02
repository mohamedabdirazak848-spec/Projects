#!/bin/bash

LOG_DIR="/Users/a/Devops/Error_Search/logs"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")
REPORT_FILE="/Users/a/Devops/Error_Search/Reports/analyse_logs_reprot.txt"

echo "files in the last 24 hours!" > $REPORT_FILE
echo "===============================================" >> $REPORT_FILE
echo "list of log files updated in the last 24 hours!">> $REPORT_FILE
echo "===============================================">> $REPORT_FILE
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOG_FILES" >> $REPORT_FILE

for LOG_FILE in $LOG_FILES; do

echo -e "\n" >> $REPORT_FILE
echo "=====================================================" >> $REPORT_FILE
echo "================$LOG_FILE============================" >> $REPORT_FILE
echo "=====================================================" >> $REPORT_FILE
    for PATTERN in ${ERROR_PATTERNS[@]}; do

        echo -e "\n $PATTERN logs in $LOG_FILE" >> $REPORT_FILE
        grep "$PATTERN" "$LOG_FILE" >> $REPORT_FILE
    
        echo -e "\nNumber of $PATTERN logs in $LOG_FILE" >> $REPORT_FILE
        ERROR_COUNT=$(grep -c "$PATTERN" "$LOG_FILE")
        echo $ERROR_COUNT >> $REPORT_FILE

        if [ "$ERROR_COUNT" -gt 10 ]; then
            echo -e "\n Action Required: too many $PATTERN errors in $LOG_FILE log file"
        fi
    
    done
done
echo "analysis completed and saved in $REPORT_FILE"
