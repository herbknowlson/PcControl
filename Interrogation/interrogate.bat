@ECHO OFF
rem ------------------------------------------------
rem Loop the interrogate script
rem ------------------------------------------------

:start
cscript C:\Users\herbk\Desktop\interrogate.vbs 
TIMEOUT 3
goto start