#!/bin/sh

mkdir -p $XDG_CONFIG_HOME/weechat
mkdir -p $XDG_DATA_HOME/weechat/python/autoload

ln -sf $DOTFILES/weechat/weechat.conf $XDG_CONFIG_HOME/weechat/weechat.conf
ln -sf /usr/share/weechat/python/wee_slack.py $XDG_DATA_HOME/weechat/python/autoload/wee_slack.py
ln -sf /usr/share/weechat/python/notify_send.py $XDG_DATA_HOME/weechat/python/autoload/notify_send.py
