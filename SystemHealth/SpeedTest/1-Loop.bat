@ECHO OFF
rem ------------------------------------------------
rem  Loop the interrogate script
rem ------------------------------------------------

:start
cscript C:\Users\herbk\Dropbox\gitHub\PcControl\SystemHealth\SpeedTest\2-Interrogate.vbs 
TIMEOUT 5
goto start