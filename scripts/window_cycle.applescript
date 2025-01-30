#!/usr/bin/osascript

on run
    try
        tell application "System Events"
            -- Get the frontmost application process
            set frontApp to first application process whose frontmost is true
            set frontAppName to name of frontApp
            
            -- Get all windows of the frontmost application
            set windowList to windows of frontApp
            set windowCount to count of windowList
            
            -- Check if there are any windows
            if windowCount is 0 then
                display notification "No windows found in " & frontAppName
                return
            end if
            
            -- Find all windows including fullscreen ones
            set allWindows to {}
            repeat with w in windowList
                try
                    if value of attribute "AXFullScreen" of w is true then
                        -- Include fullscreen windows
                        copy w to end of allWindows
                    else
                        -- Include regular windows
                        copy w to end of allWindows
                    end if
                on error
                    -- Include windows where we can't check fullscreen status
                    copy w to end of allWindows
                end try
            end repeat
            
            set windowCount to count of allWindows
            if windowCount is 0 then
                display notification "No accessible windows found in " & frontAppName
                return
            end if
            
            -- Find the current active window
            set currentWindow to ""
            repeat with i from 1 to windowCount
                set thisWindow to item i of allWindows
                try
                    if value of attribute "AXMain" of thisWindow is true then
                        set currentWindow to thisWindow
                        exit repeat
                    end if
                end try
            end repeat
            
            -- If no window is found as main, use the first window
            if currentWindow is "" then
                set currentWindow to item 1 of allWindows
            end if
            
            -- Find the index of current window
            set currentIndex to 1
            repeat with i from 1 to windowCount
                if item i of allWindows is currentWindow then
                    set currentIndex to i
                    exit repeat
                end if
            end repeat
            
            -- Calculate next window index
            set nextIndex to currentIndex + 1
            if nextIndex > windowCount then
                set nextIndex to 1
            end if
            
            -- Bring next window to front
            tell (item nextIndex of allWindows)
                try
                    -- First attempt to raise the window
                    perform action "AXRaise"
                    
                    -- If the window is fullscreen, ensure it's activated
                    if value of attribute "AXFullScreen" is true then
                        set position to {0, 0}
                    end if
                on error
                    -- Fallback method if the first attempt fails
                    try
                        set position to position
                    end try
                end try
            end tell
        end tell
        
    on error errMsg
        display notification "Error cycling windows: " & errMsg
    end try
end run
