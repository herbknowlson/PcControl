Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
rem WScript.Echo myPath 
rem Choose your path:
rem myPath = "D:\Dropbox"
rem myPath = "C:\Users\herbk\Dropbox"

Set oShell = WScript.CreateObject ("WScript.shell")
oShell.Run "RedMode.jpg",0,false
rem oShell.Run "BlackMode.jpg",0,false

rem ----------------------------
rem       wait 2 seconds
rem ----------------------------
rem WScript.Sleep 2000

oShell.Run "AHKsetBackground.ahk",0,false

rem oShell.Run myPath+"4-DONE.bat"

 
