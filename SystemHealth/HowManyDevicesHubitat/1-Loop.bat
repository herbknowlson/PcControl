@ECHO OFF
rem ------------------------------------------------
rem  Loop the interrogate script
rem ------------------------------------------------

:start
cscript 2-interrogate.vbs 
TIMEOUT 5
goto start