@ECHO OFF  
rem Choose your path
set myPath=D:\Dropbox\gitHub
rem set myPath=C:\Users\herbk\Dropbox\gitHub

powershell (Get-Process cmd)
                                                                             
FOR /F %%T IN ('Wmic process where^(Name^="cmd.exe"^)get ProcessId^|more +1') DO (
SET /A ProcessId1=%%T) &GOTO SkipLine                                                   
:SkipLine                                                                              
echo ProcessId1 = %ProcessId1% 

FOR /F "skip=1" %%T IN ('Wmic process where^(Name^="cmd.exe"^)get ProcessId^|more +1') DO (
SET /A ProcessId2=%%T) &GOTO SkipLine                                                   
:SkipLine                                                                              
echo ProcessId2 = %ProcessId2% 

FOR /F "skip=2" %%T IN ('Wmic process where^(Name^="cmd.exe"^)get ProcessId^|more +1') DO (
SET /A ProcessId3=%%T) &GOTO SkipLine                                                   
:SkipLine                                                                              
echo ProcessId3 = %ProcessId3% 

TIMEOUT 3
rem --------------------------------------------------------------
rem                 Kill the loops
rem --------------------------------------------------------------
powershell Taskkill /PID %ProcessId1%  /F
powershell Taskkill /PID %ProcessId2%  /F
powershell Taskkill /PID %ProcessId3%  /F

rem --------------------------------------------------------------
rem                 Delete All Rows
rem --------------------------------------------------------------
start "Smart home dashboard" "https://docs.google.com/spreadsheets/d/1zxylrlUsqf4W9TLM8twuCusCSwMnDL6_rtt_ELW10wc/edit#gid=1175759561"
TIMEOUT 15

cscript %myPath%\PcControl\RestartTheLoops\2-MoveTheMouse.vbs
TIMEOUT 5 
rem --------------------------------------------------------------
rem                 Restart the loops
rem --------------------------------------------------------------
START %myPath%"\PcControl\0-START_HERE.bat - Shortcut.lnk"
TIMEOUT 5 
rem --------------------------------------------------------------
rem                 Redo the Formula
rem --------------------------------------------------------------
cscript %myPath%\PcControl\RestartTheLoops\2-MoveTheMouse2.vbs
TIMEOUT 10 
rem --------------------------------------------------------------
rem                 Position the mouse for scrolling
rem --------------------------------------------------------------
cscript %myPath%\PcControl\RestartTheLoops\2-MoveTheMouse3.vbs
rem PAUSE