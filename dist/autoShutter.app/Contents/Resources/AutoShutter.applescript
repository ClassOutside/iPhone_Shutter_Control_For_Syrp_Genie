on run argv
    -- Get the path to the directory containing the script
    set scriptDirectory to POSIX path of (do shell script "dirname " & quoted form of POSIX path of (path to me))

    -- Get the selected value from the argument
    set selectedValue to item 1 of argv

    -- Define the paths to the individual AppleScripts
    set scriptPath0 to scriptDirectory & "/Syrp_Click_Restart.applescript"
    set scriptPath1 to scriptDirectory & "/Syrp_Click_Record.applescript"
    set scriptPath3 to scriptDirectory & "/volume_down_repeat.applescript"

    -- Run the first AppleScript
    do shell script "osascript " & quoted form of scriptPath0

    -- Add delay for turntable to reposition
    delay 15

    -- Run the second AppleScript
    do shell script "osascript " & quoted form of scriptPath1

    -- Run the third AppleScript with the selected value
    do shell script "osascript " & quoted form of scriptPath3 & " " & selectedValue
end run
