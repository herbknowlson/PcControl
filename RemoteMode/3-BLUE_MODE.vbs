Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
rem WScript.Echo myPath 
rem Choose your path:
myPath = "D:\Dropbox\gitHub\PcControl\RemoteMode\"
rem myPath = "C:\Users\herbk\Dropbox\gitHub\PcControl\RemoteMode\"

Set oShell = WScript.CreateObject ("WScript.shell")
oShell.Run myPath+"BlueLine.jpg",0,false
rem oShell.Run myPath+"BlackMode.jpg",0,false

rem ----------------------------
rem       wait 2 seconds
rem ----------------------------
rem WScript.Sleep 2000

oShell.Run myPath+"AHKsetBackground.ahk",1,true

rem oShell.Run myPath+"4-DONE.bat"

 
