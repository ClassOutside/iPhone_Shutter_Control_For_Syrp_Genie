# iPhone_Shutter_Control_For_Syrp_Genie
Automatically trigger iPhone camera shutter in sync with Syrp Genie mini turntable.

------------------------------------------------------------------------------------

# Purpose
The goal of this project is to capture photos on an iPhone in sync with the rotations of a syrp genie mini device.

------------------------------------------------------------------------------------

# Requirements
This application may only run on MacOS and requires specific third-party software to properly operate.
The required software can be found below:
- The Syrp app, by Syrp: https://apps.apple.com/us/app/syrp/id1387335063
- The Keypad app, by Toolbunch LLC: https://apps.apple.com/us/app/keypad-bluetooth-keyboard/id1491684442?mt=12
- The cliclick binary, by BlueM: https://github.com/BlueM/cliclick?tab=License-1-ov-file#readme
  - This binary is included in the package. 

------------------------------------------------------------------------------------

# Use
Before running the application, ensure both the Syrp app and Keypad are downloaded, open, and paired to the respective devices. 
- Syrp application should be paired to a Syrp genie mini device.
- Keypad should be paired to an iPhone.


After downloading the repository, the application itself can be found in the ./dist folder. 
1. Double click to run the application.
2. When the application is first run, it may ask for various permissions. These must be accepted for the application to properly function.
3. Select from the drop down how many photos you want taken. This should match with the number of photos listed on the Syrp application's turntable page.
4. Both "WAIT TIME" and "MOVE SHOOT DELAY" should be set to 0.7 in the Syrp genie app.
5. Make sure your iPhone is on, and a camera application is open.
6. Press the "Start Scan" button in the application.

The application should now begin. This should start the turntable and begin taking photos. There is a delay at the beginning, which should be less than one minute. 
The delay occurs while the application searches the screen for the necessary buttons. 

This process requires the ability to leave your mac running, without use of the mouse, until all photos are taken. The mouse is used to repeatedly click an on-screen button, and if moved may interrupt the process.

------------------------------------------------------------------------------------

# Related Videos
- Installation: https://youtu.be/XJCp2flDMIM
- Overview: https://youtu.be/9tybX4yEF2g
