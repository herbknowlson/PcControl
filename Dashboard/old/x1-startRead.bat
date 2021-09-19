@ECHO OFF
rem ---------------------------------------------------------------------------
rem Note: You cannot return parameters to a batch file. You can return an exitcode.  
rem The Exitcode is an integer.
rem ---------------------------------------------------------------------------
set LOOP_TIMEOUT=3
rem Choose your path
rem set myPath=D:\Dropbox
set myPath=C:\Users\herbk\Dropbox

rem ---------------------------------------------------------------------------
rem                      run synchronously
rem ---------------------------------------------------------------------------
rem start /wait "" cmd /c cscript %myPath%"\PcControl\Dashboard\2-startRead.vbs"

rem ---------------------------------------------------------------------------
rem                      run 
rem ---------------------------------------------------------------------------
START %myPath%"\PcControl\Dashboard\2-startRead.vbs"

rem ---------------------------------------------------------------------------
rem                     run silent
rem ---------------------------------------------------------------------------
rem cscript %myPath%"\PcControl\Dashboard\2-startRead.vbs",0,false
rem cscript %myPath%"\PcControl\Dashboard\2-startRead.vbs"

PAUSE

