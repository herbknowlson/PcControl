rem ---------------------------------------------------------------------------
rem                              START HERE
rem ---------------------------------------------------------------------------
rem Note: This is the parent process set the envirnmental variables 

set LOOP_TIMEOUT=3
set myPath=D:\Dropbox
rem set myPath=C:\Users\herbk\Dropbox

rem ------------------------------------------------------------------
rem      Get the current time to check for a pause in execution
rem ------------------------------------------------------------------
echo Current date and time: %yyyy-mm-dd% %time%
set "hour=%time:~0,2%
echo hour is: %hour%
set "minute=%time:~3,2%
echo minute is: %minute%
rem ------------------------------------------------------------------
rem            Pause execution between 3:55 am to 4:05 am
rem ------------------------------------------------------------------
set executionPaused="NO"
if %hour% EQU 3 if %minute% GEQ 55 set executionPaused="YES"
if %hour% EQU 4 if %minute% LEQ 5 set executionPaused="YES"

START %myPath%"\PcControl\InterrogateLoop1.bat - Shortcut.lnk"

rem PAUSE








