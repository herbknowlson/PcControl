@ECHO OFF  
rem FOR /F "tokens=* delims=" %%x in (new.txt) DO echo %%x
echo ------------------------------------------
rem FOR /F "skip=5  delims=" %%x in (new.txt) DO echo %%x
FOR /F %%T IN ('Wmic process where^(Name^="cmd.exe"^)get ProcessId^|more +1) DO (
SET /A ProcessId=%%T) &GOTO SkipLine                                                   
:SkipLine                                                                              
echo ProcessId = %ProcessId% 
PAUSE