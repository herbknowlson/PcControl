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
rem myPath="C:\Users\herbk\Dropbox"

rem =============================================================================
rem                  Pass parameters using Environmental variables
rem =============================================================================
Set wshSystemEnv = oShell.Environment("Process")
wshSystemEnv("fileName") = myPath+"\PcControl\Dashboard\CounterFile.txt"

rem =============================================================================
rem                        Run next VBS  synchronously
rem =============================================================================
Wscript.Echo " Got here - 1"
oShell.Run myPath+"\PcControl\Dashboard\ReadWrite.vbs",1,true
Wscript.Echo " Got here - 2"

WScript.Quit