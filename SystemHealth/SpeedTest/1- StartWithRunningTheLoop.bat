@ECHO OFF
rem ------------------------------------------------
rem  Loop the interrogate script
rem ------------------------------------------------

:start
cscript C:\Users\herbk\Dropbox\gitHub\PcControl\SystemHealth\SpeedTest\interrogate.vbs 
TIMEOUT 10
goto start