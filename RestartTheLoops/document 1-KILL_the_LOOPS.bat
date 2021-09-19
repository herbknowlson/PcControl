@ECHO OFF  
rem ---------------------------------------------------------------------------
rem                              START HERE
rem ---------------------------------------------------------------------------
rem set LOOP_TIMEOUT=3
rem Choose your path
rem set myPath=D:\Dropbox
set myPath=C:\Users\herbk\Dropbox
rem --------------------------------------------------------------------- 
rem  Processing Multiple Items with the For Command 
rem 
rem  The basic version of the for command scans through a set or list of names and runs a command once for each. 
rem  The format for batch files is
rem     for %%x in (set of names) do command 
rem  where set of names is a list of words separated by spaces. 
rem
rem  The for command executes command once for each item it finds in the set. 
rem  At each iteration, variable x contains the current name, 
rem  and any occurrences of %%x in the command are replaced by the current value of x. 
rem 
rem  You can choose any alphabetic letter for the variable name. 
rem  Also, upper- and lowercase matters, meaning a and A are different to the for command.
rem ---------------------------------------------------------------------  
rem 
rem  FOR /F processing of a text file consists of reading the file, 
rem  one line of text at a time and then breaking the line up into individual items of data called 'tokens'. 
rem  The DO command is then executed with the parameter(s) set to the token(s) found.
rem
rem --------------------------------------------------------------------- 
rem set (environment variable)
rem /a	Sets <string> to a numerical expression that is evaluated.
rem ---------------------------------------------------------------------
rem   
                                                                   
FOR /F %%T IN ('Wmic process where^(Name^="cmd.exe"^)get ProcessId^|more +1) DO (
SET /A ProcessId=%%T) &GOTO SkipLine                                                   
:SkipLine                                                                              
echo ProcessId = %ProcessId%  

rem ---------------------------------------------------------------------
rem You can use echo, and redirect the output to a text file 
rem ---------------------------------------------------------------------
@echo off
echo %ProcessId%> %myPath%"\PcControl\KillItProcessId.txt" 

rem ---------------------------------------------------------------------
rem Reading of files in a Batch Script is done via using the FOR loop command 
rem ---------------------------------------------------------------------
FOR /F %%a in (%myPath%\PcControl\loop1ProcessId.txt) DO (
SET /A loop1ProcessId=%%a) &GOTO SkipLine                                                   
:SkipLine                                                                              
echo loop1ProcessId = %loop1ProcessId%  

FOR /F %%b in (%myPath%\PcControl\loop2ProcessId.txt) DO (
SET /A loop1ProcessId=%%b) &GOTO SkipLine                                                   
:SkipLine                                                                              
echo loop2ProcessId = %loop2ProcessId% 

FOR /F %%c in (%myPath%\PcControl\loop3ProcessId.txt) DO (
SET /A loop1ProcessId=%%c) &GOTO SkipLine                                                   
:SkipLine                                                                              
echo loop3ProcessId = %loop3ProcessId% 

rem MODE 100
rem mode con: cols=55 lines=5
rem ---------------------------------------------------------------------
rem                      Kill the loops
rem ---------------------------------------------------------------------
powershell (Get-Process cmd)
TIMEOUT 10

rem powershell (Microsoft.Photos)Process.Kill
rem powershell (ps Microsoft.Photos).CloseMainWindow()
rem powershell (ps Photos).CloseMainWindow()
rem powershell taskkill /im Microsoft.Photos.exe /f

rem powershell Taskkill /PID %loop1ProcessId%  /F
rem powershell Taskkill /PID %loop2ProcessId%  /F
rem powershell Taskkill /PID %loop3ProcessId%  /F
PAUSE


