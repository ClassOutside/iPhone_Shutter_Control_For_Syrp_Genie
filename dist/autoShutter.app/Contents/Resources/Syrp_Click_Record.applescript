-- Function to press the button where Description: RecordIcon passive
on pressRecordIconButton()
    tell application "System Events"
        -- Get the list of UI elements within the standard window of the GenieApp (Syrp)
        set targetApp to application process "GenieApp"
        tell targetApp
            -- Find the standard window of the GenieApp (Syrp)
            set syrpWindows to windows whose subrole is "AXStandardWindow"
            if syrpWindows is not {} then
                -- Get the first standard window of the GenieApp (Syrp)
                set syrpWindow to first item of syrpWindows
                -- Get the list of UI elements within the window
                set uiElements to entire contents of syrpWindow
                -- Flag to indicate if the button is pressed
                set buttonPressed to false
                -- Loop through each UI element
                repeat with anElement in uiElements
                    -- Check if the element is a button with the description "RecordIcon passive"
                    if (class of anElement is button) and (description of anElement is "RecordIcon passive") then
                        -- Click the button
                        click anElement
                        -- Set the flag to true indicating the button is pressed
                        set buttonPressed to true
                        -- Exit the loop once the button is pressed
                        exit repeat
                    end if
                end repeat
                -- If the button is not found, display an error message
                if not buttonPressed then
                    display dialog "Button with description 'RecordIcon passive' not found." buttons {"OK"} default button "OK" with icon caution
                end if
            else
                -- If no standard window of the GenieApp (Syrp) was found, display an error message
                display dialog "No standard window of GenieApp (Syrp) was found." buttons {"OK"} default button "OK" with icon caution
            end if
        end tell
    end tell
end pressRecordIconButton

-- Call the function to press the button where Description: RecordIcon passive
pressRecordIconButton()
