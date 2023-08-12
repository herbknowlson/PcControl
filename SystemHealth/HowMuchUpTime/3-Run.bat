rem ---------------------------------------------------------------------
rem  Run AutoHotKey script and parse the result
rem --------------------------------------------------------------------
@ECHO OFF
start /wait MyAHK.exe
rem timeout 10
rem PAUSE
start /wait 5-parseResults.vbs
rem cscript 5-parseResults.vbs
rem PAUSE

