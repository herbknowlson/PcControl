rem -------------------------------------------------------------------------------------------------
rem  Use a file to hold dashboard variables like Loop1Counter etc.
rem -------------------------------------------------------------------------------------------------
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "            Script name: " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName

Set oShell = WScript.CreateObject ("WScript.shell")

myPath = oShell.Environment("Process").Item("myPath")
Wscript.Echo myPath

rem =============================================================================
rem                            Hard code for testing 
rem =============================================================================
rem currentValue = "forceRun"
rem myPath="D:\Dropbox"
myPath="C:\Users\herbk\Dropbox"
rem =============================================================================
rem                  Pass parameters using Environmental variables
rem =============================================================================
Set wshSystemEnv = oShell.Environment("ParentProcess")
wshSystemEnv("fileName") = myPath+"\PcControl\Dashboard\CounterFile.txt"

rem oShell.Run myPath+"\PcControl\Dashboard\ReadWriteCounter.vbs",0,false
rem =============================================================================
rem                                Run next VBS  synchronously
rem =============================================================================
Wscript.Echo " Got here - 1"
oShell.Run myPath+"\PcControl\Dashboard\ReadFile.vbs",1,true
Wscript.Echo " Got here - 2"

rem =============================================================================
rem                  Get Environmental Variable(s) set in child process
rem 
rem  * * * * * You can't do this 
rem 
rem A process can pass environment variables to child processes, 
rem but not to its parent
rem =============================================================================
valueRead = oShell.Environment("ParentProcess").Item("valueRead")

Wscript.Echo " Got here - 3"
Wscript.Echo "valueRead = " + valueRead

WScript.Quit