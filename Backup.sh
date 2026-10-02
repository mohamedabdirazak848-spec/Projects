#!/bin/bash

CHOSEN_FILE="Downloads"
Timestamp="$(date +%Y-%m-%d_%H:%M:%S)"
FILES="/Users/a/$CHOSEN_FILE"
BACK_UP="/Users/a"
Backup_Name="$CHOSEN_FILE.BACKUP_$Timestamp"

if ls "${BACK_UP}/${CHOSEN_FILE}.BACKUP_"* ; then
    mv "${BACK_UP}/${CHOSEN_FILE}.BACKUP_"* "${BACK_UP}/${Backup_Name}"
    sudo rm -r "${BACK_UP}/${Backup_Name}/${CHOSEN_FILE}"
    sudo cp -r "${FILES}" "${BACK_UP}/${Backup_Name}"
else 
    mkdir "${BACK_UP}/${Backup_Name}"
    sudo cp -r "${FILES}" "${BACK_UP}/${Backup_Name}"
fi
