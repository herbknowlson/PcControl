@ECHO OFF
rem ------------------------------------------------
rem  Loop the interrogate script
rem ------------------------------------------------

:start
cscript 2-Interrogate.vbs 
TIMEOUT 5
goto start