#!/bin/sh

mkdir -p $XDG_DATA_HOME/gnupg

chmod 600 $XDG_DATA_HOME/gnupg/*
chmod 700 $XDG_DATA_HOME/gnupg

gpg --import $HOME/misc/.keys/pgp-private-keys.asc
