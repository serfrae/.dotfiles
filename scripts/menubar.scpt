on run
	do shell script "open -j x-apple.systempreferences:com.apple.ControlCenter-Settings.extension"
	tell application "System Events"
		tell application process "System Settings"
			tell window 1
				delay 0.5
				set CurrentShowStr to value of pop up button 1 of group 9 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1
				
				if (CurrentShowStr is "Never") then
					set NewShowStr to "In Full Screen Only"
				else
					set NewShowStr to "Never"
				end if
				tell pop up button 1 of group 9 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1
					click
					##need delays to allow the menu items to populate
					delay 0.01
					click menu item NewShowStr of menu 1
					delay 0.01
				end tell
			end tell
		end tell
	end tell
	quit application "System Settings"
	return input
	end run

