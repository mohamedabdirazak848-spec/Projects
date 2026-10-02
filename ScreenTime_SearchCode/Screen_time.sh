#!/bin/bash
FILE="/Users/a/Devops/ScreenTime_SearchCode/Screen/Screen_dates.last"
DATE=" 2 Jul "
REPORT_FILE="/Users/a/Devops/ScreenTime_SearchCode/Screen/screentime.file"

last > $FILE

grep -c "$DATE" $FILE > $REPORT_FILE
grep "$DATE" $FILE >> $REPORT_FILE

rm  $FILE

echo "==================== SCREEN TIME SAVED IN $REPORT_FILE!!! ===================="
