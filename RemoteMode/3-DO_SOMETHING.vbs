Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
rem WScript.Echo myPath 
rem Choose your path:
rem myPath = "D:\Dropbox"
rem myPath = "C:\Users\herbk\Dropbox"

Set oShell = WScript.CreateObject ("WScript.shell")
oShell.Run myPath+"DoingSomething.jpg",0,false

rem ----------------------------
rem       wait 5 seconds
rem ----------------------------
WScript.Sleep 5000
oShell.Run myPath+"4-DONE.bat"

 
