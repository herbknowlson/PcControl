rem ---------------------------------------------------------------------
rem  Run AutoHotKey script and parse the result
rem --------------------------------------------------------------------
@ECHO OFF
start /wait HowManyDevicesHubitat.exe
rem timeout 10
rem PAUSE
start /wait 5-FormatResults.vbs
rem cscript 5-FormatResults.vbs
rem PAUSE

