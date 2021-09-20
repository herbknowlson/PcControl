rem ---------------------------------------------------------------------------
rem                              START HERE for no reset 
rem ---------------------------------------------------------------------------
rem Note: This is the parent process set the envirnmental variables 

set LOOP_TIMEOUT=3
set myPath=D:\Dropbox\gitHub
rem set myPath=C:\Users\herbk\Dropbox\gitHub

goto skip_it
rem -----------------------------------------------------------
rem         One time actions to perform outside the loop
rem -----------------------------------------------------------
rem           Reset the actionID to 0
rem           Write hard coded values to Google sheet
rem ------------------------------------------------------------
START %myPath%"\PcControl\TimedAction\0-timedActionReset.bat - Shortcut.lnk"

set fileName=C:\Users\herbk\Desktop\counters\loop1Counter.txt
cscript %myPath%"\PcControl\Dashboard\resetLoopCounter.vbs
set fileName=C:\Users\herbk\Desktop\counters\loop2Counter.txt
cscript %myPath%"\PcControl\Dashboard\resetLoopCounter.vbs"
set fileName=C:\Users\herbk\Desktop\counters\loop3Counter.txt
cscript %myPath%"\PcControl\Dashboard\resetLoopCounter.vbs"

rem cscript %myPath%\PcControl\DeviceManagment\GetValueBatteryLevel\2-LOOP.vbs
:skip_it
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








