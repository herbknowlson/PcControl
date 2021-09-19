Set args = WScript.Arguments
Set oShell = CreateObject ("WScript.Shell")
Dim var 
var = "http://192.168.2.84/apps/api/1376/devices/1621/push/1?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
Dim var2
var2 = "http://192.168.2.84/apps/api/1376/devices/1413?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
rem msgbox var2
oShell.run "cmd.exe /C curl " + var2
rem msgbox "Got here 2"