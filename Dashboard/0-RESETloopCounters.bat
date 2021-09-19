@ECHO OFF
rem ---------------------------------------------------------------------------
rem                    reset loop counters file
rem 
rem Note: You cannot return parameters to a batch file. 
rem ---------------------------------------------------------------------------
rem Choose your path
rem set myPath=D:\Dropbox
rem set myPath=C:\Users\herbk\Dropbox

set fileName=%myPath%\PcControl\Dashboard\loop1Counter.txt
cscript %myPath%"\PcControl\Dashboard\resetLoopCounter.vbs"

set fileName=%myPath%\PcControl\Dashboard\loop2Counter.txt
cscript %myPath%"\PcControl\Dashboard\resetLoopCounter.vbs"

set fileName=%myPath%\PcControl\Dashboard\loop3Counter.txt
cscript %myPath%"\PcControl\Dashboard\resetLoopCounter.vbs"

set fileName=%myPath%\PcControl\SmartHomeActionTimer\actionCounterFile.txt
cscript %myPath%"\PcControl\Dashboard\resetLoopCounter.vbs"


PAUSE

