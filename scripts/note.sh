#!/bin/sh

DATE=$(date +"%Y%m%dT%H%M%S")
NOTE_PATH="$HOME/docs/notes"
FILE="$NOTE_PATH/$DATE.txt"

echo $(date) > $FILE
nvim $FILE

git -C "$NOTE_PATH" add -A
git -C "$NOTE_PATH" commit -m "test"
