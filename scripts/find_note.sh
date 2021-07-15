#!/bin/sh
cd $NOTES_DIR;nvim $(rg -e '\s@.+' -g !tags | fzf | sed -e 's/:.*//g')
