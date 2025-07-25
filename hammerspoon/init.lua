-- local lastWindowIndex = {}
--
-- function activateAndCycle(appName)
--     local focusedApp = hs.application.frontmostApplication()
--
--     if focusedApp and focusedApp:name() == appName then
--         local cmd = "/usr/local/bin/yabai -m query --windows | jq '[.[] | select(.app==\"" .. appName .. "\")]'"
--         local output = hs.execute(cmd)
--
--         if output and type(output) == "string" and output ~= "" and output ~= "[]" then
--             local windows = hs.json.decode(output)
--
--             if windows and #windows > 1 then
--                 local currentIndex = lastWindowIndex[appName] or 0
--                 local nextIndex = currentIndex + 1
--
--                 if nextIndex > #windows then
--                     nextIndex = 1
--                 end
--
--                 lastWindowIndex[appName] = nextIndex
--                 local nextWindowId = windows[nextIndex].id
--                 hs.execute("/usr/local/bin/yabai -m window --focus " .. nextWindowId)
--                 return
--             end
--         end
--
--         hs.eventtap.keyStroke({"cmd"}, "`")
--     else
--         hs.application.launchOrFocus(appName)
--         lastWindowIndex[appName] = 1
--     end
-- end
--
-- -- Set up hotkeys
-- hs.hotkey.bind("alt", "1", function() activateAndCycle("Ghostty") end)
-- hs.hotkey.bind("alt", "2", function() activateAndCycle("Intellij IDEA") end)
-- hs.hotkey.bind("alt", "3", function() activateAndCycle("WebStorm") end)
-- hs.hotkey.bind("alt", "4", function() activateAndCycle("RustRover") end)
-- hs.hotkey.bind("alt", "5", function() activateAndCycle("PyCharm") end)
-- hs.hotkey.bind("alt", "6", function() activateAndCycle("DataGrip") end)
-- hs.hotkey.bind("alt", "w", function() activateAndCycle("Google Chrome") end)
