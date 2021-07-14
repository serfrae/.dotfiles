#!/bin/sh

FILE=$(rg -e '\s@.+' $NOTES_DIR | fzf)

if [[ -n $FILE ]]; then
	if [[ $FILE == *tags* ]]; then
		nvim $NOTES_DIR/$(echo $FILE | awk '{print $2}')
	else
		nvim $(echo $FILE | sed -e 's/:.*//g')
	fi
fi
