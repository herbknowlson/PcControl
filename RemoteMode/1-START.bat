@ECHO OFF
rem ------------------------------------------------------------------------------
rem                           START HERE  (1-START.bat)
rem -------------------------------------------------------------------------------
rem
rem            Demonstrate communication between Hubitat and the computer
rem
rem  Based on the value of a Virtual Switch in Hubitat called "DoSomething" the computer
rem  will or will not do something.
rem
rem  
rem      Given I have the value of a device from the Maker API (2-INTERROGATE.vbs) 
rem      When the value is not "off"
rem      Then Display the DoingSomething.jpg (3-DO_SOMETHING.vbs)
rem      And after waiting 5 seconds 
rem      Then kill the process (4-DONE.bat)
rem   
rem -----------------------------------------------
rem              Set the path
rem -----------------------------------------------
rem Choose your path:
rem set myPath=D:\Dropbox\PcControl\DoSomething\
set myPath=C:\Users\herbk\Dropbox\PcControl\DoSomething\

rem -----------------------------------------------
rem         INTERROGATE the Virtual Switch
rem -----------------------------------------------
cscript %myPath%2-INTERROGATE.vbs
rem wscript %myPath%2-INTERROGATE.vbs

PAUSE

 