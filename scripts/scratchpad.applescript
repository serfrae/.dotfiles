#!/usr/bin/osascript

on run
    tell application "System Events"
        if exists process "Ghostty" then
            if exists (window 1 of process "Ghostty" whose title contains "Scratchpad") then
                set win to window 1 of process "Ghostty" whose title contains "Scratchpad"
                if win is visible then
                    set visible of win to false
                    set frontmost of process "Ghostty" to true
                else
                    set visible of win to true
                end if
            else
                do shell script "ghostty --title Scratchpad"
            end if
        else
            do shell script "ghostty --title Scratchpad"
        end if
    end tell
end run
