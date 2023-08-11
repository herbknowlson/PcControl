@ECHO OFF
rem ------------------------------------------------
rem  Loop the interrogate script
rem ------------------------------------------------

:start
cscript C:\Users\herbk\Dropbox\gitHub\PcControl\MakerAPI\2-interrogate.vbs 
TIMEOUT 5
goto start