on run argv
    -- Get the argument passed from the previous AppleScript
    set repeatCount to (item 1 of argv) as integer
    
    -- Set script directory
    set scriptDirectory to POSIX path of (do shell script "dirname " & quoted form of POSIX path of (path to me))

    -- Function to press the button where Description: volume down
    tell application "System Events"
        -- Get the list of UI elements within the standard window of the KeyPad
        set targetApp to application process "KeyPad"
        tell targetApp
            -- Find the standard window of the KeyPad
            set keypadWindows to windows whose subrole is "AXStandardWindow"
            if keypadWindows is not {} then
                -- Get the first standard window of the KeyPad
                set keypadWindow to first item of keypadWindows
                -- Get the list of UI elements within the window
                set uiElements to entire contents of keypadWindow
                -- Counter for number of clicks
                set clickCount to 0
                -- Repeat loop to click the button the specified number of times
                repeat repeatCount times
                    -- Flag to indicate if the button is pressed
                    set buttonPressed to false
                    -- Loop through each UI element
                    repeat with anElement in uiElements
                        -- Check if the element is a button with the description "volume down"
                        if (class of anElement is button) and (description of anElement is "volume down") then
                            set elementPosition to position of anElement
                            set elementSize to size of anElement
                            
                            -- Calculate the center coordinates
                            set centerX to (item 1 of elementPosition) + ((item 1 of elementSize) / 2)
                            set centerY to (item 2 of elementPosition) + ((item 2 of elementSize) / 2)
                            
                            set centerXRounded to round centerX
                            set centerYRounded to round centerY
                            
                            -- Click the button using cliclick
                            -- do shell script "cliclick c:" & centerXRounded & "," & centerYRounded

                            -- get the cliclick directory
                            set parentDirectory to do shell script "dirname " & quoted form of scriptDirectory
                            set binDirectory to parentDirectory & "/bin/"
                            set cliclickPath to binDirectory & "cliclick"

                            -- Click the button using cliclick
                            do shell script cliclickPath & " c:" & centerXRounded & "," & centerYRounded

                            delay 2
                            -- Set the flag to true indicating the button is pressed
                            set buttonPressed to true
                            -- Increment the click count
                            set clickCount to clickCount + 1
                            -- Exit the loop once the button is pressed
                            exit repeat
                        end if
                    end repeat
                    -- If the button is not found, display an error message
                    if not buttonPressed then
                        display dialog "Button with description 'volume down' not found." buttons {"OK"} default button "OK" with icon caution
                    end if
                    -- Exit the loop if the specified number of clicks have been done
                    if clickCount is repeatCount then exit repeat
                    delay 0.1
                end repeat
            else
                -- If no standard window of the KeyPad was found, display an error message
                display dialog "No standard window of KeyPad was found." buttons {"OK"} default button "OK" with icon caution
            end if
        end tell
    end tell
end run
