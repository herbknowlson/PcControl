Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
rem WScript.Echo myPath 
rem Choose your path:
myPath = "D:\Dropbox\PcControl\RemoteMode\"
rem myPath = "C:\Users\herbk\Dropbox\PcControl\RemoteMode\"

Set oShell = WScript.CreateObject ("WScript.shell")
rem oShell.Run myPath+"RedMode.jpg",0,false
oShell.Run myPath+"BlackMode.jpg",0,false

rem ----------------------------
rem       wait 2 seconds
rem ----------------------------
rem WScript.Sleep 2000

oShell.Run myPath+"AHKsetBackground.ahk",1,true

rem oShell.Run myPath+"4-DONE.bat"

 
