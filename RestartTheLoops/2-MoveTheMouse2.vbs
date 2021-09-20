WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "            Script name: " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName

Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
Wscript.Echo myPath

rem Choose your path:
rem myPath = "D:\Dropbox"
rem myPath = "C:\Users\herbk\Dropbox"

rem WScript.Echo "Do something"
Set oShell = WScript.CreateObject ("WScript.shell")
fullPath = myPath+"\PcControl\RestartTheLoops\AHKrightBottom.ahk"
WScript.Echo fullPath
oShell.Run fullPath,0,false
WScript.Quit