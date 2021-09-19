@ECHO OFF
rem ---------------------------------------------------------------------------
rem                     START Update counter file
rem 
rem Note: You cannot return parameters to a batch file. 
rem ---------------------------------------------------------------------------
rem Choose your path
rem set myPath=D:\Dropbox
set myPath=C:\Users\herbk\Dropbox

set fileName=%myPath%\PcControl\Dashboard\loop1Counter.txt

rem ---------------------------------------------------------------------------
rem                     run silent (no popups)
rem ---------------------------------------------------------------------------
cscript %myPath%"\PcControl\Dashboard\updateLoop1Counter.vbs"

rem ---------------------------------------------------------------------------
rem         run the update (with Popups) this may help you test
rem ---------------------------------------------------------------------------
rem START %myPath%"\PcControl\Dashboard\updateLoop1Counter.vbs"

PAUSE

