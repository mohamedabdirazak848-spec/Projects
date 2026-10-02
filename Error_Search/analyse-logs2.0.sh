#!/bin/bash

LOC_DIR="/Users/a/Devops/Error_Search/logs"
LOG_FILES=$(find $LOC_DIR -name "*.log")
ERROR_PATTERN=("ERROR" "FATAL" "CRITICAL")
REPORT_FILE="/Users/a/Devops/Error_Search/Reports/analyse_logs2.0_reprot.txt"

if [ -d "$REPORT_FILE" ]; then
    echo "$REPORT_FILE is created"
else
    mkdir /Users/a/Devops/Test_Dir
fi 

echo "$LOG_FILES" > $REPORT_FILE

for LOG_FILE in $LOG_FILES; do
    echo "============================" >>$REPORT_FILE
    echo "==========$LOG_FILE========" >>$REPORT_FILE
    echo "============================" >>$REPORT_FILE
    
    for PATTERN in ${ERROR_PATTERN[@]}; do
        echo "$PATTERN in $LOG_FILE" >>$REPORT_FILE
        grep -c "$PATTERN" $LOG_FILE >>$REPORT_FILE
        
        ERROR_COUNT=$(grep -c $PATTERN $LOG_FILE)
        echo "$ERROR_PATTERN" >>$REPORT_FILE
       
        if [ "$ERROR_COUNT" -gt 10 ]; then
           echo -e "\nWARNING! $PATTERN IN $LOG_FILE IS MORE THAN 10!!!"
        fi

    done
done

echo "Successfully printed in $REPORT_FILE"
